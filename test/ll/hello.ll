; ModuleID = './src/hello.c'
source_filename = "./src/hello.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@l.s = internal global i32 0, align 4
@global = common dso_local global i32 0, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @f(i32** %a, i32** %b, i32* %p, i32* %q) #0 {
entry:
  %a.addr = alloca i32**, align 8
  %b.addr = alloca i32**, align 8
  %p.addr = alloca i32*, align 8
  %q.addr = alloca i32*, align 8
  store i32** %a, i32*** %a.addr, align 8
  store i32** %b, i32*** %b.addr, align 8
  store i32* %p, i32** %p.addr, align 8
  store i32* %q, i32** %q.addr, align 8
  %0 = load i32*, i32** %p.addr, align 8
  %1 = load i32**, i32*** %a.addr, align 8
  store i32* %0, i32** %1, align 8
  %2 = load i32*, i32** %q.addr, align 8
  %3 = load i32**, i32*** %b.addr, align 8
  store i32* %2, i32** %3, align 8
  %4 = load i32**, i32*** %a.addr, align 8
  %5 = load i32*, i32** %4, align 8
  store i32 3, i32* %5, align 4
  %6 = load i32**, i32*** %b.addr, align 8
  %7 = load i32*, i32** %6, align 8
  store i32 4, i32* %7, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @g(i32** %a1, i32** %a2) #0 {
entry:
  %a1.addr = alloca i32**, align 8
  %a2.addr = alloca i32**, align 8
  %t1 = alloca i32*, align 8
  %t2 = alloca i32*, align 8
  %t3 = alloca i32*, align 8
  %t4 = alloca i32, align 4
  store i32** %a1, i32*** %a1.addr, align 8
  store i32** %a2, i32*** %a2.addr, align 8
  %call = call noalias i8* @malloc(i64 4) #2
  %0 = bitcast i8* %call to i32*
  %1 = load i32**, i32*** %a1.addr, align 8
  store i32* %0, i32** %1, align 8
  %call1 = call noalias i8* @malloc(i64 4) #2
  %2 = bitcast i8* %call1 to i32*
  %3 = load i32**, i32*** %a2.addr, align 8
  store i32* %2, i32** %3, align 8
  %4 = load i32**, i32*** %a1.addr, align 8
  %5 = load i32*, i32** %4, align 8
  store i32* %5, i32** %t1, align 8
  %6 = load i32*, i32** %t1, align 8
  store i32 7, i32* %6, align 4
  %7 = load i32**, i32*** %a2.addr, align 8
  %8 = load i32*, i32** %7, align 8
  store i32* %8, i32** %t2, align 8
  %9 = load i32*, i32** %t2, align 8
  store i32 8, i32* %9, align 4
  %10 = load i32**, i32*** %a1.addr, align 8
  %11 = load i32*, i32** %10, align 8
  store i32* %11, i32** %t3, align 8
  %12 = load i32*, i32** %t3, align 8
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %t4, align 4
  ret void
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @h(i32** %p, i32** %q, i8* %t, i8* %s) #0 {
entry:
  %p.addr = alloca i32**, align 8
  %q.addr = alloca i32**, align 8
  %t.addr = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  store i32** %p, i32*** %p.addr, align 8
  store i32** %q, i32*** %q.addr, align 8
  store i8* %t, i8** %t.addr, align 8
  store i8* %s, i8** %s.addr, align 8
  store i8* null, i8** %t.addr, align 8
  %0 = load i32**, i32*** %p.addr, align 8
  store i32* null, i32** %0, align 8
  %1 = load i32**, i32*** %p.addr, align 8
  %2 = load i32*, i32** %1, align 8
  %add.ptr = getelementptr inbounds i32, i32* %2, i64 1
  %3 = load i32**, i32*** %q.addr, align 8
  store i32* %add.ptr, i32** %3, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @k(i32* %p, i32* %q) #0 {
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
define dso_local void @l(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  store i32 %0, i32* @global, align 4
  %1 = load i32, i32* %x.addr, align 4
  store i32 %1, i32* @l.s, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @m() #0 {
entry:
  call void @l(i32 42)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.1-12 "}
