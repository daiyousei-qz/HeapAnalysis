#pragma once

template <typename IterType>
class IterRange
{
public:
    IterRange(IterType begin, IterType end)
        : begin(begin), end(end)
    {
    }

    auto begin() const
    {
        return begin;
    }
    auto end() const
    {
        return end;
    }

    private:
    IterType begin;
    IterType end;
};