; ModuleID = 'mcf.bc'
source_filename = "ld-temp.o"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.network = type { [200 x i8], [200 x i8], i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double, i64, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i64 }
%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }
%struct.basket = type { %struct.arc*, i64, i64 }

@.str = private unnamed_addr constant [20 x i8] c"net->max_new_m >= 3\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"implicit.c\00", align 1
@__PRETTY_FUNCTION__.resize_prob = private unnamed_addr constant [30 x i8] c"long resize_prob(network_t *)\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"network %s: not enough memory\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@net = internal global %struct.network zeroinitializer, align 8
@.str.3 = private unnamed_addr constant [34 x i8] c"active arcs                : %ld\0A\00", align 1
@.str.1.4 = private unnamed_addr constant [34 x i8] c"simplex iterations         : %ld\0A\00", align 1
@.str.2.5 = private unnamed_addr constant [36 x i8] c"objective value            : %0.0f\0A\00", align 1
@.str.3.6 = private unnamed_addr constant [34 x i8] c"erased arcs                : %ld\0A\00", align 1
@.str.4 = private unnamed_addr constant [34 x i8] c"new implicit arcs          : %ld\0A\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"not enough memory, exit(-1)\0A\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"checksum                   : %ld\0A\00", align 1
@.str.7 = private unnamed_addr constant [32 x i8] c"\0AMCF SPEC CPU2006 version 1.10\0A\00", align 1
@.str.8 = private unnamed_addr constant [52 x i8] c"Copyright (c) 1998-2000 Zuse Institut Berlin (ZIB)\0A\00", align 1
@.str.9 = private unnamed_addr constant [46 x i8] c"Copyright (c) 2000-2002 Andreas Loebel & ZIB\0A\00", align 1
@.str.10 = private unnamed_addr constant [40 x i8] c"Copyright (c) 2003-2005 Andreas Loebel\0A\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.12 = private unnamed_addr constant [18 x i8] c"read error, exit\0A\00", align 1
@.str.13 = private unnamed_addr constant [34 x i8] c"nodes                      : %ld\0A\00", align 1
@.str.14 = private unnamed_addr constant [6 x i8] c"done\0A\00", align 1
@.str.15 = private unnamed_addr constant [8 x i8] c"mcf.out\00", align 1
@.str.16 = private unnamed_addr constant [25 x i8] c"PRIMAL NETWORK SIMPLEX: \00", align 1
@.str.1.17 = private unnamed_addr constant [49 x i8] c"artificial arc with nonzero flow, node %d (%ld)\0A\00", align 1
@.str.2.18 = private unnamed_addr constant [31 x i8] c"basis primal infeasible (%ld)\0A\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.3.19 = private unnamed_addr constant [23 x i8] c"DUAL NETWORK SIMPLEX: \00", align 1
@.str.4.20 = private unnamed_addr constant [23 x i8] c"basis dual infeasible\0A\00", align 1
@.str.25 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1.26 = private unnamed_addr constant [4 x i8] c"()\0A\00", align 1
@.str.2.27 = private unnamed_addr constant [5 x i8] c"***\0A\00", align 1
@.str.3.28 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@perm = internal global [351 x %struct.basket*] zeroinitializer, align 16
@initialize = internal global i64 1, align 8
@basket = internal global [351 x %struct.basket] zeroinitializer, align 16
@nr_group = internal global i64 0, align 8
@group_pos = internal global i64 0, align 8
@basket_size = internal global i64 0, align 8
@.str.35 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1.36 = private unnamed_addr constant [8 x i8] c"%ld %ld\00", align 1
@.str.2.37 = private unnamed_addr constant [20 x i8] c"net->max_new_m >= 3\00", align 1
@.str.3.38 = private unnamed_addr constant [10 x i8] c"readmin.c\00", align 1
@__PRETTY_FUNCTION__.read_min = private unnamed_addr constant [27 x i8] c"long read_min(network_t *)\00", align 1
@.str.4.39 = private unnamed_addr constant [31 x i8] c"read_min(): not enough memory\0A\00", align 1
@.str.5.40 = private unnamed_addr constant [12 x i8] c"%ld %ld %ld\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @resize_prob(%struct.network* %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca %struct.network*, align 8
  %4 = alloca %struct.arc*, align 8
  %5 = alloca %struct.node*, align 8
  %6 = alloca %struct.node*, align 8
  %7 = alloca %struct.node*, align 8
  %8 = alloca i64, align 8
  store %struct.network* %0, %struct.network** %3, align 8
  %9 = load %struct.network*, %struct.network** %3, align 8
  %10 = getelementptr inbounds %struct.network, %struct.network* %9, i32 0, i32 9
  %11 = load i64, i64* %10, align 8
  %12 = icmp sge i64 %11, 3
  br i1 %12, label %13, label %14

13:                                               ; preds = %1
  br label %15

14:                                               ; preds = %1
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 39, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__PRETTY_FUNCTION__.resize_prob, i64 0, i64 0)) #6
  unreachable

15:                                               ; preds = %13
  %16 = load %struct.network*, %struct.network** %3, align 8
  %17 = getelementptr inbounds %struct.network, %struct.network* %16, i32 0, i32 9
  %18 = load i64, i64* %17, align 8
  %19 = load %struct.network*, %struct.network** %3, align 8
  %20 = getelementptr inbounds %struct.network, %struct.network* %19, i32 0, i32 4
  %21 = load i64, i64* %20, align 8
  %22 = add nsw i64 %21, %18
  store i64 %22, i64* %20, align 8
  %23 = load %struct.network*, %struct.network** %3, align 8
  %24 = getelementptr inbounds %struct.network, %struct.network* %23, i32 0, i32 9
  %25 = load i64, i64* %24, align 8
  %26 = load %struct.network*, %struct.network** %3, align 8
  %27 = getelementptr inbounds %struct.network, %struct.network* %26, i32 0, i32 8
  %28 = load i64, i64* %27, align 8
  %29 = add nsw i64 %28, %25
  store i64 %29, i64* %27, align 8
  %30 = load %struct.network*, %struct.network** %3, align 8
  %31 = getelementptr inbounds %struct.network, %struct.network* %30, i32 0, i32 23
  %32 = load %struct.arc*, %struct.arc** %31, align 8
  %33 = bitcast %struct.arc* %32 to i8*
  %34 = load %struct.network*, %struct.network** %3, align 8
  %35 = getelementptr inbounds %struct.network, %struct.network* %34, i32 0, i32 4
  %36 = load i64, i64* %35, align 8
  %37 = mul i64 %36, 64
  %38 = call i8* @realloc(i8* %33, i64 %37) #7
  %39 = bitcast i8* %38 to %struct.arc*
  store %struct.arc* %39, %struct.arc** %4, align 8
  %40 = load %struct.arc*, %struct.arc** %4, align 8
  %41 = icmp ne %struct.arc* %40, null
  br i1 %41, label %49, label %42

42:                                               ; preds = %15
  %43 = load %struct.network*, %struct.network** %3, align 8
  %44 = getelementptr inbounds %struct.network, %struct.network* %43, i32 0, i32 0
  %45 = getelementptr inbounds [200 x i8], [200 x i8]* %44, i64 0, i64 0
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i8* %45)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %48 = call i32 @fflush(%struct._IO_FILE* %47)
  store i64 -1, i64* %2, align 8
  br label %102

49:                                               ; preds = %15
  %50 = load %struct.arc*, %struct.arc** %4, align 8
  %51 = ptrtoint %struct.arc* %50 to i64
  %52 = load %struct.network*, %struct.network** %3, align 8
  %53 = getelementptr inbounds %struct.network, %struct.network* %52, i32 0, i32 23
  %54 = load %struct.arc*, %struct.arc** %53, align 8
  %55 = ptrtoint %struct.arc* %54 to i64
  %56 = sub i64 %51, %55
  store i64 %56, i64* %8, align 8
  %57 = load %struct.arc*, %struct.arc** %4, align 8
  %58 = load %struct.network*, %struct.network** %3, align 8
  %59 = getelementptr inbounds %struct.network, %struct.network* %58, i32 0, i32 23
  store %struct.arc* %57, %struct.arc** %59, align 8
  %60 = load %struct.arc*, %struct.arc** %4, align 8
  %61 = load %struct.network*, %struct.network** %3, align 8
  %62 = getelementptr inbounds %struct.network, %struct.network* %61, i32 0, i32 5
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds %struct.arc, %struct.arc* %60, i64 %63
  %65 = load %struct.network*, %struct.network** %3, align 8
  %66 = getelementptr inbounds %struct.network, %struct.network* %65, i32 0, i32 24
  store %struct.arc* %64, %struct.arc** %66, align 8
  %67 = load %struct.network*, %struct.network** %3, align 8
  %68 = getelementptr inbounds %struct.network, %struct.network* %67, i32 0, i32 21
  %69 = load %struct.node*, %struct.node** %68, align 8
  store %struct.node* %69, %struct.node** %5, align 8
  store %struct.node* %69, %struct.node** %7, align 8
  %70 = load %struct.node*, %struct.node** %5, align 8
  %71 = getelementptr inbounds %struct.node, %struct.node* %70, i32 1
  store %struct.node* %71, %struct.node** %5, align 8
  %72 = load %struct.network*, %struct.network** %3, align 8
  %73 = getelementptr inbounds %struct.network, %struct.network* %72, i32 0, i32 22
  %74 = load %struct.node*, %struct.node** %73, align 8
  %75 = bitcast %struct.node* %74 to i8*
  %76 = bitcast i8* %75 to %struct.node*
  store %struct.node* %76, %struct.node** %6, align 8
  br label %77

77:                                               ; preds = %98, %49
  %78 = load %struct.node*, %struct.node** %5, align 8
  %79 = load %struct.node*, %struct.node** %6, align 8
  %80 = icmp ult %struct.node* %78, %79
  br i1 %80, label %81, label %101

81:                                               ; preds = %77
  %82 = load %struct.node*, %struct.node** %5, align 8
  %83 = getelementptr inbounds %struct.node, %struct.node* %82, i32 0, i32 3
  %84 = load %struct.node*, %struct.node** %83, align 8
  %85 = load %struct.node*, %struct.node** %7, align 8
  %86 = icmp ne %struct.node* %84, %85
  br i1 %86, label %87, label %97

87:                                               ; preds = %81
  %88 = load %struct.node*, %struct.node** %5, align 8
  %89 = getelementptr inbounds %struct.node, %struct.node* %88, i32 0, i32 6
  %90 = load %struct.arc*, %struct.arc** %89, align 8
  %91 = ptrtoint %struct.arc* %90 to i64
  %92 = load i64, i64* %8, align 8
  %93 = add i64 %91, %92
  %94 = inttoptr i64 %93 to %struct.arc*
  %95 = load %struct.node*, %struct.node** %5, align 8
  %96 = getelementptr inbounds %struct.node, %struct.node* %95, i32 0, i32 6
  store %struct.arc* %94, %struct.arc** %96, align 8
  br label %97

97:                                               ; preds = %87, %81
  br label %98

98:                                               ; preds = %97
  %99 = load %struct.node*, %struct.node** %5, align 8
  %100 = getelementptr inbounds %struct.node, %struct.node* %99, i32 1
  store %struct.node* %100, %struct.node** %5, align 8
  br label %77, !llvm.loop !5

101:                                              ; preds = %77
  store i64 0, i64* %2, align 8
  br label %102

102:                                              ; preds = %101, %42
  %103 = load i64, i64* %2, align 8
  ret i64 %103
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

declare dso_local i32 @printf(i8*, ...) #3

