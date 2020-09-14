#pragma once
#include "llvm/IR/Type.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Instruction.h"

enum class LocationTag
{
    // an LLVM instruction value
    // intermediate locations for analysis and independent from the program state
    Register,

    // dynamic locations
    // .i.e locations passed in by parameters
    Dynamic,

    // static locations
    // i.e. locations allocated inside the function
    Value,
    StackAlloc,
    HeapAlloc,
};

// A location variable is composed with 4 components
// Tag: type of the location
// Definition: the specific llvm::Value that this location is defined
// Dereference Level: to differentiate pointed locations that have the same definition
// Context: the function that we are working on(do we actually need this, may be implied)
class LocationVar
{
public:
    LocationVar(LocationTag tag, const llvm::Value* def, int deref_level = 0)
        : tag_(tag), definition_(def), deref_level_(deref_level), context_(nullptr)
    {
        assert(tag == LocationTag::Dynamic || deref_level == 0);
    }

    auto GetTag() const noexcept
    {
        return tag_;
    }

    auto GetDerefLevel() const noexcept
    {
        return deref_level_;
    }

    auto GetDefinition() const noexcept
    {
        return definition_;
    }

    auto GetContext() const noexcept
    {
        return context_;
    }

    static LocationVar FromProgramValue(const llvm::Value* val)
    {
        return LocationVar{LocationTag::Register, val};
    }

private:
    friend bool operator==(LocationVar lhs, LocationVar rhs) noexcept;
    friend bool operator!=(LocationVar lhs, LocationVar rhs) noexcept;
    friend struct std::hash<LocationVar>;

    LocationTag tag_;
    int deref_level_;
    const llvm::Value* definition_;
    const llvm::Function* context_; // need this?
};

inline bool operator==(LocationVar lhs, LocationVar rhs) noexcept
{
    return lhs.tag_ == rhs.tag_ && lhs.deref_level_ == rhs.deref_level_ && lhs.definition_ == rhs.definition_;
}
inline bool operator!=(LocationVar lhs, LocationVar rhs) noexcept
{
    return !(lhs == rhs);
}

namespace std
{
    template <>
    struct hash<LocationVar>
    {
        size_t operator()(LocationVar x) const noexcept
        {
            // TODO: use better hash combination algorithm
            return hash<LocationTag>()(x.tag_) ^ hash<int>()(x.deref_level_) ^ hash<const llvm::Value*>()(x.definition_);
        }
    };
} // namespace std