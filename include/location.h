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

class LocationVar
{
public:
    LocationVar(LocationTag tag, const llvm::Value* def, int deref_level = 0)
        : tag_(tag), definition_(def), deref_level_(deref_level)
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

    static LocationVar FromRegister(const llvm::Instruction* reg)
    {
        return LocationVar{LocationTag::Register, reg};
    }

    static LocationVar FromProgramValue(const llvm::Value* val)
    {
        using namespace llvm;
        if (isa<Constant>(val))
        {
            return LocationVar{LocationTag::Value, val};
        }
        
        assert(isa<Instruction>(val) || isa<Argument>(val) || isa<GlobalVariable>(val));
        return LocationVar{LocationTag::Register, val};
    }

private:
    friend bool operator==(LocationVar lhs, LocationVar rhs) noexcept;
    friend bool operator!=(LocationVar lhs, LocationVar rhs) noexcept;
    friend struct std::hash<LocationVar>;

    LocationTag tag_;
    int deref_level_;
    const llvm::Value* definition_;
};

inline bool operator==(LocationVar lhs, LocationVar rhs) noexcept
{
    return lhs.tag_ == rhs.tag_ 
        && lhs.deref_level_ == rhs.deref_level_ 
        && lhs.definition_ == rhs.definition_;
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
            return hash<LocationTag>()(x.tag_) 
                ^ hash<int>()(x.deref_level_) 
                ^ hash<const llvm::Value*>()(x.definition_);
        }
    };
} // namespace std