declare dso_local i32 @fflush(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @insert_new_arc(%struct.arc* %0, i64 %1, %struct.node* %2, %struct.node* %3, i64 %4, i64 %5) #0 {
  %7 = alloca %struct.arc*, align 8
  %8 = alloca i64, align 8
  %9 = alloca %struct.node*, align 8
  %10 = alloca %struct.node*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  store %struct.arc* %0, %struct.arc** %7, align 8
  store i64 %1, i64* %8, align 8
  store %struct.node* %2, %struct.node** %9, align 8
  store %struct.node* %3, %struct.node** %10, align 8
  store i64 %4, i64* %11, align 8
  store i64 %5, i64* %12, align 8
  %14 = load %struct.node*, %struct.node** %9, align 8
  %15 = load %struct.arc*, %struct.arc** %7, align 8
  %16 = load i64, i64* %8, align 8
  %17 = getelementptr inbounds %struct.arc, %struct.arc* %15, i64 %16
  %18 = getelementptr inbounds %struct.arc, %struct.arc* %17, i32 0, i32 1
  store %struct.node* %14, %struct.node** %18, align 8
  %19 = load %struct.node*, %struct.node** %10, align 8
  %20 = load %struct.arc*, %struct.arc** %7, align 8
  %21 = load i64, i64* %8, align 8
  %22 = getelementptr inbounds %struct.arc, %struct.arc* %20, i64 %21
  %23 = getelementptr inbounds %struct.arc, %struct.arc* %22, i32 0, i32 2
  store %struct.node* %19, %struct.node** %23, align 8
  %24 = load i64, i64* %11, align 8
  %25 = load %struct.arc*, %struct.arc** %7, align 8
  %26 = load i64, i64* %8, align 8
  %27 = getelementptr inbounds %struct.arc, %struct.arc* %25, i64 %26
  %28 = getelementptr inbounds %struct.arc, %struct.arc* %27, i32 0, i32 7
  store i64 %24, i64* %28, align 8
  %29 = load i64, i64* %11, align 8
  %30 = load %struct.arc*, %struct.arc** %7, align 8
  %31 = load i64, i64* %8, align 8
  %32 = getelementptr inbounds %struct.arc, %struct.arc* %30, i64 %31
  %33 = getelementptr inbounds %struct.arc, %struct.arc* %32, i32 0, i32 0
  store i64 %29, i64* %33, align 8
  %34 = load i64, i64* %12, align 8
  %35 = load %struct.arc*, %struct.arc** %7, align 8
  %36 = load i64, i64* %8, align 8
  %37 = getelementptr inbounds %struct.arc, %struct.arc* %35, i64 %36
  %38 = getelementptr inbounds %struct.arc, %struct.arc* %37, i32 0, i32 6
  store i64 %34, i64* %38, align 8
  %39 = load i64, i64* %8, align 8
  %40 = add nsw i64 %39, 1
  store i64 %40, i64* %13, align 8
  br label %41

41:                                               ; preds = %57, %6
  %42 = load i64, i64* %13, align 8
  %43 = sub nsw i64 %42, 1
  %44 = icmp ne i64 %43, 0
  br i1 %44, label %45, label %55

45:                                               ; preds = %41
  %46 = load i64, i64* %12, align 8
  %47 = load %struct.arc*, %struct.arc** %7, align 8
  %48 = load i64, i64* %13, align 8
  %49 = sdiv i64 %48, 2
  %50 = sub nsw i64 %49, 1
  %51 = getelementptr inbounds %struct.arc, %struct.arc* %47, i64 %50
  %52 = getelementptr inbounds %struct.arc, %struct.arc* %51, i32 0, i32 6
  %53 = load i64, i64* %52, align 8
  %54 = icmp sgt i64 %46, %53
  br label %55

55:                                               ; preds = %45, %41
  %56 = phi i1 [ false, %41 ], [ %54, %45 ]
  br i1 %56, label %57, label %150

57:                                               ; preds = %55
  %58 = load %struct.arc*, %struct.arc** %7, align 8
  %59 = load i64, i64* %13, align 8
  %60 = sdiv i64 %59, 2
  %61 = sub nsw i64 %60, 1
  %62 = getelementptr inbounds %struct.arc, %struct.arc* %58, i64 %61
  %63 = getelementptr inbounds %struct.arc, %struct.arc* %62, i32 0, i32 1
  %64 = load %struct.node*, %struct.node** %63, align 8
  %65 = load %struct.arc*, %struct.arc** %7, align 8
  %66 = load i64, i64* %13, align 8
  %67 = sub nsw i64 %66, 1
  %68 = getelementptr inbounds %struct.arc, %struct.arc* %65, i64 %67
  %69 = getelementptr inbounds %struct.arc, %struct.arc* %68, i32 0, i32 1
  store %struct.node* %64, %struct.node** %69, align 8
  %70 = load %struct.arc*, %struct.arc** %7, align 8
  %71 = load i64, i64* %13, align 8
  %72 = sdiv i64 %71, 2
  %73 = sub nsw i64 %72, 1
  %74 = getelementptr inbounds %struct.arc, %struct.arc* %70, i64 %73
  %75 = getelementptr inbounds %struct.arc, %struct.arc* %74, i32 0, i32 2
  %76 = load %struct.node*, %struct.node** %75, align 8
  %77 = load %struct.arc*, %struct.arc** %7, align 8
  %78 = load i64, i64* %13, align 8
  %79 = sub nsw i64 %78, 1
  %80 = getelementptr inbounds %struct.arc, %struct.arc* %77, i64 %79
  %81 = getelementptr inbounds %struct.arc, %struct.arc* %80, i32 0, i32 2
  store %struct.node* %76, %struct.node** %81, align 8
  %82 = load %struct.arc*, %struct.arc** %7, align 8
  %83 = load i64, i64* %13, align 8
  %84 = sdiv i64 %83, 2
  %85 = sub nsw i64 %84, 1
  %86 = getelementptr inbounds %struct.arc, %struct.arc* %82, i64 %85
  %87 = getelementptr inbounds %struct.arc, %struct.arc* %86, i32 0, i32 0
  %88 = load i64, i64* %87, align 8
  %89 = load %struct.arc*, %struct.arc** %7, align 8
  %90 = load i64, i64* %13, align 8
  %91 = sub nsw i64 %90, 1
  %92 = getelementptr inbounds %struct.arc, %struct.arc* %89, i64 %91
  %93 = getelementptr inbounds %struct.arc, %struct.arc* %92, i32 0, i32 0
  store i64 %88, i64* %93, align 8
  %94 = load %struct.arc*, %struct.arc** %7, align 8
  %95 = load i64, i64* %13, align 8
  %96 = sdiv i64 %95, 2
  %97 = sub nsw i64 %96, 1
  %98 = getelementptr inbounds %struct.arc, %struct.arc* %94, i64 %97
  %99 = getelementptr inbounds %struct.arc, %struct.arc* %98, i32 0, i32 0
  %100 = load i64, i64* %99, align 8
  %101 = load %struct.arc*, %struct.arc** %7, align 8
  %102 = load i64, i64* %13, align 8
  %103 = sub nsw i64 %102, 1
  %104 = getelementptr inbounds %struct.arc, %struct.arc* %101, i64 %103
  %105 = getelementptr inbounds %struct.arc, %struct.arc* %104, i32 0, i32 7
  store i64 %100, i64* %105, align 8
  %106 = load %struct.arc*, %struct.arc** %7, align 8
  %107 = load i64, i64* %13, align 8
  %108 = sdiv i64 %107, 2
  %109 = sub nsw i64 %108, 1
  %110 = getelementptr inbounds %struct.arc, %struct.arc* %106, i64 %109
  %111 = getelementptr inbounds %struct.arc, %struct.arc* %110, i32 0, i32 6
  %112 = load i64, i64* %111, align 8
  %113 = load %struct.arc*, %struct.arc** %7, align 8
  %114 = load i64, i64* %13, align 8
  %115 = sub nsw i64 %114, 1
  %116 = getelementptr inbounds %struct.arc, %struct.arc* %113, i64 %115
  %117 = getelementptr inbounds %struct.arc, %struct.arc* %116, i32 0, i32 6
  store i64 %112, i64* %117, align 8
  %118 = load i64, i64* %13, align 8
  %119 = sdiv i64 %118, 2
  store i64 %119, i64* %13, align 8
  %120 = load %struct.node*, %struct.node** %9, align 8
  %121 = load %struct.arc*, %struct.arc** %7, align 8
  %122 = load i64, i64* %13, align 8
  %123 = sub nsw i64 %122, 1
  %124 = getelementptr inbounds %struct.arc, %struct.arc* %121, i64 %123
  %125 = getelementptr inbounds %struct.arc, %struct.arc* %124, i32 0, i32 1
  store %struct.node* %120, %struct.node** %125, align 8
  %126 = load %struct.node*, %struct.node** %10, align 8
  %127 = load %struct.arc*, %struct.arc** %7, align 8
  %128 = load i64, i64* %13, align 8
  %129 = sub nsw i64 %128, 1
  %130 = getelementptr inbounds %struct.arc, %struct.arc* %127, i64 %129
  %131 = getelementptr inbounds %struct.arc, %struct.arc* %130, i32 0, i32 2
  store %struct.node* %126, %struct.node** %131, align 8
  %132 = load i64, i64* %11, align 8
  %133 = load %struct.arc*, %struct.arc** %7, align 8
  %134 = load i64, i64* %13, align 8
  %135 = sub nsw i64 %134, 1
  %136 = getelementptr inbounds %struct.arc, %struct.arc* %133, i64 %135
  %137 = getelementptr inbounds %struct.arc, %struct.arc* %136, i32 0, i32 0
  store i64 %132, i64* %137, align 8
  %138 = load i64, i64* %11, align 8
  %139 = load %struct.arc*, %struct.arc** %7, align 8
  %140 = load i64, i64* %13, align 8
  %141 = sub nsw i64 %140, 1
  %142 = getelementptr inbounds %struct.arc, %struct.arc* %139, i64 %141
  %143 = getelementptr inbounds %struct.arc, %struct.arc* %142, i32 0, i32 7
  store i64 %138, i64* %143, align 8
  %144 = load i64, i64* %12, align 8
  %145 = load %struct.arc*, %struct.arc** %7, align 8
  %146 = load i64, i64* %13, align 8
  %147 = sub nsw i64 %146, 1
  %148 = getelementptr inbounds %struct.arc, %struct.arc* %145, i64 %147
  %149 = getelementptr inbounds %struct.arc, %struct.arc* %148, i32 0, i32 6
  store i64 %144, i64* %149, align 8
  br label %41, !llvm.loop !7

150:                                              ; preds = %55
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @replace_weaker_arc(%struct.network* %0, %struct.arc* %1, %struct.node* %2, %struct.node* %3, i64 %4, i64 %5) #0 {
  %7 = alloca %struct.network*, align 8
  %8 = alloca %struct.arc*, align 8
  %9 = alloca %struct.node*, align 8
  %10 = alloca %struct.node*, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store %struct.network* %0, %struct.network** %7, align 8
  store %struct.arc* %1, %struct.arc** %8, align 8
  store %struct.node* %2, %struct.node** %9, align 8
  store %struct.node* %3, %struct.node** %10, align 8
  store i64 %4, i64* %11, align 8
  store i64 %5, i64* %12, align 8
  %15 = load %struct.node*, %struct.node** %9, align 8
  %16 = load %struct.arc*, %struct.arc** %8, align 8
  %17 = getelementptr inbounds %struct.arc, %struct.arc* %16, i64 0
  %18 = getelementptr inbounds %struct.arc, %struct.arc* %17, i32 0, i32 1
  store %struct.node* %15, %struct.node** %18, align 8
  %19 = load %struct.node*, %struct.node** %10, align 8
  %20 = load %struct.arc*, %struct.arc** %8, align 8
  %21 = getelementptr inbounds %struct.arc, %struct.arc* %20, i64 0
  %22 = getelementptr inbounds %struct.arc, %struct.arc* %21, i32 0, i32 2
  store %struct.node* %19, %struct.node** %22, align 8
  %23 = load i64, i64* %11, align 8
  %24 = load %struct.arc*, %struct.arc** %8, align 8
  %25 = getelementptr inbounds %struct.arc, %struct.arc* %24, i64 0
  %26 = getelementptr inbounds %struct.arc, %struct.arc* %25, i32 0, i32 7
  store i64 %23, i64* %26, align 8
  %27 = load i64, i64* %11, align 8
  %28 = load %struct.arc*, %struct.arc** %8, align 8
  %29 = getelementptr inbounds %struct.arc, %struct.arc* %28, i64 0
  %30 = getelementptr inbounds %struct.arc, %struct.arc* %29, i32 0, i32 0
  store i64 %27, i64* %30, align 8
  %31 = load i64, i64* %12, align 8
  %32 = load %struct.arc*, %struct.arc** %8, align 8
  %33 = getelementptr inbounds %struct.arc, %struct.arc* %32, i64 0
  %34 = getelementptr inbounds %struct.arc, %struct.arc* %33, i32 0, i32 6
  store i64 %31, i64* %34, align 8
  store i64 1, i64* %13, align 8
  %35 = load %struct.arc*, %struct.arc** %8, align 8
  %36 = getelementptr inbounds %struct.arc, %struct.arc* %35, i64 1
  %37 = getelementptr inbounds %struct.arc, %struct.arc* %36, i32 0, i32 6
  %38 = load i64, i64* %37, align 8
  %39 = load %struct.arc*, %struct.arc** %8, align 8
  %40 = getelementptr inbounds %struct.arc, %struct.arc* %39, i64 2
  %41 = getelementptr inbounds %struct.arc, %struct.arc* %40, i32 0, i32 6
  %42 = load i64, i64* %41, align 8
  %43 = icmp sgt i64 %38, %42
  %44 = zext i1 %43 to i64
  %45 = select i1 %43, i32 2, i32 3
  %46 = sext i32 %45 to i64
  store i64 %46, i64* %14, align 8
  br label %47

47:                                               ; preds = %176, %6
  %48 = load i64, i64* %14, align 8
  %49 = load %struct.network*, %struct.network** %7, align 8
  %50 = getelementptr inbounds %struct.network, %struct.network* %49, i32 0, i32 8
  %51 = load i64, i64* %50, align 8
  %52 = icmp sle i64 %48, %51
  br i1 %52, label %53, label %62

53:                                               ; preds = %47
  %54 = load i64, i64* %12, align 8
  %55 = load %struct.arc*, %struct.arc** %8, align 8
  %56 = load i64, i64* %14, align 8
  %57 = sub nsw i64 %56, 1
  %58 = getelementptr inbounds %struct.arc, %struct.arc* %55, i64 %57
  %59 = getelementptr inbounds %struct.arc, %struct.arc* %58, i32 0, i32 6
  %60 = load i64, i64* %59, align 8
  %61 = icmp slt i64 %54, %60
  br label %62

62:                                               ; preds = %53, %47
  %63 = phi i1 [ false, %47 ], [ %61, %53 ]
  br i1 %63, label %64, label %177

64:                                               ; preds = %62
  %65 = load %struct.arc*, %struct.arc** %8, align 8
  %66 = load i64, i64* %14, align 8
  %67 = sub nsw i64 %66, 1
  %68 = getelementptr inbounds %struct.arc, %struct.arc* %65, i64 %67
  %69 = getelementptr inbounds %struct.arc, %struct.arc* %68, i32 0, i32 1
  %70 = load %struct.node*, %struct.node** %69, align 8
  %71 = load %struct.arc*, %struct.arc** %8, align 8
  %72 = load i64, i64* %13, align 8
  %73 = sub nsw i64 %72, 1
  %74 = getelementptr inbounds %struct.arc, %struct.arc* %71, i64 %73
  %75 = getelementptr inbounds %struct.arc, %struct.arc* %74, i32 0, i32 1
  store %struct.node* %70, %struct.node** %75, align 8
  %76 = load %struct.arc*, %struct.arc** %8, align 8
  %77 = load i64, i64* %14, align 8
  %78 = sub nsw i64 %77, 1
  %79 = getelementptr inbounds %struct.arc, %struct.arc* %76, i64 %78
  %80 = getelementptr inbounds %struct.arc, %struct.arc* %79, i32 0, i32 2
  %81 = load %struct.node*, %struct.node** %80, align 8
  %82 = load %struct.arc*, %struct.arc** %8, align 8
  %83 = load i64, i64* %13, align 8
  %84 = sub nsw i64 %83, 1
  %85 = getelementptr inbounds %struct.arc, %struct.arc* %82, i64 %84
  %86 = getelementptr inbounds %struct.arc, %struct.arc* %85, i32 0, i32 2
  store %struct.node* %81, %struct.node** %86, align 8
  %87 = load %struct.arc*, %struct.arc** %8, align 8
  %88 = load i64, i64* %14, align 8
  %89 = sub nsw i64 %88, 1
  %90 = getelementptr inbounds %struct.arc, %struct.arc* %87, i64 %89
  %91 = getelementptr inbounds %struct.arc, %struct.arc* %90, i32 0, i32 0
  %92 = load i64, i64* %91, align 8
  %93 = load %struct.arc*, %struct.arc** %8, align 8
  %94 = load i64, i64* %13, align 8
  %95 = sub nsw i64 %94, 1
  %96 = getelementptr inbounds %struct.arc, %struct.arc* %93, i64 %95
  %97 = getelementptr inbounds %struct.arc, %struct.arc* %96, i32 0, i32 0
  store i64 %92, i64* %97, align 8
  %98 = load %struct.arc*, %struct.arc** %8, align 8
  %99 = load i64, i64* %14, align 8
  %100 = sub nsw i64 %99, 1
  %101 = getelementptr inbounds %struct.arc, %struct.arc* %98, i64 %100
  %102 = getelementptr inbounds %struct.arc, %struct.arc* %101, i32 0, i32 0
  %103 = load i64, i64* %102, align 8
  %104 = load %struct.arc*, %struct.arc** %8, align 8
  %105 = load i64, i64* %13, align 8
  %106 = sub nsw i64 %105, 1
  %107 = getelementptr inbounds %struct.arc, %struct.arc* %104, i64 %106
  %108 = getelementptr inbounds %struct.arc, %struct.arc* %107, i32 0, i32 7
  store i64 %103, i64* %108, align 8
  %109 = load %struct.arc*, %struct.arc** %8, align 8
  %110 = load i64, i64* %14, align 8
  %111 = sub nsw i64 %110, 1
  %112 = getelementptr inbounds %struct.arc, %struct.arc* %109, i64 %111
  %113 = getelementptr inbounds %struct.arc, %struct.arc* %112, i32 0, i32 6
  %114 = load i64, i64* %113, align 8
  %115 = load %struct.arc*, %struct.arc** %8, align 8
  %116 = load i64, i64* %13, align 8
  %117 = sub nsw i64 %116, 1
  %118 = getelementptr inbounds %struct.arc, %struct.arc* %115, i64 %117
  %119 = getelementptr inbounds %struct.arc, %struct.arc* %118, i32 0, i32 6
  store i64 %114, i64* %119, align 8
  %120 = load %struct.node*, %struct.node** %9, align 8
  %121 = load %struct.arc*, %struct.arc** %8, align 8
  %122 = load i64, i64* %14, align 8
  %123 = sub nsw i64 %122, 1
  %124 = getelementptr inbounds %struct.arc, %struct.arc* %121, i64 %123
  %125 = getelementptr inbounds %struct.arc, %struct.arc* %124, i32 0, i32 1
  store %struct.node* %120, %struct.node** %125, align 8
  %126 = load %struct.node*, %struct.node** %10, align 8
  %127 = load %struct.arc*, %struct.arc** %8, align 8
  %128 = load i64, i64* %14, align 8
  %129 = sub nsw i64 %128, 1
  %130 = getelementptr inbounds %struct.arc, %struct.arc* %127, i64 %129
  %131 = getelementptr inbounds %struct.arc, %struct.arc* %130, i32 0, i32 2
  store %struct.node* %126, %struct.node** %131, align 8
  %132 = load i64, i64* %11, align 8
  %133 = load %struct.arc*, %struct.arc** %8, align 8
  %134 = load i64, i64* %14, align 8
  %135 = sub nsw i64 %134, 1
  %136 = getelementptr inbounds %struct.arc, %struct.arc* %133, i64 %135
  %137 = getelementptr inbounds %struct.arc, %struct.arc* %136, i32 0, i32 0
  store i64 %132, i64* %137, align 8
  %138 = load i64, i64* %11, align 8
  %139 = load %struct.arc*, %struct.arc** %8, align 8
  %140 = load i64, i64* %14, align 8
  %141 = sub nsw i64 %140, 1
  %142 = getelementptr inbounds %struct.arc, %struct.arc* %139, i64 %141
  %143 = getelementptr inbounds %struct.arc, %struct.arc* %142, i32 0, i32 7
  store i64 %138, i64* %143, align 8
  %144 = load i64, i64* %12, align 8
  %145 = load %struct.arc*, %struct.arc** %8, align 8
  %146 = load i64, i64* %14, align 8
  %147 = sub nsw i64 %146, 1
  %148 = getelementptr inbounds %struct.arc, %struct.arc* %145, i64 %147
  %149 = getelementptr inbounds %struct.arc, %struct.arc* %148, i32 0, i32 6
  store i64 %144, i64* %149, align 8
  %150 = load i64, i64* %14, align 8
  store i64 %150, i64* %13, align 8
  %151 = load i64, i64* %14, align 8
  %152 = mul nsw i64 %151, 2
  store i64 %152, i64* %14, align 8
  %153 = load i64, i64* %14, align 8
  %154 = add nsw i64 %153, 1
  %155 = load %struct.network*, %struct.network** %7, align 8
  %156 = getelementptr inbounds %struct.network, %struct.network* %155, i32 0, i32 8
  %157 = load i64, i64* %156, align 8
  %158 = icmp sle i64 %154, %157
  br i1 %158, label %159, label %176

159:                                              ; preds = %64
  %160 = load %struct.arc*, %struct.arc** %8, align 8
  %161 = load i64, i64* %14, align 8
  %162 = sub nsw i64 %161, 1
  %163 = getelementptr inbounds %struct.arc, %struct.arc* %160, i64 %162
  %164 = getelementptr inbounds %struct.arc, %struct.arc* %163, i32 0, i32 6
  %165 = load i64, i64* %164, align 8
  %166 = load %struct.arc*, %struct.arc** %8, align 8
  %167 = load i64, i64* %14, align 8
  %168 = getelementptr inbounds %struct.arc, %struct.arc* %166, i64 %167
  %169 = getelementptr inbounds %struct.arc, %struct.arc* %168, i32 0, i32 6
  %170 = load i64, i64* %169, align 8
  %171 = icmp slt i64 %165, %170
  br i1 %171, label %172, label %175

172:                                              ; preds = %159
  %173 = load i64, i64* %14, align 8
  %174 = add nsw i64 %173, 1
  store i64 %174, i64* %14, align 8
  br label %175

175:                                              ; preds = %172, %159
  br label %176

176:                                              ; preds = %175, %64
  br label %47, !llvm.loop !8

177:                                              ; preds = %62
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @price_out_impl(%struct.network* %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca %struct.network*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca %struct.arc*, align 8
  %16 = alloca %struct.arc*, align 8
  %17 = alloca %struct.arc*, align 8
  %18 = alloca %struct.arc*, align 8
  %19 = alloca %struct.arc*, align 8
  %20 = alloca %struct.node*, align 8
  %21 = alloca %struct.node*, align 8
  store %struct.network* %0, %struct.network** %3, align 8
  store i64 0, i64* %6, align 8
  store i64 0, i64* %7, align 8
  store i64 15, i64* %9, align 8
  %22 = load %struct.network*, %struct.network** %3, align 8
  %23 = getelementptr inbounds %struct.network, %struct.network* %22, i32 0, i32 18
  %24 = load i64, i64* %23, align 8
  store i64 %24, i64* %10, align 8
  store i64 30, i64* %12, align 8
  %25 = load i64, i64* %10, align 8
  %26 = load i64, i64* %9, align 8
  %27 = sub nsw i64 %25, %26
  store i64 %27, i64* %14, align 8
  %28 = load %struct.network*, %struct.network** %3, align 8
  %29 = getelementptr inbounds %struct.network, %struct.network* %28, i32 0, i32 3
  %30 = load i64, i64* %29, align 8
  %31 = icmp sle i64 %30, 15000
  br i1 %31, label %32, label %69

32:                                               ; preds = %1
  %33 = load %struct.network*, %struct.network** %3, align 8
  %34 = getelementptr inbounds %struct.network, %struct.network* %33, i32 0, i32 5
  %35 = load i64, i64* %34, align 8
  %36 = load %struct.network*, %struct.network** %3, align 8
  %37 = getelementptr inbounds %struct.network, %struct.network* %36, i32 0, i32 9
  %38 = load i64, i64* %37, align 8
  %39 = add nsw i64 %35, %38
  %40 = load %struct.network*, %struct.network** %3, align 8
  %41 = getelementptr inbounds %struct.network, %struct.network* %40, i32 0, i32 4
  %42 = load i64, i64* %41, align 8
  %43 = icmp sgt i64 %39, %42
  br i1 %43, label %44, label %68

44:                                               ; preds = %32
  %45 = load %struct.network*, %struct.network** %3, align 8
  %46 = getelementptr inbounds %struct.network, %struct.network* %45, i32 0, i32 3
  %47 = load i64, i64* %46, align 8
  %48 = load %struct.network*, %struct.network** %3, align 8
  %49 = getelementptr inbounds %struct.network, %struct.network* %48, i32 0, i32 3
  %50 = load i64, i64* %49, align 8
  %51 = mul nsw i64 %47, %50
  %52 = sdiv i64 %51, 2
  %53 = load %struct.network*, %struct.network** %3, align 8
  %54 = getelementptr inbounds %struct.network, %struct.network* %53, i32 0, i32 5
  %55 = load i64, i64* %54, align 8
  %56 = add nsw i64 %52, %55
  %57 = load %struct.network*, %struct.network** %3, align 8
  %58 = getelementptr inbounds %struct.network, %struct.network* %57, i32 0, i32 4
  %59 = load i64, i64* %58, align 8
  %60 = icmp sgt i64 %56, %59
  br i1 %60, label %61, label %68

61:                                               ; preds = %44
  store i64 1, i64* %7, align 8
  %62 = load %struct.network*, %struct.network** %3, align 8
  %63 = call i64 @resize_prob(%struct.network* %62)
  %64 = icmp ne i64 %63, 0
  br i1 %64, label %65, label %66

65:                                               ; preds = %61
  store i64 -1, i64* %2, align 8
  br label %311

66:                                               ; preds = %61
  %67 = load %struct.network*, %struct.network** %3, align 8
  call void @refresh_neighbour_lists(%struct.network* %67)
  br label %68

68:                                               ; preds = %66, %44, %32
  br label %69

69:                                               ; preds = %68, %1
  %70 = load %struct.network*, %struct.network** %3, align 8
  %71 = getelementptr inbounds %struct.network, %struct.network* %70, i32 0, i32 24
  %72 = load %struct.arc*, %struct.arc** %71, align 8
  store %struct.arc* %72, %struct.arc** %17, align 8
  %73 = load %struct.network*, %struct.network** %3, align 8
  %74 = getelementptr inbounds %struct.network, %struct.network* %73, i32 0, i32 3
  %75 = load i64, i64* %74, align 8
  store i64 %75, i64* %5, align 8
  %76 = load %struct.network*, %struct.network** %3, align 8
  %77 = getelementptr inbounds %struct.network, %struct.network* %76, i32 0, i32 23
  %78 = load %struct.arc*, %struct.arc** %77, align 8
  store %struct.arc* %78, %struct.arc** %15, align 8
  store i64 0, i64* %4, align 8
  br label %79

79:                                               ; preds = %92, %69
  %80 = load i64, i64* %4, align 8
  %81 = load i64, i64* %5, align 8
  %82 = icmp slt i64 %80, %81
  br i1 %82, label %83, label %89

83:                                               ; preds = %79
  %84 = load %struct.arc*, %struct.arc** %15, align 8
  %85 = getelementptr inbounds %struct.arc, %struct.arc* %84, i64 1
  %86 = getelementptr inbounds %struct.arc, %struct.arc* %85, i32 0, i32 3
  %87 = load i32, i32* %86, align 8
  %88 = icmp eq i32 %87, -1
  br label %89

89:                                               ; preds = %83, %79
  %90 = phi i1 [ false, %79 ], [ %88, %83 ]
  br i1 %90, label %91, label %97

91:                                               ; preds = %89
  br label %92

92:                                               ; preds = %91
  %93 = load i64, i64* %4, align 8
  %94 = add nsw i64 %93, 1
  store i64 %94, i64* %4, align 8
  %95 = load %struct.arc*, %struct.arc** %15, align 8
  %96 = getelementptr inbounds %struct.arc, %struct.arc* %95, i64 3
  store %struct.arc* %96, %struct.arc** %15, align 8
  br label %79, !llvm.loop !9

97:                                               ; preds = %89
  store %struct.arc* null, %struct.arc** %19, align 8
  br label %98

98:                                               ; preds = %217, %97
  %99 = load i64, i64* %4, align 8
  %100 = load i64, i64* %5, align 8
  %101 = icmp slt i64 %99, %100
  br i1 %101, label %102, label %222

102:                                              ; preds = %98
  %103 = load %struct.arc*, %struct.arc** %15, align 8
  %104 = getelementptr inbounds %struct.arc, %struct.arc* %103, i64 1
  %105 = getelementptr inbounds %struct.arc, %struct.arc* %104, i32 0, i32 3
  %106 = load i32, i32* %105, align 8
  %107 = icmp ne i32 %106, -1
  br i1 %107, label %108, label %120

108:                                              ; preds = %102
  %109 = load %struct.arc*, %struct.arc** %19, align 8
  %110 = load %struct.arc*, %struct.arc** %15, align 8
  %111 = getelementptr inbounds %struct.arc, %struct.arc* %110, i32 0, i32 2
  %112 = load %struct.node*, %struct.node** %111, align 8
  %113 = getelementptr inbounds %struct.node, %struct.node* %112, i32 0, i32 7
  %114 = load %struct.arc*, %struct.arc** %113, align 8
  %115 = getelementptr inbounds %struct.arc, %struct.arc* %114, i32 0, i32 2
  %116 = load %struct.node*, %struct.node** %115, align 8
  %117 = getelementptr inbounds %struct.node, %struct.node* %116, i32 0, i32 9
  store %struct.arc* %109, %struct.arc** %117, align 8
  %118 = load %struct.arc*, %struct.arc** %15, align 8
  %119 = getelementptr inbounds %struct.arc, %struct.arc* %118, i64 1
  store %struct.arc* %119, %struct.arc** %19, align 8
  br label %120

120:                                              ; preds = %108, %102
  %121 = load %struct.arc*, %struct.arc** %15, align 8
  %122 = getelementptr inbounds %struct.arc, %struct.arc* %121, i32 0, i32 3
  %123 = load i32, i32* %122, align 8
  %124 = icmp eq i32 %123, -1
  br i1 %124, label %125, label %126

125:                                              ; preds = %120
  br label %217

126:                                              ; preds = %120
  %127 = load %struct.arc*, %struct.arc** %15, align 8
  %128 = getelementptr inbounds %struct.arc, %struct.arc* %127, i32 0, i32 2
  %129 = load %struct.node*, %struct.node** %128, align 8
  store %struct.node* %129, %struct.node** %21, align 8
  %130 = load %struct.node*, %struct.node** %21, align 8
  %131 = getelementptr inbounds %struct.node, %struct.node* %130, i32 0, i32 13
  %132 = load i32, i32* %131, align 4
  %133 = sext i32 %132 to i64
  %134 = load %struct.arc*, %struct.arc** %15, align 8
  %135 = getelementptr inbounds %struct.arc, %struct.arc* %134, i32 0, i32 7
  %136 = load i64, i64* %135, align 8
  %137 = sub nsw i64 %133, %136
  %138 = load i64, i64* %14, align 8
  %139 = add nsw i64 %137, %138
  store i64 %139, i64* %8, align 8
  %140 = load %struct.node*, %struct.node** %21, align 8
  %141 = getelementptr inbounds %struct.node, %struct.node* %140, i32 0, i32 0
  %142 = load i64, i64* %141, align 8
  store i64 %142, i64* %11, align 8
  %143 = load %struct.arc*, %struct.arc** %19, align 8
  %144 = getelementptr inbounds %struct.arc, %struct.arc* %143, i32 0, i32 1
  %145 = load %struct.node*, %struct.node** %144, align 8
  %146 = getelementptr inbounds %struct.node, %struct.node* %145, i32 0, i32 9
  %147 = load %struct.arc*, %struct.arc** %146, align 8
  store %struct.arc* %147, %struct.arc** %16, align 8
  br label %148

148:                                              ; preds = %212, %165, %126
  %149 = load %struct.arc*, %struct.arc** %16, align 8
  %150 = icmp ne %struct.arc* %149, null
  br i1 %150, label %151, label %216

151:                                              ; preds = %148
  %152 = load %struct.arc*, %struct.arc** %16, align 8
  %153 = getelementptr inbounds %struct.arc, %struct.arc* %152, i32 0, i32 1
  %154 = load %struct.node*, %struct.node** %153, align 8
  store %struct.node* %154, %struct.node** %20, align 8
  %155 = load %struct.node*, %struct.node** %20, align 8
  %156 = getelementptr inbounds %struct.node, %struct.node* %155, i32 0, i32 13
  %157 = load i32, i32* %156, align 4
  %158 = sext i32 %157 to i64
  %159 = load %struct.arc*, %struct.arc** %16, align 8
  %160 = getelementptr inbounds %struct.arc, %struct.arc* %159, i32 0, i32 7
  %161 = load i64, i64* %160, align 8
  %162 = add nsw i64 %158, %161
  %163 = load i64, i64* %8, align 8
  %164 = icmp sgt i64 %162, %163
  br i1 %164, label %165, label %169

165:                                              ; preds = %151
  %166 = load %struct.node*, %struct.node** %20, align 8
  %167 = getelementptr inbounds %struct.node, %struct.node* %166, i32 0, i32 9
  %168 = load %struct.arc*, %struct.arc** %167, align 8
  store %struct.arc* %168, %struct.arc** %16, align 8
  br label %148, !llvm.loop !10

169:                                              ; preds = %151
  %170 = load i64, i64* %12, align 8
  %171 = load %struct.node*, %struct.node** %20, align 8
  %172 = getelementptr inbounds %struct.node, %struct.node* %171, i32 0, i32 0
  %173 = load i64, i64* %172, align 8
  %174 = sub nsw i64 %170, %173
  %175 = load %struct.node*, %struct.node** %21, align 8
  %176 = getelementptr inbounds %struct.node, %struct.node* %175, i32 0, i32 0
  %177 = load i64, i64* %176, align 8
  %178 = add nsw i64 %174, %177
  store i64 %178, i64* %13, align 8
  %179 = load i64, i64* %13, align 8
  %180 = icmp slt i64 %179, 0
  br i1 %180, label %181, label %212

181:                                              ; preds = %169
  %182 = load i64, i64* %6, align 8
  %183 = load %struct.network*, %struct.network** %3, align 8
  %184 = getelementptr inbounds %struct.network, %struct.network* %183, i32 0, i32 8
  %185 = load i64, i64* %184, align 8
  %186 = icmp slt i64 %182, %185
  br i1 %186, label %187, label %196

187:                                              ; preds = %181
  %188 = load %struct.arc*, %struct.arc** %17, align 8
  %189 = load i64, i64* %6, align 8
  %190 = load %struct.node*, %struct.node** %20, align 8
  %191 = load %struct.node*, %struct.node** %21, align 8
  %192 = load i64, i64* %12, align 8
  %193 = load i64, i64* %13, align 8
  call void @insert_new_arc(%struct.arc* %188, i64 %189, %struct.node* %190, %struct.node* %191, i64 %192, i64 %193)
  %194 = load i64, i64* %6, align 8
  %195 = add nsw i64 %194, 1
  store i64 %195, i64* %6, align 8
  br label %211

196:                                              ; preds = %181
  %197 = load %struct.arc*, %struct.arc** %17, align 8
  %198 = getelementptr inbounds %struct.arc, %struct.arc* %197, i64 0
  %199 = getelementptr inbounds %struct.arc, %struct.arc* %198, i32 0, i32 6
  %200 = load i64, i64* %199, align 8
  %201 = load i64, i64* %13, align 8
  %202 = icmp sgt i64 %200, %201
  br i1 %202, label %203, label %210

203:                                              ; preds = %196
  %204 = load %struct.network*, %struct.network** %3, align 8
  %205 = load %struct.arc*, %struct.arc** %17, align 8
  %206 = load %struct.node*, %struct.node** %20, align 8
  %207 = load %struct.node*, %struct.node** %21, align 8
  %208 = load i64, i64* %12, align 8
  %209 = load i64, i64* %13, align 8
  call void @replace_weaker_arc(%struct.network* %204, %struct.arc* %205, %struct.node* %206, %struct.node* %207, i64 %208, i64 %209)
  br label %210

210:                                              ; preds = %203, %196
  br label %211

211:                                              ; preds = %210, %187
  br label %212

212:                                              ; preds = %211, %169
  %213 = load %struct.node*, %struct.node** %20, align 8
  %214 = getelementptr inbounds %struct.node, %struct.node* %213, i32 0, i32 9
  %215 = load %struct.arc*, %struct.arc** %214, align 8
  store %struct.arc* %215, %struct.arc** %16, align 8
  br label %148, !llvm.loop !10

216:                                              ; preds = %148
  br label %217

217:                                              ; preds = %216, %125
  %218 = load i64, i64* %4, align 8
  %219 = add nsw i64 %218, 1
  store i64 %219, i64* %4, align 8
  %220 = load %struct.arc*, %struct.arc** %15, align 8
  %221 = getelementptr inbounds %struct.arc, %struct.arc* %220, i64 3
  store %struct.arc* %221, %struct.arc** %15, align 8
  br label %98, !llvm.loop !11

222:                                              ; preds = %98
  %223 = load i64, i64* %6, align 8
  %224 = icmp ne i64 %223, 0
  br i1 %224, label %225, label %309

225:                                              ; preds = %222
  %226 = load %struct.network*, %struct.network** %3, align 8
  %227 = getelementptr inbounds %struct.network, %struct.network* %226, i32 0, i32 24
  %228 = load %struct.arc*, %struct.arc** %227, align 8
  store %struct.arc* %228, %struct.arc** %17, align 8
  %229 = load i64, i64* %6, align 8
  %230 = load %struct.network*, %struct.network** %3, align 8
  %231 = getelementptr inbounds %struct.network, %struct.network* %230, i32 0, i32 24
  %232 = load %struct.arc*, %struct.arc** %231, align 8
  %233 = getelementptr inbounds %struct.arc, %struct.arc* %232, i64 %229
  store %struct.arc* %233, %struct.arc** %231, align 8
  %234 = load %struct.network*, %struct.network** %3, align 8
  %235 = getelementptr inbounds %struct.network, %struct.network* %234, i32 0, i32 24
  %236 = load %struct.arc*, %struct.arc** %235, align 8
  %237 = bitcast %struct.arc* %236 to i8*
  %238 = bitcast i8* %237 to %struct.arc*
  store %struct.arc* %238, %struct.arc** %18, align 8
  %239 = load i64, i64* %7, align 8
  %240 = icmp ne i64 %239, 0
  br i1 %240, label %241, label %255

241:                                              ; preds = %225
  br label %242

242:                                              ; preds = %251, %241
  %243 = load %struct.arc*, %struct.arc** %17, align 8
  %244 = load %struct.arc*, %struct.arc** %18, align 8
  %245 = icmp ne %struct.arc* %243, %244
  br i1 %245, label %246, label %254

246:                                              ; preds = %242
  %247 = load %struct.arc*, %struct.arc** %17, align 8
  %248 = getelementptr inbounds %struct.arc, %struct.arc* %247, i32 0, i32 6
  store i64 0, i64* %248, align 8
  %249 = load %struct.arc*, %struct.arc** %17, align 8
  %250 = getelementptr inbounds %struct.arc, %struct.arc* %249, i32 0, i32 3
  store i32 1, i32* %250, align 8
  br label %251

251:                                              ; preds = %246
  %252 = load %struct.arc*, %struct.arc** %17, align 8
  %253 = getelementptr inbounds %struct.arc, %struct.arc* %252, i32 1
  store %struct.arc* %253, %struct.arc** %17, align 8
  br label %242, !llvm.loop !12

254:                                              ; preds = %242
  br label %293

255:                                              ; preds = %225
  br label %256

256:                                              ; preds = %289, %255
  %257 = load %struct.arc*, %struct.arc** %17, align 8
  %258 = load %struct.arc*, %struct.arc** %18, align 8
  %259 = icmp ne %struct.arc* %257, %258
  br i1 %259, label %260, label %292

260:                                              ; preds = %256
  %261 = load %struct.arc*, %struct.arc** %17, align 8
  %262 = getelementptr inbounds %struct.arc, %struct.arc* %261, i32 0, i32 6
  store i64 0, i64* %262, align 8
  %263 = load %struct.arc*, %struct.arc** %17, align 8
  %264 = getelementptr inbounds %struct.arc, %struct.arc* %263, i32 0, i32 3
  store i32 1, i32* %264, align 8
  %265 = load %struct.arc*, %struct.arc** %17, align 8
  %266 = getelementptr inbounds %struct.arc, %struct.arc* %265, i32 0, i32 1
  %267 = load %struct.node*, %struct.node** %266, align 8
  %268 = getelementptr inbounds %struct.node, %struct.node* %267, i32 0, i32 7
  %269 = load %struct.arc*, %struct.arc** %268, align 8
  %270 = load %struct.arc*, %struct.arc** %17, align 8
  %271 = getelementptr inbounds %struct.arc, %struct.arc* %270, i32 0, i32 4
  store %struct.arc* %269, %struct.arc** %271, align 8
  %272 = load %struct.arc*, %struct.arc** %17, align 8
  %273 = load %struct.arc*, %struct.arc** %17, align 8
  %274 = getelementptr inbounds %struct.arc, %struct.arc* %273, i32 0, i32 1
  %275 = load %struct.node*, %struct.node** %274, align 8
  %276 = getelementptr inbounds %struct.node, %struct.node* %275, i32 0, i32 7
  store %struct.arc* %272, %struct.arc** %276, align 8
  %277 = load %struct.arc*, %struct.arc** %17, align 8
  %278 = getelementptr inbounds %struct.arc, %struct.arc* %277, i32 0, i32 2
  %279 = load %struct.node*, %struct.node** %278, align 8
  %280 = getelementptr inbounds %struct.node, %struct.node* %279, i32 0, i32 8
  %281 = load %struct.arc*, %struct.arc** %280, align 8
  %282 = load %struct.arc*, %struct.arc** %17, align 8
  %283 = getelementptr inbounds %struct.arc, %struct.arc* %282, i32 0, i32 5
  store %struct.arc* %281, %struct.arc** %283, align 8
  %284 = load %struct.arc*, %struct.arc** %17, align 8
  %285 = load %struct.arc*, %struct.arc** %17, align 8
  %286 = getelementptr inbounds %struct.arc, %struct.arc* %285, i32 0, i32 2
  %287 = load %struct.node*, %struct.node** %286, align 8
  %288 = getelementptr inbounds %struct.node, %struct.node* %287, i32 0, i32 8
  store %struct.arc* %284, %struct.arc** %288, align 8
  br label %289

289:                                              ; preds = %260
  %290 = load %struct.arc*, %struct.arc** %17, align 8
  %291 = getelementptr inbounds %struct.arc, %struct.arc* %290, i32 1
  store %struct.arc* %291, %struct.arc** %17, align 8
  br label %256, !llvm.loop !13

292:                                              ; preds = %256
  br label %293

293:                                              ; preds = %292, %254
  %294 = load i64, i64* %6, align 8
  %295 = load %struct.network*, %struct.network** %3, align 8
  %296 = getelementptr inbounds %struct.network, %struct.network* %295, i32 0, i32 5
  %297 = load i64, i64* %296, align 8
  %298 = add nsw i64 %297, %294
  store i64 %298, i64* %296, align 8
  %299 = load i64, i64* %6, align 8
  %300 = load %struct.network*, %struct.network** %3, align 8
  %301 = getelementptr inbounds %struct.network, %struct.network* %300, i32 0, i32 7
  %302 = load i64, i64* %301, align 8
  %303 = add nsw i64 %302, %299
  store i64 %303, i64* %301, align 8
  %304 = load i64, i64* %6, align 8
  %305 = load %struct.network*, %struct.network** %3, align 8
  %306 = getelementptr inbounds %struct.network, %struct.network* %305, i32 0, i32 8
  %307 = load i64, i64* %306, align 8
  %308 = sub nsw i64 %307, %304
  store i64 %308, i64* %306, align 8
  br label %309

309:                                              ; preds = %293, %222
  %310 = load i64, i64* %6, align 8
  store i64 %310, i64* %2, align 8
  br label %311

311:                                              ; preds = %309, %65
  %312 = load i64, i64* %2, align 8
  ret i64 %312
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @suspend_impl(%struct.network* %0, i64 %1, i64 %2) #0 {
  %4 = alloca %struct.network*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca %struct.arc*, align 8
  %10 = alloca %struct.arc*, align 8
  %11 = alloca i8*, align 8
  store %struct.network* %0, %struct.network** %4, align 8
  store i64 %1, i64* %5, align 8
  store i64 %2, i64* %6, align 8
  %12 = load i64, i64* %6, align 8
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %3
  %15 = load %struct.network*, %struct.network** %4, align 8
  %16 = getelementptr inbounds %struct.network, %struct.network* %15, i32 0, i32 7
  %17 = load i64, i64* %16, align 8
  store i64 %17, i64* %7, align 8
  br label %107

18:                                               ; preds = %3
  %19 = load %struct.network*, %struct.network** %4, align 8
  %20 = getelementptr inbounds %struct.network, %struct.network* %19, i32 0, i32 24
  %21 = load %struct.arc*, %struct.arc** %20, align 8
  %22 = bitcast %struct.arc* %21 to i8*
  store i8* %22, i8** %11, align 8
  %23 = load %struct.network*, %struct.network** %4, align 8
  %24 = getelementptr inbounds %struct.network, %struct.network* %23, i32 0, i32 23
  %25 = load %struct.arc*, %struct.arc** %24, align 8
  %26 = load %struct.network*, %struct.network** %4, align 8
  %27 = getelementptr inbounds %struct.network, %struct.network* %26, i32 0, i32 5
  %28 = load i64, i64* %27, align 8
  %29 = load %struct.network*, %struct.network** %4, align 8
  %30 = getelementptr inbounds %struct.network, %struct.network* %29, i32 0, i32 7
  %31 = load i64, i64* %30, align 8
  %32 = sub nsw i64 %28, %31
  %33 = getelementptr inbounds %struct.arc, %struct.arc* %25, i64 %32
  store %struct.arc* %33, %struct.arc** %9, align 8
  store i64 0, i64* %7, align 8
  %34 = load %struct.arc*, %struct.arc** %9, align 8
  store %struct.arc* %34, %struct.arc** %10, align 8
  br label %35

35:                                               ; preds = %103, %18
  %36 = load %struct.arc*, %struct.arc** %10, align 8
  %37 = load i8*, i8** %11, align 8
  %38 = bitcast i8* %37 to %struct.arc*
  %39 = icmp ult %struct.arc* %36, %38
  br i1 %39, label %40, label %106

40:                                               ; preds = %35
  %41 = load %struct.arc*, %struct.arc** %10, align 8
  %42 = getelementptr inbounds %struct.arc, %struct.arc* %41, i32 0, i32 3
  %43 = load i32, i32* %42, align 8
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %45, label %61

45:                                               ; preds = %40
  %46 = load %struct.arc*, %struct.arc** %10, align 8
  %47 = getelementptr inbounds %struct.arc, %struct.arc* %46, i32 0, i32 0
  %48 = load i64, i64* %47, align 8
  %49 = load %struct.arc*, %struct.arc** %10, align 8
  %50 = getelementptr inbounds %struct.arc, %struct.arc* %49, i32 0, i32 1
  %51 = load %struct.node*, %struct.node** %50, align 8
  %52 = getelementptr inbounds %struct.node, %struct.node* %51, i32 0, i32 0
  %53 = load i64, i64* %52, align 8
  %54 = sub nsw i64 %48, %53
  %55 = load %struct.arc*, %struct.arc** %10, align 8
  %56 = getelementptr inbounds %struct.arc, %struct.arc* %55, i32 0, i32 2
  %57 = load %struct.node*, %struct.node** %56, align 8
  %58 = getelementptr inbounds %struct.node, %struct.node* %57, i32 0, i32 0
  %59 = load i64, i64* %58, align 8
  %60 = add nsw i64 %54, %59
  store i64 %60, i64* %8, align 8
  br label %88

61:                                               ; preds = %40
  store i64 -2, i64* %8, align 8
  %62 = load %struct.arc*, %struct.arc** %10, align 8
  %63 = getelementptr inbounds %struct.arc, %struct.arc* %62, i32 0, i32 3
  %64 = load i32, i32* %63, align 8
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %87

66:                                               ; preds = %61
  %67 = load %struct.arc*, %struct.arc** %10, align 8
  %68 = getelementptr inbounds %struct.arc, %struct.arc* %67, i32 0, i32 1
  %69 = load %struct.node*, %struct.node** %68, align 8
  %70 = getelementptr inbounds %struct.node, %struct.node* %69, i32 0, i32 6
  %71 = load %struct.arc*, %struct.arc** %70, align 8
  %72 = load %struct.arc*, %struct.arc** %10, align 8
  %73 = icmp eq %struct.arc* %71, %72
  br i1 %73, label %74, label %80

74:                                               ; preds = %66
  %75 = load %struct.arc*, %struct.arc** %9, align 8
  %76 = load %struct.arc*, %struct.arc** %10, align 8
  %77 = getelementptr inbounds %struct.arc, %struct.arc* %76, i32 0, i32 1
  %78 = load %struct.node*, %struct.node** %77, align 8
  %79 = getelementptr inbounds %struct.node, %struct.node* %78, i32 0, i32 6
  store %struct.arc* %75, %struct.arc** %79, align 8
  br label %86

80:                                               ; preds = %66
  %81 = load %struct.arc*, %struct.arc** %9, align 8
  %82 = load %struct.arc*, %struct.arc** %10, align 8
  %83 = getelementptr inbounds %struct.arc, %struct.arc* %82, i32 0, i32 2
  %84 = load %struct.node*, %struct.node** %83, align 8
  %85 = getelementptr inbounds %struct.node, %struct.node* %84, i32 0, i32 6
  store %struct.arc* %81, %struct.arc** %85, align 8
  br label %86

86:                                               ; preds = %80, %74
  br label %87

87:                                               ; preds = %86, %61
  br label %88

88:                                               ; preds = %87, %45
  %89 = load i64, i64* %8, align 8
  %90 = load i64, i64* %5, align 8
  %91 = icmp sgt i64 %89, %90
  br i1 %91, label %92, label %95

92:                                               ; preds = %88
  %93 = load i64, i64* %7, align 8
  %94 = add nsw i64 %93, 1
  store i64 %94, i64* %7, align 8
  br label %102

95:                                               ; preds = %88
  %96 = load %struct.arc*, %struct.arc** %9, align 8
  %97 = load %struct.arc*, %struct.arc** %10, align 8
  %98 = bitcast %struct.arc* %96 to i8*
  %99 = bitcast %struct.arc* %97 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %98, i8* align 8 %99, i64 64, i1 false)
  %100 = load %struct.arc*, %struct.arc** %9, align 8
  %101 = getelementptr inbounds %struct.arc, %struct.arc* %100, i32 1
  store %struct.arc* %101, %struct.arc** %9, align 8
  br label %102

102:                                              ; preds = %95, %92
  br label %103

103:                                              ; preds = %102
  %104 = load %struct.arc*, %struct.arc** %10, align 8
  %105 = getelementptr inbounds %struct.arc, %struct.arc* %104, i32 1
  store %struct.arc* %105, %struct.arc** %10, align 8
  br label %35, !llvm.loop !14

106:                                              ; preds = %35
  br label %107

107:                                              ; preds = %106, %14
  %108 = load i64, i64* %7, align 8
  %109 = icmp ne i64 %108, 0
  br i1 %109, label %110, label %133

110:                                              ; preds = %107
  %111 = load i64, i64* %7, align 8
  %112 = load %struct.network*, %struct.network** %4, align 8
  %113 = getelementptr inbounds %struct.network, %struct.network* %112, i32 0, i32 5
  %114 = load i64, i64* %113, align 8
  %115 = sub nsw i64 %114, %111
  store i64 %115, i64* %113, align 8
  %116 = load i64, i64* %7, align 8
  %117 = load %struct.network*, %struct.network** %4, align 8
  %118 = getelementptr inbounds %struct.network, %struct.network* %117, i32 0, i32 7
  %119 = load i64, i64* %118, align 8
  %120 = sub nsw i64 %119, %116
  store i64 %120, i64* %118, align 8
  %121 = load i64, i64* %7, align 8
  %122 = load %struct.network*, %struct.network** %4, align 8
  %123 = getelementptr inbounds %struct.network, %struct.network* %122, i32 0, i32 24
  %124 = load %struct.arc*, %struct.arc** %123, align 8
  %125 = sub i64 0, %121
  %126 = getelementptr inbounds %struct.arc, %struct.arc* %124, i64 %125
  store %struct.arc* %126, %struct.arc** %123, align 8
  %127 = load i64, i64* %7, align 8
  %128 = load %struct.network*, %struct.network** %4, align 8
  %129 = getelementptr inbounds %struct.network, %struct.network* %128, i32 0, i32 8
  %130 = load i64, i64* %129, align 8
  %131 = add nsw i64 %130, %127
  store i64 %131, i64* %129, align 8
  %132 = load %struct.network*, %struct.network** %4, align 8
  call void @refresh_neighbour_lists(%struct.network* %132)
  br label %133

133:                                              ; preds = %110, %107
  %134 = load i64, i64* %7, align 8
  ret i64 %134
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @global_opt() #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 -1, i64* %1, align 8
  %3 = load i64, i64* getelementptr inbounds (%struct.network, %struct.network* @net, i32 0, i32 3), align 8
  %4 = icmp sle i64 %3, 15000
  %5 = zext i1 %4 to i64
  %6 = select i1 %4, i32 5, i32 5
  %7 = sext i32 %6 to i64
  store i64 %7, i64* %2, align 8
  br label %8

8:                                                ; preds = %45, %0
  %9 = load i64, i64* %1, align 8
  %10 = icmp ne i64 %9, 0
  br i1 %10, label %11, label %48

11:                                               ; preds = %8
  %12 = load i64, i64* getelementptr inbounds (%struct.network, %struct.network* @net, i32 0, i32 5), align 8
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0), i64 %12)
  %14 = call i64 @primal_net_simplex(%struct.network* @net)
  %15 = load i64, i64* getelementptr inbounds (%struct.network, %struct.network* @net, i32 0, i32 27), align 8
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1.4, i64 0, i64 0), i64 %15)
  %17 = call double @flow_cost(%struct.network* @net)
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2.5, i64 0, i64 0), double %17)
  %19 = load i64, i64* %2, align 8
  %20 = icmp ne i64 %19, 0
  br i1 %20, label %22, label %21

