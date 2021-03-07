#pragma once
#include "utils.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Value.h"

namespace mh
{
    // Tag for an abstract memory location to differentiate sources of allocation
    enum class LocationTag
    {
        // locations that have dynamic definition, i.e. locations passed in by parameters
        Dynamic,

        // locations that represents program names, i.e. llvm::Instruction/Argument/GlobalVariable
        Register,

        // locations that represents memory regions in stack/heap
        Alloc,

        // locations that represents program terms
        Value,
    };

    class AbstractLocation
    {
    private:
        const llvm::Value* definition_;
        LocationTag tag_;
        union
        {
            // valid when tag is Dynamic
            int deref_level_;

            // valid when tag is any of {Alloc, Value}
            int call_point_;

            // dummy slot for intialization
            int placeholder_id_;
        };

        friend bool operator==(const AbstractLocation& lhs, const AbstractLocation& rhs) noexcept;
        friend bool operator!=(const AbstractLocation& lhs, const AbstractLocation& rhs) noexcept;

    public:
        AbstractLocation(LocationTag tag, const llvm::Value* def, int id)
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

        // valid when tag in {Alloc, Value}
        // as an identifier for different locations of the same definition in caller's context
        // should always be 0 in the context of definition
        int CallPoint() const noexcept
        {
            assert(tag_ == LocationTag::Alloc || tag_ == LocationTag::Value);
            return call_point_;
        }

        AbstractLocation Relabel(int call_point) const noexcept
        {
            assert(tag_ == LocationTag::Alloc || tag_ == LocationTag::Value);
            return AbstractLocation{tag_, definition_, call_point};
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

        static AbstractLocation FromRegister(const llvm::Value* val)
        {
            return AbstractLocation{LocationTag::Register, val, 0};
        }

        static AbstractLocation FromRuntimeMemory(const llvm::Value* reg, int deref_level)
        {
            return AbstractLocation{LocationTag::Dynamic, reg, deref_level};
        }

        static AbstractLocation FromAllocation(const llvm::Value* reg_definition)
        {
            return AbstractLocation{LocationTag::Alloc, reg_definition, 0};
        }

        static AbstractLocation FromProgramValue(const llvm::Value* reg_definition)
        {
            return AbstractLocation{LocationTag::Value, reg_definition, 0};
        }
    };

    inline bool operator==(const AbstractLocation& lhs, const AbstractLocation& rhs) noexcept
    {
        return lhs.definition_ == rhs.definition_ && lhs.tag_ == rhs.tag_ &&
               lhs.placeholder_id_ == rhs.placeholder_id_;
    }
    inline bool operator!=(const AbstractLocation& lhs, const AbstractLocation& rhs) noexcept
    {
        return !(lhs == rhs);
    }

    struct CallPointData
    {
        // remaining budget depth until the location should collapse to a summary location
        // 0 if the location is already collapsed
        int depth_to_collapse;

        // definition where this call point spawns
        const llvm::Instruction* inst;

        //
        int prev_call_point;
    };
} // namespace mh

template <> struct std::hash<mh::AbstractLocation>
{
    size_t operator()(mh::AbstractLocation x) const noexcept
    {
        return mh::detail::HashCombinePack(0, x.Definition(), x.Tag(), x.PlaceholderId());
    }
};

template <> struct fmt::formatter<mh::LocationTag> : formatter<std::string_view>
{
    // parse is inherited from formatter<string_view>.
    template <typename FormatContext> auto format(mh::LocationTag c, FormatContext& ctx)
    {
        std::string_view name = "UnknownLocationTag";
        switch (c)
        {
        case mh::LocationTag::Dynamic:
            name = "Dynamic";
            break;
        case mh::LocationTag::Register:
            name = "Register";
            break;
        case mh::LocationTag::Alloc:
            name = "Alloc";
            break;
        case mh::LocationTag::Value:
            name = "Value";
            break;
        }
        return formatter<std::string_view>::format(name, ctx);
    }
};

template <> struct fmt::formatter<mh::AbstractLocation> : fmt::formatter<std::string_view>
{
    // parse is inherited from formatter<string_view>.
    template <typename FormatContext> auto format(const mh::AbstractLocation& c, FormatContext& ctx)
    {
#ifdef HEAP_ANALYSIS_PRESENTATION_PRINT
        switch (c.Tag())
        {
        case mh::LocationTag::Alloc:
        case mh::LocationTag::Value:
            if (c.Definition() == nullptr)
            {
                return fmt::format_to(ctx.out(), "null");
            }
            else
            {
                return fmt::format_to(ctx.out(), "{}@{}", *c.Definition(), c.CallPoint());
            }
        default:
        {
            auto output_iter = ctx.out();
            if (c.Tag() == mh::LocationTag::Dynamic)
            {
                for (int i = 0; i < c.DerefLevel(); ++i)
                {
                    output_iter = fmt::format_to(output_iter, "*");
                }
            }
            else if (c.Tag() == mh::LocationTag::Register && !c.Definition()->getName().empty())
            {
                output_iter = fmt::format_to(output_iter, "%");
            }

            if (!c.Definition()->getName().empty())
            {
                return fmt::format_to(output_iter, "{}", c.Definition()->getName().str());
            }
            else
            {
                return fmt::format_to(output_iter, "{}", *c.Definition());
            }
        }
        }

#else
        if (c.Definition() != nullptr)
        {
            return fmt::format_to(ctx.out(), "Loc[{}, {}, {}]", c.Tag(), *c.Definition(),
                                  c.PlaceholderId());
        }
        else
        {
            return fmt::format_to(ctx.out(), "Loc[{}, null, {}]", c.Tag(), c.PlaceholderId());
        }

#endif
    }
};

template <> struct std::hash<mh::CallPointData>
{
    size_t operator()(const mh::CallPointData& data) const noexcept
    {
        return mh::detail::HashCombinePack(0, data.inst, data.prev_call_point);
    }
};