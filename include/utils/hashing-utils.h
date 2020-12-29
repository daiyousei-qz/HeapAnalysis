#pragma once
#include <cstddef>
#include <utility>
#include <functional>

namespace mh::detail
{
    // https://www.boost.org/doc/libs/1_35_0/doc/html/boost/hash_combine_id241013.html
    template <typename T> size_t HashCombine(size_t seed, const T& x)
    {
        return seed ^ (std::hash<T>{}(x) + 0x9e3779b9 + (seed << 6) + (seed >> 2));
    }

    template <typename T, typename... Ts>
    size_t HashCombinePack(size_t seed, const T& x, const Ts&... xs)
    {
        if constexpr (sizeof...(Ts) == 0)
        {
            return HashCombine(seed, x);
        }
        else
        {
            return HashCombinePack(HashCombine(seed, x), xs...);
        }
    }
} // namespace mh::detail

template <typename T, typename U> struct std::hash<std::pair<T, U>>
{
    size_t operator()(const std::pair<T, U>& pair) const noexcept
    {
        return mh::detail::HashCombinePack(0, pair.first, pair.second);
    }
};