21:                                               ; preds = %11
  br label %48

22:                                               ; preds = %11
  %23 = load i64, i64* getelementptr inbounds (%struct.network, %struct.network* @net, i32 0, i32 7), align 8
  %24 = icmp ne i64 %23, 0
  br i1 %24, label %25, label %33

25:                                               ; preds = %22
  %26 = call i64 @suspend_impl(%struct.network* @net, i64 -1, i64 0)
  store i64 %26, i64* %1, align 8
  %27 = load i64, i64* %1, align 8
  %28 = icmp ne i64 %27, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %25
  %30 = load i64, i64* %1, align 8
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3.6, i64 0, i64 0), i64 %30)
  br label %32

32:                                               ; preds = %29, %25
  br label %33

33:                                               ; preds = %32, %22
  %34 = call i64 @price_out_impl(%struct.network* @net)
  store i64 %34, i64* %1, align 8
  %35 = load i64, i64* %1, align 8
  %36 = icmp ne i64 %35, 0
  br i1 %36, label %37, label %40

37:                                               ; preds = %33
  %38 = load i64, i64* %1, align 8
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.4, i64 0, i64 0), i64 %38)
  br label %40

40:                                               ; preds = %37, %33
  %41 = load i64, i64* %1, align 8
  %42 = icmp slt i64 %41, 0
  br i1 %42, label %43, label %45

43:                                               ; preds = %40
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i64 0, i64 0))
  call void @exit(i32 -1) #6
  unreachable

45:                                               ; preds = %40
  %46 = load i64, i64* %2, align 8
  %47 = add nsw i64 %46, -1
  store i64 %47, i64* %2, align 8
  br label %8, !llvm.loop !15

48:                                               ; preds = %21, %8
  %49 = load i64, i64* getelementptr inbounds (%struct.network, %struct.network* @net, i32 0, i32 29), align 8
  %50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i64 0, i64 0), i64 %49)
  ret i64 0
}

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %6 = load i32, i32* %4, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i32 -1, i32* %3, align 4
  br label %36

9:                                                ; preds = %2
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.7, i64 0, i64 0))
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.8, i64 0, i64 0))
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.9, i64 0, i64 0))
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.10, i64 0, i64 0))
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i64 0, i64 0))
  call void @llvm.memset.p0i8.i64(i8* align 8 getelementptr inbounds (%struct.network, %struct.network* @net, i32 0, i32 0, i32 0), i8 0, i64 624, i1 false)
  store i64 10000000, i64* getelementptr inbounds (%struct.network, %struct.network* @net, i32 0, i32 18), align 8
  %15 = load i8**, i8*** %5, align 8
  %16 = getelementptr inbounds i8*, i8** %15, i64 1
  %17 = load i8*, i8** %16, align 8
  %18 = call i8* @strcpy(i8* getelementptr inbounds (%struct.network, %struct.network* @net, i32 0, i32 0, i64 0), i8* %17) #7
  %19 = call i64 @read_min(%struct.network* @net)
  %20 = icmp ne i64 %19, 0
  br i1 %20, label %21, label %24

21:                                               ; preds = %9
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.12, i64 0, i64 0))
  %23 = call i64 @getfree(%struct.network* @net)
  store i32 -1, i32* %3, align 4
  br label %36

24:                                               ; preds = %9
  %25 = load i64, i64* getelementptr inbounds (%struct.network, %struct.network* @net, i32 0, i32 3), align 8
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.13, i64 0, i64 0), i64 %25)
  %27 = call i64 @primal_start_artificial(%struct.network* @net)
  %28 = call i64 @global_opt()
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i64 0, i64 0))
  %30 = call i64 @write_circulations(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.15, i64 0, i64 0), %struct.network* @net)
  %31 = icmp ne i64 %30, 0
  br i1 %31, label %32, label %34

32:                                               ; preds = %24
  %33 = call i64 @getfree(%struct.network* @net)
  store i32 -1, i32* %3, align 4
  br label %36

34:                                               ; preds = %24
  %35 = call i64 @getfree(%struct.network* @net)
  store i32 0, i32* %3, align 4
  br label %36

36:                                               ; preds = %34, %32, %21, %8
  %37 = load i32, i32* %3, align 4
  ret i32 %37
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @refresh_neighbour_lists(%struct.network* %0) #0 {
  %2 = alloca %struct.network*, align 8
  %3 = alloca %struct.node*, align 8
  %4 = alloca %struct.arc*, align 8
  %5 = alloca i8*, align 8
  store %struct.network* %0, %struct.network** %2, align 8
  %6 = load %struct.network*, %struct.network** %2, align 8
  %7 = getelementptr inbounds %struct.network, %struct.network* %6, i32 0, i32 21
  %8 = load %struct.node*, %struct.node** %7, align 8
  store %struct.node* %8, %struct.node** %3, align 8
  %9 = load %struct.network*, %struct.network** %2, align 8
  %10 = getelementptr inbounds %struct.network, %struct.network* %9, i32 0, i32 22
  %11 = load %struct.node*, %struct.node** %10, align 8
  %12 = bitcast %struct.node* %11 to i8*
  store i8* %12, i8** %5, align 8
  br label %13

13:                                               ; preds = %23, %1
  %14 = load %struct.node*, %struct.node** %3, align 8
  %15 = load i8*, i8** %5, align 8
  %16 = bitcast i8* %15 to %struct.node*
  %17 = icmp ult %struct.node* %14, %16
  br i1 %17, label %18, label %26

18:                                               ; preds = %13
  %19 = load %struct.node*, %struct.node** %3, align 8
  %20 = getelementptr inbounds %struct.node, %struct.node* %19, i32 0, i32 8
  store %struct.arc* null, %struct.arc** %20, align 8
  %21 = load %struct.node*, %struct.node** %3, align 8
  %22 = getelementptr inbounds %struct.node, %struct.node* %21, i32 0, i32 7
  store %struct.arc* null, %struct.arc** %22, align 8
  br label %23

23:                                               ; preds = %18
  %24 = load %struct.node*, %struct.node** %3, align 8
  %25 = getelementptr inbounds %struct.node, %struct.node* %24, i32 1
  store %struct.node* %25, %struct.node** %3, align 8
  br label %13, !llvm.loop !16

26:                                               ; preds = %13
  %27 = load %struct.network*, %struct.network** %2, align 8
  %28 = getelementptr inbounds %struct.network, %struct.network* %27, i32 0, i32 23
  %29 = load %struct.arc*, %struct.arc** %28, align 8
  store %struct.arc* %29, %struct.arc** %4, align 8
  %30 = load %struct.network*, %struct.network** %2, align 8
  %31 = getelementptr inbounds %struct.network, %struct.network* %30, i32 0, i32 24
  %32 = load %struct.arc*, %struct.arc** %31, align 8
  %33 = bitcast %struct.arc* %32 to i8*
  store i8* %33, i8** %5, align 8
  br label %34

34:                                               ; preds = %64, %26
  %35 = load %struct.arc*, %struct.arc** %4, align 8
  %36 = load i8*, i8** %5, align 8
  %37 = bitcast i8* %36 to %struct.arc*
  %38 = icmp ult %struct.arc* %35, %37
  br i1 %38, label %39, label %67

39:                                               ; preds = %34
  %40 = load %struct.arc*, %struct.arc** %4, align 8
  %41 = getelementptr inbounds %struct.arc, %struct.arc* %40, i32 0, i32 1
  %42 = load %struct.node*, %struct.node** %41, align 8
  %43 = getelementptr inbounds %struct.node, %struct.node* %42, i32 0, i32 7
  %44 = load %struct.arc*, %struct.arc** %43, align 8
  %45 = load %struct.arc*, %struct.arc** %4, align 8
  %46 = getelementptr inbounds %struct.arc, %struct.arc* %45, i32 0, i32 4
  store %struct.arc* %44, %struct.arc** %46, align 8
  %47 = load %struct.arc*, %struct.arc** %4, align 8
  %48 = load %struct.arc*, %struct.arc** %4, align 8
  %49 = getelementptr inbounds %struct.arc, %struct.arc* %48, i32 0, i32 1
  %50 = load %struct.node*, %struct.node** %49, align 8
  %51 = getelementptr inbounds %struct.node, %struct.node* %50, i32 0, i32 7
  store %struct.arc* %47, %struct.arc** %51, align 8
  %52 = load %struct.arc*, %struct.arc** %4, align 8
  %53 = getelementptr inbounds %struct.arc, %struct.arc* %52, i32 0, i32 2
  %54 = load %struct.node*, %struct.node** %53, align 8
  %55 = getelementptr inbounds %struct.node, %struct.node* %54, i32 0, i32 8
  %56 = load %struct.arc*, %struct.arc** %55, align 8
  %57 = load %struct.arc*, %struct.arc** %4, align 8
  %58 = getelementptr inbounds %struct.arc, %struct.arc* %57, i32 0, i32 5
  store %struct.arc* %56, %struct.arc** %58, align 8
  %59 = load %struct.arc*, %struct.arc** %4, align 8
  %60 = load %struct.arc*, %struct.arc** %4, align 8
  %61 = getelementptr inbounds %struct.arc, %struct.arc* %60, i32 0, i32 2
  %62 = load %struct.node*, %struct.node** %61, align 8
  %63 = getelementptr inbounds %struct.node, %struct.node* %62, i32 0, i32 8
  store %struct.arc* %59, %struct.arc** %63, align 8
  br label %64

64:                                               ; preds = %39
  %65 = load %struct.arc*, %struct.arc** %4, align 8
  %66 = getelementptr inbounds %struct.arc, %struct.arc* %65, i32 1
  store %struct.arc* %66, %struct.arc** %4, align 8
  br label %34, !llvm.loop !17

67:                                               ; preds = %34
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @refresh_potential(%struct.network* %0) #0 {
  %2 = alloca %struct.network*, align 8
  %3 = alloca %struct.node*, align 8
  %4 = alloca %struct.node*, align 8
  %5 = alloca %struct.node*, align 8
  %6 = alloca i64, align 8
  store %struct.network* %0, %struct.network** %2, align 8
  %7 = load %struct.network*, %struct.network** %2, align 8
  %8 = getelementptr inbounds %struct.network, %struct.network* %7, i32 0, i32 21
  %9 = load %struct.node*, %struct.node** %8, align 8
  store %struct.node* %9, %struct.node** %5, align 8
  store i64 0, i64* %6, align 8
  %10 = load %struct.node*, %struct.node** %5, align 8
  %11 = getelementptr inbounds %struct.node, %struct.node* %10, i32 0, i32 0
  store i64 -100000000, i64* %11, align 8
  %12 = load %struct.node*, %struct.node** %5, align 8
  %13 = getelementptr inbounds %struct.node, %struct.node* %12, i32 0, i32 2
  %14 = load %struct.node*, %struct.node** %13, align 8
  store %struct.node* %14, %struct.node** %3, align 8
  store %struct.node* %14, %struct.node** %4, align 8
  br label %15

15:                                               ; preds = %83, %1
  %16 = load %struct.node*, %struct.node** %3, align 8
  %17 = load %struct.node*, %struct.node** %5, align 8
  %18 = icmp ne %struct.node* %16, %17
  br i1 %18, label %19, label %84

19:                                               ; preds = %15
  br label %20

20:                                               ; preds = %58, %19
  %21 = load %struct.node*, %struct.node** %3, align 8
  %22 = icmp ne %struct.node* %21, null
  br i1 %22, label %23, label %63

23:                                               ; preds = %20
  %24 = load %struct.node*, %struct.node** %3, align 8
  %25 = getelementptr inbounds %struct.node, %struct.node* %24, i32 0, i32 1
  %26 = load i32, i32* %25, align 8
  %27 = icmp eq i32 %26, 1
  br i1 %27, label %28, label %42

28:                                               ; preds = %23
  %29 = load %struct.node*, %struct.node** %3, align 8
  %30 = getelementptr inbounds %struct.node, %struct.node* %29, i32 0, i32 6
  %31 = load %struct.arc*, %struct.arc** %30, align 8
  %32 = getelementptr inbounds %struct.arc, %struct.arc* %31, i32 0, i32 0
  %33 = load i64, i64* %32, align 8
  %34 = load %struct.node*, %struct.node** %3, align 8
  %35 = getelementptr inbounds %struct.node, %struct.node* %34, i32 0, i32 3
  %36 = load %struct.node*, %struct.node** %35, align 8
  %37 = getelementptr inbounds %struct.node, %struct.node* %36, i32 0, i32 0
  %38 = load i64, i64* %37, align 8
  %39 = add nsw i64 %33, %38
  %40 = load %struct.node*, %struct.node** %3, align 8
  %41 = getelementptr inbounds %struct.node, %struct.node* %40, i32 0, i32 0
  store i64 %39, i64* %41, align 8
  br label %58

42:                                               ; preds = %23
  %43 = load %struct.node*, %struct.node** %3, align 8
  %44 = getelementptr inbounds %struct.node, %struct.node* %43, i32 0, i32 3
  %45 = load %struct.node*, %struct.node** %44, align 8
  %46 = getelementptr inbounds %struct.node, %struct.node* %45, i32 0, i32 0
  %47 = load i64, i64* %46, align 8
  %48 = load %struct.node*, %struct.node** %3, align 8
  %49 = getelementptr inbounds %struct.node, %struct.node* %48, i32 0, i32 6
  %50 = load %struct.arc*, %struct.arc** %49, align 8
  %51 = getelementptr inbounds %struct.arc, %struct.arc* %50, i32 0, i32 0
  %52 = load i64, i64* %51, align 8
  %53 = sub nsw i64 %47, %52
  %54 = load %struct.node*, %struct.node** %3, align 8
  %55 = getelementptr inbounds %struct.node, %struct.node* %54, i32 0, i32 0
  store i64 %53, i64* %55, align 8
  %56 = load i64, i64* %6, align 8
  %57 = add nsw i64 %56, 1
  store i64 %57, i64* %6, align 8
  br label %58

58:                                               ; preds = %42, %28
  %59 = load %struct.node*, %struct.node** %3, align 8
  store %struct.node* %59, %struct.node** %4, align 8
  %60 = load %struct.node*, %struct.node** %3, align 8
  %61 = getelementptr inbounds %struct.node, %struct.node* %60, i32 0, i32 2
  %62 = load %struct.node*, %struct.node** %61, align 8
  store %struct.node* %62, %struct.node** %3, align 8
  br label %20, !llvm.loop !18

63:                                               ; preds = %20
  %64 = load %struct.node*, %struct.node** %4, align 8
  store %struct.node* %64, %struct.node** %3, align 8
  br label %65

65:                                               ; preds = %82, %63
  %66 = load %struct.node*, %struct.node** %3, align 8
  %67 = getelementptr inbounds %struct.node, %struct.node* %66, i32 0, i32 3
  %68 = load %struct.node*, %struct.node** %67, align 8
  %69 = icmp ne %struct.node* %68, null
  br i1 %69, label %70, label %83

70:                                               ; preds = %65
  %71 = load %struct.node*, %struct.node** %3, align 8
  %72 = getelementptr inbounds %struct.node, %struct.node* %71, i32 0, i32 4
  %73 = load %struct.node*, %struct.node** %72, align 8
  store %struct.node* %73, %struct.node** %4, align 8
  %74 = load %struct.node*, %struct.node** %4, align 8
  %75 = icmp ne %struct.node* %74, null
  br i1 %75, label %76, label %78

76:                                               ; preds = %70
  %77 = load %struct.node*, %struct.node** %4, align 8
  store %struct.node* %77, %struct.node** %3, align 8
  br label %83

78:                                               ; preds = %70
  %79 = load %struct.node*, %struct.node** %3, align 8
  %80 = getelementptr inbounds %struct.node, %struct.node* %79, i32 0, i32 3
  %81 = load %struct.node*, %struct.node** %80, align 8
  store %struct.node* %81, %struct.node** %3, align 8
  br label %82

82:                                               ; preds = %78
  br label %65, !llvm.loop !19

83:                                               ; preds = %76, %65
  br label %15, !llvm.loop !20

84:                                               ; preds = %15
  %85 = load i64, i64* %6, align 8
  ret i64 %85
}

; Function Attrs: noinline nounwind optnone uwtable
define internal double @flow_cost(%struct.network* %0) #0 {
  %2 = alloca %struct.network*, align 8
  %3 = alloca %struct.arc*, align 8
  %4 = alloca %struct.node*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store %struct.network* %0, %struct.network** %2, align 8
  store i64 0, i64* %6, align 8
  store i64 0, i64* %7, align 8
  %8 = load %struct.network*, %struct.network** %2, align 8
  %9 = getelementptr inbounds %struct.network, %struct.network* %8, i32 0, i32 24
  %10 = load %struct.arc*, %struct.arc** %9, align 8
  %11 = bitcast %struct.arc* %10 to i8*
  store i8* %11, i8** %5, align 8
  %12 = load %struct.network*, %struct.network** %2, align 8
  %13 = getelementptr inbounds %struct.network, %struct.network* %12, i32 0, i32 23
  %14 = load %struct.arc*, %struct.arc** %13, align 8
  store %struct.arc* %14, %struct.arc** %3, align 8
  br label %15

15:                                               ; preds = %32, %1
  %16 = load %struct.arc*, %struct.arc** %3, align 8
  %17 = load i8*, i8** %5, align 8
  %18 = bitcast i8* %17 to %struct.arc*
  %19 = icmp ne %struct.arc* %16, %18
  br i1 %19, label %20, label %35

20:                                               ; preds = %15
  %21 = load %struct.arc*, %struct.arc** %3, align 8
  %22 = getelementptr inbounds %struct.arc, %struct.arc* %21, i32 0, i32 3
  %23 = load i32, i32* %22, align 8
  %24 = icmp eq i32 %23, 2
  br i1 %24, label %25, label %28

25:                                               ; preds = %20
  %26 = load %struct.arc*, %struct.arc** %3, align 8
  %27 = getelementptr inbounds %struct.arc, %struct.arc* %26, i32 0, i32 6
  store i64 1, i64* %27, align 8
  br label %31

28:                                               ; preds = %20
  %29 = load %struct.arc*, %struct.arc** %3, align 8
  %30 = getelementptr inbounds %struct.arc, %struct.arc* %29, i32 0, i32 6
  store i64 0, i64* %30, align 8
  br label %31

31:                                               ; preds = %28, %25
  br label %32

32:                                               ; preds = %31
  %33 = load %struct.arc*, %struct.arc** %3, align 8
  %34 = getelementptr inbounds %struct.arc, %struct.arc* %33, i32 1
  store %struct.arc* %34, %struct.arc** %3, align 8
  br label %15, !llvm.loop !21

35:                                               ; preds = %15
  %36 = load %struct.network*, %struct.network** %2, align 8
  %37 = getelementptr inbounds %struct.network, %struct.network* %36, i32 0, i32 22
  %38 = load %struct.node*, %struct.node** %37, align 8
  %39 = bitcast %struct.node* %38 to i8*
  store i8* %39, i8** %5, align 8
  %40 = load %struct.network*, %struct.network** %2, align 8
  %41 = getelementptr inbounds %struct.network, %struct.network* %40, i32 0, i32 21
  %42 = load %struct.node*, %struct.node** %41, align 8
  store %struct.node* %42, %struct.node** %4, align 8
  %43 = load %struct.node*, %struct.node** %4, align 8
  %44 = getelementptr inbounds %struct.node, %struct.node* %43, i32 1
  store %struct.node* %44, %struct.node** %4, align 8
  br label %45

45:                                               ; preds = %58, %35
  %46 = load %struct.node*, %struct.node** %4, align 8
  %47 = load i8*, i8** %5, align 8
  %48 = bitcast i8* %47 to %struct.node*
  %49 = icmp ne %struct.node* %46, %48
  br i1 %49, label %50, label %61

50:                                               ; preds = %45
  %51 = load %struct.node*, %struct.node** %4, align 8
  %52 = getelementptr inbounds %struct.node, %struct.node* %51, i32 0, i32 10
  %53 = load i64, i64* %52, align 8
  %54 = load %struct.node*, %struct.node** %4, align 8
  %55 = getelementptr inbounds %struct.node, %struct.node* %54, i32 0, i32 6
  %56 = load %struct.arc*, %struct.arc** %55, align 8
  %57 = getelementptr inbounds %struct.arc, %struct.arc* %56, i32 0, i32 6
  store i64 %53, i64* %57, align 8
  br label %58

58:                                               ; preds = %50
  %59 = load %struct.node*, %struct.node** %4, align 8
  %60 = getelementptr inbounds %struct.node, %struct.node* %59, i32 1
  store %struct.node* %60, %struct.node** %4, align 8
  br label %45, !llvm.loop !22

61:                                               ; preds = %45
  %62 = load %struct.network*, %struct.network** %2, align 8
  %63 = getelementptr inbounds %struct.network, %struct.network* %62, i32 0, i32 24
  %64 = load %struct.arc*, %struct.arc** %63, align 8
  %65 = bitcast %struct.arc* %64 to i8*
  store i8* %65, i8** %5, align 8
  %66 = load %struct.network*, %struct.network** %2, align 8
  %67 = getelementptr inbounds %struct.network, %struct.network* %66, i32 0, i32 23
  %68 = load %struct.arc*, %struct.arc** %67, align 8
  store %struct.arc* %68, %struct.arc** %3, align 8
  br label %69

69:                                               ; preds = %121, %61
  %70 = load %struct.arc*, %struct.arc** %3, align 8
  %71 = load i8*, i8** %5, align 8
  %72 = bitcast i8* %71 to %struct.arc*
  %73 = icmp ne %struct.arc* %70, %72
  br i1 %73, label %74, label %124

