#pragma once
#include "fmt/format.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Value.h"
#include "llvm/Support/raw_ostream.h"
#include <string>
#include <string_view>

#ifndef HEAP_ANALYSIS_PRESENTATION_PRINT
//#define HEAP_ANALYSIS_PRESENTATION_PRINT 1
#endif

template <> struct fmt::formatter<llvm::StringRef> : fmt::formatter<std::string_view>
{
    // parse is inherited from formatter<string_view>.
    template <typename FormatContext> auto format(const llvm::StringRef& s, FormatContext& ctx)
    {

        return formatter<std::string_view>::format(std::string_view{s.data(), s.size()}, ctx);
    }
};

template <> struct fmt::formatter<llvm::Value> : fmt::formatter<std::string_view>
{
    // parse is inherited from formatter<string_view>.
    template <typename FormatContext> auto format(const llvm::Value& c, FormatContext& ctx)
    {
        std::string buf;
        llvm::raw_string_ostream ss{buf};
        c.print(ss, true);

        return formatter<std::string_view>::format(buf, ctx);
    }
};

template <> struct fmt::formatter<llvm::Type> : fmt::formatter<std::string_view>
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
