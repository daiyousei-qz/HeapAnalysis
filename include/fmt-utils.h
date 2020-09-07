#pragma once
#include "location.h"
#include "analysis.h"
#include "fmt/format.h"
#include <string>
#include <queue>

namespace fmt
{
    template <>
    struct formatter<LocationTag> : formatter<std::string_view>
    {
        // parse is inherited from formatter<string_view>.
        template <typename FormatContext>
        auto format(LocationTag c, FormatContext& ctx)
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

    template <>
    struct formatter<llvm::Value> : formatter<std::string_view>
    {
        // parse is inherited from formatter<string_view>.
        template <typename FormatContext>
        auto format(const llvm::Value& c, FormatContext& ctx)
        {
            std::string buf;
            llvm::raw_string_ostream ss(buf);
            c.print(ss);

            return formatter<std::string_view>::format(buf, ctx);
        }
    };

    template <>
    struct formatter<Constraint> : formatter<std::string_view>
    {
        // parse is inherited from formatter<string_view>.
        template <typename FormatContext>
        auto format(const Constraint& c, FormatContext& ctx)
        {
            return formatter<std::string_view>::format(c.body.to_string(), ctx);
        }
    };

    template <>
    struct formatter<LocationVar> : formatter<std::string_view>
    {
        // parse is inherited from formatter<string_view>.
        template <typename FormatContext>
        auto format(const LocationVar& c, FormatContext& ctx)
        {
            return format_to(ctx.out(), "Loc[{}, {}, {}]", c.GetTag(), *c.GetDefinition(), c.GetDerefLevel());
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

inline void DebugPrint(const AbstractExecution& exec)
{
    const auto& ctx    = exec.GetContext();
    const auto& inputs = ctx.GetInputs();
    const auto& output = ctx.GetOutput();
    const auto& store  = exec.GetStore();

    std::unordered_set<LocationVar> known_locs;
    std::queue<LocationVar> important_locs;

    // input pointers are important
    for (const llvm::Value* input_reg : inputs)
    {
        auto loc_reg = LocationVar::FromProgramValue(input_reg);
        known_locs.insert(loc_reg);
        important_locs.push(loc_reg);
    }

    // also, return value is important
    if (output != nullptr)
    {
        auto loc_reg = LocationVar::FromProgramValue(output);
        known_locs.insert(loc_reg);
        important_locs.push(loc_reg);
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

        fmt::print("| {}\n", loc);
        for (const auto& [target_loc, constraint] : it->second)
        {
            fmt::print("  -> {} ? {}\n", target_loc, constraint);

            if (known_locs.find(target_loc) == known_locs.end())
            {
                known_locs.insert(target_loc);
                important_locs.push(target_loc);
            }
        }
    }
}