74:                                               ; preds = %69
  %75 = load %struct.arc*, %struct.arc** %3, align 8
  %76 = getelementptr inbounds %struct.arc, %struct.arc* %75, i32 0, i32 6
  %77 = load i64, i64* %76, align 8
  %78 = icmp ne i64 %77, 0
  br i1 %78, label %79, label %120

79:                                               ; preds = %74
  %80 = load %struct.arc*, %struct.arc** %3, align 8
  %81 = getelementptr inbounds %struct.arc, %struct.arc* %80, i32 0, i32 1
  %82 = load %struct.node*, %struct.node** %81, align 8
  %83 = getelementptr inbounds %struct.node, %struct.node* %82, i32 0, i32 12
  %84 = load i32, i32* %83, align 8
  %85 = icmp slt i32 %84, 0
  br i1 %85, label %86, label %93

86:                                               ; preds = %79
  %87 = load %struct.arc*, %struct.arc** %3, align 8
  %88 = getelementptr inbounds %struct.arc, %struct.arc* %87, i32 0, i32 2
  %89 = load %struct.node*, %struct.node** %88, align 8
  %90 = getelementptr inbounds %struct.node, %struct.node* %89, i32 0, i32 12
  %91 = load i32, i32* %90, align 8
  %92 = icmp sgt i32 %91, 0
  br i1 %92, label %119, label %93

93:                                               ; preds = %86, %79
  %94 = load %struct.arc*, %struct.arc** %3, align 8
  %95 = getelementptr inbounds %struct.arc, %struct.arc* %94, i32 0, i32 1
  %96 = load %struct.node*, %struct.node** %95, align 8
  %97 = getelementptr inbounds %struct.node, %struct.node* %96, i32 0, i32 12
  %98 = load i32, i32* %97, align 8
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %112, label %100

100:                                              ; preds = %93
  %101 = load %struct.arc*, %struct.arc** %3, align 8
  %102 = getelementptr inbounds %struct.arc, %struct.arc* %101, i32 0, i32 0
  %103 = load i64, i64* %102, align 8
  %104 = load %struct.network*, %struct.network** %2, align 8
  %105 = getelementptr inbounds %struct.network, %struct.network* %104, i32 0, i32 18
  %106 = load i64, i64* %105, align 8
  %107 = sub nsw i64 %103, %106
  %108 = load i64, i64* %7, align 8
  %109 = add nsw i64 %108, %107
  store i64 %109, i64* %7, align 8
  %110 = load i64, i64* %6, align 8
  %111 = add nsw i64 %110, 1
  store i64 %111, i64* %6, align 8
  br label %118

112:                                              ; preds = %93
  %113 = load %struct.arc*, %struct.arc** %3, align 8
  %114 = getelementptr inbounds %struct.arc, %struct.arc* %113, i32 0, i32 0
  %115 = load i64, i64* %114, align 8
  %116 = load i64, i64* %7, align 8
  %117 = add nsw i64 %116, %115
  store i64 %117, i64* %7, align 8
  br label %118

118:                                              ; preds = %112, %100
  br label %119

119:                                              ; preds = %118, %86
  br label %120

120:                                              ; preds = %119, %74
  br label %121

121:                                              ; preds = %120
  %122 = load %struct.arc*, %struct.arc** %3, align 8
  %123 = getelementptr inbounds %struct.arc, %struct.arc* %122, i32 1
  store %struct.arc* %123, %struct.arc** %3, align 8
  br label %69, !llvm.loop !23

124:                                              ; preds = %69
  %125 = load i64, i64* %6, align 8
  %126 = sitofp i64 %125 to double
  %127 = load %struct.network*, %struct.network** %2, align 8
  %128 = getelementptr inbounds %struct.network, %struct.network* %127, i32 0, i32 18
  %129 = load i64, i64* %128, align 8
  %130 = sitofp i64 %129 to double
  %131 = fmul double %126, %130
  %132 = load i64, i64* %7, align 8
  %133 = sitofp i64 %132 to double
  %134 = fadd double %131, %133
  ret double %134
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @primal_feasible(%struct.network* %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca %struct.network*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.node*, align 8
  %6 = alloca %struct.arc*, align 8
  %7 = alloca %struct.arc*, align 8
  %8 = alloca %struct.arc*, align 8
  %9 = alloca i64, align 8
  store %struct.network* %0, %struct.network** %3, align 8
  %10 = load %struct.network*, %struct.network** %3, align 8
  %11 = getelementptr inbounds %struct.network, %struct.network* %10, i32 0, i32 25
  %12 = load %struct.arc*, %struct.arc** %11, align 8
  store %struct.arc* %12, %struct.arc** %6, align 8
  %13 = load %struct.network*, %struct.network** %3, align 8
  %14 = getelementptr inbounds %struct.network, %struct.network* %13, i32 0, i32 26
  %15 = load %struct.arc*, %struct.arc** %14, align 8
  store %struct.arc* %15, %struct.arc** %7, align 8
  %16 = load %struct.network*, %struct.network** %3, align 8
  %17 = getelementptr inbounds %struct.network, %struct.network* %16, i32 0, i32 21
  %18 = load %struct.node*, %struct.node** %17, align 8
  store %struct.node* %18, %struct.node** %5, align 8
  %19 = load %struct.network*, %struct.network** %3, align 8
  %20 = getelementptr inbounds %struct.network, %struct.network* %19, i32 0, i32 22
  %21 = load %struct.node*, %struct.node** %20, align 8
  %22 = bitcast %struct.node* %21 to i8*
  store i8* %22, i8** %4, align 8
  %23 = load %struct.node*, %struct.node** %5, align 8
  %24 = getelementptr inbounds %struct.node, %struct.node* %23, i32 1
  store %struct.node* %24, %struct.node** %5, align 8
  br label %25

25:                                               ; preds = %88, %1
  %26 = load %struct.node*, %struct.node** %5, align 8
  %27 = load i8*, i8** %4, align 8
  %28 = bitcast i8* %27 to %struct.node*
  %29 = icmp ult %struct.node* %26, %28
  br i1 %29, label %30, label %91

30:                                               ; preds = %25
  %31 = load %struct.node*, %struct.node** %5, align 8
  %32 = getelementptr inbounds %struct.node, %struct.node* %31, i32 0, i32 6
  %33 = load %struct.arc*, %struct.arc** %32, align 8
  store %struct.arc* %33, %struct.arc** %8, align 8
  %34 = load %struct.node*, %struct.node** %5, align 8
  %35 = getelementptr inbounds %struct.node, %struct.node* %34, i32 0, i32 10
  %36 = load i64, i64* %35, align 8
  store i64 %36, i64* %9, align 8
  %37 = load %struct.arc*, %struct.arc** %8, align 8
  %38 = load %struct.arc*, %struct.arc** %6, align 8
  %39 = icmp uge %struct.arc* %37, %38
  br i1 %39, label %40, label %66

40:                                               ; preds = %30
  %41 = load %struct.arc*, %struct.arc** %8, align 8
  %42 = load %struct.arc*, %struct.arc** %7, align 8
  %43 = icmp ult %struct.arc* %41, %42
  br i1 %43, label %44, label %66

44:                                               ; preds = %40
  %45 = load i64, i64* %9, align 8
  %46 = icmp sge i64 %45, 0
  br i1 %46, label %47, label %49

47:                                               ; preds = %44
  %48 = load i64, i64* %9, align 8
  br label %52

49:                                               ; preds = %44
  %50 = load i64, i64* %9, align 8
  %51 = sub nsw i64 0, %50
  br label %52

52:                                               ; preds = %49, %47
  %53 = phi i64 [ %48, %47 ], [ %51, %49 ]
  %54 = load %struct.network*, %struct.network** %3, align 8
  %55 = getelementptr inbounds %struct.network, %struct.network* %54, i32 0, i32 16
  %56 = load i64, i64* %55, align 8
  %57 = icmp sgt i64 %53, %56
  br i1 %57, label %58, label %65

58:                                               ; preds = %52
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.16, i64 0, i64 0))
  %60 = load %struct.node*, %struct.node** %5, align 8
  %61 = getelementptr inbounds %struct.node, %struct.node* %60, i32 0, i32 12
  %62 = load i32, i32* %61, align 8
  %63 = load i64, i64* %9, align 8
  %64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.1.17, i64 0, i64 0), i32 %62, i64 %63)
  br label %65

65:                                               ; preds = %58, %52
  br label %87

66:                                               ; preds = %40, %30
  %67 = load i64, i64* %9, align 8
  %68 = load %struct.network*, %struct.network** %3, align 8
  %69 = getelementptr inbounds %struct.network, %struct.network* %68, i32 0, i32 16
  %70 = load i64, i64* %69, align 8
  %71 = sub nsw i64 0, %70
  %72 = icmp slt i64 %67, %71
  br i1 %72, label %80, label %73

73:                                               ; preds = %66
  %74 = load i64, i64* %9, align 8
  %75 = sub nsw i64 %74, 1
  %76 = load %struct.network*, %struct.network** %3, align 8
  %77 = getelementptr inbounds %struct.network, %struct.network* %76, i32 0, i32 16
  %78 = load i64, i64* %77, align 8
  %79 = icmp sgt i64 %75, %78
  br i1 %79, label %80, label %86

80:                                               ; preds = %73, %66
  %81 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.16, i64 0, i64 0))
  %82 = load i64, i64* %9, align 8
  %83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2.18, i64 0, i64 0), i64 %82)
  %84 = load %struct.network*, %struct.network** %3, align 8
  %85 = getelementptr inbounds %struct.network, %struct.network* %84, i32 0, i32 13
  store i64 0, i64* %85, align 8
  store i64 1, i64* %2, align 8
  br label %94

86:                                               ; preds = %73
  br label %87

87:                                               ; preds = %86, %65
  br label %88

88:                                               ; preds = %87
  %89 = load %struct.node*, %struct.node** %5, align 8
  %90 = getelementptr inbounds %struct.node, %struct.node* %89, i32 1
  store %struct.node* %90, %struct.node** %5, align 8
  br label %25, !llvm.loop !24

91:                                               ; preds = %25
  %92 = load %struct.network*, %struct.network** %3, align 8
  %93 = getelementptr inbounds %struct.network, %struct.network* %92, i32 0, i32 13
  store i64 1, i64* %93, align 8
  store i64 0, i64* %2, align 8
  br label %94

94:                                               ; preds = %91, %80
  %95 = load i64, i64* %2, align 8
  ret i64 %95
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @dual_feasible(%struct.network* %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca %struct.network*, align 8
  %4 = alloca %struct.arc*, align 8
  %5 = alloca %struct.arc*, align 8
  %6 = alloca i64, align 8
  store %struct.network* %0, %struct.network** %3, align 8
  %7 = load %struct.network*, %struct.network** %3, align 8
  %8 = getelementptr inbounds %struct.network, %struct.network* %7, i32 0, i32 24
  %9 = load %struct.arc*, %struct.arc** %8, align 8
  store %struct.arc* %9, %struct.arc** %5, align 8
  %10 = load %struct.network*, %struct.network** %3, align 8
  %11 = getelementptr inbounds %struct.network, %struct.network* %10, i32 0, i32 23
  %12 = load %struct.arc*, %struct.arc** %11, align 8
  store %struct.arc* %12, %struct.arc** %4, align 8
  br label %13

13:                                               ; preds = %56, %1
  %14 = load %struct.arc*, %struct.arc** %4, align 8
  %15 = load %struct.arc*, %struct.arc** %5, align 8
  %16 = icmp ult %struct.arc* %14, %15
  br i1 %16, label %17, label %59

17:                                               ; preds = %13
  %18 = load %struct.arc*, %struct.arc** %4, align 8
  %19 = getelementptr inbounds %struct.arc, %struct.arc* %18, i32 0, i32 0
  %20 = load i64, i64* %19, align 8
  %21 = load %struct.arc*, %struct.arc** %4, align 8
  %22 = getelementptr inbounds %struct.arc, %struct.arc* %21, i32 0, i32 1
  %23 = load %struct.node*, %struct.node** %22, align 8
  %24 = getelementptr inbounds %struct.node, %struct.node* %23, i32 0, i32 0
  %25 = load i64, i64* %24, align 8
  %26 = sub nsw i64 %20, %25
  %27 = load %struct.arc*, %struct.arc** %4, align 8
  %28 = getelementptr inbounds %struct.arc, %struct.arc* %27, i32 0, i32 2
  %29 = load %struct.node*, %struct.node** %28, align 8
  %30 = getelementptr inbounds %struct.node, %struct.node* %29, i32 0, i32 0
  %31 = load i64, i64* %30, align 8
  %32 = add nsw i64 %26, %31
  store i64 %32, i64* %6, align 8
  %33 = load %struct.arc*, %struct.arc** %4, align 8
  %34 = getelementptr inbounds %struct.arc, %struct.arc* %33, i32 0, i32 3
  %35 = load i32, i32* %34, align 8
  switch i32 %35, label %54 [
    i32 0, label %36
    i32 1, label %36
    i32 2, label %45
    i32 -1, label %53
  ]

36:                                               ; preds = %17, %17
  %37 = load i64, i64* %6, align 8
  %38 = load %struct.network*, %struct.network** %3, align 8
  %39 = getelementptr inbounds %struct.network, %struct.network* %38, i32 0, i32 16
  %40 = load i64, i64* %39, align 8
  %41 = sub nsw i64 0, %40
  %42 = icmp slt i64 %37, %41
  br i1 %42, label %43, label %44

43:                                               ; preds = %36
  br label %60

44:                                               ; preds = %36
  br label %55

45:                                               ; preds = %17
  %46 = load i64, i64* %6, align 8
  %47 = load %struct.network*, %struct.network** %3, align 8
  %48 = getelementptr inbounds %struct.network, %struct.network* %47, i32 0, i32 16
  %49 = load i64, i64* %48, align 8
  %50 = icmp sgt i64 %46, %49
  br i1 %50, label %51, label %52

51:                                               ; preds = %45
  br label %60

52:                                               ; preds = %45
  br label %55

53:                                               ; preds = %17
  br label %54

54:                                               ; preds = %53, %17
  br label %55

55:                                               ; preds = %54, %52, %44
  br label %56

56:                                               ; preds = %55
  %57 = load %struct.arc*, %struct.arc** %4, align 8
  %58 = getelementptr inbounds %struct.arc, %struct.arc* %57, i32 1
  store %struct.arc* %58, %struct.arc** %4, align 8
  br label %13, !llvm.loop !25

59:                                               ; preds = %13
  store i64 0, i64* %2, align 8
  br label %65

60:                                               ; preds = %51, %43
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3.19, i64 0, i64 0))
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %63, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4.20, i64 0, i64 0))
  store i64 1, i64* %2, align 8
  br label %65

65:                                               ; preds = %60, %59
  %66 = load i64, i64* %2, align 8
  ret i64 %66
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @getfree(%struct.network* %0) #0 {
  %2 = alloca %struct.network*, align 8
  store %struct.network* %0, %struct.network** %2, align 8
  %3 = load %struct.network*, %struct.network** %2, align 8
  %4 = getelementptr inbounds %struct.network, %struct.network* %3, i32 0, i32 21
  %5 = load %struct.node*, %struct.node** %4, align 8
  %6 = icmp ne %struct.node* %5, null
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = load %struct.network*, %struct.network** %2, align 8
  %9 = getelementptr inbounds %struct.network, %struct.network* %8, i32 0, i32 21
  %10 = load %struct.node*, %struct.node** %9, align 8
  %11 = bitcast %struct.node* %10 to i8*
  call void @free(i8* %11) #7
  br label %12

12:                                               ; preds = %7, %1
  %13 = load %struct.network*, %struct.network** %2, align 8
  %14 = getelementptr inbounds %struct.network, %struct.network* %13, i32 0, i32 23
  %15 = load %struct.arc*, %struct.arc** %14, align 8
  %16 = icmp ne %struct.arc* %15, null
  br i1 %16, label %17, label %22

17:                                               ; preds = %12
  %18 = load %struct.network*, %struct.network** %2, align 8
  %19 = getelementptr inbounds %struct.network, %struct.network* %18, i32 0, i32 23
  %20 = load %struct.arc*, %struct.arc** %19, align 8
  %21 = bitcast %struct.arc* %20 to i8*
  call void @free(i8* %21) #7
  br label %22

22:                                               ; preds = %17, %12
  %23 = load %struct.network*, %struct.network** %2, align 8
  %24 = getelementptr inbounds %struct.network, %struct.network* %23, i32 0, i32 25
  %25 = load %struct.arc*, %struct.arc** %24, align 8
  %26 = icmp ne %struct.arc* %25, null
  br i1 %26, label %27, label %32

27:                                               ; preds = %22
  %28 = load %struct.network*, %struct.network** %2, align 8
  %29 = getelementptr inbounds %struct.network, %struct.network* %28, i32 0, i32 25
  %30 = load %struct.arc*, %struct.arc** %29, align 8
  %31 = bitcast %struct.arc* %30 to i8*
  call void @free(i8* %31) #7
  br label %32

32:                                               ; preds = %27, %22
  %33 = load %struct.network*, %struct.network** %2, align 8
  %34 = getelementptr inbounds %struct.network, %struct.network* %33, i32 0, i32 22
  store %struct.node* null, %struct.node** %34, align 8
  %35 = load %struct.network*, %struct.network** %2, align 8
  %36 = getelementptr inbounds %struct.network, %struct.network* %35, i32 0, i32 21
  store %struct.node* null, %struct.node** %36, align 8
  %37 = load %struct.network*, %struct.network** %2, align 8
  %38 = getelementptr inbounds %struct.network, %struct.network* %37, i32 0, i32 24
  store %struct.arc* null, %struct.arc** %38, align 8
  %39 = load %struct.network*, %struct.network** %2, align 8
  %40 = getelementptr inbounds %struct.network, %struct.network* %39, i32 0, i32 23
  store %struct.arc* null, %struct.arc** %40, align 8
  %41 = load %struct.network*, %struct.network** %2, align 8
  %42 = getelementptr inbounds %struct.network, %struct.network* %41, i32 0, i32 26
  store %struct.arc* null, %struct.arc** %42, align 8
  %43 = load %struct.network*, %struct.network** %2, align 8
  %44 = getelementptr inbounds %struct.network, %struct.network* %43, i32 0, i32 25
  store %struct.arc* null, %struct.arc** %44, align 8
  ret i64 0
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @write_circulations(i8* %0, %struct.network* %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.network*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct.arc*, align 8
  %8 = alloca %struct.arc*, align 8
  %9 = alloca %struct.arc*, align 8
  %10 = alloca %struct.arc*, align 8
  store i8* %0, i8** %4, align 8
  store %struct.network* %1, %struct.network** %5, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %6, align 8
  %11 = load %struct.network*, %struct.network** %5, align 8
  %12 = getelementptr inbounds %struct.network, %struct.network* %11, i32 0, i32 24
  %13 = load %struct.arc*, %struct.arc** %12, align 8
  %14 = load %struct.network*, %struct.network** %5, align 8
  %15 = getelementptr inbounds %struct.network, %struct.network* %14, i32 0, i32 7
  %16 = load i64, i64* %15, align 8
  %17 = sub i64 0, %16
  %18 = getelementptr inbounds %struct.arc, %struct.arc* %13, i64 %17
  store %struct.arc* %18, %struct.arc** %10, align 8
  %19 = load i8*, i8** %4, align 8
  %20 = call %struct._IO_FILE* @fopen(i8* %19, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.25, i64 0, i64 0))
  store %struct._IO_FILE* %20, %struct._IO_FILE** %6, align 8
  %21 = icmp eq %struct._IO_FILE* %20, null
  br i1 %21, label %22, label %23

22:                                               ; preds = %2
  store i64 -1, i64* %3, align 8
  br label %114

23:                                               ; preds = %2
  %24 = load %struct.network*, %struct.network** %5, align 8
  call void @refresh_neighbour_lists(%struct.network* %24)
  %25 = load %struct.network*, %struct.network** %5, align 8
  %26 = getelementptr inbounds %struct.network, %struct.network* %25, i32 0, i32 21
  %27 = load %struct.node*, %struct.node** %26, align 8
  %28 = load %struct.network*, %struct.network** %5, align 8
  %29 = getelementptr inbounds %struct.network, %struct.network* %28, i32 0, i32 2
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds %struct.node, %struct.node* %27, i64 %30
  %32 = getelementptr inbounds %struct.node, %struct.node* %31, i32 0, i32 7
  %33 = load %struct.arc*, %struct.arc** %32, align 8
  store %struct.arc* %33, %struct.arc** %7, align 8
  br label %34

34:                                               ; preds = %107, %23
  %35 = load %struct.arc*, %struct.arc** %7, align 8
  %36 = icmp ne %struct.arc* %35, null
  br i1 %36, label %37, label %111

37:                                               ; preds = %34
  %38 = load %struct.arc*, %struct.arc** %7, align 8
  %39 = getelementptr inbounds %struct.arc, %struct.arc* %38, i32 0, i32 6
  %40 = load i64, i64* %39, align 8
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %106

42:                                               ; preds = %37
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1.26, i64 0, i64 0))
  %45 = load %struct.arc*, %struct.arc** %7, align 8
  store %struct.arc* %45, %struct.arc** %8, align 8
  br label %46

46:                                               ; preds = %104, %42
  %47 = load %struct.arc*, %struct.arc** %8, align 8
  %48 = icmp ne %struct.arc* %47, null
  br i1 %48, label %49, label %105

49:                                               ; preds = %46
  %50 = load %struct.arc*, %struct.arc** %8, align 8
  %51 = load %struct.arc*, %struct.arc** %10, align 8
  %52 = icmp uge %struct.arc* %50, %51
  br i1 %52, label %53, label %56

53:                                               ; preds = %49
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2.27, i64 0, i64 0))
  br label %56

56:                                               ; preds = %53, %49
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %58 = load %struct.arc*, %struct.arc** %8, align 8
  %59 = getelementptr inbounds %struct.arc, %struct.arc* %58, i32 0, i32 2
  %60 = load %struct.node*, %struct.node** %59, align 8
  %61 = getelementptr inbounds %struct.node, %struct.node* %60, i32 0, i32 12
  %62 = load i32, i32* %61, align 8
  %63 = sub nsw i32 0, %62
  %64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3.28, i64 0, i64 0), i32 %63)
  %65 = load %struct.arc*, %struct.arc** %8, align 8
  %66 = getelementptr inbounds %struct.arc, %struct.arc* %65, i32 0, i32 2
  %67 = load %struct.node*, %struct.node** %66, align 8
  %68 = load %struct.network*, %struct.network** %5, align 8
  %69 = getelementptr inbounds %struct.network, %struct.network* %68, i32 0, i32 3
  %70 = load i64, i64* %69, align 8
  %71 = getelementptr inbounds %struct.node, %struct.node* %67, i64 %70
  %72 = getelementptr inbounds %struct.node, %struct.node* %71, i32 0, i32 7
  %73 = load %struct.arc*, %struct.arc** %72, align 8
  store %struct.arc* %73, %struct.arc** %9, align 8
  br label %74

74:                                               ; preds = %84, %56
  %75 = load %struct.arc*, %struct.arc** %9, align 8
  %76 = icmp ne %struct.arc* %75, null
  br i1 %76, label %77, label %88

77:                                               ; preds = %74
  %78 = load %struct.arc*, %struct.arc** %9, align 8
  %79 = getelementptr inbounds %struct.arc, %struct.arc* %78, i32 0, i32 6
  %80 = load i64, i64* %79, align 8
  %81 = icmp ne i64 %80, 0
  br i1 %81, label %82, label %83

82:                                               ; preds = %77
  br label %88

83:                                               ; preds = %77
  br label %84

84:                                               ; preds = %83
  %85 = load %struct.arc*, %struct.arc** %9, align 8
  %86 = getelementptr inbounds %struct.arc, %struct.arc* %85, i32 0, i32 4
  %87 = load %struct.arc*, %struct.arc** %86, align 8
  store %struct.arc* %87, %struct.arc** %9, align 8
  br label %74, !llvm.loop !26

88:                                               ; preds = %82, %74
  %89 = load %struct.arc*, %struct.arc** %9, align 8
  %90 = icmp ne %struct.arc* %89, null
  br i1 %90, label %94, label %91

91:                                               ; preds = %88
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %93 = call i32 @fclose(%struct._IO_FILE* %92)
  store i64 -1, i64* %3, align 8
  br label %114

94:                                               ; preds = %88
  %95 = load %struct.arc*, %struct.arc** %9, align 8
  %96 = getelementptr inbounds %struct.arc, %struct.arc* %95, i32 0, i32 2
  %97 = load %struct.node*, %struct.node** %96, align 8
  %98 = getelementptr inbounds %struct.node, %struct.node* %97, i32 0, i32 12
  %99 = load i32, i32* %98, align 8
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %103

101:                                              ; preds = %94
  %102 = load %struct.arc*, %struct.arc** %9, align 8
  store %struct.arc* %102, %struct.arc** %8, align 8
  br label %104

103:                                              ; preds = %94
  store %struct.arc* null, %struct.arc** %8, align 8
  br label %104

104:                                              ; preds = %103, %101
  br label %46, !llvm.loop !27

105:                                              ; preds = %46
  br label %106

106:                                              ; preds = %105, %37
  br label %107

107:                                              ; preds = %106
  %108 = load %struct.arc*, %struct.arc** %7, align 8
  %109 = getelementptr inbounds %struct.arc, %struct.arc* %108, i32 0, i32 4
  %110 = load %struct.arc*, %struct.arc** %109, align 8
  store %struct.arc* %110, %struct.arc** %7, align 8
  br label %34, !llvm.loop !28

111:                                              ; preds = %34
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %113 = call i32 @fclose(%struct._IO_FILE* %112)
  store i64 0, i64* %3, align 8
  br label %114

114:                                              ; preds = %111, %91, %22
  %115 = load i64, i64* %3, align 8
  ret i64 %115
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @bea_is_dual_infeasible(%struct.arc* %0, i64 %1) #0 {
  %3 = alloca %struct.arc*, align 8
  %4 = alloca i64, align 8
  store %struct.arc* %0, %struct.arc** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  %6 = icmp slt i64 %5, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %2
  %8 = load %struct.arc*, %struct.arc** %3, align 8
  %9 = getelementptr inbounds %struct.arc, %struct.arc* %8, i32 0, i32 3
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %22, label %12

12:                                               ; preds = %7, %2
  %13 = load i64, i64* %4, align 8
  %14 = icmp sgt i64 %13, 0
  br i1 %14, label %15, label %20

15:                                               ; preds = %12
  %16 = load %struct.arc*, %struct.arc** %3, align 8
  %17 = getelementptr inbounds %struct.arc, %struct.arc* %16, i32 0, i32 3
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 2
  br label %20

20:                                               ; preds = %15, %12
  %21 = phi i1 [ false, %12 ], [ %19, %15 ]
  br label %22

