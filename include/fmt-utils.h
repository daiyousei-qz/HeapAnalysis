#pragma once
#include "fmt-utils2.h"
#include "location.h"
#include "analysis.h"
#include "fmt/format.h"
#include <string>
#include <queue>

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

    // template <> struct formatter<llvm::Value> : formatter<std::string_view>
    // {
    //     // parse is inherited from formatter<string_view>.
    //     template <typename FormatContext> auto format(const llvm::Value& c, FormatContext& ctx)
    //     {
    //         std::string buf;
    //         llvm::raw_string_ostream ss{buf};
    //         c.print(ss);

    //         return formatter<std::string_view>::format(buf, ctx);
    //     }
    // };

    // template <> struct formatter<llvm::Type> : formatter<std::string_view>
    // {
    //     // parse is inherited from formatter<string_view>.
    //     template <typename FormatContext> auto format(const llvm::Type& c, FormatContext& ctx)
    //     {
    //         std::string buf;
    //         llvm::raw_string_ostream ss{buf};
    //         ss << c;

    //         return formatter<std::string_view>::format(buf, ctx);
    //     }
    // };

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
                return format_to(ctx.out(), "{}@{}", *c.Definition(), c.CallPoint());

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

                if (!c.Definition()->getName().empty())
                {
                    return format_to(output_iter, "{}", c.Definition()->getName().str());
                }
                else
                {
                    return format_to(output_iter, "{}", *c.Definition());
                }
            }
            }

#else
            return format_to(ctx.out(), "Loc[{}, {}, {}]", c.Tag(), *c.Definition(),
                             c.PlaceholderId());
#endif
        }
    };
} // namespace fmt

inline void DebugPrintAll(const AbstractExecution& exec, bool output_graphviz = false)
{
    const auto& ctx       = exec.GetContext();
    const auto& store     = exec.GetStore();
    const auto& alias_map = exec.GetAliasMap();
    const auto& inputs    = ctx.GetInputs();
    const auto& output    = ctx.GetReturnValue();

    std::unordered_multimap<const llvm::Value*, const llvm::Value*> reverse_alias_map;
    for (auto [val, canonical_val] : alias_map)
    {
        reverse_alias_map.insert(std::pair{canonical_val, val});
    }

    fmt::print("AbstractExecution:\n");
    if (output_graphviz)
    {
        fmt::print("digraph G {{\n");
    }

    // legend for constraint terms
    for (int i = 0; i < inputs.size(); ++i)
    {
        fmt::print("\"x{}: {}\" [shape=box]\n", i, LocationVar::FromRegister(inputs[i]));
    }
    fmt::print("\n");

    for (const auto& [src_loc, pt_map] : exec.GetStore())
    {
        if (!output_graphviz)
        {
            fmt::print("| {}\n", src_loc);
        }
        for (const auto& [target_loc, constraint] : pt_map)
        {
            if (output_graphviz)
            {
                fmt::print("  \"{}\" -> \"{}\" [label=\"{}\"];\n", src_loc, target_loc, constraint);
            }
            else
            {
                fmt::print("  -> {} ? {}\n", target_loc, constraint);
            }

            auto [iter_begin, iter_end] = reverse_alias_map.equal_range(src_loc.Definition());
            for (auto iter = iter_begin; iter != iter_end; ++iter)
            {
                const llvm::Value* alias_src_def = iter->second;
                if (output_graphviz)
                {
                    fmt::print("  \"{}\" -> \"{}\" [label=\"{}\"];\n",
                               LocationVar{src_loc.Tag(), alias_src_def, src_loc.PlaceholderId()},
                               target_loc, constraint);
                }
                else
                {
                    fmt::print("  -> {} ? {}\n", target_loc, constraint);
                }
            }
        }
    }

    if (output_graphviz)
    {
        fmt::print("}}\n");
    }
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

    // legend for constraint terms
    for (int i = 0; i < inputs.size(); ++i)
    {
        fmt::print("\"x{}: {}\" [shape=box]\n", i, LocationVar::FromRegister(inputs[i]));
    }
    fmt::print("\n");

    // point-to graph
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