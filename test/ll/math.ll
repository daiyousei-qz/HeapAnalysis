; ModuleID = './src/math.c'
source_filename = "./src/math.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@PI = dso_local global double 0x400921FB54442D18, align 8
@E = dso_local global double 0x4005BF0A8B145769, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @FACTORIAL(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp ugt i32 %0, 1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4
  %2 = load i32, i32* %n.addr, align 4
  %sub = sub i32 %2, 1
  %call = call i32 @FACTORIAL(i32 %sub)
  %mul = mul i32 %1, %call
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %mul, %cond.true ], [ 1, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @Abs(double %x) #0 {
entry:
  %x.addr = alloca double, align 8
  store double %x, double* %x.addr, align 8
  %0 = load double, double* %x.addr, align 8
  %cmp = fcmp ogt double %0, 0.000000e+00
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load double, double* %x.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load double, double* %x.addr, align 8
  %sub = fsub double -0.000000e+00, %2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %1, %cond.true ], [ %sub, %cond.false ]
  ret double %cond
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @Floor(double %x, i32* %y) #0 {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca i32*, align 8
  store double %x, double* %x.addr, align 8
  store i32* %y, i32** %y.addr, align 8
  %0 = load double, double* @PI, align 8
  %add = fadd double %0, 1.000000e+00
  store double %add, double* @PI, align 8
  %1 = load double, double* %x.addr, align 8
  %conv = fptosi double %1 to i64
  %conv1 = sitofp i64 %conv to double
  ret double %conv1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @Ln(double %x) #0 {
entry:
  %x.addr = alloca double, align 8
  %factor = alloca double, align 8
  %val = alloca double, align 8
  %sum = alloca double, align 8
  %sign = alloca i32, align 4
  %pow = alloca double, align 8
  %i = alloca i32, align 4
  %tmp = alloca double, align 8
  store double %x, double* %x.addr, align 8
  store double 0.000000e+00, double* %factor, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load double, double* %x.addr, align 8
  %cmp = fcmp ogt double %0, 2.000000e+00
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load double, double* %factor, align 8
  %inc = fadd double %1, 1.000000e+00
  store double %inc, double* %factor, align 8
  %2 = load double, double* @E, align 8
  %3 = load double, double* %x.addr, align 8
  %div = fdiv double %3, %2
  store double %div, double* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %4 = load double, double* %x.addr, align 8
  %sub = fsub double %4, 1.000000e+00
  store double %sub, double* %val, align 8
  store double 0.000000e+00, double* %sum, align 8
  store i32 1, i32* %sign, align 4
  %5 = load double, double* %val, align 8
  store double %5, double* %pow, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %6 = load i32, i32* %i, align 4
  %cmp1 = icmp slt i32 %6, 100
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load double, double* %pow, align 8
  %8 = load i32, i32* %i, align 4
  %add = add nsw i32 %8, 1
  %conv = sitofp i32 %add to double
  %div2 = fdiv double %7, %conv
  store double %div2, double* %tmp, align 8
  %9 = load double, double* %tmp, align 8
  %10 = load i32, i32* %sign, align 4
  %conv3 = sitofp i32 %10 to double
  %mul = fmul double %9, %conv3
  %11 = load double, double* %sum, align 8
  %add4 = fadd double %11, %mul
  store double %add4, double* %sum, align 8
  %12 = load i32, i32* %sign, align 4
  %sub5 = sub nsw i32 0, %12
  store i32 %sub5, i32* %sign, align 4
  %13 = load double, double* %val, align 8
  %14 = load double, double* %pow, align 8
  %mul6 = fmul double %14, %13
  store double %mul6, double* %pow, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %15, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %16 = load double, double* %sum, align 8
  %17 = load double, double* %factor, align 8
  %add8 = fadd double %16, %17
  ret double %add8
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @Power(double %x, i32 %y) #0 {
entry:
  %retval = alloca double, align 8
  %x.addr = alloca double, align 8
  %y.addr = alloca i32, align 4
  %tmp = alloca double, align 8
  store double %x, double* %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32, i32* %y.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store double 1.000000e+00, double* %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %y.addr, align 4
  %cmp1 = icmp slt i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %2 = load double, double* %x.addr, align 8
  %3 = load i32, i32* %y.addr, align 4
  %sub = sub nsw i32 0, %3
  %call = call double @Power(double %2, i32 %sub)
  %div = fdiv double 1.000000e+00, %call
  store double %div, double* %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load double, double* %x.addr, align 8
  %5 = load i32, i32* %y.addr, align 4
  %div4 = sdiv i32 %5, 2
  %call5 = call double @Power(double %4, i32 %div4)
  store double %call5, double* %tmp, align 8
  %6 = load double, double* %tmp, align 8
  %7 = load double, double* %tmp, align 8
  %mul = fmul double %6, %7
  %8 = load i32, i32* %y.addr, align 4
  %and = and i32 %8, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end3
  %9 = load double, double* %x.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.end3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %9, %cond.true ], [ 1.000000e+00, %cond.false ]
  %mul6 = fmul double %mul, %cond
  store double %mul6, double* %retval, align 8
  br label %return

return:                                           ; preds = %cond.end, %if.then2, %if.then
  %10 = load double, double* %retval, align 8
  ret double %10
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.1-12 "}