22:                                               ; preds = %20, %7
  %23 = phi i1 [ true, %7 ], [ %21, %20 ]
  %24 = zext i1 %23 to i32
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @sort_basket(i64 %0, i64 %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca %struct.basket*, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %9 = load i64, i64* %3, align 8
  store i64 %9, i64* %5, align 8
  %10 = load i64, i64* %4, align 8
  store i64 %10, i64* %6, align 8
  %11 = load i64, i64* %5, align 8
  %12 = load i64, i64* %6, align 8
  %13 = add nsw i64 %11, %12
  %14 = sdiv i64 %13, 2
  %15 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %14
  %16 = load %struct.basket*, %struct.basket** %15, align 8
  %17 = getelementptr inbounds %struct.basket, %struct.basket* %16, i32 0, i32 2
  %18 = load i64, i64* %17, align 8
  store i64 %18, i64* %7, align 8
  br label %19

19:                                               ; preds = %69, %2
  br label %20

20:                                               ; preds = %28, %19
  %21 = load i64, i64* %5, align 8
  %22 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %21
  %23 = load %struct.basket*, %struct.basket** %22, align 8
  %24 = getelementptr inbounds %struct.basket, %struct.basket* %23, i32 0, i32 2
  %25 = load i64, i64* %24, align 8
  %26 = load i64, i64* %7, align 8
  %27 = icmp sgt i64 %25, %26
  br i1 %27, label %28, label %31

28:                                               ; preds = %20
  %29 = load i64, i64* %5, align 8
  %30 = add nsw i64 %29, 1
  store i64 %30, i64* %5, align 8
  br label %20, !llvm.loop !29

31:                                               ; preds = %20
  br label %32

32:                                               ; preds = %40, %31
  %33 = load i64, i64* %7, align 8
  %34 = load i64, i64* %6, align 8
  %35 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %34
  %36 = load %struct.basket*, %struct.basket** %35, align 8
  %37 = getelementptr inbounds %struct.basket, %struct.basket* %36, i32 0, i32 2
  %38 = load i64, i64* %37, align 8
  %39 = icmp sgt i64 %33, %38
  br i1 %39, label %40, label %43

40:                                               ; preds = %32
  %41 = load i64, i64* %6, align 8
  %42 = add nsw i64 %41, -1
  store i64 %42, i64* %6, align 8
  br label %32, !llvm.loop !30

43:                                               ; preds = %32
  %44 = load i64, i64* %5, align 8
  %45 = load i64, i64* %6, align 8
  %46 = icmp slt i64 %44, %45
  br i1 %46, label %47, label %59

47:                                               ; preds = %43
  %48 = load i64, i64* %5, align 8
  %49 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %48
  %50 = load %struct.basket*, %struct.basket** %49, align 8
  store %struct.basket* %50, %struct.basket** %8, align 8
  %51 = load i64, i64* %6, align 8
  %52 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %51
  %53 = load %struct.basket*, %struct.basket** %52, align 8
  %54 = load i64, i64* %5, align 8
  %55 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %54
  store %struct.basket* %53, %struct.basket** %55, align 8
  %56 = load %struct.basket*, %struct.basket** %8, align 8
  %57 = load i64, i64* %6, align 8
  %58 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %57
  store %struct.basket* %56, %struct.basket** %58, align 8
  br label %59

59:                                               ; preds = %47, %43
  %60 = load i64, i64* %5, align 8
  %61 = load i64, i64* %6, align 8
  %62 = icmp sle i64 %60, %61
  br i1 %62, label %63, label %68

63:                                               ; preds = %59
  %64 = load i64, i64* %5, align 8
  %65 = add nsw i64 %64, 1
  store i64 %65, i64* %5, align 8
  %66 = load i64, i64* %6, align 8
  %67 = add nsw i64 %66, -1
  store i64 %67, i64* %6, align 8
  br label %68

68:                                               ; preds = %63, %59
  br label %69

69:                                               ; preds = %68
  %70 = load i64, i64* %5, align 8
  %71 = load i64, i64* %6, align 8
  %72 = icmp sle i64 %70, %71
  br i1 %72, label %19, label %73, !llvm.loop !31

73:                                               ; preds = %69
  %74 = load i64, i64* %3, align 8
  %75 = load i64, i64* %6, align 8
  %76 = icmp slt i64 %74, %75
  br i1 %76, label %77, label %80

77:                                               ; preds = %73
  %78 = load i64, i64* %3, align 8
  %79 = load i64, i64* %6, align 8
  call void @sort_basket(i64 %78, i64 %79)
  br label %80

80:                                               ; preds = %77, %73
  %81 = load i64, i64* %5, align 8
  %82 = load i64, i64* %4, align 8
  %83 = icmp slt i64 %81, %82
  br i1 %83, label %84, label %90

84:                                               ; preds = %80
  %85 = load i64, i64* %5, align 8
  %86 = icmp sle i64 %85, 50
  br i1 %86, label %87, label %90

87:                                               ; preds = %84
  %88 = load i64, i64* %5, align 8
  %89 = load i64, i64* %4, align 8
  call void @sort_basket(i64 %88, i64 %89)
  br label %90

90:                                               ; preds = %87, %84, %80
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.arc* @primal_bea_mpp(i64 %0, %struct.arc* %1, %struct.arc* %2, i64* %3) #0 {
  %5 = alloca %struct.arc*, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.arc*, align 8
  %8 = alloca %struct.arc*, align 8
  %9 = alloca i64*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca %struct.arc*, align 8
  %14 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  store %struct.arc* %1, %struct.arc** %7, align 8
  store %struct.arc* %2, %struct.arc** %8, align 8
  store i64* %3, i64** %9, align 8
  %15 = load i64, i64* @initialize, align 8
  %16 = icmp ne i64 %15, 0
  br i1 %16, label %17, label %34

17:                                               ; preds = %4
  store i64 1, i64* %10, align 8
  br label %18

18:                                               ; preds = %26, %17
  %19 = load i64, i64* %10, align 8
  %20 = icmp slt i64 %19, 351
  br i1 %20, label %21, label %29

21:                                               ; preds = %18
  %22 = load i64, i64* %10, align 8
  %23 = getelementptr inbounds [351 x %struct.basket], [351 x %struct.basket]* @basket, i64 0, i64 %22
  %24 = load i64, i64* %10, align 8
  %25 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %24
  store %struct.basket* %23, %struct.basket** %25, align 8
  br label %26

26:                                               ; preds = %21
  %27 = load i64, i64* %10, align 8
  %28 = add nsw i64 %27, 1
  store i64 %28, i64* %10, align 8
  br label %18, !llvm.loop !32

29:                                               ; preds = %18
  %30 = load i64, i64* %6, align 8
  %31 = sub nsw i64 %30, 1
  %32 = sdiv i64 %31, 300
  %33 = add nsw i64 %32, 1
  store i64 %33, i64* @nr_group, align 8
  store i64 0, i64* @group_pos, align 8
  store i64 0, i64* @basket_size, align 8
  store i64 0, i64* @initialize, align 8
  br label %112

34:                                               ; preds = %4
  store i64 2, i64* %10, align 8
  store i64 0, i64* %11, align 8
  br label %35

35:                                               ; preds = %107, %34
  %36 = load i64, i64* %10, align 8
  %37 = icmp sle i64 %36, 50
  br i1 %37, label %38, label %42

38:                                               ; preds = %35
  %39 = load i64, i64* %10, align 8
  %40 = load i64, i64* @basket_size, align 8
  %41 = icmp sle i64 %39, %40
  br label %42

42:                                               ; preds = %38, %35
  %43 = phi i1 [ false, %35 ], [ %41, %38 ]
  br i1 %43, label %44, label %110

44:                                               ; preds = %42
  %45 = load i64, i64* %10, align 8
  %46 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %45
  %47 = load %struct.basket*, %struct.basket** %46, align 8
  %48 = getelementptr inbounds %struct.basket, %struct.basket* %47, i32 0, i32 0
  %49 = load %struct.arc*, %struct.arc** %48, align 8
  store %struct.arc* %49, %struct.arc** %13, align 8
  %50 = load %struct.arc*, %struct.arc** %13, align 8
  %51 = getelementptr inbounds %struct.arc, %struct.arc* %50, i32 0, i32 0
  %52 = load i64, i64* %51, align 8
  %53 = load %struct.arc*, %struct.arc** %13, align 8
  %54 = getelementptr inbounds %struct.arc, %struct.arc* %53, i32 0, i32 1
  %55 = load %struct.node*, %struct.node** %54, align 8
  %56 = getelementptr inbounds %struct.node, %struct.node* %55, i32 0, i32 0
  %57 = load i64, i64* %56, align 8
  %58 = sub nsw i64 %52, %57
  %59 = load %struct.arc*, %struct.arc** %13, align 8
  %60 = getelementptr inbounds %struct.arc, %struct.arc* %59, i32 0, i32 2
  %61 = load %struct.node*, %struct.node** %60, align 8
  %62 = getelementptr inbounds %struct.node, %struct.node* %61, i32 0, i32 0
  %63 = load i64, i64* %62, align 8
  %64 = add nsw i64 %58, %63
  store i64 %64, i64* %14, align 8
  %65 = load i64, i64* %14, align 8
  %66 = icmp slt i64 %65, 0
  br i1 %66, label %67, label %72

67:                                               ; preds = %44
  %68 = load %struct.arc*, %struct.arc** %13, align 8
  %69 = getelementptr inbounds %struct.arc, %struct.arc* %68, i32 0, i32 3
  %70 = load i32, i32* %69, align 8
  %71 = icmp eq i32 %70, 1
  br i1 %71, label %80, label %72

72:                                               ; preds = %67, %44
  %73 = load i64, i64* %14, align 8
  %74 = icmp sgt i64 %73, 0
  br i1 %74, label %75, label %106

75:                                               ; preds = %72
  %76 = load %struct.arc*, %struct.arc** %13, align 8
  %77 = getelementptr inbounds %struct.arc, %struct.arc* %76, i32 0, i32 3
  %78 = load i32, i32* %77, align 8
  %79 = icmp eq i32 %78, 2
  br i1 %79, label %80, label %106

80:                                               ; preds = %75, %67
  %81 = load i64, i64* %11, align 8
  %82 = add nsw i64 %81, 1
  store i64 %82, i64* %11, align 8
  %83 = load %struct.arc*, %struct.arc** %13, align 8
  %84 = load i64, i64* %11, align 8
  %85 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %84
  %86 = load %struct.basket*, %struct.basket** %85, align 8
  %87 = getelementptr inbounds %struct.basket, %struct.basket* %86, i32 0, i32 0
  store %struct.arc* %83, %struct.arc** %87, align 8
  %88 = load i64, i64* %14, align 8
  %89 = load i64, i64* %11, align 8
  %90 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %89
  %91 = load %struct.basket*, %struct.basket** %90, align 8
  %92 = getelementptr inbounds %struct.basket, %struct.basket* %91, i32 0, i32 1
  store i64 %88, i64* %92, align 8
  %93 = load i64, i64* %14, align 8
  %94 = icmp sge i64 %93, 0
  br i1 %94, label %95, label %97

95:                                               ; preds = %80
  %96 = load i64, i64* %14, align 8
  br label %100

97:                                               ; preds = %80
  %98 = load i64, i64* %14, align 8
  %99 = sub nsw i64 0, %98
  br label %100

100:                                              ; preds = %97, %95
  %101 = phi i64 [ %96, %95 ], [ %99, %97 ]
  %102 = load i64, i64* %11, align 8
  %103 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %102
  %104 = load %struct.basket*, %struct.basket** %103, align 8
  %105 = getelementptr inbounds %struct.basket, %struct.basket* %104, i32 0, i32 2
  store i64 %101, i64* %105, align 8
  br label %106

106:                                              ; preds = %100, %75, %72
  br label %107

107:                                              ; preds = %106
  %108 = load i64, i64* %10, align 8
  %109 = add nsw i64 %108, 1
  store i64 %109, i64* %10, align 8
  br label %35, !llvm.loop !33

110:                                              ; preds = %42
  %111 = load i64, i64* %11, align 8
  store i64 %111, i64* @basket_size, align 8
  br label %112

112:                                              ; preds = %110, %29
  %113 = load i64, i64* @group_pos, align 8
  store i64 %113, i64* %12, align 8
  br label %114

114:                                              ; preds = %192, %112
  %115 = load %struct.arc*, %struct.arc** %7, align 8
  %116 = load i64, i64* @group_pos, align 8
  %117 = getelementptr inbounds %struct.arc, %struct.arc* %115, i64 %116
  store %struct.arc* %117, %struct.arc** %13, align 8
  br label %118

118:                                              ; preds = %175, %114
  %119 = load %struct.arc*, %struct.arc** %13, align 8
  %120 = load %struct.arc*, %struct.arc** %8, align 8
  %121 = icmp ult %struct.arc* %119, %120
  br i1 %121, label %122, label %179

122:                                              ; preds = %118
  %123 = load %struct.arc*, %struct.arc** %13, align 8
  %124 = getelementptr inbounds %struct.arc, %struct.arc* %123, i32 0, i32 3
  %125 = load i32, i32* %124, align 8
  %126 = icmp sgt i32 %125, 0
  br i1 %126, label %127, label %174

127:                                              ; preds = %122
  %128 = load %struct.arc*, %struct.arc** %13, align 8
  %129 = getelementptr inbounds %struct.arc, %struct.arc* %128, i32 0, i32 0
  %130 = load i64, i64* %129, align 8
  %131 = load %struct.arc*, %struct.arc** %13, align 8
  %132 = getelementptr inbounds %struct.arc, %struct.arc* %131, i32 0, i32 1
  %133 = load %struct.node*, %struct.node** %132, align 8
  %134 = getelementptr inbounds %struct.node, %struct.node* %133, i32 0, i32 0
  %135 = load i64, i64* %134, align 8
  %136 = sub nsw i64 %130, %135
  %137 = load %struct.arc*, %struct.arc** %13, align 8
  %138 = getelementptr inbounds %struct.arc, %struct.arc* %137, i32 0, i32 2
  %139 = load %struct.node*, %struct.node** %138, align 8
  %140 = getelementptr inbounds %struct.node, %struct.node* %139, i32 0, i32 0
  %141 = load i64, i64* %140, align 8
  %142 = add nsw i64 %136, %141
  store i64 %142, i64* %14, align 8
  %143 = load %struct.arc*, %struct.arc** %13, align 8
  %144 = load i64, i64* %14, align 8
  %145 = call i32 @bea_is_dual_infeasible(%struct.arc* %143, i64 %144)
  %146 = icmp ne i32 %145, 0
  br i1 %146, label %147, label %173

147:                                              ; preds = %127
  %148 = load i64, i64* @basket_size, align 8
  %149 = add nsw i64 %148, 1
  store i64 %149, i64* @basket_size, align 8
  %150 = load %struct.arc*, %struct.arc** %13, align 8
  %151 = load i64, i64* @basket_size, align 8
  %152 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %151
  %153 = load %struct.basket*, %struct.basket** %152, align 8
  %154 = getelementptr inbounds %struct.basket, %struct.basket* %153, i32 0, i32 0
  store %struct.arc* %150, %struct.arc** %154, align 8
  %155 = load i64, i64* %14, align 8
  %156 = load i64, i64* @basket_size, align 8
  %157 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %156
  %158 = load %struct.basket*, %struct.basket** %157, align 8
  %159 = getelementptr inbounds %struct.basket, %struct.basket* %158, i32 0, i32 1
  store i64 %155, i64* %159, align 8
  %160 = load i64, i64* %14, align 8
  %161 = icmp sge i64 %160, 0
  br i1 %161, label %162, label %164

162:                                              ; preds = %147
  %163 = load i64, i64* %14, align 8
  br label %167

164:                                              ; preds = %147
  %165 = load i64, i64* %14, align 8
  %166 = sub nsw i64 0, %165
  br label %167

167:                                              ; preds = %164, %162
  %168 = phi i64 [ %163, %162 ], [ %166, %164 ]
  %169 = load i64, i64* @basket_size, align 8
  %170 = getelementptr inbounds [351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 %169
  %171 = load %struct.basket*, %struct.basket** %170, align 8
  %172 = getelementptr inbounds %struct.basket, %struct.basket* %171, i32 0, i32 2
  store i64 %168, i64* %172, align 8
  br label %173

173:                                              ; preds = %167, %127
  br label %174

174:                                              ; preds = %173, %122
  br label %175

175:                                              ; preds = %174
  %176 = load i64, i64* @nr_group, align 8
  %177 = load %struct.arc*, %struct.arc** %13, align 8
  %178 = getelementptr inbounds %struct.arc, %struct.arc* %177, i64 %176
  store %struct.arc* %178, %struct.arc** %13, align 8
  br label %118, !llvm.loop !34

179:                                              ; preds = %118
  %180 = load i64, i64* @group_pos, align 8
  %181 = add nsw i64 %180, 1
  store i64 %181, i64* @group_pos, align 8
  %182 = load i64, i64* @nr_group, align 8
  %183 = icmp eq i64 %181, %182
  br i1 %183, label %184, label %185

184:                                              ; preds = %179
  store i64 0, i64* @group_pos, align 8
  br label %185

185:                                              ; preds = %184, %179
  %186 = load i64, i64* @basket_size, align 8
  %187 = icmp slt i64 %186, 50
  br i1 %187, label %188, label %193

188:                                              ; preds = %185
  %189 = load i64, i64* @group_pos, align 8
  %190 = load i64, i64* %12, align 8
  %191 = icmp ne i64 %189, %190
  br i1 %191, label %192, label %193

192:                                              ; preds = %188
  br label %114

193:                                              ; preds = %188, %185
  %194 = load i64, i64* @basket_size, align 8
  %195 = icmp eq i64 %194, 0
  br i1 %195, label %196, label %198

196:                                              ; preds = %193
  store i64 1, i64* @initialize, align 8
  %197 = load i64*, i64** %9, align 8
  store i64 0, i64* %197, align 8
  store %struct.arc* null, %struct.arc** %5, align 8
  br label %207

198:                                              ; preds = %193
  %199 = load i64, i64* @basket_size, align 8
  call void @sort_basket(i64 1, i64 %199)
  %200 = load %struct.basket*, %struct.basket** getelementptr inbounds ([351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 1), align 8
  %201 = getelementptr inbounds %struct.basket, %struct.basket* %200, i32 0, i32 1
  %202 = load i64, i64* %201, align 8
  %203 = load i64*, i64** %9, align 8
  store i64 %202, i64* %203, align 8
  %204 = load %struct.basket*, %struct.basket** getelementptr inbounds ([351 x %struct.basket*], [351 x %struct.basket*]* @perm, i64 0, i64 1), align 8
  %205 = getelementptr inbounds %struct.basket, %struct.basket* %204, i32 0, i32 0
  %206 = load %struct.arc*, %struct.arc** %205, align 8
  store %struct.arc* %206, %struct.arc** %5, align 8
  br label %207

207:                                              ; preds = %198, %196
  %208 = load %struct.arc*, %struct.arc** %5, align 8
  ret %struct.arc* %208
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.node* @primal_iminus(i64* %0, i64* %1, %struct.node* %2, %struct.node* %3, %struct.node** %4) #0 {
  %6 = alloca i64*, align 8
  %7 = alloca i64*, align 8
  %8 = alloca %struct.node*, align 8
  %9 = alloca %struct.node*, align 8
  %10 = alloca %struct.node**, align 8
  %11 = alloca %struct.node*, align 8
  store i64* %0, i64** %6, align 8
  store i64* %1, i64** %7, align 8
  store %struct.node* %2, %struct.node** %8, align 8
  store %struct.node* %3, %struct.node** %9, align 8
  store %struct.node** %4, %struct.node*** %10, align 8
  store %struct.node* null, %struct.node** %11, align 8
  br label %12

12:                                               ; preds = %122, %5
  %13 = load %struct.node*, %struct.node** %8, align 8
  %14 = load %struct.node*, %struct.node** %9, align 8
  %15 = icmp ne %struct.node* %13, %14
  br i1 %15, label %16, label %123

16:                                               ; preds = %12
  %17 = load %struct.node*, %struct.node** %8, align 8
  %18 = getelementptr inbounds %struct.node, %struct.node* %17, i32 0, i32 11
  %19 = load i64, i64* %18, align 8
  %20 = load %struct.node*, %struct.node** %9, align 8
  %21 = getelementptr inbounds %struct.node, %struct.node* %20, i32 0, i32 11
  %22 = load i64, i64* %21, align 8
  %23 = icmp slt i64 %19, %22
  br i1 %23, label %24, label %73

24:                                               ; preds = %16
  %25 = load %struct.node*, %struct.node** %8, align 8
  %26 = getelementptr inbounds %struct.node, %struct.node* %25, i32 0, i32 1
  %27 = load i32, i32* %26, align 8
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %44

29:                                               ; preds = %24
  %30 = load i64*, i64** %6, align 8
  %31 = load i64, i64* %30, align 8
  %32 = load %struct.node*, %struct.node** %8, align 8
  %33 = getelementptr inbounds %struct.node, %struct.node* %32, i32 0, i32 10
  %34 = load i64, i64* %33, align 8
  %35 = icmp sgt i64 %31, %34
  br i1 %35, label %36, label %43

36:                                               ; preds = %29
  %37 = load %struct.node*, %struct.node** %8, align 8
  store %struct.node* %37, %struct.node** %11, align 8
  %38 = load %struct.node*, %struct.node** %8, align 8
  %39 = getelementptr inbounds %struct.node, %struct.node* %38, i32 0, i32 10
  %40 = load i64, i64* %39, align 8
  %41 = load i64*, i64** %6, align 8
  store i64 %40, i64* %41, align 8
  %42 = load i64*, i64** %7, align 8
  store i64 0, i64* %42, align 8
  br label %43

43:                                               ; preds = %36, %29
  br label %69

44:                                               ; preds = %24
  %45 = load %struct.node*, %struct.node** %8, align 8
  %46 = getelementptr inbounds %struct.node, %struct.node* %45, i32 0, i32 3
  %47 = load %struct.node*, %struct.node** %46, align 8
  %48 = getelementptr inbounds %struct.node, %struct.node* %47, i32 0, i32 3
  %49 = load %struct.node*, %struct.node** %48, align 8
  %50 = icmp ne %struct.node* %49, null
  br i1 %50, label %51, label %68

51:                                               ; preds = %44
  %52 = load i64*, i64** %6, align 8
  %53 = load i64, i64* %52, align 8
  %54 = load %struct.node*, %struct.node** %8, align 8
  %55 = getelementptr inbounds %struct.node, %struct.node* %54, i32 0, i32 10
  %56 = load i64, i64* %55, align 8
  %57 = sub nsw i64 1, %56
  %58 = icmp sgt i64 %53, %57
  br i1 %58, label %59, label %67

59:                                               ; preds = %51
  %60 = load %struct.node*, %struct.node** %8, align 8
  store %struct.node* %60, %struct.node** %11, align 8
  %61 = load %struct.node*, %struct.node** %8, align 8
  %62 = getelementptr inbounds %struct.node, %struct.node* %61, i32 0, i32 10
  %63 = load i64, i64* %62, align 8
  %64 = sub nsw i64 1, %63
  %65 = load i64*, i64** %6, align 8
  store i64 %64, i64* %65, align 8
  %66 = load i64*, i64** %7, align 8
  store i64 0, i64* %66, align 8
  br label %67

67:                                               ; preds = %59, %51
  br label %68

68:                                               ; preds = %67, %44
  br label %69

69:                                               ; preds = %68, %43
  %70 = load %struct.node*, %struct.node** %8, align 8
  %71 = getelementptr inbounds %struct.node, %struct.node* %70, i32 0, i32 3
  %72 = load %struct.node*, %struct.node** %71, align 8
  store %struct.node* %72, %struct.node** %8, align 8
  br label %122

73:                                               ; preds = %16
  %74 = load %struct.node*, %struct.node** %9, align 8
  %75 = getelementptr inbounds %struct.node, %struct.node* %74, i32 0, i32 1
  %76 = load i32, i32* %75, align 8
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %93, label %78

78:                                               ; preds = %73
  %79 = load i64*, i64** %6, align 8
  %80 = load i64, i64* %79, align 8
  %81 = load %struct.node*, %struct.node** %9, align 8
  %82 = getelementptr inbounds %struct.node, %struct.node* %81, i32 0, i32 10
  %83 = load i64, i64* %82, align 8
  %84 = icmp sge i64 %80, %83
  br i1 %84, label %85, label %92

85:                                               ; preds = %78
  %86 = load %struct.node*, %struct.node** %9, align 8
  store %struct.node* %86, %struct.node** %11, align 8
  %87 = load %struct.node*, %struct.node** %9, align 8
  %88 = getelementptr inbounds %struct.node, %struct.node* %87, i32 0, i32 10
  %89 = load i64, i64* %88, align 8
  %90 = load i64*, i64** %6, align 8
  store i64 %89, i64* %90, align 8
  %91 = load i64*, i64** %7, align 8
  store i64 1, i64* %91, align 8
  br label %92

92:                                               ; preds = %85, %78
  br label %118

93:                                               ; preds = %73
  %94 = load %struct.node*, %struct.node** %9, align 8
  %95 = getelementptr inbounds %struct.node, %struct.node* %94, i32 0, i32 3
  %96 = load %struct.node*, %struct.node** %95, align 8
  %97 = getelementptr inbounds %struct.node, %struct.node* %96, i32 0, i32 3
  %98 = load %struct.node*, %struct.node** %97, align 8
  %99 = icmp ne %struct.node* %98, null
  br i1 %99, label %100, label %117

100:                                              ; preds = %93
  %101 = load i64*, i64** %6, align 8
  %102 = load i64, i64* %101, align 8
  %103 = load %struct.node*, %struct.node** %9, align 8
  %104 = getelementptr inbounds %struct.node, %struct.node* %103, i32 0, i32 10
  %105 = load i64, i64* %104, align 8
  %106 = sub nsw i64 1, %105
  %107 = icmp sge i64 %102, %106
  br i1 %107, label %108, label %116

108:                                              ; preds = %100
  %109 = load %struct.node*, %struct.node** %9, align 8
  store %struct.node* %109, %struct.node** %11, align 8
  %110 = load %struct.node*, %struct.node** %9, align 8
  %111 = getelementptr inbounds %struct.node, %struct.node* %110, i32 0, i32 10
  %112 = load i64, i64* %111, align 8
  %113 = sub nsw i64 1, %112
  %114 = load i64*, i64** %6, align 8
  store i64 %113, i64* %114, align 8
  %115 = load i64*, i64** %7, align 8
  store i64 1, i64* %115, align 8
  br label %116

116:                                              ; preds = %108, %100
  br label %117

117:                                              ; preds = %116, %93
  br label %118

118:                                              ; preds = %117, %92
  %119 = load %struct.node*, %struct.node** %9, align 8
  %120 = getelementptr inbounds %struct.node, %struct.node* %119, i32 0, i32 3
  %121 = load %struct.node*, %struct.node** %120, align 8
  store %struct.node* %121, %struct.node** %9, align 8
  br label %122

122:                                              ; preds = %118, %69
  br label %12, !llvm.loop !35

123:                                              ; preds = %12
  %124 = load %struct.node*, %struct.node** %8, align 8
  %125 = load %struct.node**, %struct.node*** %10, align 8
  store %struct.node* %124, %struct.node** %125, align 8
  %126 = load %struct.node*, %struct.node** %11, align 8
  ret %struct.node* %126
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @primal_update_flow(%struct.node* %0, %struct.node* %1, %struct.node* %2) #0 {
  %4 = alloca %struct.node*, align 8
  %5 = alloca %struct.node*, align 8
  %6 = alloca %struct.node*, align 8
  store %struct.node* %0, %struct.node** %4, align 8
  store %struct.node* %1, %struct.node** %5, align 8
  store %struct.node* %2, %struct.node** %6, align 8
  br label %7

7:                                                ; preds = %23, %3
  %8 = load %struct.node*, %struct.node** %4, align 8
  %9 = load %struct.node*, %struct.node** %6, align 8
  %10 = icmp ne %struct.node* %8, %9
  br i1 %10, label %11, label %27

11:                                               ; preds = %7
  %12 = load %struct.node*, %struct.node** %4, align 8
  %13 = getelementptr inbounds %struct.node, %struct.node* %12, i32 0, i32 1
  %14 = load i32, i32* %13, align 8
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %11
  %17 = load %struct.node*, %struct.node** %4, align 8
  %18 = getelementptr inbounds %struct.node, %struct.node* %17, i32 0, i32 10
  store i64 0, i64* %18, align 8
  br label %22

19:                                               ; preds = %11
  %20 = load %struct.node*, %struct.node** %4, align 8
  %21 = getelementptr inbounds %struct.node, %struct.node* %20, i32 0, i32 10
  store i64 1, i64* %21, align 8
  br label %22

22:                                               ; preds = %19, %16
  br label %23

23:                                               ; preds = %22
  %24 = load %struct.node*, %struct.node** %4, align 8
  %25 = getelementptr inbounds %struct.node, %struct.node* %24, i32 0, i32 3
  %26 = load %struct.node*, %struct.node** %25, align 8
  store %struct.node* %26, %struct.node** %4, align 8
  br label %7, !llvm.loop !36

27:                                               ; preds = %7
  br label %28

28:                                               ; preds = %44, %27
  %29 = load %struct.node*, %struct.node** %5, align 8
  %30 = load %struct.node*, %struct.node** %6, align 8
  %31 = icmp ne %struct.node* %29, %30
  br i1 %31, label %32, label %48

32:                                               ; preds = %28
  %33 = load %struct.node*, %struct.node** %5, align 8
  %34 = getelementptr inbounds %struct.node, %struct.node* %33, i32 0, i32 1
  %35 = load i32, i32* %34, align 8
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %40

37:                                               ; preds = %32
  %38 = load %struct.node*, %struct.node** %5, align 8
  %39 = getelementptr inbounds %struct.node, %struct.node* %38, i32 0, i32 10
  store i64 1, i64* %39, align 8
  br label %43

40:                                               ; preds = %32
  %41 = load %struct.node*, %struct.node** %5, align 8
  %42 = getelementptr inbounds %struct.node, %struct.node* %41, i32 0, i32 10
  store i64 0, i64* %42, align 8
  br label %43

43:                                               ; preds = %40, %37
  br label %44

44:                                               ; preds = %43
  %45 = load %struct.node*, %struct.node** %5, align 8
  %46 = getelementptr inbounds %struct.node, %struct.node* %45, i32 0, i32 3
  %47 = load %struct.node*, %struct.node** %46, align 8
  store %struct.node* %47, %struct.node** %5, align 8
  br label %28, !llvm.loop !37

48:                                               ; preds = %28
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @primal_net_simplex(%struct.network* %0) #0 {
  %2 = alloca %struct.network*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca %struct.node*, align 8
  %9 = alloca %struct.node*, align 8
  %10 = alloca %struct.node*, align 8
  %11 = alloca %struct.node*, align 8
  %12 = alloca %struct.node*, align 8
  %13 = alloca %struct.arc*, align 8
  %14 = alloca %struct.arc*, align 8
  %15 = alloca %struct.arc*, align 8
  %16 = alloca %struct.arc*, align 8
  %17 = alloca %struct.node*, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca i64*, align 8
  %22 = alloca i64*, align 8
  %23 = alloca i64*, align 8
  store %struct.network* %0, %struct.network** %2, align 8
  store i64 0, i64* %5, align 8
  %24 = load %struct.network*, %struct.network** %2, align 8
  %25 = getelementptr inbounds %struct.network, %struct.network* %24, i32 0, i32 23
  %26 = load %struct.arc*, %struct.arc** %25, align 8
  store %struct.arc* %26, %struct.arc** %15, align 8
  %27 = load %struct.network*, %struct.network** %2, align 8
  %28 = getelementptr inbounds %struct.network, %struct.network* %27, i32 0, i32 24
  %29 = load %struct.arc*, %struct.arc** %28, align 8
  store %struct.arc* %29, %struct.arc** %16, align 8
  %30 = load %struct.network*, %struct.network** %2, align 8
  %31 = getelementptr inbounds %struct.network, %struct.network* %30, i32 0, i32 5
  %32 = load i64, i64* %31, align 8
  store i64 %32, i64* %18, align 8
  %33 = load %struct.network*, %struct.network** %2, align 8
  %34 = getelementptr inbounds %struct.network, %struct.network* %33, i32 0, i32 27
  store i64* %34, i64** %21, align 8
  %35 = load %struct.network*, %struct.network** %2, align 8
  %36 = getelementptr inbounds %struct.network, %struct.network* %35, i32 0, i32 28
  store i64* %36, i64** %22, align 8
  %37 = load %struct.network*, %struct.network** %2, align 8
  %38 = getelementptr inbounds %struct.network, %struct.network* %37, i32 0, i32 29
  store i64* %38, i64** %23, align 8
  br label %39

39:                                               ; preds = %174, %1
  %40 = load i64, i64* %5, align 8
  %41 = icmp ne i64 %40, 0
  %42 = xor i1 %41, true
  br i1 %42, label %43, label %175

43:                                               ; preds = %39
  %44 = load i64, i64* %18, align 8
  %45 = load %struct.arc*, %struct.arc** %15, align 8
  %46 = load %struct.arc*, %struct.arc** %16, align 8
  %47 = call %struct.arc* @primal_bea_mpp(i64 %44, %struct.arc* %45, %struct.arc* %46, i64* %20)
  store %struct.arc* %47, %struct.arc** %13, align 8
  %48 = icmp ne %struct.arc* %47, null
  br i1 %48, label %49, label %173

49:                                               ; preds = %43
  %50 = load i64*, i64** %21, align 8
  %51 = load i64, i64* %50, align 8
  %52 = add nsw i64 %51, 1
  store i64 %52, i64* %50, align 8
  %53 = load i64, i64* %20, align 8
  %54 = icmp sgt i64 %53, 0
  br i1 %54, label %55, label %62

55:                                               ; preds = %49
  %56 = load %struct.arc*, %struct.arc** %13, align 8
  %57 = getelementptr inbounds %struct.arc, %struct.arc* %56, i32 0, i32 2
  %58 = load %struct.node*, %struct.node** %57, align 8
  store %struct.node* %58, %struct.node** %8, align 8
  %59 = load %struct.arc*, %struct.arc** %13, align 8
  %60 = getelementptr inbounds %struct.arc, %struct.arc* %59, i32 0, i32 1
  %61 = load %struct.node*, %struct.node** %60, align 8
  store %struct.node* %61, %struct.node** %9, align 8
  br label %69

62:                                               ; preds = %49
  %63 = load %struct.arc*, %struct.arc** %13, align 8
  %64 = getelementptr inbounds %struct.arc, %struct.arc* %63, i32 0, i32 1
  %65 = load %struct.node*, %struct.node** %64, align 8
  store %struct.node* %65, %struct.node** %8, align 8
  %66 = load %struct.arc*, %struct.arc** %13, align 8
  %67 = getelementptr inbounds %struct.arc, %struct.arc* %66, i32 0, i32 2
  %68 = load %struct.node*, %struct.node** %67, align 8
  store %struct.node* %68, %struct.node** %9, align 8
  br label %69

69:                                               ; preds = %62, %55
  store i64 1, i64* %3, align 8
  %70 = load %struct.node*, %struct.node** %8, align 8
  %71 = load %struct.node*, %struct.node** %9, align 8
  %72 = call %struct.node* @primal_iminus(i64* %3, i64* %6, %struct.node* %70, %struct.node* %71, %struct.node** %12)
  store %struct.node* %72, %struct.node** %10, align 8
  %73 = load %struct.node*, %struct.node** %10, align 8
  %74 = icmp ne %struct.node* %73, null
  br i1 %74, label %97, label %75

75:                                               ; preds = %69
  %76 = load i64*, i64** %22, align 8
  %77 = load i64, i64* %76, align 8
  %78 = add nsw i64 %77, 1
  store i64 %78, i64* %76, align 8
  %79 = load %struct.arc*, %struct.arc** %13, align 8
  %80 = getelementptr inbounds %struct.arc, %struct.arc* %79, i32 0, i32 3
  %81 = load i32, i32* %80, align 8
  %82 = icmp eq i32 %81, 2
  br i1 %82, label %83, label %86

83:                                               ; preds = %75
  %84 = load %struct.arc*, %struct.arc** %13, align 8
  %85 = getelementptr inbounds %struct.arc, %struct.arc* %84, i32 0, i32 3
  store i32 1, i32* %85, align 8
  br label %89

86:                                               ; preds = %75
  %87 = load %struct.arc*, %struct.arc** %13, align 8
  %88 = getelementptr inbounds %struct.arc, %struct.arc* %87, i32 0, i32 3
  store i32 2, i32* %88, align 8
  br label %89

89:                                               ; preds = %86, %83
  %90 = load i64, i64* %3, align 8
  %91 = icmp ne i64 %90, 0
  br i1 %91, label %92, label %96

92:                                               ; preds = %89
  %93 = load %struct.node*, %struct.node** %8, align 8
  %94 = load %struct.node*, %struct.node** %9, align 8
  %95 = load %struct.node*, %struct.node** %12, align 8
  call void @primal_update_flow(%struct.node* %93, %struct.node* %94, %struct.node* %95)
  br label %96

96:                                               ; preds = %92, %89
  br label %172

97:                                               ; preds = %69
  %98 = load i64, i64* %6, align 8
  %99 = icmp ne i64 %98, 0
  br i1 %99, label %100, label %104

100:                                              ; preds = %97
  %101 = load %struct.node*, %struct.node** %9, align 8
  store %struct.node* %101, %struct.node** %17, align 8
  %102 = load %struct.node*, %struct.node** %8, align 8
  store %struct.node* %102, %struct.node** %9, align 8
  %103 = load %struct.node*, %struct.node** %17, align 8
  store %struct.node* %103, %struct.node** %8, align 8
  br label %104

104:                                              ; preds = %100, %97
  %105 = load %struct.node*, %struct.node** %10, align 8
  %106 = getelementptr inbounds %struct.node, %struct.node* %105, i32 0, i32 3
  %107 = load %struct.node*, %struct.node** %106, align 8
  store %struct.node* %107, %struct.node** %11, align 8
  %108 = load %struct.node*, %struct.node** %10, align 8
  %109 = getelementptr inbounds %struct.node, %struct.node* %108, i32 0, i32 6
  %110 = load %struct.arc*, %struct.arc** %109, align 8
  store %struct.arc* %110, %struct.arc** %14, align 8
  %111 = load i64, i64* %6, align 8
  %112 = load %struct.node*, %struct.node** %10, align 8
  %113 = getelementptr inbounds %struct.node, %struct.node* %112, i32 0, i32 1
  %114 = load i32, i32* %113, align 8
  %115 = sext i32 %114 to i64
  %116 = icmp ne i64 %111, %115
  br i1 %116, label %117, label %118

117:                                              ; preds = %104
  store i64 1, i64* %19, align 8
  br label %119

118:                                              ; preds = %104
  store i64 2, i64* %19, align 8
  br label %119

119:                                              ; preds = %118, %117
  %120 = load i64, i64* %20, align 8
  %121 = icmp sgt i64 %120, 0
  br i1 %121, label %122, label %125

122:                                              ; preds = %119
  %123 = load i64, i64* %3, align 8
  %124 = sub nsw i64 1, %123
  store i64 %124, i64* %4, align 8
  br label %127

125:                                              ; preds = %119
  %126 = load i64, i64* %3, align 8
  store i64 %126, i64* %4, align 8
  br label %127

127:                                              ; preds = %125, %122
  %128 = load %struct.arc*, %struct.arc** %13, align 8
  %129 = getelementptr inbounds %struct.arc, %struct.arc* %128, i32 0, i32 1
  %130 = load %struct.node*, %struct.node** %129, align 8
  %131 = load %struct.node*, %struct.node** %8, align 8
  %132 = icmp eq %struct.node* %130, %131
  br i1 %132, label %133, label %134

133:                                              ; preds = %127
  store i64 1, i64* %7, align 8
  br label %135

134:                                              ; preds = %127
  store i64 0, i64* %7, align 8
  br label %135

135:                                              ; preds = %134, %133
  %136 = load i64, i64* %6, align 8
  %137 = icmp ne i64 %136, 0
  %138 = xor i1 %137, true
  %139 = zext i1 %138 to i32
  %140 = sext i32 %139 to i64
  %141 = load i64, i64* %7, align 8
  %142 = load i64, i64* %3, align 8
  %143 = load i64, i64* %4, align 8
  %144 = load %struct.node*, %struct.node** %8, align 8
  %145 = load %struct.node*, %struct.node** %9, align 8
  %146 = load %struct.node*, %struct.node** %10, align 8
  %147 = load %struct.node*, %struct.node** %11, align 8
  %148 = load %struct.node*, %struct.node** %12, align 8
  %149 = load %struct.arc*, %struct.arc** %13, align 8
  %150 = load i64, i64* %20, align 8
  %151 = load %struct.network*, %struct.network** %2, align 8
  %152 = getelementptr inbounds %struct.network, %struct.network* %151, i32 0, i32 16
  %153 = load i64, i64* %152, align 8
  call void @update_tree(i64 %140, i64 %141, i64 %142, i64 %143, %struct.node* %144, %struct.node* %145, %struct.node* %146, %struct.node* %147, %struct.node* %148, %struct.arc* %149, i64 %150, i64 %153)
  %154 = load %struct.arc*, %struct.arc** %13, align 8
  %155 = getelementptr inbounds %struct.arc, %struct.arc* %154, i32 0, i32 3
  store i32 0, i32* %155, align 8
  %156 = load i64, i64* %19, align 8
  %157 = trunc i64 %156 to i32
  %158 = load %struct.arc*, %struct.arc** %14, align 8
  %159 = getelementptr inbounds %struct.arc, %struct.arc* %158, i32 0, i32 3
  store i32 %157, i32* %159, align 8
  %160 = load i64*, i64** %21, align 8
  %161 = load i64, i64* %160, align 8
  %162 = sub nsw i64 %161, 1
  %163 = srem i64 %162, 200
  %164 = icmp ne i64 %163, 0
  br i1 %164, label %171, label %165

165:                                              ; preds = %135
  %166 = load %struct.network*, %struct.network** %2, align 8
  %167 = call i64 @refresh_potential(%struct.network* %166)
  %168 = load i64*, i64** %23, align 8
  %169 = load i64, i64* %168, align 8
  %170 = add nsw i64 %169, %167
  store i64 %170, i64* %168, align 8
  br label %171

171:                                              ; preds = %165, %135
  br label %172

172:                                              ; preds = %171, %96
  br label %174

173:                                              ; preds = %43
  store i64 1, i64* %5, align 8
  br label %174

174:                                              ; preds = %173, %172
  br label %39, !llvm.loop !38

175:                                              ; preds = %39
  %176 = load %struct.network*, %struct.network** %2, align 8
  %177 = call i64 @refresh_potential(%struct.network* %176)
  %178 = load i64*, i64** %23, align 8
  %179 = load i64, i64* %178, align 8
  %180 = add nsw i64 %179, %177
  store i64 %180, i64* %178, align 8
  %181 = load %struct.network*, %struct.network** %2, align 8
  %182 = call i64 @primal_feasible(%struct.network* %181)
  %183 = load %struct.network*, %struct.network** %2, align 8
  %184 = call i64 @dual_feasible(%struct.network* %183)
  ret i64 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @primal_start_artificial(%struct.network* %0) #0 {
  %2 = alloca %struct.network*, align 8
  %3 = alloca %struct.node*, align 8
  %4 = alloca %struct.node*, align 8
  %5 = alloca %struct.arc*, align 8
  %6 = alloca i8*, align 8
  store %struct.network* %0, %struct.network** %2, align 8
  %7 = load %struct.network*, %struct.network** %2, align 8
  %8 = getelementptr inbounds %struct.network, %struct.network* %7, i32 0, i32 21
  %9 = load %struct.node*, %struct.node** %8, align 8
  store %struct.node* %9, %struct.node** %3, align 8
  store %struct.node* %9, %struct.node** %4, align 8
  %10 = load %struct.node*, %struct.node** %3, align 8
  %11 = getelementptr inbounds %struct.node, %struct.node* %10, i32 1
  store %struct.node* %11, %struct.node** %3, align 8
  %12 = load %struct.node*, %struct.node** %4, align 8
  %13 = getelementptr inbounds %struct.node, %struct.node* %12, i32 0, i32 6
  store %struct.arc* null, %struct.arc** %13, align 8
  %14 = load %struct.node*, %struct.node** %4, align 8
  %15 = getelementptr inbounds %struct.node, %struct.node* %14, i32 0, i32 3
  store %struct.node* null, %struct.node** %15, align 8
  %16 = load %struct.node*, %struct.node** %3, align 8
  %17 = load %struct.node*, %struct.node** %4, align 8
  %18 = getelementptr inbounds %struct.node, %struct.node* %17, i32 0, i32 2
  store %struct.node* %16, %struct.node** %18, align 8
  %19 = load %struct.node*, %struct.node** %4, align 8
  %20 = getelementptr inbounds %struct.node, %struct.node* %19, i32 0, i32 4
  store %struct.node* null, %struct.node** %20, align 8
  %21 = load %struct.node*, %struct.node** %4, align 8
  %22 = getelementptr inbounds %struct.node, %struct.node* %21, i32 0, i32 5
  store %struct.node* null, %struct.node** %22, align 8
  %23 = load %struct.network*, %struct.network** %2, align 8
  %24 = getelementptr inbounds %struct.network, %struct.network* %23, i32 0, i32 2
  %25 = load i64, i64* %24, align 8
  %26 = add nsw i64 %25, 1
  %27 = load %struct.node*, %struct.node** %4, align 8
  %28 = getelementptr inbounds %struct.node, %struct.node* %27, i32 0, i32 11
  store i64 %26, i64* %28, align 8
  %29 = load %struct.node*, %struct.node** %4, align 8
  %30 = getelementptr inbounds %struct.node, %struct.node* %29, i32 0, i32 1
  store i32 0, i32* %30, align 8
  %31 = load %struct.node*, %struct.node** %4, align 8
  %32 = getelementptr inbounds %struct.node, %struct.node* %31, i32 0, i32 0
  store i64 -100000000, i64* %32, align 8
  %33 = load %struct.node*, %struct.node** %4, align 8
  %34 = getelementptr inbounds %struct.node, %struct.node* %33, i32 0, i32 10
  store i64 0, i64* %34, align 8
  %35 = load %struct.network*, %struct.network** %2, align 8
  %36 = getelementptr inbounds %struct.network, %struct.network* %35, i32 0, i32 24
  %37 = load %struct.arc*, %struct.arc** %36, align 8
  %38 = bitcast %struct.arc* %37 to i8*
  store i8* %38, i8** %6, align 8
  %39 = load %struct.network*, %struct.network** %2, align 8
  %40 = getelementptr inbounds %struct.network, %struct.network* %39, i32 0, i32 23
  %41 = load %struct.arc*, %struct.arc** %40, align 8
  store %struct.arc* %41, %struct.arc** %5, align 8
  br label %42

42:                                               ; preds = %56, %1
  %43 = load %struct.arc*, %struct.arc** %5, align 8
  %44 = load i8*, i8** %6, align 8
  %45 = bitcast i8* %44 to %struct.arc*
  %46 = icmp ne %struct.arc* %43, %45
  br i1 %46, label %47, label %59

47:                                               ; preds = %42
  %48 = load %struct.arc*, %struct.arc** %5, align 8
  %49 = getelementptr inbounds %struct.arc, %struct.arc* %48, i32 0, i32 3
  %50 = load i32, i32* %49, align 8
  %51 = icmp ne i32 %50, -1
  br i1 %51, label %52, label %55

52:                                               ; preds = %47
  %53 = load %struct.arc*, %struct.arc** %5, align 8
  %54 = getelementptr inbounds %struct.arc, %struct.arc* %53, i32 0, i32 3
  store i32 1, i32* %54, align 8
  br label %55

55:                                               ; preds = %52, %47
  br label %56

56:                                               ; preds = %55
  %57 = load %struct.arc*, %struct.arc** %5, align 8
  %58 = getelementptr inbounds %struct.arc, %struct.arc* %57, i32 1
  store %struct.arc* %58, %struct.arc** %5, align 8
  br label %42, !llvm.loop !39

59:                                               ; preds = %42
  %60 = load %struct.network*, %struct.network** %2, align 8
  %61 = getelementptr inbounds %struct.network, %struct.network* %60, i32 0, i32 25
  %62 = load %struct.arc*, %struct.arc** %61, align 8
  store %struct.arc* %62, %struct.arc** %5, align 8
  %63 = load %struct.network*, %struct.network** %2, align 8
  %64 = getelementptr inbounds %struct.network, %struct.network* %63, i32 0, i32 22
  %65 = load %struct.node*, %struct.node** %64, align 8
  %66 = bitcast %struct.node* %65 to i8*
  store i8* %66, i8** %6, align 8
  br label %67

67:                                               ; preds = %107, %59
  %68 = load %struct.node*, %struct.node** %3, align 8
  %69 = load i8*, i8** %6, align 8
  %70 = bitcast i8* %69 to %struct.node*
  %71 = icmp ne %struct.node* %68, %70
  br i1 %71, label %72, label %112

72:                                               ; preds = %67
  %73 = load %struct.arc*, %struct.arc** %5, align 8
  %74 = load %struct.node*, %struct.node** %3, align 8
  %75 = getelementptr inbounds %struct.node, %struct.node* %74, i32 0, i32 6
  store %struct.arc* %73, %struct.arc** %75, align 8
  %76 = load %struct.node*, %struct.node** %4, align 8
  %77 = load %struct.node*, %struct.node** %3, align 8
  %78 = getelementptr inbounds %struct.node, %struct.node* %77, i32 0, i32 3
  store %struct.node* %76, %struct.node** %78, align 8
  %79 = load %struct.node*, %struct.node** %3, align 8
  %80 = getelementptr inbounds %struct.node, %struct.node* %79, i32 0, i32 2
  store %struct.node* null, %struct.node** %80, align 8
  %81 = load %struct.node*, %struct.node** %3, align 8
  %82 = getelementptr inbounds %struct.node, %struct.node* %81, i64 1
  %83 = load %struct.node*, %struct.node** %3, align 8
  %84 = getelementptr inbounds %struct.node, %struct.node* %83, i32 0, i32 4
  store %struct.node* %82, %struct.node** %84, align 8
  %85 = load %struct.node*, %struct.node** %3, align 8
  %86 = getelementptr inbounds %struct.node, %struct.node* %85, i64 -1
  %87 = load %struct.node*, %struct.node** %3, align 8
  %88 = getelementptr inbounds %struct.node, %struct.node* %87, i32 0, i32 5
  store %struct.node* %86, %struct.node** %88, align 8
  %89 = load %struct.node*, %struct.node** %3, align 8
  %90 = getelementptr inbounds %struct.node, %struct.node* %89, i32 0, i32 11
  store i64 1, i64* %90, align 8
  %91 = load %struct.arc*, %struct.arc** %5, align 8
  %92 = getelementptr inbounds %struct.arc, %struct.arc* %91, i32 0, i32 0
  store i64 100000000, i64* %92, align 8
  %93 = load %struct.arc*, %struct.arc** %5, align 8
  %94 = getelementptr inbounds %struct.arc, %struct.arc* %93, i32 0, i32 3
  store i32 0, i32* %94, align 8
  %95 = load %struct.node*, %struct.node** %3, align 8
  %96 = getelementptr inbounds %struct.node, %struct.node* %95, i32 0, i32 1
  store i32 1, i32* %96, align 8
  %97 = load %struct.node*, %struct.node** %3, align 8
  %98 = getelementptr inbounds %struct.node, %struct.node* %97, i32 0, i32 0
  store i64 0, i64* %98, align 8
  %99 = load %struct.node*, %struct.node** %3, align 8
  %100 = load %struct.arc*, %struct.arc** %5, align 8
  %101 = getelementptr inbounds %struct.arc, %struct.arc* %100, i32 0, i32 1
  store %struct.node* %99, %struct.node** %101, align 8
  %102 = load %struct.node*, %struct.node** %4, align 8
  %103 = load %struct.arc*, %struct.arc** %5, align 8
  %104 = getelementptr inbounds %struct.arc, %struct.arc* %103, i32 0, i32 2
  store %struct.node* %102, %struct.node** %104, align 8
  %105 = load %struct.node*, %struct.node** %3, align 8
  %106 = getelementptr inbounds %struct.node, %struct.node* %105, i32 0, i32 10
  store i64 0, i64* %106, align 8
  br label %107

107:                                              ; preds = %72
  %108 = load %struct.arc*, %struct.arc** %5, align 8
  %109 = getelementptr inbounds %struct.arc, %struct.arc* %108, i32 1
  store %struct.arc* %109, %struct.arc** %5, align 8
  %110 = load %struct.node*, %struct.node** %3, align 8
  %111 = getelementptr inbounds %struct.node, %struct.node* %110, i32 1
  store %struct.node* %111, %struct.node** %3, align 8
  br label %67, !llvm.loop !40

112:                                              ; preds = %67
  %113 = load %struct.node*, %struct.node** %3, align 8
  %114 = getelementptr inbounds %struct.node, %struct.node* %113, i32 -1
  store %struct.node* %114, %struct.node** %3, align 8
  %115 = load %struct.node*, %struct.node** %4, align 8
  %116 = getelementptr inbounds %struct.node, %struct.node* %115, i32 1
  store %struct.node* %116, %struct.node** %4, align 8
  %117 = load %struct.node*, %struct.node** %3, align 8
  %118 = getelementptr inbounds %struct.node, %struct.node* %117, i32 0, i32 4
  store %struct.node* null, %struct.node** %118, align 8
  %119 = load %struct.node*, %struct.node** %4, align 8
  %120 = getelementptr inbounds %struct.node, %struct.node* %119, i32 0, i32 5
  store %struct.node* null, %struct.node** %120, align 8
  ret i64 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @read_min(%struct.network* %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca %struct.network*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca [201 x i8], align 16
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca %struct.arc*, align 8
  %11 = alloca %struct.node*, align 8
  store %struct.network* %0, %struct.network** %3, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %4, align 8
  %12 = load %struct.network*, %struct.network** %3, align 8
  %13 = getelementptr inbounds %struct.network, %struct.network* %12, i32 0, i32 0
  %14 = getelementptr inbounds [200 x i8], [200 x i8]* %13, i64 0, i64 0
  %15 = call %struct._IO_FILE* @fopen(i8* %14, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.35, i64 0, i64 0))
  store %struct._IO_FILE* %15, %struct._IO_FILE** %4, align 8
  %16 = icmp eq %struct._IO_FILE* %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %1
  store i64 -1, i64* %2, align 8
  br label %537

18:                                               ; preds = %1
  %19 = getelementptr inbounds [201 x i8], [201 x i8]* %5, i64 0, i64 0
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %21 = call i8* @fgets(i8* %19, i32 200, %struct._IO_FILE* %20)
  %22 = getelementptr inbounds [201 x i8], [201 x i8]* %5, i64 0, i64 0
  %23 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1.36, i64 0, i64 0), i64* %6, i64* %7) #7
  %24 = icmp ne i32 %23, 2
  br i1 %24, label %25, label %26

25:                                               ; preds = %18
  store i64 -1, i64* %2, align 8
  br label %537

26:                                               ; preds = %18
  %27 = load i64, i64* %6, align 8
  %28 = load %struct.network*, %struct.network** %3, align 8
  %29 = getelementptr inbounds %struct.network, %struct.network* %28, i32 0, i32 3
  store i64 %27, i64* %29, align 8
  %30 = load i64, i64* %7, align 8
  %31 = load %struct.network*, %struct.network** %3, align 8
  %32 = getelementptr inbounds %struct.network, %struct.network* %31, i32 0, i32 6
  store i64 %30, i64* %32, align 8
  %33 = load i64, i64* %6, align 8
  %34 = load i64, i64* %6, align 8
  %35 = add nsw i64 %33, %34
  %36 = add nsw i64 %35, 1
  %37 = load %struct.network*, %struct.network** %3, align 8
  %38 = getelementptr inbounds %struct.network, %struct.network* %37, i32 0, i32 2
  store i64 %36, i64* %38, align 8
  %39 = load i64, i64* %6, align 8
  %40 = load i64, i64* %6, align 8
  %41 = add nsw i64 %39, %40
  %42 = load i64, i64* %6, align 8
  %43 = add nsw i64 %41, %42
  %44 = load i64, i64* %7, align 8
  %45 = add nsw i64 %43, %44
  %46 = load %struct.network*, %struct.network** %3, align 8
  %47 = getelementptr inbounds %struct.network, %struct.network* %46, i32 0, i32 5
  store i64 %45, i64* %47, align 8
  %48 = load %struct.network*, %struct.network** %3, align 8
  %49 = getelementptr inbounds %struct.network, %struct.network* %48, i32 0, i32 3
  %50 = load i64, i64* %49, align 8
  %51 = icmp sle i64 %50, 15000
  br i1 %51, label %52, label %60

52:                                               ; preds = %26
  %53 = load %struct.network*, %struct.network** %3, align 8
  %54 = getelementptr inbounds %struct.network, %struct.network* %53, i32 0, i32 5
  %55 = load i64, i64* %54, align 8
  %56 = load %struct.network*, %struct.network** %3, align 8
  %57 = getelementptr inbounds %struct.network, %struct.network* %56, i32 0, i32 4
  store i64 %55, i64* %57, align 8
  %58 = load %struct.network*, %struct.network** %3, align 8
  %59 = getelementptr inbounds %struct.network, %struct.network* %58, i32 0, i32 9
  store i64 3000000, i64* %59, align 8
  br label %65

60:                                               ; preds = %26
  %61 = load %struct.network*, %struct.network** %3, align 8
  %62 = getelementptr inbounds %struct.network, %struct.network* %61, i32 0, i32 4
  store i64 27328512, i64* %62, align 8
  %63 = load %struct.network*, %struct.network** %3, align 8
  %64 = getelementptr inbounds %struct.network, %struct.network* %63, i32 0, i32 9
  store i64 28900000, i64* %64, align 8
  br label %65

65:                                               ; preds = %60, %52
  %66 = load %struct.network*, %struct.network** %3, align 8
  %67 = getelementptr inbounds %struct.network, %struct.network* %66, i32 0, i32 4
  %68 = load i64, i64* %67, align 8
  %69 = load %struct.network*, %struct.network** %3, align 8
  %70 = getelementptr inbounds %struct.network, %struct.network* %69, i32 0, i32 5
  %71 = load i64, i64* %70, align 8
  %72 = sub nsw i64 %68, %71
  %73 = load %struct.network*, %struct.network** %3, align 8
  %74 = getelementptr inbounds %struct.network, %struct.network* %73, i32 0, i32 8
  store i64 %72, i64* %74, align 8
  %75 = load %struct.network*, %struct.network** %3, align 8
  %76 = getelementptr inbounds %struct.network, %struct.network* %75, i32 0, i32 9
  %77 = load i64, i64* %76, align 8
  %78 = icmp sge i64 %77, 3
  br i1 %78, label %79, label %80

79:                                               ; preds = %65
  br label %81

80:                                               ; preds = %65
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.37, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3.38, i64 0, i64 0), i32 77, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @__PRETTY_FUNCTION__.read_min, i64 0, i64 0)) #6
  unreachable

