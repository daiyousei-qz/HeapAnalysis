#pragma once
#include <utility>
#include <iterator>

template <typename TIter> class IterPair
{
private:
    TIter begin_, end_;

public:
    IterPair(TIter&& begin, TIter&& end)
        : begin_(std::forward<TIter>(begin)), end_(std::forward<TIter>(end))
    {
    }

    TIter begin() noexcept { return begin_; }
    TIter end() noexcept { return end_; }

    auto size() noexcept { return std::distance(begin_, end_); }
};

template <typename TIter> IterPair(TIter, TIter) -> IterPair<std::decay_t<TIter>>;