; ModuleID = './src/call.c'
source_filename = "./src/call.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @swap(i32* %p, i32* %q) #0 {
entry:
  %p.addr = alloca i32*, align 8
  %q.addr = alloca i32*, align 8
  %tmp = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  store i32* %q, i32** %q.addr, align 8
  %0 = load i32*, i32** %p.addr, align 8
  %1 = load i32, i32* %0, align 4
  store i32 %1, i32* %tmp, align 4
  %2 = load i32*, i32** %q.addr, align 8
  %3 = load i32, i32* %2, align 4
  %4 = load i32*, i32** %p.addr, align 8
  store i32 %3, i32* %4, align 4
  %5 = load i32, i32* %tmp, align 4
  %6 = load i32*, i32** %q.addr, align 8
  store i32 %5, i32* %6, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @do_swap(i32* %a, i32* %b) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  store i32* %b, i32** %b.addr, align 8
  %0 = load i32*, i32** %a.addr, align 8
  %1 = load i32*, i32** %b.addr, align 8
  call void @swap(i32* %0, i32* %1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @do_swap2(i32* %a, i32* %b) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  store i32* %b, i32** %b.addr, align 8
  %0 = load i32*, i32** %a.addr, align 8
  %1 = load i32*, i32** %b.addr, align 8
  call void @swap(i32* %0, i32* %1)
  %2 = load i32*, i32** %a.addr, align 8
  %3 = load i32*, i32** %b.addr, align 8
  call void @swap(i32* %2, i32* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @alloc(i32** %p) #0 {
entry:
  %p.addr = alloca i32**, align 8
  store i32** %p, i32*** %p.addr, align 8
  %call = call noalias i8* @malloc(i64 4) #2
  %0 = bitcast i8* %call to i32*
  %1 = load i32**, i32*** %p.addr, align 8
  store i32* %0, i32** %1, align 8
  ret void
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @add_alloc(i32** %p, i32** %q) #0 {
entry:
  %p.addr = alloca i32**, align 8
  %q.addr = alloca i32**, align 8
  store i32** %p, i32*** %p.addr, align 8
  store i32** %q, i32*** %q.addr, align 8
  %0 = load i32**, i32*** %p.addr, align 8
  call void @alloc(i32** %0)
  %1 = load i32**, i32*** %q.addr, align 8
  call void @alloc(i32** %1)
  %2 = load i32**, i32*** %p.addr, align 8
  %3 = load i32*, i32** %2, align 8
  %4 = load i32, i32* %3, align 4
  %5 = load i32**, i32*** %q.addr, align 8
  %6 = load i32*, i32** %5, align 8
  %7 = load i32, i32* %6, align 4
  %add = add nsw i32 %4, %7
  ret i32 %add
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.1-12 "}