81:                                               ; preds = %79
  %82 = load %struct.network*, %struct.network** %3, align 8
  %83 = getelementptr inbounds %struct.network, %struct.network* %82, i32 0, i32 2
  %84 = load i64, i64* %83, align 8
  %85 = add nsw i64 %84, 1
  %86 = call noalias i8* @calloc(i64 %85, i64 104) #7
  %87 = bitcast i8* %86 to %struct.node*
  %88 = load %struct.network*, %struct.network** %3, align 8
  %89 = getelementptr inbounds %struct.network, %struct.network* %88, i32 0, i32 21
  store %struct.node* %87, %struct.node** %89, align 8
  %90 = load %struct.network*, %struct.network** %3, align 8
  %91 = getelementptr inbounds %struct.network, %struct.network* %90, i32 0, i32 2
  %92 = load i64, i64* %91, align 8
  %93 = call noalias i8* @calloc(i64 %92, i64 64) #7
  %94 = bitcast i8* %93 to %struct.arc*
  %95 = load %struct.network*, %struct.network** %3, align 8
  %96 = getelementptr inbounds %struct.network, %struct.network* %95, i32 0, i32 25
  store %struct.arc* %94, %struct.arc** %96, align 8
  %97 = load %struct.network*, %struct.network** %3, align 8
  %98 = getelementptr inbounds %struct.network, %struct.network* %97, i32 0, i32 4
  %99 = load i64, i64* %98, align 8
  %100 = call noalias i8* @calloc(i64 %99, i64 64) #7
  %101 = bitcast i8* %100 to %struct.arc*
  %102 = load %struct.network*, %struct.network** %3, align 8
  %103 = getelementptr inbounds %struct.network, %struct.network* %102, i32 0, i32 23
  store %struct.arc* %101, %struct.arc** %103, align 8
  %104 = load %struct.network*, %struct.network** %3, align 8
  %105 = getelementptr inbounds %struct.network, %struct.network* %104, i32 0, i32 21
  %106 = load %struct.node*, %struct.node** %105, align 8
  %107 = icmp ne %struct.node* %106, null
  br i1 %107, label %108, label %118

