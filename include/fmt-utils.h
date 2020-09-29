#pragma once
#include "location.h"
#include "analysis.h"
#include "fmt/format.h"
#include <string>
#include <queue>

#define HEAP_ANALYSIS_PRESENTATION_PRINT 1

namespace fmt
{
    template <> struct formatter<LocationTag> : formatter<std::string_view>
    {
        // parse is inherited from formatter<string_view>.
        template <typename FormatContext> auto format(LocationTag c, FormatContext& ctx)
        {
            std::string_view name = "UnknownLocationTag";
            switch (c)
            {
            case LocationTag::Register:
                name = "Register";
                break;
            case LocationTag::Dynamic:
                name = "Dynamic";
                break;
            case LocationTag::Value:
                name = "Value";
                break;
            case LocationTag::StackAlloc:
                name = "StackAlloc";
                break;
            case LocationTag::HeapAlloc:
                name = "HeapAlloc";
                break;
            }
            return formatter<std::string_view>::format(name, ctx);
        }
    };

    template <> struct formatter<llvm::Value> : formatter<std::string_view>
    {
        // parse is inherited from formatter<string_view>.
        template <typename FormatContext> auto format(const llvm::Value& c, FormatContext& ctx)
        {
            std::string buf;
            llvm::raw_string_ostream ss{buf};
            c.print(ss);

            return formatter<std::string_view>::format(buf, ctx);
        }
    };

    template <> struct formatter<llvm::Type> : formatter<std::string_view>
    {
        // parse is inherited from formatter<string_view>.
        template <typename FormatContext> auto format(const llvm::Type& c, FormatContext& ctx)
        {
            std::string buf;
            llvm::raw_string_ostream ss{buf};
            ss << c;

            return formatter<std::string_view>::format(buf, ctx);
        }
    };

    template <> struct formatter<Constraint> : formatter<std::string_view>
    {
        // parse is inherited from formatter<string_view>.
        template <typename FormatContext> auto format(const Constraint& c, FormatContext& ctx)
        {
            return formatter<std::string_view>::format(c.body.to_string(), ctx);
        }
    };

    template <> struct formatter<LocationVar> : formatter<std::string_view>
    {
        // parse is inherited from formatter<string_view>.
        template <typename FormatContext> auto format(const LocationVar& c, FormatContext& ctx)
        {
#ifdef HEAP_ANALYSIS_PRESENTATION_PRINT
            switch (c.Tag())
            {
            case LocationTag::Value:
            case LocationTag::StackAlloc:
            case LocationTag::HeapAlloc:
                return format_to(ctx.out(), "{}", *c.Definition());

            default:
            {
                auto output_iter = ctx.out();
                if (c.Tag() == LocationTag::Dynamic)
                {
                    for (int i = 0; i <= c.DerefLevel(); ++i)
                    {
                        output_iter = format_to(output_iter, "*");
                    }
                }

                return format_to(output_iter, "{}", c.Definition()->getName().str());
            }
            }

#else
            return format_to(ctx.out(), "Loc[{}, {}, {}]", c.Tag(), *c.Definition(),
                             c.PlaceholderId());
#endif
        }
    };
} // namespace fmt

inline std::string ToString(const AbstractExecution& exec)
{
    fmt::memory_buffer buf;
    fmt::format_to(buf, "AbstractExecution\n");
    for (const auto& [src_loc, pt_map] : exec.GetStore())
    {
        fmt::format_to(buf, "| {}\n", src_loc);
        for (const auto& [target_loc, constraint] : pt_map)
        {
            fmt::format_to(buf, "  -> {} ? {}\n", target_loc, constraint);
        }
    }
    return std::string(buf.data(), buf.size());
}

inline void DebugPrint(const AbstractExecution& exec, bool output_graphviz = false)
{
    const auto& ctx    = exec.GetContext();
    const auto& store  = exec.GetStore();
    const auto& inputs = ctx.GetInputs();
    const auto& output = ctx.GetReturnValue();

    std::unordered_set<LocationVar> known_locs;
    std::queue<LocationVar> important_locs;

    // input pointers are important
    for (const llvm::Value* input_reg : inputs)
    {
        LocationVar loc_reg = LocationVar::FromRegister(input_reg);
        known_locs.insert(loc_reg);
        important_locs.push(loc_reg);
    }

    // also, return value is important
    if (output != nullptr)
    {
        auto loc_reg = LocationVar::FromRegister(output);
        known_locs.insert(loc_reg);
        important_locs.push(loc_reg);
    }

    fmt::print("Abstruct Heap:\n");
    if (output_graphviz)
    {
        fmt::print("digraph G {{\n");
    }
    while (!important_locs.empty())
    {
        auto loc = important_locs.front();
        important_locs.pop();

        auto it = store.find(loc);
        if (it == store.end())
        {
            continue;
        }

        if (!output_graphviz)
        {
            fmt::print("| {}\n", loc);
        }
        for (const auto& [target_loc, constraint] : it->second)
        {
            if (output_graphviz)
            {
                fmt::print("  \"{}\" -> \"{}\" [label=\"{}\"];\n", loc, target_loc, constraint);
            }
            else
            {
                fmt::print("  -> {} ? {}\n", target_loc, constraint);
            }

            if (known_locs.find(target_loc) == known_locs.end())
            {
                known_locs.insert(target_loc);
                important_locs.push(target_loc);
            }
        }
    }
    if (output_graphviz)
    {
        fmt::print("}}\n");
    }
}