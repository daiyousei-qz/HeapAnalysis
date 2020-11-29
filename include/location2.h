#pragma once
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Value.h"

namespace mh
{
    // Tag for an abstract memory location to differentiate sources of allocation
    enum class LocationTag
    {
        // an LLVM instruction value
        // intermediate locations for analysis and independent from the program
        // state
        Register,

        // locations that have dynamic definition
        // .i.e locations passed in by parameters
        Dynamic,

        // locations that have deterministic definition
        // i.e. locations allocated inside the function
        Value,
        StackAlloc,
        HeapAlloc,
    };

    class LocationVar
    {
    private:
        const llvm::Value* definition_;
        LocationTag tag_;
        union
        {
            // valid when tag is Dynamic
            int deref_level_;

            // valid when tag is any of {Value, StackAlloc, HeapAlloc}
            int call_point_;

            // dummy slot for intialization
            int placeholder_id_;
        };

        friend bool operator==(const LocationVar& lhs, const LocationVar& rhs) noexcept;
        friend bool operator!=(const LocationVar& lhs, const LocationVar& rhs) noexcept;

    public:
        LocationVar(LocationTag tag, const llvm::Value* def, int id)
            : tag_(tag), definition_(def), placeholder_id_(id)
        {
        }

        const llvm::Value* Definition() const noexcept { return definition_; }

        LocationTag Tag() const noexcept { return tag_; }

        // please don't call this
        // use its tag-specific counterpart
        int PlaceholderId() const noexcept { return placeholder_id_; }

        // valid when tag is Dynamic
        // indicating level of dereference for a runtime pointer
        int DerefLevel() const noexcept
        {
            assert(tag_ == LocationTag::Dynamic);
            return deref_level_;
        }

        // valid when tag in {Value, StackAlloc, HeapAlloc}
        // as an identifier for different locations of the same definition in caller's context
        // should always be 0 in the context of definition
        int CallPoint() const noexcept
        {
            assert(tag_ == LocationTag::Value || tag_ == LocationTag::StackAlloc ||
                   tag_ == LocationTag::HeapAlloc);
            return call_point_;
        }

        LocationVar Rebrand(int call_point) const noexcept
        {
            // TODO: should we differentiate locations tagged with LocationTag::Value?
            assert(tag_ == LocationTag::Value || tag_ == LocationTag::StackAlloc ||
                   tag_ == LocationTag::HeapAlloc);
            return LocationVar{tag_, definition_, call_point};
        }

        const llvm::Type* GetType() const noexcept
        {
            const llvm::Type* ty = definition_->getType();
            if (tag_ == LocationTag::Register)
            {
                ty = ty->getPointerTo();
            }
            else if (tag_ == LocationTag::Dynamic)
            {
                for (int i = 0; i < deref_level_; ++i)
                {
                    ty = ty->getPointerElementType();
                }
            }

            return ty;
        }

        static LocationVar FromRegister(const llvm::Value* val)
        {
            return LocationVar{LocationTag::Register, val, 0};
        }

        static LocationVar FromRuntimeMemory(const llvm::Value* reg, int deref_level)
        {
            return LocationVar{LocationTag::Dynamic, reg, deref_level};
        }

        static LocationVar FromStackAlloc(const llvm::Value* reg_definition)
        {
            return LocationVar{LocationTag::StackAlloc, reg_definition, 0};
        }

        static LocationVar FromHeapAlloc(const llvm::Value* reg_definition)
        {
            return LocationVar{LocationTag::HeapAlloc, reg_definition, 0};
        }

        static LocationVar FromProgramValue(const llvm::Value* reg_definition)
        {
            return LocationVar{LocationTag::Value, reg_definition, 0};
        }
    };

    inline bool operator==(const LocationVar& lhs, const LocationVar& rhs) noexcept
    {
        return lhs.definition_ == rhs.definition_ && lhs.tag_ == rhs.tag_ &&
               lhs.placeholder_id_ == rhs.placeholder_id_;
    }
    inline bool operator!=(const LocationVar& lhs, const LocationVar& rhs) noexcept
    {
        return !(lhs == rhs);
    }
} // namespace mh

namespace std
{
    template <> struct hash<mh::LocationVar>
    {
        size_t operator()(mh::LocationVar x) const noexcept
        {
            // TODO: use better hash combination algorithm
            return hash<mh::LocationTag>{}(x.Tag()) ^ hash<int>{}(x.PlaceholderId()) ^
                   hash<const llvm::Value*>{}(x.Definition());
        }
    };
} // namespace std