108:                                              ; preds = %81
  %109 = load %struct.network*, %struct.network** %3, align 8
  %110 = getelementptr inbounds %struct.network, %struct.network* %109, i32 0, i32 23
  %111 = load %struct.arc*, %struct.arc** %110, align 8
  %112 = icmp ne %struct.arc* %111, null
  br i1 %112, label %113, label %118

113:                                              ; preds = %108
  %114 = load %struct.network*, %struct.network** %3, align 8
  %115 = getelementptr inbounds %struct.network, %struct.network* %114, i32 0, i32 25
  %116 = load %struct.arc*, %struct.arc** %115, align 8
  %117 = icmp ne %struct.arc* %116, null
  br i1 %117, label %122, label %118

118:                                              ; preds = %113, %108, %81
  %119 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4.39, i64 0, i64 0))
  %120 = load %struct.network*, %struct.network** %3, align 8
  %121 = call i64 @getfree(%struct.network* %120)
  store i64 -1, i64* %2, align 8
  br label %537

122:                                              ; preds = %113
  %123 = load %struct.network*, %struct.network** %3, align 8
  %124 = getelementptr inbounds %struct.network, %struct.network* %123, i32 0, i32 21
  %125 = load %struct.node*, %struct.node** %124, align 8
  %126 = load %struct.network*, %struct.network** %3, align 8
  %127 = getelementptr inbounds %struct.network, %struct.network* %126, i32 0, i32 2
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds %struct.node, %struct.node* %125, i64 %128
  %130 = getelementptr inbounds %struct.node, %struct.node* %129, i64 1
  %131 = load %struct.network*, %struct.network** %3, align 8
  %132 = getelementptr inbounds %struct.network, %struct.network* %131, i32 0, i32 22
  store %struct.node* %130, %struct.node** %132, align 8
  %133 = load %struct.network*, %struct.network** %3, align 8
  %134 = getelementptr inbounds %struct.network, %struct.network* %133, i32 0, i32 23
  %135 = load %struct.arc*, %struct.arc** %134, align 8
  %136 = load %struct.network*, %struct.network** %3, align 8
  %137 = getelementptr inbounds %struct.network, %struct.network* %136, i32 0, i32 5
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds %struct.arc, %struct.arc* %135, i64 %138
  %140 = load %struct.network*, %struct.network** %3, align 8
  %141 = getelementptr inbounds %struct.network, %struct.network* %140, i32 0, i32 24
  store %struct.arc* %139, %struct.arc** %141, align 8
  %142 = load %struct.network*, %struct.network** %3, align 8
  %143 = getelementptr inbounds %struct.network, %struct.network* %142, i32 0, i32 25
  %144 = load %struct.arc*, %struct.arc** %143, align 8
  %145 = load %struct.network*, %struct.network** %3, align 8
  %146 = getelementptr inbounds %struct.network, %struct.network* %145, i32 0, i32 2
  %147 = load i64, i64* %146, align 8
  %148 = getelementptr inbounds %struct.arc, %struct.arc* %144, i64 %147
  %149 = load %struct.network*, %struct.network** %3, align 8
  %150 = getelementptr inbounds %struct.network, %struct.network* %149, i32 0, i32 26
  store %struct.arc* %148, %struct.arc** %150, align 8
  %151 = load %struct.network*, %struct.network** %3, align 8
  %152 = getelementptr inbounds %struct.network, %struct.network* %151, i32 0, i32 21
  %153 = load %struct.node*, %struct.node** %152, align 8
  store %struct.node* %153, %struct.node** %11, align 8
  %154 = load %struct.network*, %struct.network** %3, align 8
  %155 = getelementptr inbounds %struct.network, %struct.network* %154, i32 0, i32 23
  %156 = load %struct.arc*, %struct.arc** %155, align 8
  store %struct.arc* %156, %struct.arc** %10, align 8
  store i64 1, i64* %9, align 8
  br label %157

157:                                              ; preds = %369, %122
  %158 = load i64, i64* %9, align 8
  %159 = load %struct.network*, %struct.network** %3, align 8
  %160 = getelementptr inbounds %struct.network, %struct.network* %159, i32 0, i32 3
  %161 = load i64, i64* %160, align 8
  %162 = icmp sle i64 %158, %161
  br i1 %162, label %163, label %372

163:                                              ; preds = %157
  %164 = getelementptr inbounds [201 x i8], [201 x i8]* %5, i64 0, i64 0
  %165 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %166 = call i8* @fgets(i8* %164, i32 200, %struct._IO_FILE* %165)
  %167 = getelementptr inbounds [201 x i8], [201 x i8]* %5, i64 0, i64 0
  %168 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %167, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1.36, i64 0, i64 0), i64* %6, i64* %7) #7
  %169 = icmp ne i32 %168, 2
  br i1 %169, label %174, label %170

170:                                              ; preds = %163
  %171 = load i64, i64* %6, align 8
  %172 = load i64, i64* %7, align 8
  %173 = icmp sgt i64 %171, %172
  br i1 %173, label %174, label %175

174:                                              ; preds = %170, %163
  store i64 -1, i64* %2, align 8
  br label %537

175:                                              ; preds = %170
  %176 = load i64, i64* %9, align 8
  %177 = sub nsw i64 0, %176
  %178 = trunc i64 %177 to i32
  %179 = load %struct.node*, %struct.node** %11, align 8
  %180 = load i64, i64* %9, align 8
  %181 = getelementptr inbounds %struct.node, %struct.node* %179, i64 %180
  %182 = getelementptr inbounds %struct.node, %struct.node* %181, i32 0, i32 12
  store i32 %178, i32* %182, align 8
  %183 = load %struct.node*, %struct.node** %11, align 8
  %184 = load i64, i64* %9, align 8
  %185 = getelementptr inbounds %struct.node, %struct.node* %183, i64 %184
  %186 = getelementptr inbounds %struct.node, %struct.node* %185, i32 0, i32 10
  store i64 -1, i64* %186, align 8
  %187 = load i64, i64* %9, align 8
  %188 = trunc i64 %187 to i32
  %189 = load %struct.node*, %struct.node** %11, align 8
  %190 = load i64, i64* %9, align 8
  %191 = load %struct.network*, %struct.network** %3, align 8
  %192 = getelementptr inbounds %struct.network, %struct.network* %191, i32 0, i32 3
  %193 = load i64, i64* %192, align 8
  %194 = add nsw i64 %190, %193
  %195 = getelementptr inbounds %struct.node, %struct.node* %189, i64 %194
  %196 = getelementptr inbounds %struct.node, %struct.node* %195, i32 0, i32 12
  store i32 %188, i32* %196, align 8
  %197 = load %struct.node*, %struct.node** %11, align 8
  %198 = load i64, i64* %9, align 8
  %199 = load %struct.network*, %struct.network** %3, align 8
  %200 = getelementptr inbounds %struct.network, %struct.network* %199, i32 0, i32 3
  %201 = load i64, i64* %200, align 8
  %202 = add nsw i64 %198, %201
  %203 = getelementptr inbounds %struct.node, %struct.node* %197, i64 %202
  %204 = getelementptr inbounds %struct.node, %struct.node* %203, i32 0, i32 10
  store i64 1, i64* %204, align 8
  %205 = load i64, i64* %6, align 8
  %206 = trunc i64 %205 to i32
  %207 = load %struct.node*, %struct.node** %11, align 8
  %208 = load i64, i64* %9, align 8
  %209 = getelementptr inbounds %struct.node, %struct.node* %207, i64 %208
  %210 = getelementptr inbounds %struct.node, %struct.node* %209, i32 0, i32 13
  store i32 %206, i32* %210, align 4
  %211 = load i64, i64* %7, align 8
  %212 = trunc i64 %211 to i32
  %213 = load %struct.node*, %struct.node** %11, align 8
  %214 = load i64, i64* %9, align 8
  %215 = load %struct.network*, %struct.network** %3, align 8
  %216 = getelementptr inbounds %struct.network, %struct.network* %215, i32 0, i32 3
  %217 = load i64, i64* %216, align 8
  %218 = add nsw i64 %214, %217
  %219 = getelementptr inbounds %struct.node, %struct.node* %213, i64 %218
  %220 = getelementptr inbounds %struct.node, %struct.node* %219, i32 0, i32 13
  store i32 %212, i32* %220, align 4
  %221 = load %struct.node*, %struct.node** %11, align 8
  %222 = load %struct.network*, %struct.network** %3, align 8
  %223 = getelementptr inbounds %struct.network, %struct.network* %222, i32 0, i32 2
  %224 = load i64, i64* %223, align 8
  %225 = getelementptr inbounds %struct.node, %struct.node* %221, i64 %224
  %226 = load %struct.arc*, %struct.arc** %10, align 8
  %227 = getelementptr inbounds %struct.arc, %struct.arc* %226, i32 0, i32 1
  store %struct.node* %225, %struct.node** %227, align 8
  %228 = load %struct.node*, %struct.node** %11, align 8
  %229 = load i64, i64* %9, align 8
  %230 = getelementptr inbounds %struct.node, %struct.node* %228, i64 %229
  %231 = load %struct.arc*, %struct.arc** %10, align 8
  %232 = getelementptr inbounds %struct.arc, %struct.arc* %231, i32 0, i32 2
  store %struct.node* %230, %struct.node** %232, align 8
  %233 = load %struct.network*, %struct.network** %3, align 8
  %234 = getelementptr inbounds %struct.network, %struct.network* %233, i32 0, i32 18
  %235 = load i64, i64* %234, align 8
  %236 = add nsw i64 %235, 15
  %237 = load %struct.arc*, %struct.arc** %10, align 8
  %238 = getelementptr inbounds %struct.arc, %struct.arc* %237, i32 0, i32 0
  store i64 %236, i64* %238, align 8
  %239 = load %struct.arc*, %struct.arc** %10, align 8
  %240 = getelementptr inbounds %struct.arc, %struct.arc* %239, i32 0, i32 7
  store i64 %236, i64* %240, align 8
  %241 = load %struct.arc*, %struct.arc** %10, align 8
  %242 = getelementptr inbounds %struct.arc, %struct.arc* %241, i32 0, i32 1
  %243 = load %struct.node*, %struct.node** %242, align 8
  %244 = getelementptr inbounds %struct.node, %struct.node* %243, i32 0, i32 7
  %245 = load %struct.arc*, %struct.arc** %244, align 8
  %246 = load %struct.arc*, %struct.arc** %10, align 8
  %247 = getelementptr inbounds %struct.arc, %struct.arc* %246, i32 0, i32 4
  store %struct.arc* %245, %struct.arc** %247, align 8
  %248 = load %struct.arc*, %struct.arc** %10, align 8
  %249 = load %struct.arc*, %struct.arc** %10, align 8
  %250 = getelementptr inbounds %struct.arc, %struct.arc* %249, i32 0, i32 1
  %251 = load %struct.node*, %struct.node** %250, align 8
  %252 = getelementptr inbounds %struct.node, %struct.node* %251, i32 0, i32 7
  store %struct.arc* %248, %struct.arc** %252, align 8
  %253 = load %struct.arc*, %struct.arc** %10, align 8
  %254 = getelementptr inbounds %struct.arc, %struct.arc* %253, i32 0, i32 2
  %255 = load %struct.node*, %struct.node** %254, align 8
  %256 = getelementptr inbounds %struct.node, %struct.node* %255, i32 0, i32 8
  %257 = load %struct.arc*, %struct.arc** %256, align 8
  %258 = load %struct.arc*, %struct.arc** %10, align 8
  %259 = getelementptr inbounds %struct.arc, %struct.arc* %258, i32 0, i32 5
  store %struct.arc* %257, %struct.arc** %259, align 8
  %260 = load %struct.arc*, %struct.arc** %10, align 8
  %261 = load %struct.arc*, %struct.arc** %10, align 8
  %262 = getelementptr inbounds %struct.arc, %struct.arc* %261, i32 0, i32 2
  %263 = load %struct.node*, %struct.node** %262, align 8
  %264 = getelementptr inbounds %struct.node, %struct.node* %263, i32 0, i32 8
  store %struct.arc* %260, %struct.arc** %264, align 8
  %265 = load %struct.arc*, %struct.arc** %10, align 8
  %266 = getelementptr inbounds %struct.arc, %struct.arc* %265, i32 1
  store %struct.arc* %266, %struct.arc** %10, align 8
  %267 = load %struct.node*, %struct.node** %11, align 8
  %268 = load i64, i64* %9, align 8
  %269 = load %struct.network*, %struct.network** %3, align 8
  %270 = getelementptr inbounds %struct.network, %struct.network* %269, i32 0, i32 3
  %271 = load i64, i64* %270, align 8
  %272 = add nsw i64 %268, %271
  %273 = getelementptr inbounds %struct.node, %struct.node* %267, i64 %272
  %274 = load %struct.arc*, %struct.arc** %10, align 8
  %275 = getelementptr inbounds %struct.arc, %struct.arc* %274, i32 0, i32 1
  store %struct.node* %273, %struct.node** %275, align 8
  %276 = load %struct.node*, %struct.node** %11, align 8
  %277 = load %struct.network*, %struct.network** %3, align 8
  %278 = getelementptr inbounds %struct.network, %struct.network* %277, i32 0, i32 2
  %279 = load i64, i64* %278, align 8
  %280 = getelementptr inbounds %struct.node, %struct.node* %276, i64 %279
  %281 = load %struct.arc*, %struct.arc** %10, align 8
  %282 = getelementptr inbounds %struct.arc, %struct.arc* %281, i32 0, i32 2
  store %struct.node* %280, %struct.node** %282, align 8
  %283 = load %struct.arc*, %struct.arc** %10, align 8
  %284 = getelementptr inbounds %struct.arc, %struct.arc* %283, i32 0, i32 0
  store i64 15, i64* %284, align 8
  %285 = load %struct.arc*, %struct.arc** %10, align 8
  %286 = getelementptr inbounds %struct.arc, %struct.arc* %285, i32 0, i32 7
  store i64 15, i64* %286, align 8
  %287 = load %struct.arc*, %struct.arc** %10, align 8
  %288 = getelementptr inbounds %struct.arc, %struct.arc* %287, i32 0, i32 1
  %289 = load %struct.node*, %struct.node** %288, align 8
  %290 = getelementptr inbounds %struct.node, %struct.node* %289, i32 0, i32 7
  %291 = load %struct.arc*, %struct.arc** %290, align 8
  %292 = load %struct.arc*, %struct.arc** %10, align 8
  %293 = getelementptr inbounds %struct.arc, %struct.arc* %292, i32 0, i32 4
  store %struct.arc* %291, %struct.arc** %293, align 8
  %294 = load %struct.arc*, %struct.arc** %10, align 8
  %295 = load %struct.arc*, %struct.arc** %10, align 8
  %296 = getelementptr inbounds %struct.arc, %struct.arc* %295, i32 0, i32 1
  %297 = load %struct.node*, %struct.node** %296, align 8
  %298 = getelementptr inbounds %struct.node, %struct.node* %297, i32 0, i32 7
  store %struct.arc* %294, %struct.arc** %298, align 8
  %299 = load %struct.arc*, %struct.arc** %10, align 8
  %300 = getelementptr inbounds %struct.arc, %struct.arc* %299, i32 0, i32 2
  %301 = load %struct.node*, %struct.node** %300, align 8
  %302 = getelementptr inbounds %struct.node, %struct.node* %301, i32 0, i32 8
  %303 = load %struct.arc*, %struct.arc** %302, align 8
  %304 = load %struct.arc*, %struct.arc** %10, align 8
  %305 = getelementptr inbounds %struct.arc, %struct.arc* %304, i32 0, i32 5
  store %struct.arc* %303, %struct.arc** %305, align 8
  %306 = load %struct.arc*, %struct.arc** %10, align 8
  %307 = load %struct.arc*, %struct.arc** %10, align 8
  %308 = getelementptr inbounds %struct.arc, %struct.arc* %307, i32 0, i32 2
  %309 = load %struct.node*, %struct.node** %308, align 8
  %310 = getelementptr inbounds %struct.node, %struct.node* %309, i32 0, i32 8
  store %struct.arc* %306, %struct.arc** %310, align 8
  %311 = load %struct.arc*, %struct.arc** %10, align 8
  %312 = getelementptr inbounds %struct.arc, %struct.arc* %311, i32 1
  store %struct.arc* %312, %struct.arc** %10, align 8
  %313 = load %struct.node*, %struct.node** %11, align 8
  %314 = load i64, i64* %9, align 8
  %315 = getelementptr inbounds %struct.node, %struct.node* %313, i64 %314
  %316 = load %struct.arc*, %struct.arc** %10, align 8
  %317 = getelementptr inbounds %struct.arc, %struct.arc* %316, i32 0, i32 1
  store %struct.node* %315, %struct.node** %317, align 8
  %318 = load %struct.node*, %struct.node** %11, align 8
  %319 = load i64, i64* %9, align 8
  %320 = load %struct.network*, %struct.network** %3, align 8
  %321 = getelementptr inbounds %struct.network, %struct.network* %320, i32 0, i32 3
  %322 = load i64, i64* %321, align 8
  %323 = add nsw i64 %319, %322
  %324 = getelementptr inbounds %struct.node, %struct.node* %318, i64 %323
  %325 = load %struct.arc*, %struct.arc** %10, align 8
  %326 = getelementptr inbounds %struct.arc, %struct.arc* %325, i32 0, i32 2
  store %struct.node* %324, %struct.node** %326, align 8
  %327 = load %struct.network*, %struct.network** %3, align 8
  %328 = getelementptr inbounds %struct.network, %struct.network* %327, i32 0, i32 18
  %329 = load i64, i64* %328, align 8
  %330 = icmp sgt i64 %329, 10000000
  br i1 %330, label %331, label %335

331:                                              ; preds = %175
  %332 = load %struct.network*, %struct.network** %3, align 8
  %333 = getelementptr inbounds %struct.network, %struct.network* %332, i32 0, i32 18
  %334 = load i64, i64* %333, align 8
  br label %336

335:                                              ; preds = %175
  br label %336

336:                                              ; preds = %335, %331
  %337 = phi i64 [ %334, %331 ], [ 10000000, %335 ]
  %338 = mul nsw i64 2, %337
  %339 = load %struct.arc*, %struct.arc** %10, align 8
  %340 = getelementptr inbounds %struct.arc, %struct.arc* %339, i32 0, i32 0
  store i64 %338, i64* %340, align 8
  %341 = load %struct.arc*, %struct.arc** %10, align 8
  %342 = getelementptr inbounds %struct.arc, %struct.arc* %341, i32 0, i32 7
  store i64 %338, i64* %342, align 8
  %343 = load %struct.arc*, %struct.arc** %10, align 8
  %344 = getelementptr inbounds %struct.arc, %struct.arc* %343, i32 0, i32 1
  %345 = load %struct.node*, %struct.node** %344, align 8
  %346 = getelementptr inbounds %struct.node, %struct.node* %345, i32 0, i32 7
  %347 = load %struct.arc*, %struct.arc** %346, align 8
  %348 = load %struct.arc*, %struct.arc** %10, align 8
  %349 = getelementptr inbounds %struct.arc, %struct.arc* %348, i32 0, i32 4
  store %struct.arc* %347, %struct.arc** %349, align 8
  %350 = load %struct.arc*, %struct.arc** %10, align 8
  %351 = load %struct.arc*, %struct.arc** %10, align 8
  %352 = getelementptr inbounds %struct.arc, %struct.arc* %351, i32 0, i32 1
  %353 = load %struct.node*, %struct.node** %352, align 8
  %354 = getelementptr inbounds %struct.node, %struct.node* %353, i32 0, i32 7
  store %struct.arc* %350, %struct.arc** %354, align 8
  %355 = load %struct.arc*, %struct.arc** %10, align 8
  %356 = getelementptr inbounds %struct.arc, %struct.arc* %355, i32 0, i32 2
  %357 = load %struct.node*, %struct.node** %356, align 8
  %358 = getelementptr inbounds %struct.node, %struct.node* %357, i32 0, i32 8
  %359 = load %struct.arc*, %struct.arc** %358, align 8
  %360 = load %struct.arc*, %struct.arc** %10, align 8
  %361 = getelementptr inbounds %struct.arc, %struct.arc* %360, i32 0, i32 5
  store %struct.arc* %359, %struct.arc** %361, align 8
  %362 = load %struct.arc*, %struct.arc** %10, align 8
  %363 = load %struct.arc*, %struct.arc** %10, align 8
  %364 = getelementptr inbounds %struct.arc, %struct.arc* %363, i32 0, i32 2
  %365 = load %struct.node*, %struct.node** %364, align 8
  %366 = getelementptr inbounds %struct.node, %struct.node* %365, i32 0, i32 8
  store %struct.arc* %362, %struct.arc** %366, align 8
  %367 = load %struct.arc*, %struct.arc** %10, align 8
  %368 = getelementptr inbounds %struct.arc, %struct.arc* %367, i32 1
  store %struct.arc* %368, %struct.arc** %10, align 8
  br label %369

369:                                              ; preds = %336
  %370 = load i64, i64* %9, align 8
  %371 = add nsw i64 %370, 1
  store i64 %371, i64* %9, align 8
  br label %157, !llvm.loop !41

372:                                              ; preds = %157
  %373 = load i64, i64* %9, align 8
  %374 = load %struct.network*, %struct.network** %3, align 8
  %375 = getelementptr inbounds %struct.network, %struct.network* %374, i32 0, i32 3
  %376 = load i64, i64* %375, align 8
  %377 = add nsw i64 %376, 1
  %378 = icmp ne i64 %373, %377
  br i1 %378, label %379, label %380

379:                                              ; preds = %372
  store i64 -1, i64* %2, align 8
  br label %537

380:                                              ; preds = %372
  store i64 0, i64* %9, align 8
  br label %381

381:                                              ; preds = %440, %380
  %382 = load i64, i64* %9, align 8
  %383 = load %struct.network*, %struct.network** %3, align 8
  %384 = getelementptr inbounds %struct.network, %struct.network* %383, i32 0, i32 6
  %385 = load i64, i64* %384, align 8
  %386 = icmp slt i64 %382, %385
  br i1 %386, label %387, label %445

387:                                              ; preds = %381
  %388 = getelementptr inbounds [201 x i8], [201 x i8]* %5, i64 0, i64 0
  %389 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %390 = call i8* @fgets(i8* %388, i32 200, %struct._IO_FILE* %389)
  %391 = getelementptr inbounds [201 x i8], [201 x i8]* %5, i64 0, i64 0
  %392 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %391, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5.40, i64 0, i64 0), i64* %6, i64* %7, i64* %8) #7
  %393 = icmp ne i32 %392, 3
  br i1 %393, label %394, label %395

394:                                              ; preds = %387
  store i64 -1, i64* %2, align 8
  br label %537

395:                                              ; preds = %387
  %396 = load %struct.node*, %struct.node** %11, align 8
  %397 = load i64, i64* %6, align 8
  %398 = load %struct.network*, %struct.network** %3, align 8
  %399 = getelementptr inbounds %struct.network, %struct.network* %398, i32 0, i32 3
  %400 = load i64, i64* %399, align 8
  %401 = add nsw i64 %397, %400
  %402 = getelementptr inbounds %struct.node, %struct.node* %396, i64 %401
  %403 = load %struct.arc*, %struct.arc** %10, align 8
  %404 = getelementptr inbounds %struct.arc, %struct.arc* %403, i32 0, i32 1
  store %struct.node* %402, %struct.node** %404, align 8
  %405 = load %struct.node*, %struct.node** %11, align 8
  %406 = load i64, i64* %7, align 8
  %407 = getelementptr inbounds %struct.node, %struct.node* %405, i64 %406
  %408 = load %struct.arc*, %struct.arc** %10, align 8
  %409 = getelementptr inbounds %struct.arc, %struct.arc* %408, i32 0, i32 2
  store %struct.node* %407, %struct.node** %409, align 8
  %410 = load i64, i64* %8, align 8
  %411 = load %struct.arc*, %struct.arc** %10, align 8
  %412 = getelementptr inbounds %struct.arc, %struct.arc* %411, i32 0, i32 7
  store i64 %410, i64* %412, align 8
  %413 = load i64, i64* %8, align 8
  %414 = load %struct.arc*, %struct.arc** %10, align 8
  %415 = getelementptr inbounds %struct.arc, %struct.arc* %414, i32 0, i32 0
  store i64 %413, i64* %415, align 8
  %416 = load %struct.arc*, %struct.arc** %10, align 8
  %417 = getelementptr inbounds %struct.arc, %struct.arc* %416, i32 0, i32 1
  %418 = load %struct.node*, %struct.node** %417, align 8
  %419 = getelementptr inbounds %struct.node, %struct.node* %418, i32 0, i32 7
  %420 = load %struct.arc*, %struct.arc** %419, align 8
  %421 = load %struct.arc*, %struct.arc** %10, align 8
  %422 = getelementptr inbounds %struct.arc, %struct.arc* %421, i32 0, i32 4
  store %struct.arc* %420, %struct.arc** %422, align 8
  %423 = load %struct.arc*, %struct.arc** %10, align 8
  %424 = load %struct.arc*, %struct.arc** %10, align 8
  %425 = getelementptr inbounds %struct.arc, %struct.arc* %424, i32 0, i32 1
  %426 = load %struct.node*, %struct.node** %425, align 8
  %427 = getelementptr inbounds %struct.node, %struct.node* %426, i32 0, i32 7
  store %struct.arc* %423, %struct.arc** %427, align 8
  %428 = load %struct.arc*, %struct.arc** %10, align 8
  %429 = getelementptr inbounds %struct.arc, %struct.arc* %428, i32 0, i32 2
  %430 = load %struct.node*, %struct.node** %429, align 8
  %431 = getelementptr inbounds %struct.node, %struct.node* %430, i32 0, i32 8
  %432 = load %struct.arc*, %struct.arc** %431, align 8
  %433 = load %struct.arc*, %struct.arc** %10, align 8
  %434 = getelementptr inbounds %struct.arc, %struct.arc* %433, i32 0, i32 5
  store %struct.arc* %432, %struct.arc** %434, align 8
  %435 = load %struct.arc*, %struct.arc** %10, align 8
  %436 = load %struct.arc*, %struct.arc** %10, align 8
  %437 = getelementptr inbounds %struct.arc, %struct.arc* %436, i32 0, i32 2
  %438 = load %struct.node*, %struct.node** %437, align 8
  %439 = getelementptr inbounds %struct.node, %struct.node* %438, i32 0, i32 8
  store %struct.arc* %435, %struct.arc** %439, align 8
  br label %440

440:                                              ; preds = %395
  %441 = load i64, i64* %9, align 8
  %442 = add nsw i64 %441, 1
  store i64 %442, i64* %9, align 8
  %443 = load %struct.arc*, %struct.arc** %10, align 8
  %444 = getelementptr inbounds %struct.arc, %struct.arc* %443, i32 1
  store %struct.arc* %444, %struct.arc** %10, align 8
  br label %381, !llvm.loop !42

445:                                              ; preds = %381
  %446 = load %struct.network*, %struct.network** %3, align 8
  %447 = getelementptr inbounds %struct.network, %struct.network* %446, i32 0, i32 24
  %448 = load %struct.arc*, %struct.arc** %447, align 8
  %449 = load %struct.arc*, %struct.arc** %10, align 8
  %450 = icmp ne %struct.arc* %448, %449
  br i1 %450, label %451, label %480

451:                                              ; preds = %445
  %452 = load %struct.arc*, %struct.arc** %10, align 8
  %453 = load %struct.network*, %struct.network** %3, align 8
  %454 = getelementptr inbounds %struct.network, %struct.network* %453, i32 0, i32 24
  store %struct.arc* %452, %struct.arc** %454, align 8
  %455 = load %struct.network*, %struct.network** %3, align 8
  %456 = getelementptr inbounds %struct.network, %struct.network* %455, i32 0, i32 23
  %457 = load %struct.arc*, %struct.arc** %456, align 8
  store %struct.arc* %457, %struct.arc** %10, align 8
  %458 = load %struct.network*, %struct.network** %3, align 8
  %459 = getelementptr inbounds %struct.network, %struct.network* %458, i32 0, i32 5
  store i64 0, i64* %459, align 8
  br label %460

460:                                              ; preds = %471, %451
  %461 = load %struct.arc*, %struct.arc** %10, align 8
  %462 = load %struct.network*, %struct.network** %3, align 8
  %463 = getelementptr inbounds %struct.network, %struct.network* %462, i32 0, i32 24
  %464 = load %struct.arc*, %struct.arc** %463, align 8
  %465 = icmp ult %struct.arc* %461, %464
  br i1 %465, label %466, label %474

466:                                              ; preds = %460
  %467 = load %struct.network*, %struct.network** %3, align 8
  %468 = getelementptr inbounds %struct.network, %struct.network* %467, i32 0, i32 5
  %469 = load i64, i64* %468, align 8
  %470 = add nsw i64 %469, 1
  store i64 %470, i64* %468, align 8
  br label %471

471:                                              ; preds = %466
  %472 = load %struct.arc*, %struct.arc** %10, align 8
  %473 = getelementptr inbounds %struct.arc, %struct.arc* %472, i32 1
  store %struct.arc* %473, %struct.arc** %10, align 8
  br label %460, !llvm.loop !43

474:                                              ; preds = %460
  %475 = load %struct.network*, %struct.network** %3, align 8
  %476 = getelementptr inbounds %struct.network, %struct.network* %475, i32 0, i32 5
  %477 = load i64, i64* %476, align 8
  %478 = load %struct.network*, %struct.network** %3, align 8
  %479 = getelementptr inbounds %struct.network, %struct.network* %478, i32 0, i32 6
  store i64 %477, i64* %479, align 8
  br label %480

