; ModuleID = './src/loop.c'
source_filename = "./src/loop.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @while_loop(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %x.addr, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %x.addr, align 4
  %add = add nsw i32 %1, 1
  store i32 %add, i32* %x.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @dowhile_loop(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32, i32* %x.addr, align 4
  %add = add nsw i32 %0, 1
  store i32 %add, i32* %x.addr, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %1 = load i32, i32* %x.addr, align 4
  %cmp = icmp slt i32 %1, 10
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @atomic_test() #0 {
entry:
  %counter = alloca i32, align 4
  %i = alloca i32, align 4
  %.atomictmp = alloca i32, align 4
  %atomic-temp = alloca i32, align 4
  store i32 0, i32* %counter, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %.atomictmp, align 4
  %1 = load i32, i32* %.atomictmp, align 4
  %2 = atomicrmw add i32* %counter, i32 %1 seq_cst
  store i32 %2, i32* %atomic-temp, align 4
  %3 = load i32, i32* %atomic-temp, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @goto_test(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  br label %loop_begin

loop_begin:                                       ; preds = %if.end3, %entry
  %0 = load i32, i32* %x.addr, align 4
  %cmp = icmp sge i32 %0, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %loop_begin
  br label %loop_end

if.end:                                           ; preds = %loop_begin
  %1 = load i32, i32* %x.addr, align 4
  %add = add nsw i32 %1, 1
  store i32 %add, i32* %x.addr, align 4
  %2 = load i32, i32* %x.addr, align 4
  %cmp1 = icmp eq i32 %2, 5
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  br label %random_label

if.end3:                                          ; preds = %if.end
  br label %loop_begin

loop_end:                                         ; preds = %if.then
  %3 = load i32, i32* %x.addr, align 4
  %add4 = add nsw i32 %3, 10
  store i32 %add4, i32* %x.addr, align 4
  %4 = load i32, i32* %x.addr, align 4
  %cmp5 = icmp sgt i32 %4, 10
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %loop_end
  br label %random_label

random_label:                                     ; preds = %if.then6, %if.then2
  %5 = load i32, i32* %x.addr, align 4
  %sub = sub nsw i32 %5, 10
  store i32 %sub, i32* %x.addr, align 4
  br label %if.end7

if.end7:                                          ; preds = %random_label, %loop_end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @nest_test(i32 %x, i32 %y, i32 %z) #0 {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %z.addr = alloca i32, align 4
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %z, i32* %z.addr, align 4
  store i32 0, i32* %result, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %x.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %rem = srem i32 %2, 2
  %cmp1 = icmp eq i32 %rem, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* %result, align 4
  %add = add nsw i32 %4, %3
  store i32 %add, i32* %result, align 4
  br label %for.inc13

if.end:                                           ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc10, %if.end
  %5 = load i32, i32* %j, align 4
  %6 = load i32, i32* %y.addr, align 4
  %cmp3 = icmp slt i32 %5, %6
  br i1 %cmp3, label %for.body4, label %for.end12

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %7 = load i32, i32* %k, align 4
  %8 = load i32, i32* %z.addr, align 4
  %cmp6 = icmp slt i32 %7, %8
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %j, align 4
  %mul = mul nsw i32 %9, %10
  %11 = load i32, i32* %k, align 4
  %mul8 = mul nsw i32 %mul, %11
  %12 = load i32, i32* %result, align 4
  %add9 = add nsw i32 %12, %mul8
  store i32 %add9, i32* %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body7
  %13 = load i32, i32* %k, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %14 = load i32, i32* %j, align 4
  %inc11 = add nsw i32 %14, 1
  store i32 %inc11, i32* %j, align 4
  br label %for.cond2

for.end12:                                        ; preds = %for.cond2
  br label %for.inc13

for.inc13:                                        ; preds = %for.end12, %if.then
  %15 = load i32, i32* %i, align 4
  %inc14 = add nsw i32 %15, 1
  store i32 %inc14, i32* %i, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %16 = load i32, i32* %result, align 4
  ret i32 %16
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.1-12 "}
