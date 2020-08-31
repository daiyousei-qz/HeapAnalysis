; ModuleID = './src/math.c'
source_filename = "./src/math.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@PI = dso_local global double 0x400921FB54442D18, align 8
@E = dso_local global double 0x4005BF0A8B145769, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @FACTORIAL(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp ugt i32 %3, 1
  br i1 %4, label %5, label %11

5:                                                ; preds = %1
  %6 = load i32, i32* %2, align 4
  %7 = load i32, i32* %2, align 4
  %8 = sub i32 %7, 1
  %9 = call i32 @FACTORIAL(i32 %8)
  %10 = mul i32 %6, %9
  br label %12

11:                                               ; preds = %1
  br label %12

12:                                               ; preds = %11, %5
  %13 = phi i32 [ %10, %5 ], [ 1, %11 ]
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @Abs(double) #0 {
  %2 = alloca double, align 8
  store double %0, double* %2, align 8
  %3 = load double, double* %2, align 8
  %4 = fcmp ogt double %3, 0.000000e+00
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = load double, double* %2, align 8
  br label %10

7:                                                ; preds = %1
  %8 = load double, double* %2, align 8
  %9 = fsub double -0.000000e+00, %8
  br label %10

10:                                               ; preds = %7, %5
  %11 = phi double [ %6, %5 ], [ %9, %7 ]
  ret double %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @Floor(double, i32*) #0 {
  %3 = alloca double, align 8
  %4 = alloca i32*, align 8
  store double %0, double* %3, align 8
  store i32* %1, i32** %4, align 8
  %5 = load double, double* @PI, align 8
  %6 = fadd double %5, 1.000000e+00
  store double %6, double* @PI, align 8
  %7 = load double, double* %3, align 8
  %8 = fptosi double %7 to i64
  %9 = sitofp i64 %8 to double
  ret double %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @Ln(double) #0 {
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  store double %0, double* %2, align 8
  store double 0.000000e+00, double* %3, align 8
  br label %10

10:                                               ; preds = %13, %1
  %11 = load double, double* %2, align 8
  %12 = fcmp ogt double %11, 2.000000e+00
  br i1 %12, label %13, label %19

13:                                               ; preds = %10
  %14 = load double, double* %3, align 8
  %15 = fadd double %14, 1.000000e+00
  store double %15, double* %3, align 8
  %16 = load double, double* @E, align 8
  %17 = load double, double* %2, align 8
  %18 = fdiv double %17, %16
  store double %18, double* %2, align 8
  br label %10

19:                                               ; preds = %10
  %20 = load double, double* %2, align 8
  %21 = fsub double %20, 1.000000e+00
  store double %21, double* %4, align 8
  store double 0.000000e+00, double* %5, align 8
  store i32 1, i32* %6, align 4
  %22 = load double, double* %4, align 8
  store double %22, double* %7, align 8
  store i32 0, i32* %8, align 4
  br label %23

23:                                               ; preds = %43, %19
  %24 = load i32, i32* %8, align 4
  %25 = icmp slt i32 %24, 100
  br i1 %25, label %26, label %46

26:                                               ; preds = %23
  %27 = load double, double* %7, align 8
  %28 = load i32, i32* %8, align 4
  %29 = add nsw i32 %28, 1
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %27, %30
  store double %31, double* %9, align 8
  %32 = load double, double* %9, align 8
  %33 = load i32, i32* %6, align 4
  %34 = sitofp i32 %33 to double
  %35 = fmul double %32, %34
  %36 = load double, double* %5, align 8
  %37 = fadd double %36, %35
  store double %37, double* %5, align 8
  %38 = load i32, i32* %6, align 4
  %39 = sub nsw i32 0, %38
  store i32 %39, i32* %6, align 4
  %40 = load double, double* %4, align 8
  %41 = load double, double* %7, align 8
  %42 = fmul double %41, %40
  store double %42, double* %7, align 8
  br label %43

43:                                               ; preds = %26
  %44 = load i32, i32* %8, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %8, align 4
  br label %23

46:                                               ; preds = %23
  %47 = load double, double* %5, align 8
  %48 = load double, double* %3, align 8
  %49 = fadd double %47, %48
  ret double %49
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @Power(double, i32) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  store double %0, double* %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load i32, i32* %5, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  store double 1.000000e+00, double* %3, align 8
  br label %36

10:                                               ; preds = %2
  %11 = load i32, i32* %5, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %19

13:                                               ; preds = %10
  %14 = load double, double* %4, align 8
  %15 = load i32, i32* %5, align 4
  %16 = sub nsw i32 0, %15
  %17 = call double @Power(double %14, i32 %16)
  %18 = fdiv double 1.000000e+00, %17
  store double %18, double* %3, align 8
  br label %36

19:                                               ; preds = %10
  %20 = load double, double* %4, align 8
  %21 = load i32, i32* %5, align 4
  %22 = sdiv i32 %21, 2
  %23 = call double @Power(double %20, i32 %22)
  store double %23, double* %6, align 8
  %24 = load double, double* %6, align 8
  %25 = load double, double* %6, align 8
  %26 = fmul double %24, %25
  %27 = load i32, i32* %5, align 4
  %28 = and i32 %27, 1
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %19
  %31 = load double, double* %4, align 8
  br label %33

32:                                               ; preds = %19
  br label %33

33:                                               ; preds = %32, %30
  %34 = phi double [ %31, %30 ], [ 1.000000e+00, %32 ]
  %35 = fmul double %26, %34
  store double %35, double* %3, align 8
  br label %36

36:                                               ; preds = %33, %13, %9
  %37 = load double, double* %3, align 8
  ret double %37
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)"}