480:                                              ; preds = %474, %445
  %481 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %482 = call i32 @fclose(%struct._IO_FILE* %481)
  %483 = load %struct.network*, %struct.network** %3, align 8
  %484 = getelementptr inbounds %struct.network, %struct.network* %483, i32 0, i32 1
  %485 = getelementptr inbounds [200 x i8], [200 x i8]* %484, i64 0, i64 0
  store i8 0, i8* %485, align 8
  store i64 1, i64* %9, align 8
  br label %486

486:                                              ; preds = %533, %480
  %487 = load i64, i64* %9, align 8
  %488 = load %struct.network*, %struct.network** %3, align 8
  %489 = getelementptr inbounds %struct.network, %struct.network* %488, i32 0, i32 3
  %490 = load i64, i64* %489, align 8
  %491 = icmp sle i64 %487, %490
  br i1 %491, label %492, label %536

492:                                              ; preds = %486
  %493 = load %struct.network*, %struct.network** %3, align 8
  %494 = getelementptr inbounds %struct.network, %struct.network* %493, i32 0, i32 18
  %495 = load i64, i64* %494, align 8
  %496 = icmp sgt i64 %495, 10000000
  br i1 %496, label %497, label %501

497:                                              ; preds = %492
  %498 = load %struct.network*, %struct.network** %3, align 8
  %499 = getelementptr inbounds %struct.network, %struct.network* %498, i32 0, i32 18
  %500 = load i64, i64* %499, align 8
  br label %502

501:                                              ; preds = %492
  br label %502

502:                                              ; preds = %501, %497
  %503 = phi i64 [ %500, %497 ], [ 10000000, %501 ]
  %504 = mul nsw i64 -2, %503
  %505 = load %struct.network*, %struct.network** %3, align 8
  %506 = getelementptr inbounds %struct.network, %struct.network* %505, i32 0, i32 23
  %507 = load %struct.arc*, %struct.arc** %506, align 8
  %508 = load i64, i64* %9, align 8
  %509 = mul nsw i64 3, %508
  %510 = sub nsw i64 %509, 1
  %511 = getelementptr inbounds %struct.arc, %struct.arc* %507, i64 %510
  %512 = getelementptr inbounds %struct.arc, %struct.arc* %511, i32 0, i32 0
  store i64 %504, i64* %512, align 8
  %513 = load %struct.network*, %struct.network** %3, align 8
  %514 = getelementptr inbounds %struct.network, %struct.network* %513, i32 0, i32 18
  %515 = load i64, i64* %514, align 8
  %516 = icmp sgt i64 %515, 10000000
  br i1 %516, label %517, label %521

517:                                              ; preds = %502
  %518 = load %struct.network*, %struct.network** %3, align 8
  %519 = getelementptr inbounds %struct.network, %struct.network* %518, i32 0, i32 18
  %520 = load i64, i64* %519, align 8
  br label %522

521:                                              ; preds = %502
  br label %522

522:                                              ; preds = %521, %517
  %523 = phi i64 [ %520, %517 ], [ 10000000, %521 ]
  %524 = mul nsw i64 -2, %523
  %525 = load %struct.network*, %struct.network** %3, align 8
  %526 = getelementptr inbounds %struct.network, %struct.network* %525, i32 0, i32 23
  %527 = load %struct.arc*, %struct.arc** %526, align 8
  %528 = load i64, i64* %9, align 8
  %529 = mul nsw i64 3, %528
  %530 = sub nsw i64 %529, 1
  %531 = getelementptr inbounds %struct.arc, %struct.arc* %527, i64 %530
  %532 = getelementptr inbounds %struct.arc, %struct.arc* %531, i32 0, i32 7
  store i64 %524, i64* %532, align 8
  br label %533

533:                                              ; preds = %522
  %534 = load i64, i64* %9, align 8
  %535 = add nsw i64 %534, 1
  store i64 %535, i64* %9, align 8
  br label %486, !llvm.loop !44

536:                                              ; preds = %486
  store i64 0, i64* %2, align 8
  br label %537

537:                                              ; preds = %536, %394, %379, %174, %118, %25, %17
  %538 = load i64, i64* %2, align 8
  ret i64 %538
}

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @update_tree(i64 %0, i64 %1, i64 %2, i64 %3, %struct.node* %4, %struct.node* %5, %struct.node* %6, %struct.node* %7, %struct.node* %8, %struct.arc* %9, i64 %10, i64 %11) #0 {
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca %struct.node*, align 8
  %18 = alloca %struct.node*, align 8
  %19 = alloca %struct.node*, align 8
  %20 = alloca %struct.node*, align 8
  %21 = alloca %struct.node*, align 8
  %22 = alloca %struct.arc*, align 8
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  %25 = alloca %struct.arc*, align 8
  %26 = alloca %struct.arc*, align 8
  %27 = alloca %struct.node*, align 8
  %28 = alloca %struct.node*, align 8
  %29 = alloca %struct.node*, align 8
  %30 = alloca i64, align 8
  %31 = alloca i64, align 8
  %32 = alloca i64, align 8
  %33 = alloca i64, align 8
  %34 = alloca i64, align 8
  store i64 %0, i64* %13, align 8
  store i64 %1, i64* %14, align 8
  store i64 %2, i64* %15, align 8
  store i64 %3, i64* %16, align 8
  store %struct.node* %4, %struct.node** %17, align 8
  store %struct.node* %5, %struct.node** %18, align 8
  store %struct.node* %6, %struct.node** %19, align 8
  store %struct.node* %7, %struct.node** %20, align 8
  store %struct.node* %8, %struct.node** %21, align 8
  store %struct.arc* %9, %struct.arc** %22, align 8
  store i64 %10, i64* %23, align 8
  store i64 %11, i64* %24, align 8
  %35 = load %struct.arc*, %struct.arc** %22, align 8
  %36 = getelementptr inbounds %struct.arc, %struct.arc* %35, i32 0, i32 1
  %37 = load %struct.node*, %struct.node** %36, align 8
  %38 = load %struct.node*, %struct.node** %18, align 8
  %39 = icmp eq %struct.node* %37, %38
  br i1 %39, label %40, label %43

40:                                               ; preds = %12
  %41 = load i64, i64* %23, align 8
  %42 = icmp slt i64 %41, 0
  br i1 %42, label %52, label %43

43:                                               ; preds = %40, %12
  %44 = load %struct.arc*, %struct.arc** %22, align 8
  %45 = getelementptr inbounds %struct.arc, %struct.arc* %44, i32 0, i32 1
  %46 = load %struct.node*, %struct.node** %45, align 8
  %47 = load %struct.node*, %struct.node** %17, align 8
  %48 = icmp eq %struct.node* %46, %47
  br i1 %48, label %49, label %62

49:                                               ; preds = %43
  %50 = load i64, i64* %23, align 8
  %51 = icmp sgt i64 %50, 0
  br i1 %51, label %52, label %62

52:                                               ; preds = %49, %40
  %53 = load i64, i64* %23, align 8
  %54 = icmp sge i64 %53, 0
  br i1 %54, label %55, label %57

55:                                               ; preds = %52
  %56 = load i64, i64* %23, align 8
  br label %60

57:                                               ; preds = %52
  %58 = load i64, i64* %23, align 8
  %59 = sub nsw i64 0, %58
  br label %60

60:                                               ; preds = %57, %55
  %61 = phi i64 [ %56, %55 ], [ %59, %57 ]
  store i64 %61, i64* %23, align 8
  br label %73

62:                                               ; preds = %49, %43
  %63 = load i64, i64* %23, align 8
  %64 = icmp sge i64 %63, 0
  br i1 %64, label %65, label %67

65:                                               ; preds = %62
  %66 = load i64, i64* %23, align 8
  br label %70

67:                                               ; preds = %62
  %68 = load i64, i64* %23, align 8
  %69 = sub nsw i64 0, %68
  br label %70

70:                                               ; preds = %67, %65
  %71 = phi i64 [ %66, %65 ], [ %69, %67 ]
  %72 = sub nsw i64 0, %71
  store i64 %72, i64* %23, align 8
  br label %73

73:                                               ; preds = %70, %60
  %74 = load %struct.node*, %struct.node** %19, align 8
  store %struct.node* %74, %struct.node** %27, align 8
  %75 = load i64, i64* %23, align 8
  %76 = load %struct.node*, %struct.node** %27, align 8
  %77 = getelementptr inbounds %struct.node, %struct.node* %76, i32 0, i32 0
  %78 = load i64, i64* %77, align 8
  %79 = add nsw i64 %78, %75
  store i64 %79, i64* %77, align 8
  br label %80

80:                                               ; preds = %87, %73
  %81 = load %struct.node*, %struct.node** %27, align 8
  %82 = getelementptr inbounds %struct.node, %struct.node* %81, i32 0, i32 2
  %83 = load %struct.node*, %struct.node** %82, align 8
  store %struct.node* %83, %struct.node** %28, align 8
  %84 = load %struct.node*, %struct.node** %28, align 8
  %85 = icmp ne %struct.node* %84, null
  br i1 %85, label %86, label %94

86:                                               ; preds = %80
  br label %87

87:                                               ; preds = %106, %86
  %88 = load i64, i64* %23, align 8
  %89 = load %struct.node*, %struct.node** %28, align 8
  %90 = getelementptr inbounds %struct.node, %struct.node* %89, i32 0, i32 0
  %91 = load i64, i64* %90, align 8
  %92 = add nsw i64 %91, %88
  store i64 %92, i64* %90, align 8
  %93 = load %struct.node*, %struct.node** %28, align 8
  store %struct.node* %93, %struct.node** %27, align 8
  br label %80

94:                                               ; preds = %80
  br label %95

95:                                               ; preds = %107, %94
  %96 = load %struct.node*, %struct.node** %27, align 8
  %97 = load %struct.node*, %struct.node** %19, align 8
  %98 = icmp eq %struct.node* %96, %97
  br i1 %98, label %99, label %100

99:                                               ; preds = %95
  br label %111

100:                                              ; preds = %95
  %101 = load %struct.node*, %struct.node** %27, align 8
  %102 = getelementptr inbounds %struct.node, %struct.node* %101, i32 0, i32 4
  %103 = load %struct.node*, %struct.node** %102, align 8
  store %struct.node* %103, %struct.node** %28, align 8
  %104 = load %struct.node*, %struct.node** %28, align 8
  %105 = icmp ne %struct.node* %104, null
  br i1 %105, label %106, label %107

106:                                              ; preds = %100
  br label %87

107:                                              ; preds = %100
  %108 = load %struct.node*, %struct.node** %27, align 8
  %109 = getelementptr inbounds %struct.node, %struct.node* %108, i32 0, i32 3
  %110 = load %struct.node*, %struct.node** %109, align 8
  store %struct.node* %110, %struct.node** %27, align 8
  br label %95

111:                                              ; preds = %99
  %112 = load %struct.node*, %struct.node** %17, align 8
  store %struct.node* %112, %struct.node** %28, align 8
  %113 = load %struct.node*, %struct.node** %28, align 8
  %114 = getelementptr inbounds %struct.node, %struct.node* %113, i32 0, i32 3
  %115 = load %struct.node*, %struct.node** %114, align 8
  store %struct.node* %115, %struct.node** %27, align 8
  %116 = load %struct.node*, %struct.node** %19, align 8
  %117 = getelementptr inbounds %struct.node, %struct.node* %116, i32 0, i32 11
  %118 = load i64, i64* %117, align 8
  store i64 %118, i64* %32, align 8
  store i64 %118, i64* %33, align 8
  %119 = load %struct.node*, %struct.node** %18, align 8
  store %struct.node* %119, %struct.node** %29, align 8
  %120 = load %struct.arc*, %struct.arc** %22, align 8
  store %struct.arc* %120, %struct.arc** %26, align 8
  br label %121

121:                                              ; preds = %204, %111
  %122 = load %struct.node*, %struct.node** %28, align 8
  %123 = load %struct.node*, %struct.node** %20, align 8
  %124 = icmp ne %struct.node* %122, %123
  br i1 %124, label %125, label %235

125:                                              ; preds = %121
  %126 = load %struct.node*, %struct.node** %28, align 8
  %127 = getelementptr inbounds %struct.node, %struct.node* %126, i32 0, i32 4
  %128 = load %struct.node*, %struct.node** %127, align 8
  %129 = icmp ne %struct.node* %128, null
  br i1 %129, label %130, label %138

130:                                              ; preds = %125
  %131 = load %struct.node*, %struct.node** %28, align 8
  %132 = getelementptr inbounds %struct.node, %struct.node* %131, i32 0, i32 5
  %133 = load %struct.node*, %struct.node** %132, align 8
  %134 = load %struct.node*, %struct.node** %28, align 8
  %135 = getelementptr inbounds %struct.node, %struct.node* %134, i32 0, i32 4
  %136 = load %struct.node*, %struct.node** %135, align 8
  %137 = getelementptr inbounds %struct.node, %struct.node* %136, i32 0, i32 5
  store %struct.node* %133, %struct.node** %137, align 8
  br label %138

138:                                              ; preds = %130, %125
  %139 = load %struct.node*, %struct.node** %28, align 8
  %140 = getelementptr inbounds %struct.node, %struct.node* %139, i32 0, i32 5
  %141 = load %struct.node*, %struct.node** %140, align 8
  %142 = icmp ne %struct.node* %141, null
  br i1 %142, label %143, label %151

143:                                              ; preds = %138
  %144 = load %struct.node*, %struct.node** %28, align 8
  %145 = getelementptr inbounds %struct.node, %struct.node* %144, i32 0, i32 4
  %146 = load %struct.node*, %struct.node** %145, align 8
  %147 = load %struct.node*, %struct.node** %28, align 8
  %148 = getelementptr inbounds %struct.node, %struct.node* %147, i32 0, i32 5
  %149 = load %struct.node*, %struct.node** %148, align 8
  %150 = getelementptr inbounds %struct.node, %struct.node* %149, i32 0, i32 4
  store %struct.node* %146, %struct.node** %150, align 8
  br label %157

151:                                              ; preds = %138
  %152 = load %struct.node*, %struct.node** %28, align 8
  %153 = getelementptr inbounds %struct.node, %struct.node* %152, i32 0, i32 4
  %154 = load %struct.node*, %struct.node** %153, align 8
  %155 = load %struct.node*, %struct.node** %27, align 8
  %156 = getelementptr inbounds %struct.node, %struct.node* %155, i32 0, i32 2
  store %struct.node* %154, %struct.node** %156, align 8
  br label %157

157:                                              ; preds = %151, %143
  %158 = load %struct.node*, %struct.node** %29, align 8
  %159 = load %struct.node*, %struct.node** %28, align 8
  %160 = getelementptr inbounds %struct.node, %struct.node* %159, i32 0, i32 3
  store %struct.node* %158, %struct.node** %160, align 8
  %161 = load %struct.node*, %struct.node** %29, align 8
  %162 = getelementptr inbounds %struct.node, %struct.node* %161, i32 0, i32 2
  %163 = load %struct.node*, %struct.node** %162, align 8
  %164 = load %struct.node*, %struct.node** %28, align 8
  %165 = getelementptr inbounds %struct.node, %struct.node* %164, i32 0, i32 4
  store %struct.node* %163, %struct.node** %165, align 8
  %166 = load %struct.node*, %struct.node** %28, align 8
  %167 = getelementptr inbounds %struct.node, %struct.node* %166, i32 0, i32 4
  %168 = load %struct.node*, %struct.node** %167, align 8
  %169 = icmp ne %struct.node* %168, null
  br i1 %169, label %170, label %176

170:                                              ; preds = %157
  %171 = load %struct.node*, %struct.node** %28, align 8
  %172 = load %struct.node*, %struct.node** %28, align 8
  %173 = getelementptr inbounds %struct.node, %struct.node* %172, i32 0, i32 4
  %174 = load %struct.node*, %struct.node** %173, align 8
  %175 = getelementptr inbounds %struct.node, %struct.node* %174, i32 0, i32 5
  store %struct.node* %171, %struct.node** %175, align 8
  br label %176

176:                                              ; preds = %170, %157
  %177 = load %struct.node*, %struct.node** %28, align 8
  %178 = load %struct.node*, %struct.node** %29, align 8
  %179 = getelementptr inbounds %struct.node, %struct.node* %178, i32 0, i32 2
  store %struct.node* %177, %struct.node** %179, align 8
  %180 = load %struct.node*, %struct.node** %28, align 8
  %181 = getelementptr inbounds %struct.node, %struct.node* %180, i32 0, i32 5
  store %struct.node* null, %struct.node** %181, align 8
  %182 = load %struct.node*, %struct.node** %28, align 8
  %183 = getelementptr inbounds %struct.node, %struct.node* %182, i32 0, i32 1
  %184 = load i32, i32* %183, align 8
  %185 = icmp ne i32 %184, 0
  %186 = xor i1 %185, true
  %187 = zext i1 %186 to i32
  %188 = sext i32 %187 to i64
  store i64 %188, i64* %30, align 8
  %189 = load i64, i64* %30, align 8
  %190 = load i64, i64* %13, align 8
  %191 = icmp eq i64 %189, %190
  br i1 %191, label %192, label %198

192:                                              ; preds = %176
  %193 = load %struct.node*, %struct.node** %28, align 8
  %194 = getelementptr inbounds %struct.node, %struct.node* %193, i32 0, i32 10
  %195 = load i64, i64* %194, align 8
  %196 = load i64, i64* %15, align 8
  %197 = add nsw i64 %195, %196
  store i64 %197, i64* %34, align 8
  br label %204

198:                                              ; preds = %176
  %199 = load %struct.node*, %struct.node** %28, align 8
  %200 = getelementptr inbounds %struct.node, %struct.node* %199, i32 0, i32 10
  %201 = load i64, i64* %200, align 8
  %202 = load i64, i64* %15, align 8
  %203 = sub nsw i64 %201, %202
  store i64 %203, i64* %34, align 8
  br label %204

204:                                              ; preds = %198, %192
  %205 = load %struct.node*, %struct.node** %28, align 8
  %206 = getelementptr inbounds %struct.node, %struct.node* %205, i32 0, i32 6
  %207 = load %struct.arc*, %struct.arc** %206, align 8
  store %struct.arc* %207, %struct.arc** %25, align 8
  %208 = load %struct.node*, %struct.node** %28, align 8
  %209 = getelementptr inbounds %struct.node, %struct.node* %208, i32 0, i32 11
  %210 = load i64, i64* %209, align 8
  store i64 %210, i64* %31, align 8
  %211 = load i64, i64* %14, align 8
  %212 = trunc i64 %211 to i32
  %213 = load %struct.node*, %struct.node** %28, align 8
  %214 = getelementptr inbounds %struct.node, %struct.node* %213, i32 0, i32 1
  store i32 %212, i32* %214, align 8
  %215 = load i64, i64* %16, align 8
  %216 = load %struct.node*, %struct.node** %28, align 8
  %217 = getelementptr inbounds %struct.node, %struct.node* %216, i32 0, i32 10
  store i64 %215, i64* %217, align 8
  %218 = load %struct.arc*, %struct.arc** %26, align 8
  %219 = load %struct.node*, %struct.node** %28, align 8
  %220 = getelementptr inbounds %struct.node, %struct.node* %219, i32 0, i32 6
  store %struct.arc* %218, %struct.arc** %220, align 8
  %221 = load i64, i64* %33, align 8
  %222 = load %struct.node*, %struct.node** %28, align 8
  %223 = getelementptr inbounds %struct.node, %struct.node* %222, i32 0, i32 11
  store i64 %221, i64* %223, align 8
  %224 = load %struct.node*, %struct.node** %28, align 8
  store %struct.node* %224, %struct.node** %29, align 8
  %225 = load i64, i64* %30, align 8
  store i64 %225, i64* %14, align 8
  %226 = load i64, i64* %34, align 8
  store i64 %226, i64* %16, align 8
  %227 = load %struct.arc*, %struct.arc** %25, align 8
  store %struct.arc* %227, %struct.arc** %26, align 8
  %228 = load i64, i64* %32, align 8
  %229 = load i64, i64* %31, align 8
  %230 = sub nsw i64 %228, %229
  store i64 %230, i64* %33, align 8
  %231 = load %struct.node*, %struct.node** %27, align 8
  store %struct.node* %231, %struct.node** %28, align 8
  %232 = load %struct.node*, %struct.node** %28, align 8
  %233 = getelementptr inbounds %struct.node, %struct.node* %232, i32 0, i32 3
  %234 = load %struct.node*, %struct.node** %233, align 8
  store %struct.node* %234, %struct.node** %27, align 8
  br label %121, !llvm.loop !45

235:                                              ; preds = %121
  %236 = load i64, i64* %15, align 8
  %237 = load i64, i64* %24, align 8
  %238 = icmp sgt i64 %236, %237
  br i1 %238, label %239, label %310

239:                                              ; preds = %235
  %240 = load %struct.node*, %struct.node** %20, align 8
  store %struct.node* %240, %struct.node** %28, align 8
  br label %241

241:                                              ; preds = %270, %239
  %242 = load %struct.node*, %struct.node** %28, align 8
  %243 = load %struct.node*, %struct.node** %21, align 8
  %244 = icmp ne %struct.node* %242, %243
  br i1 %244, label %245, label %274

245:                                              ; preds = %241
  %246 = load i64, i64* %32, align 8
  %247 = load %struct.node*, %struct.node** %28, align 8
  %248 = getelementptr inbounds %struct.node, %struct.node* %247, i32 0, i32 11
  %249 = load i64, i64* %248, align 8
  %250 = sub nsw i64 %249, %246
  store i64 %250, i64* %248, align 8
  %251 = load %struct.node*, %struct.node** %28, align 8
  %252 = getelementptr inbounds %struct.node, %struct.node* %251, i32 0, i32 1
  %253 = load i32, i32* %252, align 8
  %254 = sext i32 %253 to i64
  %255 = load i64, i64* %13, align 8
  %256 = icmp ne i64 %254, %255
  br i1 %256, label %257, label %263

257:                                              ; preds = %245
  %258 = load i64, i64* %15, align 8
  %259 = load %struct.node*, %struct.node** %28, align 8
  %260 = getelementptr inbounds %struct.node, %struct.node* %259, i32 0, i32 10
  %261 = load i64, i64* %260, align 8
  %262 = add nsw i64 %261, %258
  store i64 %262, i64* %260, align 8
  br label %269

263:                                              ; preds = %245
  %264 = load i64, i64* %15, align 8
  %265 = load %struct.node*, %struct.node** %28, align 8
  %266 = getelementptr inbounds %struct.node, %struct.node* %265, i32 0, i32 10
  %267 = load i64, i64* %266, align 8
  %268 = sub nsw i64 %267, %264
  store i64 %268, i64* %266, align 8
  br label %269

269:                                              ; preds = %263, %257
  br label %270

270:                                              ; preds = %269
  %271 = load %struct.node*, %struct.node** %28, align 8
  %272 = getelementptr inbounds %struct.node, %struct.node* %271, i32 0, i32 3
  %273 = load %struct.node*, %struct.node** %272, align 8
  store %struct.node* %273, %struct.node** %28, align 8
  br label %241, !llvm.loop !46

274:                                              ; preds = %241
  %275 = load %struct.node*, %struct.node** %18, align 8
  store %struct.node* %275, %struct.node** %28, align 8
  br label %276

276:                                              ; preds = %305, %274
  %277 = load %struct.node*, %struct.node** %28, align 8
  %278 = load %struct.node*, %struct.node** %21, align 8
  %279 = icmp ne %struct.node* %277, %278
  br i1 %279, label %280, label %309

280:                                              ; preds = %276
  %281 = load i64, i64* %32, align 8
  %282 = load %struct.node*, %struct.node** %28, align 8
  %283 = getelementptr inbounds %struct.node, %struct.node* %282, i32 0, i32 11
  %284 = load i64, i64* %283, align 8
  %285 = add nsw i64 %284, %281
  store i64 %285, i64* %283, align 8
  %286 = load %struct.node*, %struct.node** %28, align 8
  %287 = getelementptr inbounds %struct.node, %struct.node* %286, i32 0, i32 1
  %288 = load i32, i32* %287, align 8
  %289 = sext i32 %288 to i64
  %290 = load i64, i64* %13, align 8
  %291 = icmp eq i64 %289, %290
  br i1 %291, label %292, label %298

292:                                              ; preds = %280
  %293 = load i64, i64* %15, align 8
  %294 = load %struct.node*, %struct.node** %28, align 8
  %295 = getelementptr inbounds %struct.node, %struct.node* %294, i32 0, i32 10
  %296 = load i64, i64* %295, align 8
  %297 = add nsw i64 %296, %293
  store i64 %297, i64* %295, align 8
  br label %304

298:                                              ; preds = %280
  %299 = load i64, i64* %15, align 8
  %300 = load %struct.node*, %struct.node** %28, align 8
  %301 = getelementptr inbounds %struct.node, %struct.node* %300, i32 0, i32 10
  %302 = load i64, i64* %301, align 8
  %303 = sub nsw i64 %302, %299
  store i64 %303, i64* %301, align 8
  br label %304

304:                                              ; preds = %298, %292
  br label %305

305:                                              ; preds = %304
  %306 = load %struct.node*, %struct.node** %28, align 8
  %307 = getelementptr inbounds %struct.node, %struct.node* %306, i32 0, i32 3
  %308 = load %struct.node*, %struct.node** %307, align 8
  store %struct.node* %308, %struct.node** %28, align 8
  br label %276, !llvm.loop !47

309:                                              ; preds = %276
  br label %343

310:                                              ; preds = %235
  %311 = load %struct.node*, %struct.node** %20, align 8
  store %struct.node* %311, %struct.node** %28, align 8
  br label %312

312:                                              ; preds = %322, %310
  %313 = load %struct.node*, %struct.node** %28, align 8
  %314 = load %struct.node*, %struct.node** %21, align 8
  %315 = icmp ne %struct.node* %313, %314
  br i1 %315, label %316, label %326

316:                                              ; preds = %312
  %317 = load i64, i64* %32, align 8
  %318 = load %struct.node*, %struct.node** %28, align 8
  %319 = getelementptr inbounds %struct.node, %struct.node* %318, i32 0, i32 11
  %320 = load i64, i64* %319, align 8
  %321 = sub nsw i64 %320, %317
  store i64 %321, i64* %319, align 8
  br label %322

322:                                              ; preds = %316
  %323 = load %struct.node*, %struct.node** %28, align 8
  %324 = getelementptr inbounds %struct.node, %struct.node* %323, i32 0, i32 3
  %325 = load %struct.node*, %struct.node** %324, align 8
  store %struct.node* %325, %struct.node** %28, align 8
  br label %312, !llvm.loop !48

326:                                              ; preds = %312
  %327 = load %struct.node*, %struct.node** %18, align 8
  store %struct.node* %327, %struct.node** %28, align 8
  br label %328

328:                                              ; preds = %338, %326
  %329 = load %struct.node*, %struct.node** %28, align 8
  %330 = load %struct.node*, %struct.node** %21, align 8
  %331 = icmp ne %struct.node* %329, %330
  br i1 %331, label %332, label %342

332:                                              ; preds = %328
  %333 = load i64, i64* %32, align 8
  %334 = load %struct.node*, %struct.node** %28, align 8
  %335 = getelementptr inbounds %struct.node, %struct.node* %334, i32 0, i32 11
  %336 = load i64, i64* %335, align 8
  %337 = add nsw i64 %336, %333
  store i64 %337, i64* %335, align 8
  br label %338

338:                                              ; preds = %332
  %339 = load %struct.node*, %struct.node** %28, align 8
  %340 = getelementptr inbounds %struct.node, %struct.node* %339, i32 0, i32 3
  %341 = load %struct.node*, %struct.node** %340, align 8
  store %struct.node* %341, %struct.node** %28, align 8
  br label %328, !llvm.loop !49

342:                                              ; preds = %328
  br label %343

343:                                              ; preds = %342, %309
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nofree nosync nounwind willreturn }
attributes #5 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"Ubuntu clang version 12.0.0-++20210120052627+c09be0d2a0f9-1~exp1~20210120163331.290"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 1, !"ThinLTO", i32 0}
!3 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!4 = !{i32 1, !"LTOPostLink", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6}
!19 = distinct !{!19, !6}
!20 = distinct !{!20, !6}
!21 = distinct !{!21, !6}
!22 = distinct !{!22, !6}
!23 = distinct !{!23, !6}
!24 = distinct !{!24, !6}
!25 = distinct !{!25, !6}
!26 = distinct !{!26, !6}
!27 = distinct !{!27, !6}
!28 = distinct !{!28, !6}
!29 = distinct !{!29, !6}
!30 = distinct !{!30, !6}
!31 = distinct !{!31, !6}
!32 = distinct !{!32, !6}
!33 = distinct !{!33, !6}
!34 = distinct !{!34, !6}
!35 = distinct !{!35, !6}
!36 = distinct !{!36, !6}
!37 = distinct !{!37, !6}
!38 = distinct !{!38, !6}
!39 = distinct !{!39, !6}
!40 = distinct !{!40, !6}
!41 = distinct !{!41, !6}
!42 = distinct !{!42, !6}
!43 = distinct !{!43, !6}
!44 = distinct !{!44, !6}
!45 = distinct !{!45, !6}
!46 = distinct !{!46, !6}
!47 = distinct !{!47, !6}
!48 = distinct !{!48, !6}
!49 = distinct !{!49, !6}
