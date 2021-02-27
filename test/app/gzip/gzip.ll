; ModuleID = 'gzip'
source_filename = "ld-temp.o"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.config = type { i16, i16, i16, i16 }
%struct.option = type { i8*, i32, i32*, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.timespec = type { i64, i64 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.__sigset_t = type { [16 x i64] }
%struct.ct_data = type { %union.anon.5, %union.anon.5 }
%union.anon.5 = type { i16 }
%struct.tree_desc = type { %struct.ct_data*, %struct.ct_data*, i32*, i32, i32, i32, i32 }
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }
%struct.__dirstream = type opaque
%struct.huft = type { i8, i8, %union.anon.0 }
%union.anon.0 = type { %struct.huft* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.direntry_t = type { i8* }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }

@zfile = internal global i32 0, align 4
@bi_buf = internal global i16 0, align 2
@bi_valid = internal global i32 0, align 4
@read_buf = internal global i32 (i8*, i32)* null, align 8
@.str = private unnamed_addr constant [15 x i8] c"bad pack level\00", align 1
@compr_level = internal global i32 0, align 4
@rsync_chunk_end = internal global i64 0, align 8
@rsync_sum = internal global i64 0, align 8
@configuration_table = internal global [10 x %struct.config] [%struct.config zeroinitializer, %struct.config { i16 4, i16 4, i16 8, i16 4 }, %struct.config { i16 4, i16 5, i16 16, i16 8 }, %struct.config { i16 4, i16 6, i16 32, i16 32 }, %struct.config { i16 4, i16 4, i16 16, i16 16 }, %struct.config { i16 8, i16 16, i16 32, i16 32 }, %struct.config { i16 8, i16 16, i16 128, i16 128 }, %struct.config { i16 8, i16 32, i16 128, i16 256 }, %struct.config { i16 32, i16 128, i16 258, i16 1024 }, %struct.config { i16 32, i16 258, i16 258, i16 4096 }], align 16
@max_lazy_match = internal global i32 0, align 4
@good_match = internal global i32 0, align 4
@nice_match = internal global i32 0, align 4
@max_chain_length = internal global i32 0, align 4
@strstart = internal global i32 0, align 4
@block_start = internal global i64 0, align 8
@lookahead = internal global i32 0, align 4
@eofile = internal global i32 0, align 4
@ins_h = internal global i32 0, align 4
@window_size = internal global i64 65536, align 8
@match_start = internal global i32 0, align 4
@prev_length = internal global i32 0, align 4
@program_name = internal global i8* null, align 8
@.str.1 = private unnamed_addr constant [5 x i8] c".exe\00", align 1
@.str.1.2 = private unnamed_addr constant [5 x i8] c"GZIP\00", align 1
@env = internal global i8* null, align 8
@.str.2 = private unnamed_addr constant [4 x i8] c".gz\00", align 1
@z_suffix = internal global i8* null, align 8
@z_len = internal global i64 0, align 8
@optind = external dso_local global i32, align 4
@.str.3 = private unnamed_addr constant [3 x i8] c"--\00", align 1
@shortopts = internal constant [34 x i8] c"ab:cdfhH?klLmMnNqrS:tvVZ123456789\00", align 16
@longopts = internal constant [27 x %struct.option] [%struct.option { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0), i32 0, i32* null, i32 97 }, %struct.option { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.16, i32 0, i32 0), i32 0, i32* null, i32 99 }, %struct.option { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 0, i32* null, i32 99 }, %struct.option { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.18, i32 0, i32 0), i32 0, i32* null, i32 100 }, %struct.option { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.19, i32 0, i32 0), i32 0, i32* null, i32 100 }, %struct.option { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.20, i32 0, i32 0), i32 0, i32* null, i32 102 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i32 0, i32* null, i32 104 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.22, i32 0, i32 0), i32 0, i32* null, i32 107 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.23, i32 0, i32 0), i32 0, i32* null, i32 108 }, %struct.option { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 0, i32* null, i32 76 }, %struct.option { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25, i32 0, i32 0), i32 0, i32* null, i32 110 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.26, i32 0, i32 0), i32 0, i32* null, i32 78 }, %struct.option { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.27, i32 0, i32 0), i32 0, i32* null, i32 128 }, %struct.option { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.28, i32 0, i32 0), i32 0, i32* null, i32 113 }, %struct.option { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i32 0, i32 0), i32 0, i32* null, i32 113 }, %struct.option { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.30, i32 0, i32 0), i32 0, i32* null, i32 130 }, %struct.option { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.31, i32 0, i32 0), i32 0, i32* null, i32 114 }, %struct.option { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.32, i32 0, i32 0), i32 1, i32* null, i32 83 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.33, i32 0, i32 0), i32 0, i32* null, i32 116 }, %struct.option { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.34, i32 0, i32 0), i32 0, i32* null, i32 118 }, %struct.option { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.35, i32 0, i32 0), i32 0, i32* null, i32 86 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.36, i32 0, i32 0), i32 0, i32* null, i32 49 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.37, i32 0, i32 0), i32 0, i32* null, i32 57 }, %struct.option { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.38, i32 0, i32 0), i32 0, i32* null, i32 90 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i32 0, i32 0), i32 1, i32* null, i32 98 }, %struct.option { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.40, i32 0, i32 0), i32 0, i32* null, i32 129 }, %struct.option zeroinitializer], align 16
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [49 x i8] c"%s: %s: non-option in GZIP environment variable\0A\00", align 1
@quiet = internal global i32 0, align 4
@.str.5 = private unnamed_addr constant [78 x i8] c"%s: warning: GZIP environment variable is deprecated; use an alias or script\0A\00", align 1
@ascii = internal global i32 0, align 4
@optarg = external dso_local global i8*, align 8
@maxbits = internal global i32 16, align 4
@.str.6 = private unnamed_addr constant [34 x i8] c"%s: -b operand is not an integer\0A\00", align 1
@to_stdout = internal global i32 0, align 4
@decompress = internal global i32 0, align 4
@force = internal global i32 0, align 4
@keep = internal global i32 0, align 4
@list = internal global i32 0, align 4
@no_time = internal global i32 -1, align 4
@no_name = internal global i32 -1, align 4
@presume_input_tty = internal global i8 0, align 1
@verbose = internal global i32 0, align 4
@recursive = internal global i32 0, align 4
@rsync = internal global i32 0, align 4
@synchronous = internal global i8 0, align 1
@test = internal global i32 0, align 4
@.str.7 = private unnamed_addr constant [38 x i8] c"%s: -Z not supported in this version\0A\00", align 1
@level = internal global i32 6, align 4
@.str.8 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"-%c: \00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"--%s: \00", align 1
@.str.11 = private unnamed_addr constant [47 x i8] c"option not valid in GZIP environment variable\0A\00", align 1
@.str.12 = private unnamed_addr constant [43 x i8] c"%s: option --ascii ignored on this system\0A\00", align 1
@.str.13 = private unnamed_addr constant [25 x i8] c"%s: invalid suffix '%s'\0A\00", align 1
@do_lzw = internal global i32 0, align 4
@work = internal global i32 (i32, i32)* @zip, align 8
@exiting_signal = internal global i32 0, align 4
@stdin_was_read = internal global i8 0, align 1
@ifname = internal global [1024 x i8] zeroinitializer, align 16
@.str.14 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@exit_code = internal global i32 0, align 4
@do_list.first_time = internal global i32 1, align 4
@.str.138 = private unnamed_addr constant [29 x i8] c"method  crc     date  time  \00", align 1
@.str.139 = private unnamed_addr constant [38 x i8] c"%*.*s %*.*s  ratio uncompressed_name\0A\00", align 1
@.str.140 = private unnamed_addr constant [11 x i8] c"compressed\00", align 1
@.str.141 = private unnamed_addr constant [13 x i8] c"uncompressed\00", align 1
@total_in = internal global i64 0, align 8
@total_out = internal global i64 0, align 8
@.str.142 = private unnamed_addr constant [29 x i8] c"                            \00", align 1
@.str.143 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.144 = private unnamed_addr constant [11 x i8] c" (totals)\0A\00", align 1
@bytes_out = internal global i64 0, align 8
@ifile_size = internal global i64 0, align 8
@bytes_in = internal global i64 0, align 8
@last_member = internal global i32 0, align 4
@time_stamp = internal global %struct.timespec zeroinitializer, align 8
@do_list.methods = internal constant [9 x i8*] [i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.133, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.134, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.135, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.136, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.137, i32 0, i32 0)], align 16
@.str.145 = private unnamed_addr constant [11 x i8] c"%5s %08lx \00", align 1
@do_list.month_abbr = internal constant [12 x [4 x i8]] [[4 x i8] c"Jan\00", [4 x i8] c"Feb\00", [4 x i8] c"Mar\00", [4 x i8] c"Apr\00", [4 x i8] c"May\00", [4 x i8] c"Jun\00", [4 x i8] c"Jul\00", [4 x i8] c"Aug\00", [4 x i8] c"Sep\00", [4 x i8] c"Oct\00", [4 x i8] c"Nov\00", [4 x i8] c"Dec\00"], align 16
@.str.146 = private unnamed_addr constant [17 x i8] c"%s%3d %02d:%02d \00", align 1
@.str.147 = private unnamed_addr constant [14 x i8] c"??? ?? ??:?? \00", align 1
@.str.148 = private unnamed_addr constant [5 x i8] c" %s\0A\00", align 1
@ofname = internal global [1024 x i8] zeroinitializer, align 16
@.str.133 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@.str.134 = private unnamed_addr constant [6 x i8] c"compr\00", align 1
@.str.135 = private unnamed_addr constant [6 x i8] c"pack \00", align 1
@.str.136 = private unnamed_addr constant [6 x i8] c"lzh  \00", align 1
@.str.43 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.137 = private unnamed_addr constant [6 x i8] c"defla\00", align 1
@.str.77 = private unnamed_addr constant [10 x i8] c"read from\00", align 1
@.str.78 = private unnamed_addr constant [11 x i8] c"written to\00", align 1
@.str.79 = private unnamed_addr constant [3 x i8] c"de\00", align 1
@.str.76 = private unnamed_addr constant [93 x i8] c"%s: compressed data not %s a terminal. Use -f to force %scompression.\0AFor help, type: %s -h\0A\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@istat = internal global %struct.stat zeroinitializer, align 8
@.str.80 = private unnamed_addr constant [15 x i8] c"standard input\00", align 1
@part_nb = internal global i32 0, align 4
@ifd = internal global i32 0, align 4
@method = internal global i32 8, align 4
@.str.81 = private unnamed_addr constant [5 x i8] c" OK\0A\00", align 1
@.str.74 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@inptr = internal global i32 0, align 4
@insize = internal global i32 0, align 4
@inbuf = internal global [32832 x i8] zeroinitializer, align 16
@.str.82 = private unnamed_addr constant [3 x i8] c"\1F\8B\00", align 1
@.str.83 = private unnamed_addr constant [3 x i8] c"\1F\9E\00", align 1
@.str.84 = private unnamed_addr constant [44 x i8] c"%s: %s: unknown method %d -- not supported\0A\00", align 1
@.str.85 = private unnamed_addr constant [38 x i8] c"%s: %s is encrypted -- not supported\0A\00", align 1
@.str.86 = private unnamed_addr constant [40 x i8] c"%s: %s has flags 0x%x -- not supported\0A\00", align 1
@.str.87 = private unnamed_addr constant [50 x i8] c"%s: %s: MTIME %lu out of range for this platform\0A\00", align 1
@.str.88 = private unnamed_addr constant [41 x i8] c"%s: %s: extra field of %u bytes ignored\0A\00", align 1
@.str.89 = private unnamed_addr constant [39 x i8] c"corrupted input -- file name too large\00", align 1
@.str.90 = private unnamed_addr constant [60 x i8] c"%s: %s: header checksum 0x%04x != computed checksum 0x%04x\0A\00", align 1
@.str.91 = private unnamed_addr constant [5 x i8] c"PK\03\04\00", align 1
@.str.92 = private unnamed_addr constant [3 x i8] c"\1F\1E\00", align 1
@.str.93 = private unnamed_addr constant [3 x i8] c"\1F\9D\00", align 1
@.str.94 = private unnamed_addr constant [3 x i8] c"\1F\A0\00", align 1
@.str.95 = private unnamed_addr constant [29 x i8] c"\0A%s: %s: not in gzip format\0A\00", align 1
@.str.96 = private unnamed_addr constant [56 x i8] c"\0A%s: %s: decompression OK, trailing zero bytes ignored\0A\00", align 1
@.str.97 = private unnamed_addr constant [53 x i8] c"\0A%s: %s: decompression OK, trailing garbage ignored\0A\00", align 1
@.str.98 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.99 = private unnamed_addr constant [34 x i8] c"%s: %s is a directory -- ignored\0A\00", align 1
@.str.100 = private unnamed_addr constant [55 x i8] c"%s: %s is not a directory or a regular file - ignored\0A\00", align 1
@.str.101 = private unnamed_addr constant [46 x i8] c"%s: %s is set-user-ID on execution - ignored\0A\00", align 1
@.str.102 = private unnamed_addr constant [47 x i8] c"%s: %s is set-group-ID on execution - ignored\0A\00", align 1
@.str.103 = private unnamed_addr constant [46 x i8] c"%s: %s has the sticky bit set - file ignored\0A\00", align 1
@.str.104 = private unnamed_addr constant [42 x i8] c"%s: %s has %lu other link%c -- unchanged\0A\00", align 1
@ofd = internal global i32 0, align 4
@save_orig_name = internal global i32 0, align 4
@.str.105 = private unnamed_addr constant [25 x i8] c"%s: %s compressed to %s\0A\00", align 1
@.str.106 = private unnamed_addr constant [5 x i8] c"%s:\09\00", align 1
@dfd = internal global i32 -1, align 4
@caught_signals = internal global %struct.__sigset_t zeroinitializer, align 8
@remove_ofname_fd = internal global i32 -1, align 4
@.str.107 = private unnamed_addr constant [4 x i8] c" OK\00", align 1
@.str.109 = private unnamed_addr constant [8 x i8] c"created\00", align 1
@.str.110 = private unnamed_addr constant [14 x i8] c"replaced with\00", align 1
@.str.108 = private unnamed_addr constant [10 x i8] c" -- %s %s\00", align 1
@dot = internal constant i8 46, align 1
@dfname = internal global [1024 x i8] zeroinitializer, align 16
@.str.132 = private unnamed_addr constant [24 x i8] c"%s: timestamp restored\0A\00", align 1
@.str.125 = private unnamed_addr constant [33 x i8] c"%s: %s: warning, name truncated\0A\00", align 1
@.str.129 = private unnamed_addr constant [23 x i8] c"%s: %s already exists;\00", align 1
@foreground = internal global i32 0, align 4
@.str.130 = private unnamed_addr constant [37 x i8] c" do you wish to overwrite (y or n)? \00", align 1
@.str.131 = private unnamed_addr constant [18 x i8] c"\09not overwritten\0A\00", align 1
@.str.126 = private unnamed_addr constant [15 x i8] c"name too short\00", align 1
@.str.127 = private unnamed_addr constant [22 x i8] c"can't recover suffix\0A\00", align 1
@.str.123 = private unnamed_addr constant [5 x i8] c".tar\00", align 1
@.str.116 = private unnamed_addr constant [5 x i8] c".tgz\00", align 1
@.str.119 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.128 = private unnamed_addr constant [31 x i8] c"internal error in shorten_name\00", align 1
@get_suffix.known_suffixes = internal global [10 x i8*] [i8* null, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.111, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.115, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.116, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.117, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.112, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.118, i32 0, i32 0), i8* null, i8* null], align 16
@.str.111 = private unnamed_addr constant [3 x i8] c".z\00", align 1
@.str.115 = private unnamed_addr constant [5 x i8] c".taz\00", align 1
@.str.117 = private unnamed_addr constant [4 x i8] c"-gz\00", align 1
@.str.112 = private unnamed_addr constant [3 x i8] c"-z\00", align 1
@.str.118 = private unnamed_addr constant [3 x i8] c"_z\00", align 1
@.str.122 = private unnamed_addr constant [35 x i8] c"%s: %s: unknown suffix -- ignored\0A\00", align 1
@.str.124 = private unnamed_addr constant [43 x i8] c"%s: %s already has %s suffix -- unchanged\0A\00", align 1
@.str.114 = private unnamed_addr constant [28 x i8] c"%s: %s: file name too long\0A\00", align 1
@.str.120 = private unnamed_addr constant [3 x i8] c"..\00", align 1
@.str.121 = private unnamed_addr constant [30 x i8] c"%s: %s/%s: pathname too long\0A\00", align 1
@open_input_file.suffixes = internal global [6 x i8*] [i8* null, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.111, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.112, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.113, i32 0, i32 0), i8* null], align 16
@.str.113 = private unnamed_addr constant [3 x i8] c".Z\00", align 1
@handled_sig = internal global [6 x i32] [i32 2, i32 1, i32 13, i32 15, i32 24, i32 25], align 16
@do_exit.in_exit = internal global i32 0, align 4
@.str.75 = private unnamed_addr constant [30 x i8] c"Written by Jean-loup Gailly.\0A\00", align 1
@license_msg = internal constant [6 x i8*] [i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.69, i32 0, i32 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.70, i32 0, i32 0), i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.71, i32 0, i32 0), i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.72, i32 0, i32 0), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.73, i32 0, i32 0), i8* null], align 16
@.str.68 = private unnamed_addr constant [7 x i8] c"%s %s\0A\00", align 1
@.str.67 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.69 = private unnamed_addr constant [50 x i8] c"Copyright (C) 2017 Free Software Foundation, Inc.\00", align 1
@.str.70 = private unnamed_addr constant [37 x i8] c"Copyright (C) 1993 Jean-loup Gailly.\00", align 1
@.str.71 = private unnamed_addr constant [77 x i8] c"This is free software.  You may redistribute copies of it under the terms of\00", align 1
@.str.72 = private unnamed_addr constant [72 x i8] c"the GNU General Public License <https://www.gnu.org/licenses/gpl.html>.\00", align 1
@.str.73 = private unnamed_addr constant [54 x i8] c"There is NO WARRANTY, to the extent permitted by law.\00", align 1
@help.help_msg = internal constant [28 x i8*] [i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.44, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.45, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.46, i32 0, i32 0), i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.47, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.49, i32 0, i32 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.50, i32 0, i32 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.51, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.52, i32 0, i32 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.53, i32 0, i32 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.54, i32 0, i32 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.55, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.56, i32 0, i32 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.57, i32 0, i32 0), i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.58, i32 0, i32 0), i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.59, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.60, i32 0, i32 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.63, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.64, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.65, i32 0, i32 0), i8* null], align 16
@.str.66 = private unnamed_addr constant [33 x i8] c"Usage: %s [OPTION]... [FILE]...\0A\00", align 1
@.str.42 = private unnamed_addr constant [68 x i8] c"Compress or uncompress FILEs (by default, compress FILES in-place).\00", align 1
@.str.44 = private unnamed_addr constant [73 x i8] c"Mandatory arguments to long options are mandatory for short options too.\00", align 1
@.str.45 = private unnamed_addr constant [76 x i8] c"  -c, --stdout      write on standard output, keep original files unchanged\00", align 1
@.str.46 = private unnamed_addr constant [31 x i8] c"  -d, --decompress  decompress\00", align 1
@.str.47 = private unnamed_addr constant [70 x i8] c"  -f, --force       force overwrite of output file and compress links\00", align 1
@.str.48 = private unnamed_addr constant [35 x i8] c"  -h, --help        give this help\00", align 1
@.str.49 = private unnamed_addr constant [52 x i8] c"  -k, --keep        keep (don't delete) input files\00", align 1
@.str.50 = private unnamed_addr constant [50 x i8] c"  -l, --list        list compressed file contents\00", align 1
@.str.51 = private unnamed_addr constant [45 x i8] c"  -L, --license     display software license\00", align 1
@.str.52 = private unnamed_addr constant [75 x i8] c"  -n, --no-name     do not save or restore the original name and timestamp\00", align 1
@.str.53 = private unnamed_addr constant [68 x i8] c"  -N, --name        save or restore the original name and timestamp\00", align 1
@.str.54 = private unnamed_addr constant [42 x i8] c"  -q, --quiet       suppress all warnings\00", align 1
@.str.55 = private unnamed_addr constant [55 x i8] c"  -r, --recursive   operate recursively on directories\00", align 1
@.str.56 = private unnamed_addr constant [48 x i8] c"      --rsyncable   make rsync-friendly archive\00", align 1
@.str.57 = private unnamed_addr constant [55 x i8] c"  -S, --suffix=SUF  use suffix SUF on compressed files\00", align 1
@.str.58 = private unnamed_addr constant [77 x i8] c"      --synchronous synchronous output (safer if system crashes, but slower)\00", align 1
@.str.59 = private unnamed_addr constant [51 x i8] c"  -t, --test        test compressed file integrity\00", align 1
@.str.60 = private unnamed_addr constant [33 x i8] c"  -v, --verbose     verbose mode\00", align 1
@.str.61 = private unnamed_addr constant [43 x i8] c"  -V, --version     display version number\00", align 1
@.str.62 = private unnamed_addr constant [36 x i8] c"  -1, --fast        compress faster\00", align 1
@.str.63 = private unnamed_addr constant [36 x i8] c"  -9, --best        compress better\00", align 1
@.str.64 = private unnamed_addr constant [54 x i8] c"With no FILE, or when FILE is -, read standard input.\00", align 1
@.str.65 = private unnamed_addr constant [35 x i8] c"Report bugs to <bug-gzip@gnu.org>.\00", align 1
@.str.41 = private unnamed_addr constant [39 x i8] c"Try `%s --help' for more information.\0A\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"ascii\00", align 1
@.str.16 = private unnamed_addr constant [10 x i8] c"to-stdout\00", align 1
@.str.18 = private unnamed_addr constant [11 x i8] c"decompress\00", align 1
@.str.19 = private unnamed_addr constant [11 x i8] c"uncompress\00", align 1
@.str.20 = private unnamed_addr constant [6 x i8] c"force\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c"keep\00", align 1
@.str.23 = private unnamed_addr constant [5 x i8] c"list\00", align 1
@.str.24 = private unnamed_addr constant [8 x i8] c"license\00", align 1
@.str.25 = private unnamed_addr constant [8 x i8] c"no-name\00", align 1
@.str.26 = private unnamed_addr constant [5 x i8] c"name\00", align 1
@.str.27 = private unnamed_addr constant [19 x i8] c"-presume-input-tty\00", align 1
@.str.28 = private unnamed_addr constant [6 x i8] c"quiet\00", align 1
@.str.29 = private unnamed_addr constant [7 x i8] c"silent\00", align 1
@.str.30 = private unnamed_addr constant [12 x i8] c"synchronous\00", align 1
@.str.31 = private unnamed_addr constant [10 x i8] c"recursive\00", align 1
@.str.32 = private unnamed_addr constant [7 x i8] c"suffix\00", align 1
@.str.33 = private unnamed_addr constant [5 x i8] c"test\00", align 1
@.str.34 = private unnamed_addr constant [8 x i8] c"verbose\00", align 1
@.str.35 = private unnamed_addr constant [8 x i8] c"version\00", align 1
@.str.36 = private unnamed_addr constant [5 x i8] c"fast\00", align 1
@.str.37 = private unnamed_addr constant [5 x i8] c"best\00", align 1
@.str.38 = private unnamed_addr constant [4 x i8] c"lzw\00", align 1
@.str.39 = private unnamed_addr constant [5 x i8] c"bits\00", align 1
@.str.40 = private unnamed_addr constant [10 x i8] c"rsyncable\00", align 1
@outbuf = internal global [18432 x i8] zeroinitializer, align 16
@d_buf = internal global [32768 x i16] zeroinitializer, align 16
@window = internal global [65536 x i8] zeroinitializer, align 16
@prev = internal global [65536 x i16] zeroinitializer, align 16
@outcnt = internal global i32 0, align 4
@bk = internal global i32 0, align 4
@bb = internal global i64 0, align 8
@hufts = internal global i32 0, align 4
@cplens = internal global [31 x i16] [i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11, i16 13, i16 15, i16 17, i16 19, i16 23, i16 27, i16 31, i16 35, i16 43, i16 51, i16 59, i16 67, i16 83, i16 99, i16 115, i16 131, i16 163, i16 195, i16 227, i16 258, i16 0, i16 0], align 16
@cplext = internal global [31 x i16] [i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 1, i16 1, i16 1, i16 1, i16 2, i16 2, i16 2, i16 2, i16 3, i16 3, i16 3, i16 3, i16 4, i16 4, i16 4, i16 4, i16 5, i16 5, i16 5, i16 5, i16 0, i16 99, i16 99], align 16
@cpdist = internal global [30 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 7, i16 9, i16 13, i16 17, i16 25, i16 33, i16 49, i16 65, i16 97, i16 129, i16 193, i16 257, i16 385, i16 513, i16 769, i16 1025, i16 1537, i16 2049, i16 3073, i16 4097, i16 6145, i16 8193, i16 12289, i16 16385, i16 24577], align 16
@cpdext = internal global [30 x i16] [i16 0, i16 0, i16 0, i16 0, i16 1, i16 1, i16 2, i16 2, i16 3, i16 3, i16 4, i16 4, i16 5, i16 5, i16 6, i16 6, i16 7, i16 7, i16 8, i16 8, i16 9, i16 9, i16 10, i16 10, i16 11, i16 11, i16 12, i16 12, i16 13, i16 13], align 16
@mask_bits = internal global [17 x i16] [i16 0, i16 1, i16 3, i16 7, i16 15, i16 31, i16 63, i16 127, i16 255, i16 511, i16 1023, i16 2047, i16 4095, i16 8191, i16 16383, i16 32767, i16 -1], align 16
@border = internal global [19 x i32] [i32 16, i32 17, i32 18, i32 0, i32 8, i32 7, i32 9, i32 6, i32 10, i32 5, i32 11, i32 4, i32 12, i32 3, i32 13, i32 2, i32 14, i32 1, i32 15], align 16
@lbits = internal global i32 9, align 4
@dbits = internal global i32 6, align 4
@msg_done = internal global i32 0, align 4
@.str.149 = private unnamed_addr constant [44 x i8] c"output in compress .Z format not supported\0A\00", align 1
@file_type = internal global i16* null, align 8
@file_method = internal global i32* null, align 8
@input_len = internal global i64 0, align 8
@compressed_len = internal global i64 0, align 8
@static_dtree = internal global [30 x %struct.ct_data] zeroinitializer, align 16
@base_length = internal global [29 x i32] zeroinitializer, align 16
@extra_lbits = internal global [29 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 2, i32 3, i32 3, i32 3, i32 3, i32 4, i32 4, i32 4, i32 4, i32 5, i32 5, i32 5, i32 5, i32 0], align 16
@length_code = internal global [256 x i8] zeroinitializer, align 16
@base_dist = internal global [30 x i32] zeroinitializer, align 16
@extra_dbits = internal global [30 x i32] [i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 2, i32 2, i32 3, i32 3, i32 4, i32 4, i32 5, i32 5, i32 6, i32 6, i32 7, i32 7, i32 8, i32 8, i32 9, i32 9, i32 10, i32 10, i32 11, i32 11, i32 12, i32 12, i32 13, i32 13], align 16
@dist_code = internal global [512 x i8] zeroinitializer, align 16
@bl_count = internal global [16 x i16] zeroinitializer, align 16
@static_ltree = internal global [288 x %struct.ct_data] zeroinitializer, align 16
@dyn_ltree = internal global [573 x %struct.ct_data] zeroinitializer, align 16
@dyn_dtree = internal global [61 x %struct.ct_data] zeroinitializer, align 16
@bl_tree = internal global [39 x %struct.ct_data] zeroinitializer, align 16
@static_len = internal global i64 0, align 8
@opt_len = internal global i64 0, align 8
@last_flags = internal global i32 0, align 4
@last_dist = internal global i32 0, align 4
@last_lit = internal global i32 0, align 4
@flags = internal global i8 0, align 1
@flag_bit = internal global i8 0, align 1
@flag_buf = internal global [4096 x i8] zeroinitializer, align 16
@l_desc = internal global %struct.tree_desc { %struct.ct_data* getelementptr inbounds ([573 x %struct.ct_data], [573 x %struct.ct_data]* @dyn_ltree, i32 0, i32 0), %struct.ct_data* getelementptr inbounds ([288 x %struct.ct_data], [288 x %struct.ct_data]* @static_ltree, i32 0, i32 0), i32* getelementptr inbounds ([29 x i32], [29 x i32]* @extra_lbits, i32 0, i32 0), i32 257, i32 286, i32 15, i32 0 }, align 8
@d_desc = internal global %struct.tree_desc { %struct.ct_data* getelementptr inbounds ([61 x %struct.ct_data], [61 x %struct.ct_data]* @dyn_dtree, i32 0, i32 0), %struct.ct_data* getelementptr inbounds ([30 x %struct.ct_data], [30 x %struct.ct_data]* @static_dtree, i32 0, i32 0), i32* getelementptr inbounds ([30 x i32], [30 x i32]* @extra_dbits, i32 0, i32 0), i32 0, i32 30, i32 15, i32 0 }, align 8
@.str.152 = private unnamed_addr constant [15 x i8] c"block vanished\00", align 1
@bl_order = internal global [19 x i8] c"\10\11\12\00\08\07\09\06\0A\05\0B\04\0C\03\0D\02\0E\01\0F", align 16
@bl_desc = internal global %struct.tree_desc { %struct.ct_data* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i32 0, i32 0), %struct.ct_data* null, i32* getelementptr inbounds ([19 x i32], [19 x i32]* @extra_blbits, i32 0, i32 0), i32 0, i32 19, i32 7, i32 0 }, align 8
@extra_blbits = internal global [19 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2, i32 3, i32 7], align 16
@heap_len = internal global i32 0, align 4
@heap_max = internal global i32 0, align 4
@heap = internal global [573 x i32] zeroinitializer, align 16
@depth = internal global [573 x i8] zeroinitializer, align 16
@.str.1.153 = private unnamed_addr constant [23 x i8] c"-l used on binary file\00", align 1
@done = internal global i32 0, align 4
@j = internal global i32 0, align 4
@decode.i = internal global i32 0, align 4
@bitbuf = internal global i16 0, align 2
@pt_table = internal global [256 x i16] zeroinitializer, align 16
@pt_len = internal global [32 x i8] zeroinitializer, align 16
@bitcount = internal global i32 0, align 4
@subbitbuf = internal global i32 0, align 4
@blocksize = internal global i32 0, align 4
@.str.158 = private unnamed_addr constant [11 x i8] c"Bad table\0A\00", align 1
@block_mode = internal global i32 128, align 4
@.str.161 = private unnamed_addr constant [38 x i8] c"\0A%s: %s: warning, unknown flags 0x%x\0A\00", align 1
@.str.1.162 = private unnamed_addr constant [59 x i8] c"\0A%s: %s: compressed with %d bits, can only handle %d bits\0A\00", align 1
@.str.2.163 = private unnamed_addr constant [15 x i8] c"corrupt input.\00", align 1
@.str.3.164 = private unnamed_addr constant [46 x i8] c"corrupt input. Use zcat to recover some data.\00", align 1
@valid = internal global i32 0, align 4
@bitbuf.168 = internal global i64 0, align 8
@peek_bits = internal global i32 0, align 4
@max_len = internal global i32 0, align 4
@leaves = internal global [26 x i32] zeroinitializer, align 16
@parents = internal global [26 x i32] zeroinitializer, align 16
@lit_base = internal global [26 x i32] zeroinitializer, align 16
@literal = internal global [256 x i8] zeroinitializer, align 16
@orig_len = internal global i64 0, align 8
@.str.169 = private unnamed_addr constant [38 x i8] c"invalid compressed data--length error\00", align 1
@.str.4.170 = private unnamed_addr constant [50 x i8] c"invalid compressed data -- unexpected end of file\00", align 1
@.str.3.171 = private unnamed_addr constant [31 x i8] c"too few leaves in Huffman tree\00", align 1
@.str.1.172 = private unnamed_addr constant [64 x i8] c"invalid compressed data -- Huffman code bit length out of range\00", align 1
@.str.2.173 = private unnamed_addr constant [32 x i8] c"too many leaves in Huffman tree\00", align 1
@.str.176 = private unnamed_addr constant [31 x i8] c"\0A%s: %s: not a valid zip file\0A\00", align 1
@.str.1.177 = private unnamed_addr constant [58 x i8] c"\0A%s: %s: first entry not deflated or stored -- use unzip\0A\00", align 1
@decrypt = internal global i32 0, align 4
@.str.2.178 = private unnamed_addr constant [38 x i8] c"\0A%s: %s: encrypted file -- use unzip\0A\00", align 1
@ext_header = internal global i32 0, align 4
@pkzip = internal global i32 0, align 4
@.str.3.181 = private unnamed_addr constant [41 x i8] c"invalid compressed data--format violated\00", align 1
@.str.4.182 = private unnamed_addr constant [18 x i8] c"len %lu, siz %lu\0A\00", align 1
@.str.5.183 = private unnamed_addr constant [41 x i8] c"invalid compressed data--length mismatch\00", align 1
@.str.6.184 = private unnamed_addr constant [31 x i8] c"internal error, invalid method\00", align 1
@.str.7.185 = private unnamed_addr constant [45 x i8] c"\0A%s: %s: invalid compressed data--crc error\0A\00", align 1
@.str.8.186 = private unnamed_addr constant [48 x i8] c"\0A%s: %s: invalid compressed data--length error\0A\00", align 1
@.str.9.187 = private unnamed_addr constant [46 x i8] c"%s: %s has more than one entry--rest ignored\0A\00", align 1
@.str.10.188 = private unnamed_addr constant [45 x i8] c"%s: %s has more than one entry -- unchanged\0A\00", align 1
@.str.4.197 = private unnamed_addr constant [6 x i8] c"\0A%s: \00", align 1
@.str.5.198 = private unnamed_addr constant [28 x i8] c"%s: unexpected end of file\0A\00", align 1
@updcrc.crc = internal global i64 4294967295, align 8
@crc_32_tab = internal constant [256 x i64] [i64 0, i64 1996959894, i64 3993919788, i64 2567524794, i64 124634137, i64 1886057615, i64 3915621685, i64 2657392035, i64 249268274, i64 2044508324, i64 3772115230, i64 2547177864, i64 162941995, i64 2125561021, i64 3887607047, i64 2428444049, i64 498536548, i64 1789927666, i64 4089016648, i64 2227061214, i64 450548861, i64 1843258603, i64 4107580753, i64 2211677639, i64 325883990, i64 1684777152, i64 4251122042, i64 2321926636, i64 335633487, i64 1661365465, i64 4195302755, i64 2366115317, i64 997073096, i64 1281953886, i64 3579855332, i64 2724688242, i64 1006888145, i64 1258607687, i64 3524101629, i64 2768942443, i64 901097722, i64 1119000684, i64 3686517206, i64 2898065728, i64 853044451, i64 1172266101, i64 3705015759, i64 2882616665, i64 651767980, i64 1373503546, i64 3369554304, i64 3218104598, i64 565507253, i64 1454621731, i64 3485111705, i64 3099436303, i64 671266974, i64 1594198024, i64 3322730930, i64 2970347812, i64 795835527, i64 1483230225, i64 3244367275, i64 3060149565, i64 1994146192, i64 31158534, i64 2563907772, i64 4023717930, i64 1907459465, i64 112637215, i64 2680153253, i64 3904427059, i64 2013776290, i64 251722036, i64 2517215374, i64 3775830040, i64 2137656763, i64 141376813, i64 2439277719, i64 3865271297, i64 1802195444, i64 476864866, i64 2238001368, i64 4066508878, i64 1812370925, i64 453092731, i64 2181625025, i64 4111451223, i64 1706088902, i64 314042704, i64 2344532202, i64 4240017532, i64 1658658271, i64 366619977, i64 2362670323, i64 4224994405, i64 1303535960, i64 984961486, i64 2747007092, i64 3569037538, i64 1256170817, i64 1037604311, i64 2765210733, i64 3554079995, i64 1131014506, i64 879679996, i64 2909243462, i64 3663771856, i64 1141124467, i64 855842277, i64 2852801631, i64 3708648649, i64 1342533948, i64 654459306, i64 3188396048, i64 3373015174, i64 1466479909, i64 544179635, i64 3110523913, i64 3462522015, i64 1591671054, i64 702138776, i64 2966460450, i64 3352799412, i64 1504918807, i64 783551873, i64 3082640443, i64 3233442989, i64 3988292384, i64 2596254646, i64 62317068, i64 1957810842, i64 3939845945, i64 2647816111, i64 81470997, i64 1943803523, i64 3814918930, i64 2489596804, i64 225274430, i64 2053790376, i64 3826175755, i64 2466906013, i64 167816743, i64 2097651377, i64 4027552580, i64 2265490386, i64 503444072, i64 1762050814, i64 4150417245, i64 2154129355, i64 426522225, i64 1852507879, i64 4275313526, i64 2312317920, i64 282753626, i64 1742555852, i64 4189708143, i64 2394877945, i64 397917763, i64 1622183637, i64 3604390888, i64 2714866558, i64 953729732, i64 1340076626, i64 3518719985, i64 2797360999, i64 1068828381, i64 1219638859, i64 3624741850, i64 2936675148, i64 906185462, i64 1090812512, i64 3747672003, i64 2825379669, i64 829329135, i64 1181335161, i64 3412177804, i64 3160834842, i64 628085408, i64 1382605366, i64 3423369109, i64 3138078467, i64 570562233, i64 1426400815, i64 3317316542, i64 2998733608, i64 733239954, i64 1555261956, i64 3268935591, i64 3050360625, i64 752459403, i64 1541320221, i64 2607071920, i64 3965973030, i64 1969922972, i64 40735498, i64 2617837225, i64 3943577151, i64 1913087877, i64 83908371, i64 2512341634, i64 3803740692, i64 2075208622, i64 213261112, i64 2463272603, i64 3855990285, i64 2094854071, i64 198958881, i64 2262029012, i64 4057260610, i64 1759359992, i64 534414190, i64 2176718541, i64 4139329115, i64 1873836001, i64 414664567, i64 2282248934, i64 4279200368, i64 1711684554, i64 285281116, i64 2405801727, i64 4167216745, i64 1634467795, i64 376229701, i64 2685067896, i64 3608007406, i64 1308918612, i64 956543938, i64 2808555105, i64 3495958263, i64 1231636301, i64 1047427035, i64 2932959818, i64 3654703836, i64 1088359270, i64 936918000, i64 2847714899, i64 3736837829, i64 1202900863, i64 817233897, i64 3183342108, i64 3401237130, i64 1404277552, i64 615818150, i64 3134207493, i64 3453421203, i64 1423857449, i64 601450431, i64 3009837614, i64 3294710456, i64 1567103746, i64 711928724, i64 3020668471, i64 3272380065, i64 1510334235, i64 755167117], align 16
@.str.219 = private unnamed_addr constant [3 x i8] c" \09\00", align 1
@.str.1.222 = private unnamed_addr constant [13 x i8] c"\0A%s: %s: %s\0A\00", align 1
@.str.2.225 = private unnamed_addr constant [23 x i8] c"\0A%s: memory_exhausted\0A\00", align 1
@.str.3.228 = private unnamed_addr constant [21 x i8] c"%s: %s: warning: %s\0A\00", align 1
@.str.6.231 = private unnamed_addr constant [8 x i8] c"%5.1f%%\00", align 1
@.str.236 = private unnamed_addr constant [3 x i8] c"\1F\8B\00", align 1
@.str.1.237 = private unnamed_addr constant [44 x i8] c"file timestamp out of range for gzip format\00", align 1
@crc = internal global i64 0, align 8
@header_bytes = internal global i64 0, align 8
@.str.2.240 = private unnamed_addr constant [41 x i8] c"%s: %s: file size changed while zipping\0A\00", align 1
@Version = internal global i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.245, i32 0, i32 0), align 8
@.str.245 = private unnamed_addr constant [4 x i8] c"1.9\00", align 1
@comparison_function_table = internal constant [2 x i32 (i8*, i8*)*] [i32 (i8*, i8*)* null, i32 (i8*, i8*)* @direntry_cmp_name], align 16
@utimensat_works_really = internal global i32 0, align 4
@lutimensat_works_really = internal global i32 0, align 4
@rpl_fcntl.have_dupfd_cloexec = internal global i32 0, align 4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @bi_init(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* @zfile, align 4
  store i16 0, i16* @bi_buf, align 2
  store i32 0, i32* @bi_valid, align 4
  %4 = load i32, i32* @zfile, align 4
  %5 = icmp ne i32 %4, -1
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 (i8*, i32)* @file_read, i32 (i8*, i32)** @read_buf, align 8
  br label %7

7:                                                ; preds = %6, %1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @send_bits(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* @bi_valid, align 4
  %6 = load i32, i32* %4, align 4
  %7 = sub nsw i32 16, %6
  %8 = icmp sgt i32 %5, %7
  br i1 %8, label %9, label %78

9:                                                ; preds = %2
  %10 = load i32, i32* %3, align 4
  %11 = load i32, i32* @bi_valid, align 4
  %12 = shl i32 %10, %11
  %13 = load i16, i16* @bi_buf, align 2
  %14 = zext i16 %13 to i32
  %15 = or i32 %14, %12
  %16 = trunc i32 %15 to i16
  store i16 %16, i16* @bi_buf, align 2
  %17 = load i32, i32* @outcnt, align 4
  %18 = icmp ult i32 %17, 16382
  br i1 %18, label %19, label %36

19:                                               ; preds = %9
  %20 = load i16, i16* @bi_buf, align 2
  %21 = zext i16 %20 to i32
  %22 = and i32 %21, 255
  %23 = trunc i32 %22 to i8
  %24 = load i32, i32* @outcnt, align 4
  %25 = add i32 %24, 1
  store i32 %25, i32* @outcnt, align 4
  %26 = zext i32 %24 to i64
  %27 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %26
  store i8 %23, i8* %27, align 1
  %28 = load i16, i16* @bi_buf, align 2
  %29 = zext i16 %28 to i32
  %30 = ashr i32 %29, 8
  %31 = trunc i32 %30 to i8
  %32 = load i32, i32* @outcnt, align 4
  %33 = add i32 %32, 1
  store i32 %33, i32* @outcnt, align 4
  %34 = zext i32 %32 to i64
  %35 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %34
  store i8 %31, i8* %35, align 1
  br label %61

36:                                               ; preds = %9
  %37 = load i16, i16* @bi_buf, align 2
  %38 = zext i16 %37 to i32
  %39 = and i32 %38, 255
  %40 = trunc i32 %39 to i8
  %41 = load i32, i32* @outcnt, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* @outcnt, align 4
  %43 = zext i32 %41 to i64
  %44 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %43
  store i8 %40, i8* %44, align 1
  %45 = load i32, i32* @outcnt, align 4
  %46 = icmp eq i32 %45, 16384
  br i1 %46, label %47, label %48

47:                                               ; preds = %36
  call void @flush_outbuf()
  br label %48

48:                                               ; preds = %47, %36
  %49 = load i16, i16* @bi_buf, align 2
  %50 = zext i16 %49 to i32
  %51 = ashr i32 %50, 8
  %52 = trunc i32 %51 to i8
  %53 = load i32, i32* @outcnt, align 4
  %54 = add i32 %53, 1
  store i32 %54, i32* @outcnt, align 4
  %55 = zext i32 %53 to i64
  %56 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %55
  store i8 %52, i8* %56, align 1
  %57 = load i32, i32* @outcnt, align 4
  %58 = icmp eq i32 %57, 16384
  br i1 %58, label %59, label %60

59:                                               ; preds = %48
  call void @flush_outbuf()
  br label %60

60:                                               ; preds = %59, %48
  br label %61

61:                                               ; preds = %60, %19
  %62 = load i32, i32* %3, align 4
  %63 = trunc i32 %62 to i16
  %64 = zext i16 %63 to i32
  %65 = load i32, i32* @bi_valid, align 4
  %66 = sext i32 %65 to i64
  %67 = sub i64 16, %66
  %68 = trunc i64 %67 to i32
  %69 = ashr i32 %64, %68
  %70 = trunc i32 %69 to i16
  store i16 %70, i16* @bi_buf, align 2
  %71 = load i32, i32* %4, align 4
  %72 = sext i32 %71 to i64
  %73 = sub i64 %72, 16
  %74 = load i32, i32* @bi_valid, align 4
  %75 = sext i32 %74 to i64
  %76 = add i64 %75, %73
  %77 = trunc i64 %76 to i32
  store i32 %77, i32* @bi_valid, align 4
  br label %89

78:                                               ; preds = %2
  %79 = load i32, i32* %3, align 4
  %80 = load i32, i32* @bi_valid, align 4
  %81 = shl i32 %79, %80
  %82 = load i16, i16* @bi_buf, align 2
  %83 = zext i16 %82 to i32
  %84 = or i32 %83, %81
  %85 = trunc i32 %84 to i16
  store i16 %85, i16* @bi_buf, align 2
  %86 = load i32, i32* %4, align 4
  %87 = load i32, i32* @bi_valid, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, i32* @bi_valid, align 4
  br label %89

89:                                               ; preds = %78, %61
  ret void
}

; Function Attrs: noinline nounwind optnone readnone uwtable
define internal i32 @bi_reverse(i32 %0, i32 %1) #1 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %6

6:                                                ; preds = %15, %2
  %7 = load i32, i32* %3, align 4
  %8 = and i32 %7, 1
  %9 = load i32, i32* %5, align 4
  %10 = or i32 %9, %8
  store i32 %10, i32* %5, align 4
  %11 = load i32, i32* %3, align 4
  %12 = lshr i32 %11, 1
  store i32 %12, i32* %3, align 4
  %13 = load i32, i32* %5, align 4
  %14 = shl i32 %13, 1
  store i32 %14, i32* %5, align 4
  br label %15

15:                                               ; preds = %6
  %16 = load i32, i32* %4, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %4, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %6, label %19, !llvm.loop !5

19:                                               ; preds = %15
  %20 = load i32, i32* %5, align 4
  %21 = lshr i32 %20, 1
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @bi_windup() #0 {
  %1 = load i32, i32* @bi_valid, align 4
  %2 = icmp sgt i32 %1, 8
  br i1 %2, label %3, label %49

3:                                                ; preds = %0
  %4 = load i32, i32* @outcnt, align 4
  %5 = icmp ult i32 %4, 16382
  br i1 %5, label %6, label %23

6:                                                ; preds = %3
  %7 = load i16, i16* @bi_buf, align 2
  %8 = zext i16 %7 to i32
  %9 = and i32 %8, 255
  %10 = trunc i32 %9 to i8
  %11 = load i32, i32* @outcnt, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* @outcnt, align 4
  %13 = zext i32 %11 to i64
  %14 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %13
  store i8 %10, i8* %14, align 1
  %15 = load i16, i16* @bi_buf, align 2
  %16 = zext i16 %15 to i32
  %17 = ashr i32 %16, 8
  %18 = trunc i32 %17 to i8
  %19 = load i32, i32* @outcnt, align 4
  %20 = add i32 %19, 1
  store i32 %20, i32* @outcnt, align 4
  %21 = zext i32 %19 to i64
  %22 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %21
  store i8 %18, i8* %22, align 1
  br label %48

23:                                               ; preds = %3
  %24 = load i16, i16* @bi_buf, align 2
  %25 = zext i16 %24 to i32
  %26 = and i32 %25, 255
  %27 = trunc i32 %26 to i8
  %28 = load i32, i32* @outcnt, align 4
  %29 = add i32 %28, 1
  store i32 %29, i32* @outcnt, align 4
  %30 = zext i32 %28 to i64
  %31 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %30
  store i8 %27, i8* %31, align 1
  %32 = load i32, i32* @outcnt, align 4
  %33 = icmp eq i32 %32, 16384
  br i1 %33, label %34, label %35

34:                                               ; preds = %23
  call void @flush_outbuf()
  br label %35

35:                                               ; preds = %34, %23
  %36 = load i16, i16* @bi_buf, align 2
  %37 = zext i16 %36 to i32
  %38 = ashr i32 %37, 8
  %39 = trunc i32 %38 to i8
  %40 = load i32, i32* @outcnt, align 4
  %41 = add i32 %40, 1
  store i32 %41, i32* @outcnt, align 4
  %42 = zext i32 %40 to i64
  %43 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %42
  store i8 %39, i8* %43, align 1
  %44 = load i32, i32* @outcnt, align 4
  %45 = icmp eq i32 %44, 16384
  br i1 %45, label %46, label %47

46:                                               ; preds = %35
  call void @flush_outbuf()
  br label %47

47:                                               ; preds = %46, %35
  br label %48

48:                                               ; preds = %47, %6
  br label %64

49:                                               ; preds = %0
  %50 = load i32, i32* @bi_valid, align 4
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %52, label %63

52:                                               ; preds = %49
  %53 = load i16, i16* @bi_buf, align 2
  %54 = trunc i16 %53 to i8
  %55 = load i32, i32* @outcnt, align 4
  %56 = add i32 %55, 1
  store i32 %56, i32* @outcnt, align 4
  %57 = zext i32 %55 to i64
  %58 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %57
  store i8 %54, i8* %58, align 1
  %59 = load i32, i32* @outcnt, align 4
  %60 = icmp eq i32 %59, 16384
  br i1 %60, label %61, label %62

61:                                               ; preds = %52
  call void @flush_outbuf()
  br label %62

62:                                               ; preds = %61, %52
  br label %63

63:                                               ; preds = %62, %49
  br label %64

64:                                               ; preds = %63, %48
  store i16 0, i16* @bi_buf, align 2
  store i32 0, i32* @bi_valid, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @copy_block(i8* %0, i32 %1, i32 %2) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  call void @bi_windup()
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %112

9:                                                ; preds = %3
  %10 = load i32, i32* @outcnt, align 4
  %11 = icmp ult i32 %10, 16382
  br i1 %11, label %12, label %31

12:                                               ; preds = %9
  %13 = load i32, i32* %5, align 4
  %14 = trunc i32 %13 to i16
  %15 = zext i16 %14 to i32
  %16 = and i32 %15, 255
  %17 = trunc i32 %16 to i8
  %18 = load i32, i32* @outcnt, align 4
  %19 = add i32 %18, 1
  store i32 %19, i32* @outcnt, align 4
  %20 = zext i32 %18 to i64
  %21 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %20
  store i8 %17, i8* %21, align 1
  %22 = load i32, i32* %5, align 4
  %23 = trunc i32 %22 to i16
  %24 = zext i16 %23 to i32
  %25 = ashr i32 %24, 8
  %26 = trunc i32 %25 to i8
  %27 = load i32, i32* @outcnt, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* @outcnt, align 4
  %29 = zext i32 %27 to i64
  %30 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %29
  store i8 %26, i8* %30, align 1
  br label %58

31:                                               ; preds = %9
  %32 = load i32, i32* %5, align 4
  %33 = trunc i32 %32 to i16
  %34 = zext i16 %33 to i32
  %35 = and i32 %34, 255
  %36 = trunc i32 %35 to i8
  %37 = load i32, i32* @outcnt, align 4
  %38 = add i32 %37, 1
  store i32 %38, i32* @outcnt, align 4
  %39 = zext i32 %37 to i64
  %40 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %39
  store i8 %36, i8* %40, align 1
  %41 = load i32, i32* @outcnt, align 4
  %42 = icmp eq i32 %41, 16384
  br i1 %42, label %43, label %44

43:                                               ; preds = %31
  call void @flush_outbuf()
  br label %44

44:                                               ; preds = %43, %31
  %45 = load i32, i32* %5, align 4
  %46 = trunc i32 %45 to i16
  %47 = zext i16 %46 to i32
  %48 = ashr i32 %47, 8
  %49 = trunc i32 %48 to i8
  %50 = load i32, i32* @outcnt, align 4
  %51 = add i32 %50, 1
  store i32 %51, i32* @outcnt, align 4
  %52 = zext i32 %50 to i64
  %53 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %52
  store i8 %49, i8* %53, align 1
  %54 = load i32, i32* @outcnt, align 4
  %55 = icmp eq i32 %54, 16384
  br i1 %55, label %56, label %57

56:                                               ; preds = %44
  call void @flush_outbuf()
  br label %57

57:                                               ; preds = %56, %44
  br label %58

58:                                               ; preds = %57, %12
  %59 = load i32, i32* @outcnt, align 4
  %60 = icmp ult i32 %59, 16382
  br i1 %60, label %61, label %82

61:                                               ; preds = %58
  %62 = load i32, i32* %5, align 4
  %63 = xor i32 %62, -1
  %64 = trunc i32 %63 to i16
  %65 = zext i16 %64 to i32
  %66 = and i32 %65, 255
  %67 = trunc i32 %66 to i8
  %68 = load i32, i32* @outcnt, align 4
  %69 = add i32 %68, 1
  store i32 %69, i32* @outcnt, align 4
  %70 = zext i32 %68 to i64
  %71 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %70
  store i8 %67, i8* %71, align 1
  %72 = load i32, i32* %5, align 4
  %73 = xor i32 %72, -1
  %74 = trunc i32 %73 to i16
  %75 = zext i16 %74 to i32
  %76 = ashr i32 %75, 8
  %77 = trunc i32 %76 to i8
  %78 = load i32, i32* @outcnt, align 4
  %79 = add i32 %78, 1
  store i32 %79, i32* @outcnt, align 4
  %80 = zext i32 %78 to i64
  %81 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %80
  store i8 %77, i8* %81, align 1
  br label %111

82:                                               ; preds = %58
  %83 = load i32, i32* %5, align 4
  %84 = xor i32 %83, -1
  %85 = trunc i32 %84 to i16
  %86 = zext i16 %85 to i32
  %87 = and i32 %86, 255
  %88 = trunc i32 %87 to i8
  %89 = load i32, i32* @outcnt, align 4
  %90 = add i32 %89, 1
  store i32 %90, i32* @outcnt, align 4
  %91 = zext i32 %89 to i64
  %92 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %91
  store i8 %88, i8* %92, align 1
  %93 = load i32, i32* @outcnt, align 4
  %94 = icmp eq i32 %93, 16384
  br i1 %94, label %95, label %96

95:                                               ; preds = %82
  call void @flush_outbuf()
  br label %96

96:                                               ; preds = %95, %82
  %97 = load i32, i32* %5, align 4
  %98 = xor i32 %97, -1
  %99 = trunc i32 %98 to i16
  %100 = zext i16 %99 to i32
  %101 = ashr i32 %100, 8
  %102 = trunc i32 %101 to i8
  %103 = load i32, i32* @outcnt, align 4
  %104 = add i32 %103, 1
  store i32 %104, i32* @outcnt, align 4
  %105 = zext i32 %103 to i64
  %106 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %105
  store i8 %102, i8* %106, align 1
  %107 = load i32, i32* @outcnt, align 4
  %108 = icmp eq i32 %107, 16384
  br i1 %108, label %109, label %110

109:                                              ; preds = %96
  call void @flush_outbuf()
  br label %110

110:                                              ; preds = %109, %96
  br label %111

111:                                              ; preds = %110, %61
  br label %112

112:                                              ; preds = %111, %3
  br label %113

113:                                              ; preds = %128, %112
  %114 = load i32, i32* %5, align 4
  %115 = add i32 %114, -1
  store i32 %115, i32* %5, align 4
  %116 = icmp ne i32 %114, 0
  br i1 %116, label %117, label %129

117:                                              ; preds = %113
  %118 = load i8*, i8** %4, align 8
  %119 = getelementptr inbounds i8, i8* %118, i32 1
  store i8* %119, i8** %4, align 8
  %120 = load i8, i8* %118, align 1
  %121 = load i32, i32* @outcnt, align 4
  %122 = add i32 %121, 1
  store i32 %122, i32* @outcnt, align 4
  %123 = zext i32 %121 to i64
  %124 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %123
  store i8 %120, i8* %124, align 1
  %125 = load i32, i32* @outcnt, align 4
  %126 = icmp eq i32 %125, 16384
  br i1 %126, label %127, label %128

127:                                              ; preds = %117
  call void @flush_outbuf()
  br label %128

128:                                              ; preds = %127, %117
  br label %113, !llvm.loop !7

129:                                              ; preds = %113
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @lm_init(i32 %0, i16* %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i16*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i16* %1, i16** %4, align 8
  %6 = load i32, i32* %3, align 4
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = load i32, i32* %3, align 4
  %10 = icmp sgt i32 %9, 9
  br i1 %10, label %11, label %12

11:                                               ; preds = %8, %2
  call void @gzip_error(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0)) #13
  unreachable

12:                                               ; preds = %8
  %13 = load i32, i32* %3, align 4
  store i32 %13, i32* @compr_level, align 4
  call void @llvm.memset.p0i8.i64(i8* align 1 bitcast (i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768) to i8*), i8 0, i64 65536, i1 false)
  store i64 4294967295, i64* @rsync_chunk_end, align 8
  store i64 0, i64* @rsync_sum, align 8
  %14 = load i32, i32* %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [10 x %struct.config], [10 x %struct.config]* @configuration_table, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.config, %struct.config* %16, i32 0, i32 1
  %18 = load i16, i16* %17, align 2
  %19 = zext i16 %18 to i32
  store i32 %19, i32* @max_lazy_match, align 4
  %20 = load i32, i32* %3, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [10 x %struct.config], [10 x %struct.config]* @configuration_table, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.config, %struct.config* %22, i32 0, i32 0
  %24 = load i16, i16* %23, align 8
  %25 = zext i16 %24 to i32
  store i32 %25, i32* @good_match, align 4
  %26 = load i32, i32* %3, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [10 x %struct.config], [10 x %struct.config]* @configuration_table, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.config, %struct.config* %28, i32 0, i32 2
  %30 = load i16, i16* %29, align 4
  %31 = zext i16 %30 to i32
  store i32 %31, i32* @nice_match, align 4
  %32 = load i32, i32* %3, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [10 x %struct.config], [10 x %struct.config]* @configuration_table, i64 0, i64 %33
  %35 = getelementptr inbounds %struct.config, %struct.config* %34, i32 0, i32 3
  %36 = load i16, i16* %35, align 2
  %37 = zext i16 %36 to i32
  store i32 %37, i32* @max_chain_length, align 4
  %38 = load i32, i32* %3, align 4
  %39 = icmp eq i32 %38, 1
  br i1 %39, label %40, label %46

40:                                               ; preds = %12
  %41 = load i16*, i16** %4, align 8
  %42 = load i16, i16* %41, align 2
  %43 = zext i16 %42 to i32
  %44 = or i32 %43, 4
  %45 = trunc i32 %44 to i16
  store i16 %45, i16* %41, align 2
  br label %56

46:                                               ; preds = %12
  %47 = load i32, i32* %3, align 4
  %48 = icmp eq i32 %47, 9
  br i1 %48, label %49, label %55

49:                                               ; preds = %46
  %50 = load i16*, i16** %4, align 8
  %51 = load i16, i16* %50, align 2
  %52 = zext i16 %51 to i32
  %53 = or i32 %52, 2
  %54 = trunc i32 %53 to i16
  store i16 %54, i16* %50, align 2
  br label %55

55:                                               ; preds = %49, %46
  br label %56

56:                                               ; preds = %55, %40
  store i32 0, i32* @strstart, align 4
  store i64 0, i64* @block_start, align 8
  %57 = load i32 (i8*, i32)*, i32 (i8*, i32)** @read_buf, align 8
  %58 = call i32 %57(i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i32 65536)
  store i32 %58, i32* @lookahead, align 4
  %59 = load i32, i32* @lookahead, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %64, label %61

61:                                               ; preds = %56
  %62 = load i32, i32* @lookahead, align 4
  %63 = icmp eq i32 %62, -1
  br i1 %63, label %64, label %65

64:                                               ; preds = %61, %56
  store i32 1, i32* @eofile, align 4
  store i32 0, i32* @lookahead, align 4
  br label %93

65:                                               ; preds = %61
  store i32 0, i32* @eofile, align 4
  br label %66

66:                                               ; preds = %75, %65
  %67 = load i32, i32* @lookahead, align 4
  %68 = icmp ult i32 %67, 262
  br i1 %68, label %69, label %73

69:                                               ; preds = %66
  %70 = load i32, i32* @eofile, align 4
  %71 = icmp ne i32 %70, 0
  %72 = xor i1 %71, true
  br label %73

73:                                               ; preds = %69, %66
  %74 = phi i1 [ false, %66 ], [ %72, %69 ]
  br i1 %74, label %75, label %76

75:                                               ; preds = %73
  call void @fill_window()
  br label %66, !llvm.loop !8

76:                                               ; preds = %73
  store i32 0, i32* @ins_h, align 4
  store i32 0, i32* %5, align 4
  br label %77

77:                                               ; preds = %90, %76
  %78 = load i32, i32* %5, align 4
  %79 = icmp ult i32 %78, 2
  br i1 %79, label %80, label %93

80:                                               ; preds = %77
  %81 = load i32, i32* @ins_h, align 4
  %82 = shl i32 %81, 5
  %83 = load i32, i32* %5, align 4
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %84
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i32
  %88 = xor i32 %82, %87
  %89 = and i32 %88, 32767
  store i32 %89, i32* @ins_h, align 4
  br label %90

90:                                               ; preds = %80
  %91 = load i32, i32* %5, align 4
  %92 = add i32 %91, 1
  store i32 %92, i32* %5, align 4
  br label %77, !llvm.loop !9

93:                                               ; preds = %77, %64
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @fill_window() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = load i64, i64* @window_size, align 8
  %5 = load i32, i32* @lookahead, align 4
  %6 = zext i32 %5 to i64
  %7 = sub i64 %4, %6
  %8 = load i32, i32* @strstart, align 4
  %9 = zext i32 %8 to i64
  %10 = sub i64 %7, %9
  %11 = trunc i64 %10 to i32
  store i32 %11, i32* %3, align 4
  %12 = load i32, i32* %3, align 4
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

14:                                               ; preds = %0
  %15 = load i32, i32* %3, align 4
  %16 = add i32 %15, -1
  store i32 %16, i32* %3, align 4
  br label %86

17:                                               ; preds = %0
  %18 = load i32, i32* @strstart, align 4
  %19 = icmp uge i32 %18, 65274
  br i1 %19, label %20, label %85

20:                                               ; preds = %17
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i8* align 1 getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 32768), i64 32768, i1 false)
  %21 = load i32, i32* @match_start, align 4
  %22 = sub i32 %21, 32768
  store i32 %22, i32* @match_start, align 4
  %23 = load i32, i32* @strstart, align 4
  %24 = sub i32 %23, 32768
  store i32 %24, i32* @strstart, align 4
  %25 = load i64, i64* @rsync_chunk_end, align 8
  %26 = icmp ne i64 %25, 4294967295
  br i1 %26, label %27, label %30

27:                                               ; preds = %20
  %28 = load i64, i64* @rsync_chunk_end, align 8
  %29 = sub i64 %28, 32768
  store i64 %29, i64* @rsync_chunk_end, align 8
  br label %30

30:                                               ; preds = %27, %20
  %31 = load i64, i64* @block_start, align 8
  %32 = sub nsw i64 %31, 32768
  store i64 %32, i64* @block_start, align 8
  store i32 0, i32* %1, align 4
  br label %33

33:                                               ; preds = %54, %30
  %34 = load i32, i32* %1, align 4
  %35 = icmp ult i32 %34, 32768
  br i1 %35, label %36, label %57

36:                                               ; preds = %33
  %37 = load i32, i32* %1, align 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %38
  %40 = load i16, i16* %39, align 2
  %41 = zext i16 %40 to i32
  store i32 %41, i32* %2, align 4
  %42 = load i32, i32* %2, align 4
  %43 = icmp uge i32 %42, 32768
  br i1 %43, label %44, label %47

44:                                               ; preds = %36
  %45 = load i32, i32* %2, align 4
  %46 = sub i32 %45, 32768
  br label %48

47:                                               ; preds = %36
  br label %48

48:                                               ; preds = %47, %44
  %49 = phi i32 [ %46, %44 ], [ 0, %47 ]
  %50 = trunc i32 %49 to i16
  %51 = load i32, i32* %1, align 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %52
  store i16 %50, i16* %53, align 2
  br label %54

54:                                               ; preds = %48
  %55 = load i32, i32* %1, align 4
  %56 = add i32 %55, 1
  store i32 %56, i32* %1, align 4
  br label %33, !llvm.loop !10

57:                                               ; preds = %33
  store i32 0, i32* %1, align 4
  br label %58

58:                                               ; preds = %79, %57
  %59 = load i32, i32* %1, align 4
  %60 = icmp ult i32 %59, 32768
  br i1 %60, label %61, label %82

61:                                               ; preds = %58
  %62 = load i32, i32* %1, align 4
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %63
  %65 = load i16, i16* %64, align 2
  %66 = zext i16 %65 to i32
  store i32 %66, i32* %2, align 4
  %67 = load i32, i32* %2, align 4
  %68 = icmp uge i32 %67, 32768
  br i1 %68, label %69, label %72

69:                                               ; preds = %61
  %70 = load i32, i32* %2, align 4
  %71 = sub i32 %70, 32768
  br label %73

72:                                               ; preds = %61
  br label %73

73:                                               ; preds = %72, %69
  %74 = phi i32 [ %71, %69 ], [ 0, %72 ]
  %75 = trunc i32 %74 to i16
  %76 = load i32, i32* %1, align 4
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %77
  store i16 %75, i16* %78, align 2
  br label %79

79:                                               ; preds = %73
  %80 = load i32, i32* %1, align 4
  %81 = add i32 %80, 1
  store i32 %81, i32* %1, align 4
  br label %58, !llvm.loop !11

82:                                               ; preds = %58
  %83 = load i32, i32* %3, align 4
  %84 = add i32 %83, 32768
  store i32 %84, i32* %3, align 4
  br label %85

85:                                               ; preds = %82, %17
  br label %86

86:                                               ; preds = %85, %14
  %87 = load i32, i32* @eofile, align 4
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %116, label %89

89:                                               ; preds = %86
  %90 = load i32 (i8*, i32)*, i32 (i8*, i32)** @read_buf, align 8
  %91 = load i32, i32* @strstart, align 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i64 %92
  %94 = load i32, i32* @lookahead, align 4
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8* %93, i64 %95
  %97 = load i32, i32* %3, align 4
  %98 = call i32 %90(i8* %96, i32 %97)
  store i32 %98, i32* %1, align 4
  %99 = load i32, i32* %1, align 4
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %104, label %101

101:                                              ; preds = %89
  %102 = load i32, i32* %1, align 4
  %103 = icmp eq i32 %102, -1
  br i1 %103, label %104, label %111

104:                                              ; preds = %101, %89
  store i32 1, i32* @eofile, align 4
  %105 = load i32, i32* @strstart, align 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i64 %106
  %108 = load i32, i32* @lookahead, align 4
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds i8, i8* %107, i64 %109
  call void @llvm.memset.p0i8.i64(i8* align 1 %110, i8 0, i64 2, i1 false)
  br label %115

111:                                              ; preds = %101
  %112 = load i32, i32* %1, align 4
  %113 = load i32, i32* @lookahead, align 4
  %114 = add i32 %113, %112
  store i32 %114, i32* @lookahead, align 4
  br label %115

115:                                              ; preds = %111, %104
  br label %116

116:                                              ; preds = %115, %86
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @deflate() #0 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 2, i32* %6, align 4
  %7 = load i32, i32* @compr_level, align 4
  %8 = icmp sle i32 %7, 3
  br i1 %8, label %9, label %11

9:                                                ; preds = %0
  %10 = call i64 @deflate_fast()
  store i64 %10, i64* %1, align 8
  br label %315

11:                                               ; preds = %0
  br label %12

12:                                               ; preds = %285, %11
  %13 = load i32, i32* @lookahead, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %286

15:                                               ; preds = %12
  %16 = load i32, i32* @ins_h, align 4
  %17 = shl i32 %16, 5
  %18 = load i32, i32* @strstart, align 4
  %19 = add i32 %18, 3
  %20 = sub i32 %19, 1
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = xor i32 %17, %24
  %26 = and i32 %25, 32767
  store i32 %26, i32* @ins_h, align 4
  %27 = load i32, i32* @ins_h, align 4
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %28
  %30 = load i16, i16* %29, align 2
  %31 = zext i16 %30 to i32
  store i32 %31, i32* %2, align 4
  %32 = trunc i32 %31 to i16
  %33 = load i32, i32* @strstart, align 4
  %34 = and i32 %33, 32767
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %35
  store i16 %32, i16* %36, align 2
  %37 = load i32, i32* @strstart, align 4
  %38 = trunc i32 %37 to i16
  %39 = load i32, i32* @ins_h, align 4
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %40
  store i16 %38, i16* %41, align 2
  %42 = load i32, i32* %6, align 4
  store i32 %42, i32* @prev_length, align 4
  %43 = load i32, i32* @match_start, align 4
  store i32 %43, i32* %3, align 4
  store i32 2, i32* %6, align 4
  %44 = load i32, i32* %2, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %81

46:                                               ; preds = %15
  %47 = load i32, i32* @prev_length, align 4
  %48 = load i32, i32* @max_lazy_match, align 4
  %49 = icmp ult i32 %47, %48
  br i1 %49, label %50, label %81

50:                                               ; preds = %46
  %51 = load i32, i32* @strstart, align 4
  %52 = load i32, i32* %2, align 4
  %53 = sub i32 %51, %52
  %54 = icmp ule i32 %53, 32506
  br i1 %54, label %55, label %81

55:                                               ; preds = %50
  %56 = load i32, i32* @strstart, align 4
  %57 = zext i32 %56 to i64
  %58 = load i64, i64* @window_size, align 8
  %59 = sub i64 %58, 262
  %60 = icmp ule i64 %57, %59
  br i1 %60, label %61, label %81

61:                                               ; preds = %55
  %62 = load i32, i32* %2, align 4
  %63 = call i32 @longest_match(i32 %62)
  store i32 %63, i32* %6, align 4
  %64 = load i32, i32* %6, align 4
  %65 = load i32, i32* @lookahead, align 4
  %66 = icmp ugt i32 %64, %65
  br i1 %66, label %67, label %69

67:                                               ; preds = %61
  %68 = load i32, i32* @lookahead, align 4
  store i32 %68, i32* %6, align 4
  br label %69

69:                                               ; preds = %67, %61
  %70 = load i32, i32* %6, align 4
  %71 = icmp eq i32 %70, 3
  br i1 %71, label %72, label %80

72:                                               ; preds = %69
  %73 = load i32, i32* @strstart, align 4
  %74 = load i32, i32* @match_start, align 4
  %75 = sub i32 %73, %74
  %76 = icmp ugt i32 %75, 4096
  br i1 %76, label %77, label %80

77:                                               ; preds = %72
  %78 = load i32, i32* %6, align 4
  %79 = add i32 %78, -1
  store i32 %79, i32* %6, align 4
  br label %80

80:                                               ; preds = %77, %72, %69
  br label %81

81:                                               ; preds = %80, %55, %50, %46, %15
  %82 = load i32, i32* @prev_length, align 4
  %83 = icmp uge i32 %82, 3
  br i1 %83, label %84, label %179

84:                                               ; preds = %81
  %85 = load i32, i32* %6, align 4
  %86 = load i32, i32* @prev_length, align 4
  %87 = icmp ule i32 %85, %86
  br i1 %87, label %88, label %179

88:                                               ; preds = %84
  %89 = load i32, i32* @strstart, align 4
  %90 = sub i32 %89, 1
  %91 = load i32, i32* %3, align 4
  %92 = sub i32 %90, %91
  %93 = load i32, i32* @prev_length, align 4
  %94 = sub i32 %93, 3
  %95 = call i32 @ct_tally(i32 %92, i32 %94)
  store i32 %95, i32* %4, align 4
  %96 = load i32, i32* @prev_length, align 4
  %97 = sub i32 %96, 1
  %98 = load i32, i32* @lookahead, align 4
  %99 = sub i32 %98, %97
  store i32 %99, i32* @lookahead, align 4
  %100 = load i32, i32* @prev_length, align 4
  %101 = sub i32 %100, 2
  store i32 %101, i32* @prev_length, align 4
  br label %102

102:                                              ; preds = %88
  %103 = load i32, i32* @rsync, align 4
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %105, label %109

105:                                              ; preds = %102
  %106 = load i32, i32* @strstart, align 4
  %107 = load i32, i32* @prev_length, align 4
  %108 = add i32 %107, 1
  call void @rsync_roll(i32 %106, i32 %108)
  br label %109

109:                                              ; preds = %105, %102
  br label %110

110:                                              ; preds = %109
  br label %111

111:                                              ; preds = %140, %110
  %112 = load i32, i32* @strstart, align 4
  %113 = add i32 %112, 1
  store i32 %113, i32* @strstart, align 4
  %114 = load i32, i32* @ins_h, align 4
  %115 = shl i32 %114, 5
  %116 = load i32, i32* @strstart, align 4
  %117 = add i32 %116, 3
  %118 = sub i32 %117, 1
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %119
  %121 = load i8, i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = xor i32 %115, %122
  %124 = and i32 %123, 32767
  store i32 %124, i32* @ins_h, align 4
  %125 = load i32, i32* @ins_h, align 4
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %126
  %128 = load i16, i16* %127, align 2
  %129 = zext i16 %128 to i32
  store i32 %129, i32* %2, align 4
  %130 = trunc i32 %129 to i16
  %131 = load i32, i32* @strstart, align 4
  %132 = and i32 %131, 32767
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %133
  store i16 %130, i16* %134, align 2
  %135 = load i32, i32* @strstart, align 4
  %136 = trunc i32 %135 to i16
  %137 = load i32, i32* @ins_h, align 4
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %138
  store i16 %136, i16* %139, align 2
  br label %140

140:                                              ; preds = %111
  %141 = load i32, i32* @prev_length, align 4
  %142 = add i32 %141, -1
  store i32 %142, i32* @prev_length, align 4
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %111, label %144, !llvm.loop !12

144:                                              ; preds = %140
  store i32 0, i32* %5, align 4
  store i32 2, i32* %6, align 4
  %145 = load i32, i32* @strstart, align 4
  %146 = add i32 %145, 1
  store i32 %146, i32* @strstart, align 4
  %147 = load i32, i32* @rsync, align 4
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %149, label %155

149:                                              ; preds = %144
  %150 = load i32, i32* @strstart, align 4
  %151 = zext i32 %150 to i64
  %152 = load i64, i64* @rsync_chunk_end, align 8
  %153 = icmp ugt i64 %151, %152
  br i1 %153, label %154, label %155

154:                                              ; preds = %149
  store i64 4294967295, i64* @rsync_chunk_end, align 8
  store i32 2, i32* %4, align 4
  br label %155

155:                                              ; preds = %154, %149, %144
  %156 = load i32, i32* %4, align 4
  %157 = icmp ne i32 %156, 0
  br i1 %157, label %158, label %178

158:                                              ; preds = %155
  %159 = load i64, i64* @block_start, align 8
  %160 = icmp sge i64 %159, 0
  br i1 %160, label %161, label %166

161:                                              ; preds = %158
  %162 = load i64, i64* @block_start, align 8
  %163 = trunc i64 %162 to i32
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %164
  br label %167

166:                                              ; preds = %158
  br label %167

167:                                              ; preds = %166, %161
  %168 = phi i8* [ %165, %161 ], [ null, %166 ]
  %169 = load i32, i32* @strstart, align 4
  %170 = zext i32 %169 to i64
  %171 = load i64, i64* @block_start, align 8
  %172 = sub nsw i64 %170, %171
  %173 = load i32, i32* %4, align 4
  %174 = sub nsw i32 %173, 1
  %175 = call i64 @flush_block(i8* %168, i64 %172, i32 %174, i32 0)
  %176 = load i32, i32* @strstart, align 4
  %177 = zext i32 %176 to i64
  store i64 %177, i64* @block_start, align 8
  br label %178

178:                                              ; preds = %167, %155
  br label %274

179:                                              ; preds = %84, %81
  %180 = load i32, i32* %5, align 4
  %181 = icmp ne i32 %180, 0
  br i1 %181, label %182, label %233

182:                                              ; preds = %179
  %183 = load i32, i32* @strstart, align 4
  %184 = sub i32 %183, 1
  %185 = zext i32 %184 to i64
  %186 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %185
  %187 = load i8, i8* %186, align 1
  %188 = zext i8 %187 to i32
  %189 = call i32 @ct_tally(i32 0, i32 %188)
  store i32 %189, i32* %4, align 4
  %190 = load i32, i32* @rsync, align 4
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %192, label %198

192:                                              ; preds = %182
  %193 = load i32, i32* @strstart, align 4
  %194 = zext i32 %193 to i64
  %195 = load i64, i64* @rsync_chunk_end, align 8
  %196 = icmp ugt i64 %194, %195
  br i1 %196, label %197, label %198

197:                                              ; preds = %192
  store i64 4294967295, i64* @rsync_chunk_end, align 8
  store i32 2, i32* %4, align 4
  br label %198

198:                                              ; preds = %197, %192, %182
  %199 = load i32, i32* %4, align 4
  %200 = icmp ne i32 %199, 0
  br i1 %200, label %201, label %221

201:                                              ; preds = %198
  %202 = load i64, i64* @block_start, align 8
  %203 = icmp sge i64 %202, 0
  br i1 %203, label %204, label %209

204:                                              ; preds = %201
  %205 = load i64, i64* @block_start, align 8
  %206 = trunc i64 %205 to i32
  %207 = zext i32 %206 to i64
  %208 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %207
  br label %210

209:                                              ; preds = %201
  br label %210

210:                                              ; preds = %209, %204
  %211 = phi i8* [ %208, %204 ], [ null, %209 ]
  %212 = load i32, i32* @strstart, align 4
  %213 = zext i32 %212 to i64
  %214 = load i64, i64* @block_start, align 8
  %215 = sub nsw i64 %213, %214
  %216 = load i32, i32* %4, align 4
  %217 = sub nsw i32 %216, 1
  %218 = call i64 @flush_block(i8* %211, i64 %215, i32 %217, i32 0)
  %219 = load i32, i32* @strstart, align 4
  %220 = zext i32 %219 to i64
  store i64 %220, i64* @block_start, align 8
  br label %221

221:                                              ; preds = %210, %198
  br label %222

222:                                              ; preds = %221
  %223 = load i32, i32* @rsync, align 4
  %224 = icmp ne i32 %223, 0
  br i1 %224, label %225, label %227

225:                                              ; preds = %222
  %226 = load i32, i32* @strstart, align 4
  call void @rsync_roll(i32 %226, i32 1)
  br label %227

227:                                              ; preds = %225, %222
  br label %228

228:                                              ; preds = %227
  %229 = load i32, i32* @strstart, align 4
  %230 = add i32 %229, 1
  store i32 %230, i32* @strstart, align 4
  %231 = load i32, i32* @lookahead, align 4
  %232 = add i32 %231, -1
  store i32 %232, i32* @lookahead, align 4
  br label %273

233:                                              ; preds = %179
  %234 = load i32, i32* @rsync, align 4
  %235 = icmp ne i32 %234, 0
  br i1 %235, label %236, label %261

236:                                              ; preds = %233
  %237 = load i32, i32* @strstart, align 4
  %238 = zext i32 %237 to i64
  %239 = load i64, i64* @rsync_chunk_end, align 8
  %240 = icmp ugt i64 %238, %239
  br i1 %240, label %241, label %261

241:                                              ; preds = %236
  store i64 4294967295, i64* @rsync_chunk_end, align 8
  store i32 2, i32* %4, align 4
  %242 = load i64, i64* @block_start, align 8
  %243 = icmp sge i64 %242, 0
  br i1 %243, label %244, label %249

244:                                              ; preds = %241
  %245 = load i64, i64* @block_start, align 8
  %246 = trunc i64 %245 to i32
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %247
  br label %250

249:                                              ; preds = %241
  br label %250

250:                                              ; preds = %249, %244
  %251 = phi i8* [ %248, %244 ], [ null, %249 ]
  %252 = load i32, i32* @strstart, align 4
  %253 = zext i32 %252 to i64
  %254 = load i64, i64* @block_start, align 8
  %255 = sub nsw i64 %253, %254
  %256 = load i32, i32* %4, align 4
  %257 = sub nsw i32 %256, 1
  %258 = call i64 @flush_block(i8* %251, i64 %255, i32 %257, i32 0)
  %259 = load i32, i32* @strstart, align 4
  %260 = zext i32 %259 to i64
  store i64 %260, i64* @block_start, align 8
  br label %261

261:                                              ; preds = %250, %236, %233
  store i32 1, i32* %5, align 4
  br label %262

262:                                              ; preds = %261
  %263 = load i32, i32* @rsync, align 4
  %264 = icmp ne i32 %263, 0
  br i1 %264, label %265, label %267

265:                                              ; preds = %262
  %266 = load i32, i32* @strstart, align 4
  call void @rsync_roll(i32 %266, i32 1)
  br label %267

267:                                              ; preds = %265, %262
  br label %268

268:                                              ; preds = %267
  %269 = load i32, i32* @strstart, align 4
  %270 = add i32 %269, 1
  store i32 %270, i32* @strstart, align 4
  %271 = load i32, i32* @lookahead, align 4
  %272 = add i32 %271, -1
  store i32 %272, i32* @lookahead, align 4
  br label %273

273:                                              ; preds = %268, %228
  br label %274

274:                                              ; preds = %273, %178
  br label %275

275:                                              ; preds = %284, %274
  %276 = load i32, i32* @lookahead, align 4
  %277 = icmp ult i32 %276, 262
  br i1 %277, label %278, label %282

278:                                              ; preds = %275
  %279 = load i32, i32* @eofile, align 4
  %280 = icmp ne i32 %279, 0
  %281 = xor i1 %280, true
  br label %282

282:                                              ; preds = %278, %275
  %283 = phi i1 [ false, %275 ], [ %281, %278 ]
  br i1 %283, label %284, label %285

284:                                              ; preds = %282
  call void @fill_window()
  br label %275, !llvm.loop !13

285:                                              ; preds = %282
  br label %12, !llvm.loop !14

286:                                              ; preds = %12
  %287 = load i32, i32* %5, align 4
  %288 = icmp ne i32 %287, 0
  br i1 %288, label %289, label %297

289:                                              ; preds = %286
  %290 = load i32, i32* @strstart, align 4
  %291 = sub i32 %290, 1
  %292 = zext i32 %291 to i64
  %293 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %292
  %294 = load i8, i8* %293, align 1
  %295 = zext i8 %294 to i32
  %296 = call i32 @ct_tally(i32 0, i32 %295)
  br label %297

297:                                              ; preds = %289, %286
  %298 = load i64, i64* @block_start, align 8
  %299 = icmp sge i64 %298, 0
  br i1 %299, label %300, label %305

300:                                              ; preds = %297
  %301 = load i64, i64* @block_start, align 8
  %302 = trunc i64 %301 to i32
  %303 = zext i32 %302 to i64
  %304 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %303
  br label %306

305:                                              ; preds = %297
  br label %306

306:                                              ; preds = %305, %300
  %307 = phi i8* [ %304, %300 ], [ null, %305 ]
  %308 = load i32, i32* @strstart, align 4
  %309 = zext i32 %308 to i64
  %310 = load i64, i64* @block_start, align 8
  %311 = sub nsw i64 %309, %310
  %312 = load i32, i32* %4, align 4
  %313 = sub nsw i32 %312, 1
  %314 = call i64 @flush_block(i8* %307, i64 %311, i32 %313, i32 1)
  store i64 %314, i64* %1, align 8
  br label %315

315:                                              ; preds = %306, %9
  %316 = load i64, i64* %1, align 8
  ret i64 %316
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @deflate_fast() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 2, i32* @prev_length, align 4
  br label %4

4:                                                ; preds = %200, %0
  %5 = load i32, i32* @lookahead, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %201

7:                                                ; preds = %4
  %8 = load i32, i32* @ins_h, align 4
  %9 = shl i32 %8, 5
  %10 = load i32, i32* @strstart, align 4
  %11 = add i32 %10, 3
  %12 = sub i32 %11, 1
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = xor i32 %9, %16
  %18 = and i32 %17, 32767
  store i32 %18, i32* @ins_h, align 4
  %19 = load i32, i32* @ins_h, align 4
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %20
  %22 = load i16, i16* %21, align 2
  %23 = zext i16 %22 to i32
  store i32 %23, i32* %1, align 4
  %24 = trunc i32 %23 to i16
  %25 = load i32, i32* @strstart, align 4
  %26 = and i32 %25, 32767
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %27
  store i16 %24, i16* %28, align 2
  %29 = load i32, i32* @strstart, align 4
  %30 = trunc i32 %29 to i16
  %31 = load i32, i32* @ins_h, align 4
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %32
  store i16 %30, i16* %33, align 2
  %34 = load i32, i32* %1, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %56

36:                                               ; preds = %7
  %37 = load i32, i32* @strstart, align 4
  %38 = load i32, i32* %1, align 4
  %39 = sub i32 %37, %38
  %40 = icmp ule i32 %39, 32506
  br i1 %40, label %41, label %56

41:                                               ; preds = %36
  %42 = load i32, i32* @strstart, align 4
  %43 = zext i32 %42 to i64
  %44 = load i64, i64* @window_size, align 8
  %45 = sub i64 %44, 262
  %46 = icmp ule i64 %43, %45
  br i1 %46, label %47, label %56

47:                                               ; preds = %41
  %48 = load i32, i32* %1, align 4
  %49 = call i32 @longest_match(i32 %48)
  store i32 %49, i32* %3, align 4
  %50 = load i32, i32* %3, align 4
  %51 = load i32, i32* @lookahead, align 4
  %52 = icmp ugt i32 %50, %51
  br i1 %52, label %53, label %55

53:                                               ; preds = %47
  %54 = load i32, i32* @lookahead, align 4
  store i32 %54, i32* %3, align 4
  br label %55

55:                                               ; preds = %53, %47
  br label %56

56:                                               ; preds = %55, %41, %36, %7
  %57 = load i32, i32* %3, align 4
  %58 = icmp uge i32 %57, 3
  br i1 %58, label %59, label %139

59:                                               ; preds = %56
  %60 = load i32, i32* @strstart, align 4
  %61 = load i32, i32* @match_start, align 4
  %62 = sub i32 %60, %61
  %63 = load i32, i32* %3, align 4
  %64 = sub i32 %63, 3
  %65 = call i32 @ct_tally(i32 %62, i32 %64)
  store i32 %65, i32* %2, align 4
  %66 = load i32, i32* %3, align 4
  %67 = load i32, i32* @lookahead, align 4
  %68 = sub i32 %67, %66
  store i32 %68, i32* @lookahead, align 4
  br label %69

69:                                               ; preds = %59
  %70 = load i32, i32* @rsync, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %75

72:                                               ; preds = %69
  %73 = load i32, i32* @strstart, align 4
  %74 = load i32, i32* %3, align 4
  call void @rsync_roll(i32 %73, i32 %74)
  br label %75

75:                                               ; preds = %72, %69
  br label %76

76:                                               ; preds = %75
  %77 = load i32, i32* %3, align 4
  %78 = load i32, i32* @max_lazy_match, align 4
  %79 = icmp ule i32 %77, %78
  br i1 %79, label %80, label %119

80:                                               ; preds = %76
  %81 = load i32, i32* %3, align 4
  %82 = add i32 %81, -1
  store i32 %82, i32* %3, align 4
  br label %83

83:                                               ; preds = %112, %80
  %84 = load i32, i32* @strstart, align 4
  %85 = add i32 %84, 1
  store i32 %85, i32* @strstart, align 4
  %86 = load i32, i32* @ins_h, align 4
  %87 = shl i32 %86, 5
  %88 = load i32, i32* @strstart, align 4
  %89 = add i32 %88, 3
  %90 = sub i32 %89, 1
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %91
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = xor i32 %87, %94
  %96 = and i32 %95, 32767
  store i32 %96, i32* @ins_h, align 4
  %97 = load i32, i32* @ins_h, align 4
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %98
  %100 = load i16, i16* %99, align 2
  %101 = zext i16 %100 to i32
  store i32 %101, i32* %1, align 4
  %102 = trunc i32 %101 to i16
  %103 = load i32, i32* @strstart, align 4
  %104 = and i32 %103, 32767
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %105
  store i16 %102, i16* %106, align 2
  %107 = load i32, i32* @strstart, align 4
  %108 = trunc i32 %107 to i16
  %109 = load i32, i32* @ins_h, align 4
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %110
  store i16 %108, i16* %111, align 2
  br label %112

112:                                              ; preds = %83
  %113 = load i32, i32* %3, align 4
  %114 = add i32 %113, -1
  store i32 %114, i32* %3, align 4
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %83, label %116, !llvm.loop !15

116:                                              ; preds = %112
  %117 = load i32, i32* @strstart, align 4
  %118 = add i32 %117, 1
  store i32 %118, i32* @strstart, align 4
  br label %138

119:                                              ; preds = %76
  %120 = load i32, i32* %3, align 4
  %121 = load i32, i32* @strstart, align 4
  %122 = add i32 %121, %120
  store i32 %122, i32* @strstart, align 4
  store i32 0, i32* %3, align 4
  %123 = load i32, i32* @strstart, align 4
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %124
  %126 = load i8, i8* %125, align 1
  %127 = zext i8 %126 to i32
  store i32 %127, i32* @ins_h, align 4
  %128 = load i32, i32* @ins_h, align 4
  %129 = shl i32 %128, 5
  %130 = load i32, i32* @strstart, align 4
  %131 = add i32 %130, 1
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %132
  %134 = load i8, i8* %133, align 1
  %135 = zext i8 %134 to i32
  %136 = xor i32 %129, %135
  %137 = and i32 %136, 32767
  store i32 %137, i32* @ins_h, align 4
  br label %138

138:                                              ; preds = %119, %116
  br label %157

139:                                              ; preds = %56
  %140 = load i32, i32* @strstart, align 4
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %141
  %143 = load i8, i8* %142, align 1
  %144 = zext i8 %143 to i32
  %145 = call i32 @ct_tally(i32 0, i32 %144)
  store i32 %145, i32* %2, align 4
  br label %146

146:                                              ; preds = %139
  %147 = load i32, i32* @rsync, align 4
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %149, label %151

149:                                              ; preds = %146
  %150 = load i32, i32* @strstart, align 4
  call void @rsync_roll(i32 %150, i32 1)
  br label %151

151:                                              ; preds = %149, %146
  br label %152

152:                                              ; preds = %151
  %153 = load i32, i32* @lookahead, align 4
  %154 = add i32 %153, -1
  store i32 %154, i32* @lookahead, align 4
  %155 = load i32, i32* @strstart, align 4
  %156 = add i32 %155, 1
  store i32 %156, i32* @strstart, align 4
  br label %157

157:                                              ; preds = %152, %138
  %158 = load i32, i32* @rsync, align 4
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %160, label %166

160:                                              ; preds = %157
  %161 = load i32, i32* @strstart, align 4
  %162 = zext i32 %161 to i64
  %163 = load i64, i64* @rsync_chunk_end, align 8
  %164 = icmp ugt i64 %162, %163
  br i1 %164, label %165, label %166

165:                                              ; preds = %160
  store i64 4294967295, i64* @rsync_chunk_end, align 8
  store i32 2, i32* %2, align 4
  br label %166

166:                                              ; preds = %165, %160, %157
  %167 = load i32, i32* %2, align 4
  %168 = icmp ne i32 %167, 0
  br i1 %168, label %169, label %189

169:                                              ; preds = %166
  %170 = load i64, i64* @block_start, align 8
  %171 = icmp sge i64 %170, 0
  br i1 %171, label %172, label %177

172:                                              ; preds = %169
  %173 = load i64, i64* @block_start, align 8
  %174 = trunc i64 %173 to i32
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %175
  br label %178

177:                                              ; preds = %169
  br label %178

178:                                              ; preds = %177, %172
  %179 = phi i8* [ %176, %172 ], [ null, %177 ]
  %180 = load i32, i32* @strstart, align 4
  %181 = zext i32 %180 to i64
  %182 = load i64, i64* @block_start, align 8
  %183 = sub nsw i64 %181, %182
  %184 = load i32, i32* %2, align 4
  %185 = sub nsw i32 %184, 1
  %186 = call i64 @flush_block(i8* %179, i64 %183, i32 %185, i32 0)
  %187 = load i32, i32* @strstart, align 4
  %188 = zext i32 %187 to i64
  store i64 %188, i64* @block_start, align 8
  br label %189

189:                                              ; preds = %178, %166
  br label %190

190:                                              ; preds = %199, %189
  %191 = load i32, i32* @lookahead, align 4
  %192 = icmp ult i32 %191, 262
  br i1 %192, label %193, label %197

193:                                              ; preds = %190
  %194 = load i32, i32* @eofile, align 4
  %195 = icmp ne i32 %194, 0
  %196 = xor i1 %195, true
  br label %197

197:                                              ; preds = %193, %190
  %198 = phi i1 [ false, %190 ], [ %196, %193 ]
  br i1 %198, label %199, label %200

199:                                              ; preds = %197
  call void @fill_window()
  br label %190, !llvm.loop !16

200:                                              ; preds = %197
  br label %4, !llvm.loop !17

201:                                              ; preds = %4
  %202 = load i64, i64* @block_start, align 8
  %203 = icmp sge i64 %202, 0
  br i1 %203, label %204, label %209

204:                                              ; preds = %201
  %205 = load i64, i64* @block_start, align 8
  %206 = trunc i64 %205 to i32
  %207 = zext i32 %206 to i64
  %208 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %207
  br label %210

209:                                              ; preds = %201
  br label %210

210:                                              ; preds = %209, %204
  %211 = phi i8* [ %208, %204 ], [ null, %209 ]
  %212 = load i32, i32* @strstart, align 4
  %213 = zext i32 %212 to i64
  %214 = load i64, i64* @block_start, align 8
  %215 = sub nsw i64 %213, %214
  %216 = load i32, i32* %2, align 4
  %217 = sub nsw i32 %216, 1
  %218 = call i64 @flush_block(i8* %211, i64 %215, i32 %217, i32 1)
  ret i64 %218
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @longest_match(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  store i32 %0, i32* %2, align 4
  %12 = load i32, i32* @max_chain_length, align 4
  store i32 %12, i32* %3, align 4
  %13 = load i32, i32* @strstart, align 4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i64 %14
  store i8* %15, i8** %4, align 8
  %16 = load i32, i32* @prev_length, align 4
  store i32 %16, i32* %7, align 4
  %17 = load i32, i32* @strstart, align 4
  %18 = icmp ugt i32 %17, 32506
  br i1 %18, label %19, label %22

19:                                               ; preds = %1
  %20 = load i32, i32* @strstart, align 4
  %21 = sub i32 %20, 32506
  br label %23

22:                                               ; preds = %1
  br label %23

23:                                               ; preds = %22, %19
  %24 = phi i32 [ %21, %19 ], [ 0, %22 ]
  store i32 %24, i32* %8, align 4
  %25 = load i32, i32* @strstart, align 4
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i64 %26
  %28 = getelementptr inbounds i8, i8* %27, i64 258
  store i8* %28, i8** %9, align 8
  %29 = load i8*, i8** %4, align 8
  %30 = load i32, i32* %7, align 4
  %31 = sub nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8* %29, i64 %32
  %34 = load i8, i8* %33, align 1
  store i8 %34, i8* %10, align 1
  %35 = load i8*, i8** %4, align 8
  %36 = load i32, i32* %7, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8* %35, i64 %37
  %39 = load i8, i8* %38, align 1
  store i8 %39, i8* %11, align 1
  %40 = load i32, i32* @prev_length, align 4
  %41 = load i32, i32* @good_match, align 4
  %42 = icmp uge i32 %40, %41
  br i1 %42, label %43, label %46

43:                                               ; preds = %23
  %44 = load i32, i32* %3, align 4
  %45 = lshr i32 %44, 2
  store i32 %45, i32* %3, align 4
  br label %46

46:                                               ; preds = %43, %23
  br label %47

47:                                               ; preds = %228, %46
  %48 = load i32, i32* %2, align 4
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i64 %49
  store i8* %50, i8** %5, align 8
  %51 = load i8*, i8** %5, align 8
  %52 = load i32, i32* %7, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %51, i64 %53
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = load i8, i8* %11, align 1
  %58 = zext i8 %57 to i32
  %59 = icmp ne i32 %56, %58
  br i1 %59, label %89, label %60

60:                                               ; preds = %47
  %61 = load i8*, i8** %5, align 8
  %62 = load i32, i32* %7, align 4
  %63 = sub nsw i32 %62, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, i8* %61, i64 %64
  %66 = load i8, i8* %65, align 1
  %67 = zext i8 %66 to i32
  %68 = load i8, i8* %10, align 1
  %69 = zext i8 %68 to i32
  %70 = icmp ne i32 %67, %69
  br i1 %70, label %89, label %71

71:                                               ; preds = %60
  %72 = load i8*, i8** %5, align 8
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = load i8*, i8** %4, align 8
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i32
  %78 = icmp ne i32 %74, %77
  br i1 %78, label %89, label %79

79:                                               ; preds = %71
  %80 = load i8*, i8** %5, align 8
  %81 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %81, i8** %5, align 8
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = load i8*, i8** %4, align 8
  %85 = getelementptr inbounds i8, i8* %84, i64 1
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i32
  %88 = icmp ne i32 %83, %87
  br i1 %88, label %89, label %90

89:                                               ; preds = %79, %71, %60, %47
  br label %215

90:                                               ; preds = %79
  %91 = load i8*, i8** %4, align 8
  %92 = getelementptr inbounds i8, i8* %91, i64 2
  store i8* %92, i8** %4, align 8
  %93 = load i8*, i8** %5, align 8
  %94 = getelementptr inbounds i8, i8* %93, i32 1
  store i8* %94, i8** %5, align 8
  br label %95

95:                                               ; preds = %180, %90
  br label %96

96:                                               ; preds = %95
  %97 = load i8*, i8** %4, align 8
  %98 = getelementptr inbounds i8, i8* %97, i32 1
  store i8* %98, i8** %4, align 8
  %99 = load i8, i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = load i8*, i8** %5, align 8
  %102 = getelementptr inbounds i8, i8* %101, i32 1
  store i8* %102, i8** %5, align 8
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = icmp eq i32 %100, %104
  br i1 %105, label %106, label %180

106:                                              ; preds = %96
  %107 = load i8*, i8** %4, align 8
  %108 = getelementptr inbounds i8, i8* %107, i32 1
  store i8* %108, i8** %4, align 8
  %109 = load i8, i8* %108, align 1
  %110 = zext i8 %109 to i32
  %111 = load i8*, i8** %5, align 8
  %112 = getelementptr inbounds i8, i8* %111, i32 1
  store i8* %112, i8** %5, align 8
  %113 = load i8, i8* %112, align 1
  %114 = zext i8 %113 to i32
  %115 = icmp eq i32 %110, %114
  br i1 %115, label %116, label %180

116:                                              ; preds = %106
  %117 = load i8*, i8** %4, align 8
  %118 = getelementptr inbounds i8, i8* %117, i32 1
  store i8* %118, i8** %4, align 8
  %119 = load i8, i8* %118, align 1
  %120 = zext i8 %119 to i32
  %121 = load i8*, i8** %5, align 8
  %122 = getelementptr inbounds i8, i8* %121, i32 1
  store i8* %122, i8** %5, align 8
  %123 = load i8, i8* %122, align 1
  %124 = zext i8 %123 to i32
  %125 = icmp eq i32 %120, %124
  br i1 %125, label %126, label %180

126:                                              ; preds = %116
  %127 = load i8*, i8** %4, align 8
  %128 = getelementptr inbounds i8, i8* %127, i32 1
  store i8* %128, i8** %4, align 8
  %129 = load i8, i8* %128, align 1
  %130 = zext i8 %129 to i32
  %131 = load i8*, i8** %5, align 8
  %132 = getelementptr inbounds i8, i8* %131, i32 1
  store i8* %132, i8** %5, align 8
  %133 = load i8, i8* %132, align 1
  %134 = zext i8 %133 to i32
  %135 = icmp eq i32 %130, %134
  br i1 %135, label %136, label %180

136:                                              ; preds = %126
  %137 = load i8*, i8** %4, align 8
  %138 = getelementptr inbounds i8, i8* %137, i32 1
  store i8* %138, i8** %4, align 8
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = load i8*, i8** %5, align 8
  %142 = getelementptr inbounds i8, i8* %141, i32 1
  store i8* %142, i8** %5, align 8
  %143 = load i8, i8* %142, align 1
  %144 = zext i8 %143 to i32
  %145 = icmp eq i32 %140, %144
  br i1 %145, label %146, label %180

146:                                              ; preds = %136
  %147 = load i8*, i8** %4, align 8
  %148 = getelementptr inbounds i8, i8* %147, i32 1
  store i8* %148, i8** %4, align 8
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = load i8*, i8** %5, align 8
  %152 = getelementptr inbounds i8, i8* %151, i32 1
  store i8* %152, i8** %5, align 8
  %153 = load i8, i8* %152, align 1
  %154 = zext i8 %153 to i32
  %155 = icmp eq i32 %150, %154
  br i1 %155, label %156, label %180

156:                                              ; preds = %146
  %157 = load i8*, i8** %4, align 8
  %158 = getelementptr inbounds i8, i8* %157, i32 1
  store i8* %158, i8** %4, align 8
  %159 = load i8, i8* %158, align 1
  %160 = zext i8 %159 to i32
  %161 = load i8*, i8** %5, align 8
  %162 = getelementptr inbounds i8, i8* %161, i32 1
  store i8* %162, i8** %5, align 8
  %163 = load i8, i8* %162, align 1
  %164 = zext i8 %163 to i32
  %165 = icmp eq i32 %160, %164
  br i1 %165, label %166, label %180

166:                                              ; preds = %156
  %167 = load i8*, i8** %4, align 8
  %168 = getelementptr inbounds i8, i8* %167, i32 1
  store i8* %168, i8** %4, align 8
  %169 = load i8, i8* %168, align 1
  %170 = zext i8 %169 to i32
  %171 = load i8*, i8** %5, align 8
  %172 = getelementptr inbounds i8, i8* %171, i32 1
  store i8* %172, i8** %5, align 8
  %173 = load i8, i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = icmp eq i32 %170, %174
  br i1 %175, label %176, label %180

176:                                              ; preds = %166
  %177 = load i8*, i8** %4, align 8
  %178 = load i8*, i8** %9, align 8
  %179 = icmp ult i8* %177, %178
  br label %180

180:                                              ; preds = %176, %166, %156, %146, %136, %126, %116, %106, %96
  %181 = phi i1 [ false, %166 ], [ false, %156 ], [ false, %146 ], [ false, %136 ], [ false, %126 ], [ false, %116 ], [ false, %106 ], [ false, %96 ], [ %179, %176 ]
  br i1 %181, label %95, label %182, !llvm.loop !18

182:                                              ; preds = %180
  %183 = load i8*, i8** %9, align 8
  %184 = load i8*, i8** %4, align 8
  %185 = ptrtoint i8* %183 to i64
  %186 = ptrtoint i8* %184 to i64
  %187 = sub i64 %185, %186
  %188 = trunc i64 %187 to i32
  %189 = sub nsw i32 258, %188
  store i32 %189, i32* %6, align 4
  %190 = load i8*, i8** %9, align 8
  %191 = getelementptr inbounds i8, i8* %190, i64 -258
  store i8* %191, i8** %4, align 8
  %192 = load i32, i32* %6, align 4
  %193 = load i32, i32* %7, align 4
  %194 = icmp sgt i32 %192, %193
  br i1 %194, label %195, label %214

195:                                              ; preds = %182
  %196 = load i32, i32* %2, align 4
  store i32 %196, i32* @match_start, align 4
  %197 = load i32, i32* %6, align 4
  store i32 %197, i32* %7, align 4
  %198 = load i32, i32* %6, align 4
  %199 = load i32, i32* @nice_match, align 4
  %200 = icmp sge i32 %198, %199
  br i1 %200, label %201, label %202

201:                                              ; preds = %195
  br label %230

202:                                              ; preds = %195
  %203 = load i8*, i8** %4, align 8
  %204 = load i32, i32* %7, align 4
  %205 = sub nsw i32 %204, 1
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds i8, i8* %203, i64 %206
  %208 = load i8, i8* %207, align 1
  store i8 %208, i8* %10, align 1
  %209 = load i8*, i8** %4, align 8
  %210 = load i32, i32* %7, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds i8, i8* %209, i64 %211
  %213 = load i8, i8* %212, align 1
  store i8 %213, i8* %11, align 1
  br label %214

214:                                              ; preds = %202, %182
  br label %215

215:                                              ; preds = %214, %89
  %216 = load i32, i32* %2, align 4
  %217 = and i32 %216, 32767
  %218 = zext i32 %217 to i64
  %219 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %218
  %220 = load i16, i16* %219, align 2
  %221 = zext i16 %220 to i32
  store i32 %221, i32* %2, align 4
  %222 = load i32, i32* %8, align 4
  %223 = icmp ugt i32 %221, %222
  br i1 %223, label %224, label %228

224:                                              ; preds = %215
  %225 = load i32, i32* %3, align 4
  %226 = add i32 %225, -1
  store i32 %226, i32* %3, align 4
  %227 = icmp ne i32 %226, 0
  br label %228

228:                                              ; preds = %224, %215
  %229 = phi i1 [ false, %215 ], [ %227, %224 ]
  br i1 %229, label %47, label %230, !llvm.loop !19

230:                                              ; preds = %228, %201
  %231 = load i32, i32* %7, align 4
  ret i32 %231
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @rsync_roll(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %6 = load i32, i32* %3, align 4
  %7 = icmp ult i32 %6, 4096
  br i1 %7, label %8, label %36

8:                                                ; preds = %2
  %9 = load i32, i32* %3, align 4
  store i32 %9, i32* %5, align 4
  br label %10

10:                                               ; preds = %28, %8
  %11 = load i32, i32* %5, align 4
  %12 = icmp ult i32 %11, 4096
  br i1 %12, label %13, label %31

13:                                               ; preds = %10
  %14 = load i32, i32* %5, align 4
  %15 = load i32, i32* %3, align 4
  %16 = load i32, i32* %4, align 4
  %17 = add i32 %15, %16
  %18 = icmp eq i32 %14, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %13
  br label %73

20:                                               ; preds = %13
  %21 = load i32, i32* %5, align 4
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %22
  %24 = load i8, i8* %23, align 1
  %25 = zext i8 %24 to i64
  %26 = load i64, i64* @rsync_sum, align 8
  %27 = add i64 %26, %25
  store i64 %27, i64* @rsync_sum, align 8
  br label %28

28:                                               ; preds = %20
  %29 = load i32, i32* %5, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %5, align 4
  br label %10, !llvm.loop !20

31:                                               ; preds = %10
  %32 = load i32, i32* %3, align 4
  %33 = sub i32 4096, %32
  %34 = load i32, i32* %4, align 4
  %35 = sub i32 %34, %33
  store i32 %35, i32* %4, align 4
  store i32 4096, i32* %3, align 4
  br label %36

36:                                               ; preds = %31, %2
  %37 = load i32, i32* %3, align 4
  store i32 %37, i32* %5, align 4
  br label %38

38:                                               ; preds = %70, %36
  %39 = load i32, i32* %5, align 4
  %40 = load i32, i32* %3, align 4
  %41 = load i32, i32* %4, align 4
  %42 = add i32 %40, %41
  %43 = icmp ult i32 %39, %42
  br i1 %43, label %44, label %73

44:                                               ; preds = %38
  %45 = load i32, i32* %5, align 4
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i64
  %50 = load i64, i64* @rsync_sum, align 8
  %51 = add i64 %50, %49
  store i64 %51, i64* @rsync_sum, align 8
  %52 = load i32, i32* %5, align 4
  %53 = sub i32 %52, 4096
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i64
  %58 = load i64, i64* @rsync_sum, align 8
  %59 = sub i64 %58, %57
  store i64 %59, i64* @rsync_sum, align 8
  %60 = load i64, i64* @rsync_chunk_end, align 8
  %61 = icmp eq i64 %60, 4294967295
  br i1 %61, label %62, label %69

62:                                               ; preds = %44
  %63 = load i64, i64* @rsync_sum, align 8
  %64 = urem i64 %63, 4096
  %65 = icmp eq i64 %64, 0
  br i1 %65, label %66, label %69

66:                                               ; preds = %62
  %67 = load i32, i32* %5, align 4
  %68 = zext i32 %67 to i64
  store i64 %68, i64* @rsync_chunk_end, align 8
  br label %69

69:                                               ; preds = %66, %62, %44
  br label %70

70:                                               ; preds = %69
  %71 = load i32, i32* %5, align 4
  %72 = add i32 %71, 1
  store i32 %72, i32* %5, align 4
  br label %38, !llvm.loop !21

73:                                               ; preds = %38, %19
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i8**, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8**, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %13 = load i8**, i8*** %5, align 8
  %14 = getelementptr inbounds i8*, i8** %13, i64 0
  %15 = load i8*, i8** %14, align 8
  %16 = call i8* @gzip_base_name(i8* %15) #14
  store i8* %16, i8** @program_name, align 8
  %17 = load i8*, i8** @program_name, align 8
  %18 = call i64 @strlen(i8* %17) #14
  store i64 %18, i64* %7, align 8
  %19 = load i64, i64* %7, align 8
  %20 = icmp ult i64 4, %19
  br i1 %20, label %21, label %33

21:                                               ; preds = %2
  %22 = load i8*, i8** @program_name, align 8
  %23 = load i64, i64* %7, align 8
  %24 = getelementptr inbounds i8, i8* %22, i64 %23
  %25 = getelementptr inbounds i8, i8* %24, i64 -4
  %26 = call i32 @strcmp(i8* %25, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)) #14
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %33

28:                                               ; preds = %21
  %29 = load i8*, i8** @program_name, align 8
  %30 = load i64, i64* %7, align 8
  %31 = sub i64 %30, 4
  %32 = getelementptr inbounds i8, i8* %29, i64 %31
  store i8 0, i8* %32, align 1
  br label %33

33:                                               ; preds = %28, %21, %2
  %34 = load i8**, i8*** %5, align 8
  store i8** %34, i8*** %8, align 8
  %35 = call i8* @add_envopt(i32* %9, i8*** %8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1.2, i64 0, i64 0))
  store i8* %35, i8** @env, align 8
  %36 = load i8*, i8** @env, align 8
  %37 = icmp ne i8* %36, null
  br i1 %37, label %38, label %40

38:                                               ; preds = %33
  %39 = load i8**, i8*** %8, align 8
  br label %41

40:                                               ; preds = %33
  br label %41

41:                                               ; preds = %40, %38
  %42 = phi i8** [ %39, %38 ], [ null, %40 ]
  store i8** %42, i8*** %10, align 8
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i8** @z_suffix, align 8
  %43 = load i8*, i8** @z_suffix, align 8
  %44 = call i64 @strlen(i8* %43) #14
  store i64 %44, i64* @z_len, align 8
  br label %45

45:                                               ; preds = %207, %41
  store i32 -1, i32* %12, align 4
  %46 = load i8**, i8*** %10, align 8
  %47 = icmp ne i8** %46, null
  br i1 %47, label %48, label %101

48:                                               ; preds = %45
  %49 = load i8**, i8*** %10, align 8
  %50 = load i32, i32* @optind, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8*, i8** %49, i64 %51
  %53 = load i8*, i8** %52, align 8
  %54 = icmp ne i8* %53, null
  br i1 %54, label %55, label %64

55:                                               ; preds = %48
  %56 = load i8**, i8*** %10, align 8
  %57 = load i32, i32* @optind, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i8*, i8** %56, i64 %58
  %60 = load i8*, i8** %59, align 8
  %61 = call i32 @strcmp(i8* %60, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #14
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %64

63:                                               ; preds = %55
  store i32 176, i32* %11, align 4
  br label %100

64:                                               ; preds = %55, %48
  %65 = load i32, i32* %9, align 4
  %66 = load i8**, i8*** %10, align 8
  %67 = call i32 @getopt_long(i32 %65, i8** %66, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @shortopts, i64 0, i64 0), %struct.option* getelementptr inbounds ([27 x %struct.option], [27 x %struct.option]* @longopts, i64 0, i64 0), i32* %12) #15
  store i32 %67, i32* %11, align 4
  %68 = load i32, i32* %11, align 4
  %69 = icmp sle i32 0, %68
  br i1 %69, label %70, label %73

70:                                               ; preds = %64
  %71 = load i32, i32* %11, align 4
  %72 = add nsw i32 %71, 131
  store i32 %72, i32* %11, align 4
  br label %99

73:                                               ; preds = %64
  %74 = load i32, i32* @optind, align 4
  %75 = load i32, i32* %9, align 4
  %76 = icmp ne i32 %74, %75
  br i1 %76, label %77, label %86

77:                                               ; preds = %73
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %79 = load i8*, i8** @program_name, align 8
  %80 = load i8**, i8*** %10, align 8
  %81 = load i32, i32* @optind, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8*, i8** %80, i64 %82
  %84 = load i8*, i8** %83, align 8
  %85 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.4, i64 0, i64 0), i8* %79, i8* %84)
  call void @try_help() #13
  unreachable

86:                                               ; preds = %73
  %87 = load i32, i32* %9, align 4
  %88 = icmp ne i32 %87, 1
  br i1 %88, label %89, label %96

89:                                               ; preds = %86
  %90 = load i32, i32* @quiet, align 4
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %96, label %92

92:                                               ; preds = %89
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %94 = load i8*, i8** @program_name, align 8
  %95 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.5, i64 0, i64 0), i8* %94)
  br label %96

96:                                               ; preds = %92, %89, %86
  %97 = load i8**, i8*** %10, align 8
  %98 = bitcast i8** %97 to i8*
  call void @free(i8* %98) #15
  store i8** null, i8*** %10, align 8
  store i32 1, i32* @optind, align 4
  store i32 -1, i32* %12, align 4
  br label %99

99:                                               ; preds = %96, %70
  br label %100

100:                                              ; preds = %99, %63
  br label %101

101:                                              ; preds = %100, %45
  %102 = load i8**, i8*** %10, align 8
  %103 = icmp ne i8** %102, null
  br i1 %103, label %108, label %104

104:                                              ; preds = %101
  %105 = load i32, i32* %4, align 4
  %106 = load i8**, i8*** %5, align 8
  %107 = call i32 @getopt_long(i32 %105, i8** %106, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @shortopts, i64 0, i64 0), %struct.option* getelementptr inbounds ([27 x %struct.option], [27 x %struct.option]* @longopts, i64 0, i64 0), i32* %12) #15
  store i32 %107, i32* %11, align 4
  br label %108

108:                                              ; preds = %104, %101
  %109 = load i32, i32* %11, align 4
  %110 = icmp slt i32 %109, 0
  br i1 %110, label %111, label %112

111:                                              ; preds = %108
  br label %208

112:                                              ; preds = %108
  %113 = load i32, i32* %11, align 4
  switch i32 %113, label %178 [
    i32 97, label %114
    i32 98, label %115
    i32 99, label %141
    i32 100, label %142
    i32 102, label %143
    i32 104, label %146
    i32 72, label %146
    i32 107, label %147
    i32 108, label %148
    i32 76, label %149
    i32 109, label %150
    i32 77, label %151
    i32 110, label %152
    i32 241, label %152
    i32 78, label %153
    i32 209, label %153
    i32 128, label %154
    i32 113, label %155
    i32 244, label %155
    i32 114, label %156
    i32 129, label %157
    i32 260, label %157
    i32 83, label %158
    i32 130, label %162
    i32 116, label %163
    i32 118, label %164
    i32 249, label %164
    i32 86, label %167
    i32 90, label %168
    i32 180, label %172
    i32 181, label %172
    i32 182, label %172
    i32 183, label %172
    i32 184, label %172
    i32 185, label %172
    i32 186, label %172
    i32 187, label %172
    i32 188, label %172
    i32 49, label %175
    i32 50, label %175
    i32 51, label %175
    i32 52, label %175
    i32 53, label %175
    i32 54, label %175
    i32 55, label %175
    i32 56, label %175
    i32 57, label %175
  ]

114:                                              ; preds = %112
  store i32 1, i32* @ascii, align 4
  br label %207

115:                                              ; preds = %112
  %116 = load i8*, i8** @optarg, align 8
  %117 = call i32 @atoi(i8* %116) #14
  store i32 %117, i32* @maxbits, align 4
  br label %118

118:                                              ; preds = %137, %115
  %119 = load i8*, i8** @optarg, align 8
  %120 = load i8, i8* %119, align 1
  %121 = icmp ne i8 %120, 0
  br i1 %121, label %122, label %140

122:                                              ; preds = %118
  %123 = load i8*, i8** @optarg, align 8
  %124 = load i8, i8* %123, align 1
  %125 = sext i8 %124 to i32
  %126 = icmp sle i32 48, %125
  br i1 %126, label %127, label %132

127:                                              ; preds = %122
  %128 = load i8*, i8** @optarg, align 8
  %129 = load i8, i8* %128, align 1
  %130 = sext i8 %129 to i32
  %131 = icmp sle i32 %130, 57
  br i1 %131, label %136, label %132

132:                                              ; preds = %127, %122
  %133 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %134 = load i8*, i8** @program_name, align 8
  %135 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %133, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i64 0, i64 0), i8* %134)
  call void @try_help() #13
  unreachable

136:                                              ; preds = %127
  br label %137

137:                                              ; preds = %136
  %138 = load i8*, i8** @optarg, align 8
  %139 = getelementptr inbounds i8, i8* %138, i32 1
  store i8* %139, i8** @optarg, align 8
  br label %118, !llvm.loop !22

140:                                              ; preds = %118
  br label %207

141:                                              ; preds = %112
  store i32 1, i32* @to_stdout, align 4
  br label %207

142:                                              ; preds = %112
  store i32 1, i32* @decompress, align 4
  br label %207

143:                                              ; preds = %112
  %144 = load i32, i32* @force, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, i32* @force, align 4
  br label %207

146:                                              ; preds = %112, %112
  call void @help()
  call void @finish_out()
  br label %207

147:                                              ; preds = %112
  store i32 1, i32* @keep, align 4
  br label %207

148:                                              ; preds = %112
  store i32 1, i32* @to_stdout, align 4
  store i32 1, i32* @decompress, align 4
  store i32 1, i32* @list, align 4
  br label %207

149:                                              ; preds = %112
  call void @license()
  call void @finish_out()
  br label %207

150:                                              ; preds = %112
  store i32 1, i32* @no_time, align 4
  br label %207

151:                                              ; preds = %112
  store i32 0, i32* @no_time, align 4
  br label %207

152:                                              ; preds = %112, %112
  store i32 1, i32* @no_time, align 4
  store i32 1, i32* @no_name, align 4
  br label %207

153:                                              ; preds = %112, %112
  store i32 0, i32* @no_time, align 4
  store i32 0, i32* @no_name, align 4
  br label %207

154:                                              ; preds = %112
  store i8 1, i8* @presume_input_tty, align 1
  br label %207

155:                                              ; preds = %112, %112
  store i32 1, i32* @quiet, align 4
  store i32 0, i32* @verbose, align 4
  br label %207

156:                                              ; preds = %112
  store i32 1, i32* @recursive, align 4
  br label %207

157:                                              ; preds = %112, %112
  store i32 1, i32* @rsync, align 4
  br label %207

158:                                              ; preds = %112
  %159 = load i8*, i8** @optarg, align 8
  %160 = call i64 @strlen(i8* %159) #14
  store i64 %160, i64* @z_len, align 8
  %161 = load i8*, i8** @optarg, align 8
  store i8* %161, i8** @z_suffix, align 8
  br label %207

162:                                              ; preds = %112
  store i8 1, i8* @synchronous, align 1
  br label %207

163:                                              ; preds = %112
  store i32 1, i32* @to_stdout, align 4
  store i32 1, i32* @decompress, align 4
  store i32 1, i32* @test, align 4
  br label %207

164:                                              ; preds = %112, %112
  %165 = load i32, i32* @verbose, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* @verbose, align 4
  store i32 0, i32* @quiet, align 4
  br label %207

167:                                              ; preds = %112
  call void @version()
  call void @finish_out()
  br label %207

168:                                              ; preds = %112
  %169 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %170 = load i8*, i8** @program_name, align 8
  %171 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %169, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7, i64 0, i64 0), i8* %170)
  call void @try_help() #13
  unreachable

172:                                              ; preds = %112, %112, %112, %112, %112, %112, %112, %112, %112
  %173 = load i32, i32* %11, align 4
  %174 = sub nsw i32 %173, 131
  store i32 %174, i32* %11, align 4
  br label %175

175:                                              ; preds = %172, %112, %112, %112, %112, %112, %112, %112, %112, %112
  %176 = load i32, i32* %11, align 4
  %177 = sub nsw i32 %176, 48
  store i32 %177, i32* @level, align 4
  br label %207

178:                                              ; preds = %112
  %179 = load i32, i32* %11, align 4
  %180 = icmp sle i32 131, %179
  br i1 %180, label %181, label %206

181:                                              ; preds = %178
  %182 = load i32, i32* %11, align 4
  %183 = icmp ne i32 %182, 194
  br i1 %183, label %184, label %206

184:                                              ; preds = %181
  %185 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %186 = load i8*, i8** @program_name, align 8
  %187 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %185, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0), i8* %186)
  %188 = load i32, i32* %12, align 4
  %189 = icmp slt i32 %188, 0
  br i1 %189, label %190, label %195

190:                                              ; preds = %184
  %191 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %192 = load i32, i32* %11, align 4
  %193 = sub nsw i32 %192, 131
  %194 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %191, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i64 0, i64 0), i32 %193)
  br label %203

195:                                              ; preds = %184
  %196 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %197 = load i32, i32* %12, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [27 x %struct.option], [27 x %struct.option]* @longopts, i64 0, i64 %198
  %200 = getelementptr inbounds %struct.option, %struct.option* %199, i32 0, i32 0
  %201 = load i8*, i8** %200, align 16
  %202 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %196, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i64 0, i64 0), i8* %201)
  br label %203

203:                                              ; preds = %195, %190
  %204 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %205 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %204, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.11, i64 0, i64 0))
  br label %206

206:                                              ; preds = %203, %181, %178
  call void @try_help() #13
  unreachable

207:                                              ; preds = %175, %167, %164, %163, %162, %158, %157, %156, %155, %154, %153, %152, %151, %150, %149, %148, %147, %146, %143, %142, %141, %140, %114
  br label %45

208:                                              ; preds = %111
  %209 = load i32, i32* @no_time, align 4
  %210 = icmp slt i32 %209, 0
  br i1 %210, label %211, label %213

211:                                              ; preds = %208
  %212 = load i32, i32* @decompress, align 4
  store i32 %212, i32* @no_time, align 4
  br label %213

213:                                              ; preds = %211, %208
  %214 = load i32, i32* @no_name, align 4
  %215 = icmp slt i32 %214, 0
  br i1 %215, label %216, label %218

216:                                              ; preds = %213
  %217 = load i32, i32* @decompress, align 4
  store i32 %217, i32* @no_name, align 4
  br label %218

218:                                              ; preds = %216, %213
  %219 = load i32, i32* %4, align 4
  %220 = load i32, i32* @optind, align 4
  %221 = sub nsw i32 %219, %220
  store i32 %221, i32* %6, align 4
  %222 = load i32, i32* @ascii, align 4
  %223 = icmp ne i32 %222, 0
  br i1 %223, label %224, label %231

224:                                              ; preds = %218
  %225 = load i32, i32* @quiet, align 4
  %226 = icmp ne i32 %225, 0
  br i1 %226, label %231, label %227

227:                                              ; preds = %224
  %228 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %229 = load i8*, i8** @program_name, align 8
  %230 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %228, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.12, i64 0, i64 0), i8* %229)
  br label %231

231:                                              ; preds = %227, %224, %218
  %232 = load i64, i64* @z_len, align 8
  %233 = icmp eq i64 %232, 0
  br i1 %233, label %237, label %234

234:                                              ; preds = %231
  %235 = load i64, i64* @z_len, align 8
  %236 = icmp ugt i64 %235, 30
  br i1 %236, label %237, label %242

237:                                              ; preds = %234, %231
  %238 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %239 = load i8*, i8** @program_name, align 8
  %240 = load i8*, i8** @z_suffix, align 8
  %241 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %238, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.13, i64 0, i64 0), i8* %239, i8* %240)
  call void @do_exit(i32 1) #13
  unreachable

242:                                              ; preds = %234
  %243 = load i32, i32* @do_lzw, align 4
  %244 = icmp ne i32 %243, 0
  br i1 %244, label %245, label %249

245:                                              ; preds = %242
  %246 = load i32, i32* @decompress, align 4
  %247 = icmp ne i32 %246, 0
  br i1 %247, label %249, label %248

248:                                              ; preds = %245
  store i32 (i32, i32)* @lzw, i32 (i32, i32)** @work, align 8
  br label %249

249:                                              ; preds = %248, %245, %242
  %250 = load i32, i32* @quiet, align 4
  %251 = icmp ne i32 %250, 0
  %252 = zext i1 %251 to i64
  %253 = select i1 %251, i32 13, i32 0
  store volatile i32 %253, i32* @exiting_signal, align 4
  call void @install_signal_handlers()
  %254 = load i32, i32* %6, align 4
  %255 = icmp ne i32 %254, 0
  br i1 %255, label %256, label %285

256:                                              ; preds = %249
  %257 = load i32, i32* @to_stdout, align 4
  %258 = icmp ne i32 %257, 0
  br i1 %258, label %259, label %272

259:                                              ; preds = %256
  %260 = load i32, i32* @test, align 4
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %272, label %262

262:                                              ; preds = %259
  %263 = load i32, i32* @list, align 4
  %264 = icmp ne i32 %263, 0
  br i1 %264, label %272, label %265

265:                                              ; preds = %262
  %266 = load i32, i32* @decompress, align 4
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %268, label %271

268:                                              ; preds = %265
  %269 = load i32, i32* @ascii, align 4
  %270 = icmp ne i32 %269, 0
  br i1 %270, label %272, label %271

271:                                              ; preds = %268, %265
  br label %272

272:                                              ; preds = %271, %268, %262, %259, %256
  br label %273

273:                                              ; preds = %277, %272
  %274 = load i32, i32* @optind, align 4
  %275 = load i32, i32* %4, align 4
  %276 = icmp slt i32 %274, %275
  br i1 %276, label %277, label %284

277:                                              ; preds = %273
  %278 = load i8**, i8*** %5, align 8
  %279 = load i32, i32* @optind, align 4
  %280 = add nsw i32 %279, 1
  store i32 %280, i32* @optind, align 4
  %281 = sext i32 %279 to i64
  %282 = getelementptr inbounds i8*, i8** %278, i64 %281
  %283 = load i8*, i8** %282, align 8
  call void @treat_file(i8* %283)
  br label %273, !llvm.loop !23

284:                                              ; preds = %273
  br label %286

285:                                              ; preds = %249
  call void @treat_stdin()
  br label %286

286:                                              ; preds = %285, %284
  %287 = load i8, i8* @stdin_was_read, align 1
  %288 = trunc i8 %287 to i1
  br i1 %288, label %289, label %294

289:                                              ; preds = %286
  %290 = call i32 @close(i32 0)
  %291 = icmp ne i32 %290, 0
  br i1 %291, label %292, label %294

292:                                              ; preds = %289
  %293 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i64 0, i64 0)) #15
  call void @read_error() #13
  unreachable

294:                                              ; preds = %289, %286
  %295 = load i32, i32* @list, align 4
  %296 = icmp ne i32 %295, 0
  br i1 %296, label %297, label %310

297:                                              ; preds = %294
  %298 = load i32, i32* @quiet, align 4
  %299 = icmp ne i32 %298, 0
  br i1 %299, label %304, label %300

300:                                              ; preds = %297
  %301 = load i32, i32* %6, align 4
  %302 = icmp slt i32 1, %301
  br i1 %302, label %303, label %304

303:                                              ; preds = %300
  call void @do_list(i32 -1, i32 -1)
  br label %304

304:                                              ; preds = %303, %300, %297
  %305 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %306 = call i32 @rpl_fflush(%struct._IO_FILE* %305)
  %307 = icmp ne i32 %306, 0
  br i1 %307, label %308, label %309

308:                                              ; preds = %304
  call void @write_error() #13
  unreachable

309:                                              ; preds = %304
  br label %310

310:                                              ; preds = %309, %294
  %311 = load i32, i32* @to_stdout, align 4
  %312 = icmp ne i32 %311, 0
  br i1 %312, label %313, label %331

313:                                              ; preds = %310
  %314 = load i8, i8* @synchronous, align 1
  %315 = trunc i8 %314 to i1
  br i1 %315, label %316, label %323

316:                                              ; preds = %313
  %317 = call i32 @fdatasync(i32 1)
  %318 = icmp ne i32 %317, 0
  br i1 %318, label %319, label %323

319:                                              ; preds = %316
  %320 = call i32* @__errno_location() #16
  %321 = load i32, i32* %320, align 4
  %322 = icmp ne i32 %321, 22
  br i1 %322, label %326, label %323

323:                                              ; preds = %319, %316, %313
  %324 = call i32 @close(i32 1)
  %325 = icmp ne i32 %324, 0
  br i1 %325, label %326, label %331

326:                                              ; preds = %323, %319
  %327 = call i32* @__errno_location() #16
  %328 = load i32, i32* %327, align 4
  %329 = icmp ne i32 %328, 9
  br i1 %329, label %330, label %331

330:                                              ; preds = %326
  call void @write_error() #13
  unreachable

331:                                              ; preds = %326, %323, %310
  %332 = load i32, i32* @exit_code, align 4
  call void @do_exit(i32 %332) #13
  unreachable
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #4

; Function Attrs: nounwind
declare dso_local i32 @getopt_long(i32, i8**, i8*, %struct.option*, i32*) #5

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #6

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal void @try_help() #7 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = load i8*, i8** @program_name, align 8
  %3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.41, i64 0, i64 0), i8* %2)
  call void @do_exit(i32 1) #13
  unreachable
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @help() #0 {
  %1 = alloca i8**, align 8
  store i8** getelementptr inbounds ([28 x i8*], [28 x i8*]* @help.help_msg, i64 0, i64 0), i8*** %1, align 8
  %2 = load i8*, i8** @program_name, align 8
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.66, i64 0, i64 0), i8* %2)
  br label %4

4:                                                ; preds = %8, %0
  %5 = load i8**, i8*** %1, align 8
  %6 = load i8*, i8** %5, align 8
  %7 = icmp ne i8* %6, null
  br i1 %7, label %8, label %13

8:                                                ; preds = %4
  %9 = load i8**, i8*** %1, align 8
  %10 = getelementptr inbounds i8*, i8** %9, i32 1
  store i8** %10, i8*** %1, align 8
  %11 = load i8*, i8** %9, align 8
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.67, i64 0, i64 0), i8* %11)
  br label %4, !llvm.loop !24

13:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @finish_out() #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %2 = call i32 @rpl_fclose(%struct._IO_FILE* %1)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %0
  call void @write_error() #13
  unreachable

5:                                                ; preds = %0
  call void @do_exit(i32 0) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @license() #0 {
  %1 = alloca i8**, align 8
  store i8** getelementptr inbounds ([6 x i8*], [6 x i8*]* @license_msg, i64 0, i64 0), i8*** %1, align 8
  %2 = load i8*, i8** @program_name, align 8
  %3 = load i8*, i8** @Version, align 8
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.68, i64 0, i64 0), i8* %2, i8* %3)
  br label %5

5:                                                ; preds = %9, %0
  %6 = load i8**, i8*** %1, align 8
  %7 = load i8*, i8** %6, align 8
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %14

9:                                                ; preds = %5
  %10 = load i8**, i8*** %1, align 8
  %11 = getelementptr inbounds i8*, i8** %10, i32 1
  store i8** %11, i8*** %1, align 8
  %12 = load i8*, i8** %10, align 8
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.67, i64 0, i64 0), i8* %12)
  br label %5, !llvm.loop !25

14:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @version() #0 {
  call void @license()
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.74, i64 0, i64 0))
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.75, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal void @do_exit(i32 %0) #7 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* @do_exit.in_exit, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = load i32, i32* %2, align 4
  call void @exit(i32 %6) #17
  unreachable

7:                                                ; preds = %1
  store i32 1, i32* @do_exit.in_exit, align 4
  %8 = load i8*, i8** @env, align 8
  call void @free(i8* %8) #15
  store i8* null, i8** @env, align 8
  %9 = load i32, i32* %2, align 4
  call void @exit(i32 %9) #17
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @install_signal_handlers() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.sigaction, align 8
  store i32 6, i32* %1, align 4
  %4 = call i32 @sigemptyset(%struct.__sigset_t* @caught_signals) #15
  store i32 0, i32* %2, align 4
  br label %5

5:                                                ; preds = %26, %0
  %6 = load i32, i32* %2, align 4
  %7 = load i32, i32* %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %29

9:                                                ; preds = %5
  %10 = load i32, i32* %2, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [6 x i32], [6 x i32]* @handled_sig, i64 0, i64 %11
  %13 = load i32, i32* %12, align 4
  %14 = call i32 @sigaction(i32 %13, %struct.sigaction* null, %struct.sigaction* %3) #15
  %15 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 0
  %16 = bitcast %union.anon* %15 to void (i32)**
  %17 = load void (i32)*, void (i32)** %16, align 8
  %18 = icmp ne void (i32)* %17, inttoptr (i64 1 to void (i32)*)
  br i1 %18, label %19, label %25

19:                                               ; preds = %9
  %20 = load i32, i32* %2, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [6 x i32], [6 x i32]* @handled_sig, i64 0, i64 %21
  %23 = load i32, i32* %22, align 4
  %24 = call i32 @sigaddset(%struct.__sigset_t* @caught_signals, i32 %23) #15
  br label %25

25:                                               ; preds = %19, %9
  br label %26

26:                                               ; preds = %25
  %27 = load i32, i32* %2, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %2, align 4
  br label %5, !llvm.loop !26

29:                                               ; preds = %5
  %30 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 0
  %31 = bitcast %union.anon* %30 to void (i32)**
  store void (i32)* @abort_gzip_signal, void (i32)** %31, align 8
  %32 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 1
  %33 = bitcast %struct.__sigset_t* %32 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %33, i8* align 8 bitcast (%struct.__sigset_t* @caught_signals to i8*), i64 128, i1 false)
  %34 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 2
  store i32 0, i32* %34, align 8
  store i32 0, i32* %2, align 4
  br label %35

35:                                               ; preds = %57, %29
  %36 = load i32, i32* %2, align 4
  %37 = load i32, i32* %1, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %60

39:                                               ; preds = %35
  %40 = load i32, i32* %2, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [6 x i32], [6 x i32]* @handled_sig, i64 0, i64 %41
  %43 = load i32, i32* %42, align 4
  %44 = call i32 @sigismember(%struct.__sigset_t* @caught_signals, i32 %43) #15
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %56

46:                                               ; preds = %39
  %47 = load i32, i32* %2, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %50

49:                                               ; preds = %46
  store i32 1, i32* @foreground, align 4
  br label %50

50:                                               ; preds = %49, %46
  %51 = load i32, i32* %2, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [6 x i32], [6 x i32]* @handled_sig, i64 0, i64 %52
  %54 = load i32, i32* %53, align 4
  %55 = call i32 @sigaction(i32 %54, %struct.sigaction* %3, %struct.sigaction* null) #15
  br label %56

56:                                               ; preds = %50, %39
  br label %57

57:                                               ; preds = %56
  %58 = load i32, i32* %2, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %2, align 4
  br label %35, !llvm.loop !27

60:                                               ; preds = %35
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @treat_file(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.timespec, align 8
  %5 = alloca %struct.__sigset_t, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %10 = load i8*, i8** %2, align 8
  %11 = call i32 @strcmp(i8* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.98, i64 0, i64 0)) #14
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %1
  %14 = load i32, i32* @to_stdout, align 4
  store i32 %14, i32* %3, align 4
  call void @treat_stdin()
  %15 = load i32, i32* %3, align 4
  store i32 %15, i32* @to_stdout, align 4
  br label %414

16:                                               ; preds = %1
  %17 = load i8*, i8** %2, align 8
  %18 = call i32 @open_input_file(i8* %17, %struct.stat* @istat)
  store i32 %18, i32* @ifd, align 4
  %19 = load i32, i32* @ifd, align 4
  %20 = icmp slt i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %16
  br label %414

22:                                               ; preds = %16
  %23 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 3), align 8
  %24 = and i32 %23, 61440
  %25 = icmp eq i32 %24, 16384
  br i1 %25, label %26, label %46

26:                                               ; preds = %22
  %27 = load i32, i32* @recursive, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %26
  %30 = load i32, i32* @ifd, align 4
  %31 = load i8*, i8** %2, align 8
  call void @treat_dir(i32 %30, i8* %31)
  br label %414

32:                                               ; preds = %26
  %33 = load i32, i32* @ifd, align 4
  %34 = call i32 @close(i32 %33)
  %35 = load i32, i32* @quiet, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %41, label %37

37:                                               ; preds = %32
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = load i8*, i8** @program_name, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.99, i64 0, i64 0), i8* %39, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %41

41:                                               ; preds = %37, %32
  %42 = load i32, i32* @exit_code, align 4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %45

44:                                               ; preds = %41
  store i32 2, i32* @exit_code, align 4
  br label %45

45:                                               ; preds = %44, %41
  br label %414

46:                                               ; preds = %22
  %47 = load i32, i32* @to_stdout, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %149, label %49

49:                                               ; preds = %46
  %50 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 3), align 8
  %51 = and i32 %50, 61440
  %52 = icmp eq i32 %51, 32768
  br i1 %52, label %67, label %53

53:                                               ; preds = %49
  %54 = load i32, i32* @quiet, align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %60, label %56

56:                                               ; preds = %53
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = load i8*, i8** @program_name, align 8
  %59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.100, i64 0, i64 0), i8* %58, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %60

60:                                               ; preds = %56, %53
  %61 = load i32, i32* @exit_code, align 4
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %64

63:                                               ; preds = %60
  store i32 2, i32* @exit_code, align 4
  br label %64

64:                                               ; preds = %63, %60
  %65 = load i32, i32* @ifd, align 4
  %66 = call i32 @close(i32 %65)
  br label %414

67:                                               ; preds = %49
  %68 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 3), align 8
  %69 = and i32 %68, 2048
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %85

71:                                               ; preds = %67
  %72 = load i32, i32* @quiet, align 4
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %78, label %74

74:                                               ; preds = %71
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %76 = load i8*, i8** @program_name, align 8
  %77 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %75, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.101, i64 0, i64 0), i8* %76, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %78

78:                                               ; preds = %74, %71
  %79 = load i32, i32* @exit_code, align 4
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %82

81:                                               ; preds = %78
  store i32 2, i32* @exit_code, align 4
  br label %82

82:                                               ; preds = %81, %78
  %83 = load i32, i32* @ifd, align 4
  %84 = call i32 @close(i32 %83)
  br label %414

85:                                               ; preds = %67
  %86 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 3), align 8
  %87 = and i32 %86, 1024
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %103

89:                                               ; preds = %85
  %90 = load i32, i32* @quiet, align 4
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %96, label %92

92:                                               ; preds = %89
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %94 = load i8*, i8** @program_name, align 8
  %95 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.102, i64 0, i64 0), i8* %94, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %96

96:                                               ; preds = %92, %89
  %97 = load i32, i32* @exit_code, align 4
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %100

99:                                               ; preds = %96
  store i32 2, i32* @exit_code, align 4
  br label %100

100:                                              ; preds = %99, %96
  %101 = load i32, i32* @ifd, align 4
  %102 = call i32 @close(i32 %101)
  br label %414

103:                                              ; preds = %85
  %104 = load i32, i32* @force, align 4
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %148, label %106

106:                                              ; preds = %103
  %107 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 3), align 8
  %108 = and i32 %107, 512
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %124

110:                                              ; preds = %106
  %111 = load i32, i32* @quiet, align 4
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %117, label %113

113:                                              ; preds = %110
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %115 = load i8*, i8** @program_name, align 8
  %116 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %114, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.103, i64 0, i64 0), i8* %115, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %117

117:                                              ; preds = %113, %110
  %118 = load i32, i32* @exit_code, align 4
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %120, label %121

120:                                              ; preds = %117
  store i32 2, i32* @exit_code, align 4
  br label %121

121:                                              ; preds = %120, %117
  %122 = load i32, i32* @ifd, align 4
  %123 = call i32 @close(i32 %122)
  br label %414

124:                                              ; preds = %106
  %125 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 2), align 8
  %126 = icmp ule i64 2, %125
  br i1 %126, label %127, label %147

127:                                              ; preds = %124
  %128 = load i32, i32* @quiet, align 4
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %140, label %130

130:                                              ; preds = %127
  %131 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %132 = load i8*, i8** @program_name, align 8
  %133 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 2), align 8
  %134 = sub i64 %133, 1
  %135 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 2), align 8
  %136 = icmp eq i64 %135, 2
  %137 = zext i1 %136 to i64
  %138 = select i1 %136, i32 32, i32 115
  %139 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %131, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.104, i64 0, i64 0), i8* %132, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i64 %134, i32 %138)
  br label %140

140:                                              ; preds = %130, %127
  %141 = load i32, i32* @exit_code, align 4
  %142 = icmp eq i32 %141, 0
  br i1 %142, label %143, label %144

143:                                              ; preds = %140
  store i32 2, i32* @exit_code, align 4
  br label %144

144:                                              ; preds = %143, %140
  %145 = load i32, i32* @ifd, align 4
  %146 = call i32 @close(i32 %145)
  br label %414

147:                                              ; preds = %124
  br label %148

148:                                              ; preds = %147, %103
  br label %149

149:                                              ; preds = %148, %46
  %150 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 3), align 8
  %151 = and i32 %150, 61440
  %152 = icmp eq i32 %151, 32768
  br i1 %152, label %153, label %155

153:                                              ; preds = %149
  %154 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 8), align 8
  br label %156

155:                                              ; preds = %149
  br label %156

156:                                              ; preds = %155, %153
  %157 = phi i64 [ %154, %153 ], [ -1, %155 ]
  store i64 %157, i64* @ifile_size, align 8
  store i64 -1, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 1), align 8
  %158 = load i32, i32* @no_time, align 4
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %160, label %163

160:                                              ; preds = %156
  %161 = load i32, i32* @list, align 4
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %163, label %171

163:                                              ; preds = %160, %156
  %164 = call { i64, i64 } @get_stat_mtime(%struct.stat* @istat) #14
  %165 = bitcast %struct.timespec* %4 to { i64, i64 }*
  %166 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %165, i32 0, i32 0
  %167 = extractvalue { i64, i64 } %164, 0
  store i64 %167, i64* %166, align 8
  %168 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %165, i32 0, i32 1
  %169 = extractvalue { i64, i64 } %164, 1
  store i64 %169, i64* %168, align 8
  %170 = bitcast %struct.timespec* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 bitcast (%struct.timespec* @time_stamp to i8*), i8* align 8 %170, i64 16, i1 false)
  br label %171

171:                                              ; preds = %163, %160
  %172 = load i32, i32* @to_stdout, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %182

174:                                              ; preds = %171
  %175 = load i32, i32* @list, align 4
  %176 = icmp ne i32 %175, 0
  br i1 %176, label %182, label %177

177:                                              ; preds = %174
  %178 = load i32, i32* @test, align 4
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %182, label %180

180:                                              ; preds = %177
  %181 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i64 0, i64 0)) #15
  br label %189

182:                                              ; preds = %177, %174, %171
  %183 = call i32 @make_ofname()
  %184 = icmp ne i32 %183, 0
  br i1 %184, label %185, label %188

185:                                              ; preds = %182
  %186 = load i32, i32* @ifd, align 4
  %187 = call i32 @close(i32 %186)
  br label %414

188:                                              ; preds = %182
  br label %189

189:                                              ; preds = %188, %180
  call void @clear_bufs()
  store i32 0, i32* @part_nb, align 4
  %190 = load i32, i32* @decompress, align 4
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %192, label %201

192:                                              ; preds = %189
  %193 = load i32, i32* @ifd, align 4
  %194 = call i32 @get_method(i32 %193)
  store i32 %194, i32* @method, align 4
  %195 = load i32, i32* @method, align 4
  %196 = icmp slt i32 %195, 0
  br i1 %196, label %197, label %200

197:                                              ; preds = %192
  %198 = load i32, i32* @ifd, align 4
  %199 = call i32 @close(i32 %198)
  br label %414

200:                                              ; preds = %192
  br label %201

201:                                              ; preds = %200, %189
  %202 = load i32, i32* @list, align 4
  %203 = icmp ne i32 %202, 0
  br i1 %203, label %204, label %212

204:                                              ; preds = %201
  %205 = load i32, i32* @ifd, align 4
  %206 = load i32, i32* @method, align 4
  call void @do_list(i32 %205, i32 %206)
  %207 = load i32, i32* @ifd, align 4
  %208 = call i32 @close(i32 %207)
  %209 = icmp ne i32 %208, 0
  br i1 %209, label %210, label %211

210:                                              ; preds = %204
  call void @read_error() #13
  unreachable

211:                                              ; preds = %204
  br label %414

212:                                              ; preds = %201
  %213 = load i32, i32* @to_stdout, align 4
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %215, label %216

215:                                              ; preds = %212
  store i32 1, i32* @ofd, align 4
  br label %237

216:                                              ; preds = %212
  %217 = call i32 @create_outfile()
  %218 = icmp ne i32 %217, 0
  br i1 %218, label %219, label %220

219:                                              ; preds = %216
  br label %414

220:                                              ; preds = %216
  %221 = load i32, i32* @decompress, align 4
  %222 = icmp ne i32 %221, 0
  br i1 %222, label %236, label %223

223:                                              ; preds = %220
  %224 = load i32, i32* @save_orig_name, align 4
  %225 = icmp ne i32 %224, 0
  br i1 %225, label %226, label %236

226:                                              ; preds = %223
  %227 = load i32, i32* @verbose, align 4
  %228 = icmp ne i32 %227, 0
  br i1 %228, label %236, label %229

229:                                              ; preds = %226
  %230 = load i32, i32* @quiet, align 4
  %231 = icmp ne i32 %230, 0
  br i1 %231, label %236, label %232

232:                                              ; preds = %229
  %233 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %234 = load i8*, i8** @program_name, align 8
  %235 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %233, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.105, i64 0, i64 0), i8* %234, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  br label %236

236:                                              ; preds = %232, %229, %226, %223, %220
  br label %237

237:                                              ; preds = %236, %215
  %238 = load i32, i32* @save_orig_name, align 4
  %239 = icmp ne i32 %238, 0
  br i1 %239, label %245, label %240

240:                                              ; preds = %237
  %241 = load i32, i32* @no_name, align 4
  %242 = icmp ne i32 %241, 0
  %243 = xor i1 %242, true
  %244 = zext i1 %243 to i32
  store i32 %244, i32* @save_orig_name, align 4
  br label %245

245:                                              ; preds = %240, %237
  %246 = load i32, i32* @verbose, align 4
  %247 = icmp ne i32 %246, 0
  br i1 %247, label %248, label %251

248:                                              ; preds = %245
  %249 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %250 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %249, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.106, i64 0, i64 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %251

251:                                              ; preds = %248, %245
  br label %252

252:                                              ; preds = %269, %251
  %253 = load i32 (i32, i32)*, i32 (i32, i32)** @work, align 8
  %254 = load i32, i32* @ifd, align 4
  %255 = load i32, i32* @ofd, align 4
  %256 = call i32 %253(i32 %254, i32 %255)
  %257 = icmp ne i32 %256, 0
  br i1 %257, label %258, label %259

258:                                              ; preds = %252
  store i32 -1, i32* @method, align 4
  br label %270

259:                                              ; preds = %252
  %260 = call i32 @input_eof()
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %262, label %263

262:                                              ; preds = %259
  br label %270

263:                                              ; preds = %259
  %264 = load i32, i32* @ifd, align 4
  %265 = call i32 @get_method(i32 %264)
  store i32 %265, i32* @method, align 4
  %266 = load i32, i32* @method, align 4
  %267 = icmp slt i32 %266, 0
  br i1 %267, label %268, label %269

268:                                              ; preds = %263
  br label %270

269:                                              ; preds = %263
  store i64 0, i64* @bytes_out, align 8
  br label %252

270:                                              ; preds = %268, %262, %258
  %271 = load i32, i32* @ifd, align 4
  %272 = call i32 @close(i32 %271)
  %273 = icmp ne i32 %272, 0
  br i1 %273, label %274, label %275

274:                                              ; preds = %270
  call void @read_error() #13
  unreachable

275:                                              ; preds = %270
  %276 = load i32, i32* @to_stdout, align 4
  %277 = icmp ne i32 %276, 0
  br i1 %277, label %361, label %278

278:                                              ; preds = %275
  call void @copy_stat(%struct.stat* @istat)
  %279 = load i8, i8* @synchronous, align 1
  %280 = trunc i8 %279 to i1
  br i1 %280, label %281, label %300

281:                                              ; preds = %278
  %282 = load i32, i32* @dfd, align 4
  %283 = icmp sle i32 0, %282
  br i1 %283, label %284, label %292

284:                                              ; preds = %281
  %285 = load i32, i32* @dfd, align 4
  %286 = call i32 @fdatasync(i32 %285)
  %287 = icmp ne i32 %286, 0
  br i1 %287, label %288, label %292

288:                                              ; preds = %284
  %289 = call i32* @__errno_location() #16
  %290 = load i32, i32* %289, align 4
  %291 = icmp ne i32 %290, 22
  br i1 %291, label %304, label %292

292:                                              ; preds = %288, %284, %281
  %293 = load i32, i32* @ofd, align 4
  %294 = call i32 @fsync(i32 %293)
  %295 = icmp ne i32 %294, 0
  br i1 %295, label %296, label %300

296:                                              ; preds = %292
  %297 = call i32* @__errno_location() #16
  %298 = load i32, i32* %297, align 4
  %299 = icmp ne i32 %298, 22
  br i1 %299, label %304, label %300

300:                                              ; preds = %296, %292, %278
  %301 = load i32, i32* @ofd, align 4
  %302 = call i32 @close(i32 %301)
  %303 = icmp ne i32 %302, 0
  br i1 %303, label %304, label %305

304:                                              ; preds = %300, %296, %288
  call void @write_error() #13
  unreachable

305:                                              ; preds = %300
  %306 = load i32, i32* @keep, align 4
  %307 = icmp ne i32 %306, 0
  br i1 %307, label %360, label %308

308:                                              ; preds = %305
  %309 = call i8* @last_component(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0)) #14
  store i8* %309, i8** %7, align 8
  %310 = load i8*, i8** %7, align 8
  %311 = ptrtoint i8* %310 to i64
  %312 = sub i64 %311, ptrtoint ([1024 x i8]* @ifname to i64)
  %313 = call zeroext i1 @atdir_eq(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i64 %312)
  br i1 %313, label %314, label %316

314:                                              ; preds = %308
  %315 = load i32, i32* @dfd, align 4
  br label %317

316:                                              ; preds = %308
  br label %317

317:                                              ; preds = %316, %314
  %318 = phi i32 [ %315, %314 ], [ -1, %316 ]
  store i32 %318, i32* %8, align 4
  %319 = call i32 @sigprocmask(i32 0, %struct.__sigset_t* @caught_signals, %struct.__sigset_t* %5) #15
  store volatile i32 -1, i32* @remove_ofname_fd, align 4
  %320 = load i32, i32* %8, align 4
  %321 = icmp slt i32 %320, 0
  br i1 %321, label %322, label %324

322:                                              ; preds = %317
  %323 = call i32 @xunlink(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %328

324:                                              ; preds = %317
  %325 = load i32, i32* %8, align 4
  %326 = load i8*, i8** %7, align 8
  %327 = call i32 @unlinkat(i32 %325, i8* %326, i32 0) #15
  br label %328

328:                                              ; preds = %324, %322
  %329 = phi i32 [ %323, %322 ], [ %327, %324 ]
  store i32 %329, i32* %9, align 4
  %330 = load i32, i32* %9, align 4
  %331 = icmp eq i32 %330, 0
  br i1 %331, label %332, label %333

332:                                              ; preds = %328
  br label %336

333:                                              ; preds = %328
  %334 = call i32* @__errno_location() #16
  %335 = load i32, i32* %334, align 4
  br label %336

336:                                              ; preds = %333, %332
  %337 = phi i32 [ 0, %332 ], [ %335, %333 ]
  store i32 %337, i32* %6, align 4
  %338 = call i32 @sigprocmask(i32 2, %struct.__sigset_t* %5, %struct.__sigset_t* null) #15
  %339 = load i32, i32* %6, align 4
  %340 = icmp ne i32 %339, 0
  br i1 %340, label %341, label %359

341:                                              ; preds = %336
  %342 = load i32, i32* @quiet, align 4
  %343 = icmp ne i32 %342, 0
  br i1 %343, label %348, label %344

344:                                              ; preds = %341
  %345 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %346 = load i8*, i8** @program_name, align 8
  %347 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %345, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0), i8* %346)
  br label %348

348:                                              ; preds = %344, %341
  %349 = load i32, i32* @exit_code, align 4
  %350 = icmp eq i32 %349, 0
  br i1 %350, label %351, label %352

351:                                              ; preds = %348
  store i32 2, i32* @exit_code, align 4
  br label %352

352:                                              ; preds = %351, %348
  %353 = load i32, i32* @quiet, align 4
  %354 = icmp ne i32 %353, 0
  br i1 %354, label %358, label %355

355:                                              ; preds = %352
  %356 = load i32, i32* %6, align 4
  %357 = call i32* @__errno_location() #16
  store i32 %356, i32* %357, align 4
  call void @perror(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %358

358:                                              ; preds = %355, %352
  br label %359

359:                                              ; preds = %358, %336
  br label %360

360:                                              ; preds = %359, %305
  br label %361

361:                                              ; preds = %360, %275
  %362 = load i32, i32* @method, align 4
  %363 = icmp eq i32 %362, -1
  br i1 %363, label %364, label %369

364:                                              ; preds = %361
  %365 = load i32, i32* @to_stdout, align 4
  %366 = icmp ne i32 %365, 0
  br i1 %366, label %368, label %367

367:                                              ; preds = %364
  call void @remove_output_file()
  br label %368

368:                                              ; preds = %367, %364
  br label %414

369:                                              ; preds = %361
  %370 = load i32, i32* @verbose, align 4
  %371 = icmp ne i32 %370, 0
  br i1 %371, label %372, label %414

372:                                              ; preds = %369
  %373 = load i32, i32* @test, align 4
  %374 = icmp ne i32 %373, 0
  br i1 %374, label %375, label %378

375:                                              ; preds = %372
  %376 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %377 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %376, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.107, i64 0, i64 0))
  br label %398

378:                                              ; preds = %372
  %379 = load i32, i32* @decompress, align 4
  %380 = icmp ne i32 %379, 0
  br i1 %380, label %381, label %389

381:                                              ; preds = %378
  %382 = load i64, i64* @bytes_out, align 8
  %383 = load i64, i64* @bytes_in, align 8
  %384 = load i64, i64* @header_bytes, align 8
  %385 = sub nsw i64 %383, %384
  %386 = sub nsw i64 %382, %385
  %387 = load i64, i64* @bytes_out, align 8
  %388 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  call void @display_ratio(i64 %386, i64 %387, %struct._IO_FILE* %388)
  br label %397

389:                                              ; preds = %378
  %390 = load i64, i64* @bytes_in, align 8
  %391 = load i64, i64* @bytes_out, align 8
  %392 = load i64, i64* @header_bytes, align 8
  %393 = sub nsw i64 %391, %392
  %394 = sub nsw i64 %390, %393
  %395 = load i64, i64* @bytes_in, align 8
  %396 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  call void @display_ratio(i64 %394, i64 %395, %struct._IO_FILE* %396)
  br label %397

397:                                              ; preds = %389, %381
  br label %398

398:                                              ; preds = %397, %375
  %399 = load i32, i32* @test, align 4
  %400 = icmp ne i32 %399, 0
  br i1 %400, label %411, label %401

401:                                              ; preds = %398
  %402 = load i32, i32* @to_stdout, align 4
  %403 = icmp ne i32 %402, 0
  br i1 %403, label %411, label %404

404:                                              ; preds = %401
  %405 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %406 = load i32, i32* @keep, align 4
  %407 = icmp ne i32 %406, 0
  %408 = zext i1 %407 to i64
  %409 = select i1 %407, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.109, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.110, i64 0, i64 0)
  %410 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %405, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.108, i64 0, i64 0), i8* %409, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  br label %411

411:                                              ; preds = %404, %401, %398
  %412 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %413 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %412, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.74, i64 0, i64 0))
  br label %414

414:                                              ; preds = %411, %369, %368, %219, %211, %197, %185, %144, %121, %100, %82, %64, %45, %29, %21, %13
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @treat_stdin() #0 {
  %1 = alloca %struct.timespec, align 8
  %2 = load i32, i32* @force, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %34, label %4

4:                                                ; preds = %0
  %5 = load i32, i32* @list, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %34, label %7

7:                                                ; preds = %4
  %8 = load i8, i8* @presume_input_tty, align 1
  %9 = trunc i8 %8 to i1
  br i1 %9, label %17, label %10

10:                                               ; preds = %7
  %11 = load i32, i32* @decompress, align 4
  %12 = icmp ne i32 %11, 0
  %13 = zext i1 %12 to i64
  %14 = select i1 %12, i32 0, i32 1
  %15 = call i32 @isatty(i32 %14) #15
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %34

17:                                               ; preds = %10, %7
  %18 = load i32, i32* @quiet, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %33, label %20

20:                                               ; preds = %17
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = load i8*, i8** @program_name, align 8
  %23 = load i32, i32* @decompress, align 4
  %24 = icmp ne i32 %23, 0
  %25 = zext i1 %24 to i64
  %26 = select i1 %24, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.77, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.78, i64 0, i64 0)
  %27 = load i32, i32* @decompress, align 4
  %28 = icmp ne i32 %27, 0
  %29 = zext i1 %28 to i64
  %30 = select i1 %28, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.79, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.43, i64 0, i64 0)
  %31 = load i8*, i8** @program_name, align 8
  %32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([93 x i8], [93 x i8]* @.str.76, i64 0, i64 0), i8* %22, i8* %26, i8* %30, i8* %31)
  br label %33

33:                                               ; preds = %20, %17
  call void @do_exit(i32 1) #13
  unreachable

34:                                               ; preds = %10, %4, %0
  %35 = load i32, i32* @decompress, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %40, label %37

37:                                               ; preds = %34
  %38 = load i32, i32* @ascii, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %41, label %40

40:                                               ; preds = %37, %34
  br label %41

41:                                               ; preds = %40, %37
  %42 = load i32, i32* @test, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %54, label %44

44:                                               ; preds = %41
  %45 = load i32, i32* @list, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %54, label %47

47:                                               ; preds = %44
  %48 = load i32, i32* @decompress, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = load i32, i32* @ascii, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %54, label %53

53:                                               ; preds = %50, %47
  br label %54

54:                                               ; preds = %53, %50, %44, %41
  %55 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i64 0, i64 0)) #15
  %56 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i64 0, i64 0)) #15
  %57 = call i32 @fstat(i32 0, %struct.stat* @istat) #15
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %60

59:                                               ; preds = %54
  call void @progerror(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.80, i64 0, i64 0))
  call void @do_exit(i32 1) #13
  unreachable

60:                                               ; preds = %54
  %61 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 3), align 8
  %62 = and i32 %61, 61440
  %63 = icmp eq i32 %62, 32768
  br i1 %63, label %64, label %66

64:                                               ; preds = %60
  %65 = load i64, i64* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 8), align 8
  br label %67

66:                                               ; preds = %60
  br label %67

67:                                               ; preds = %66, %64
  %68 = phi i64 [ %65, %64 ], [ -1, %66 ]
  store i64 %68, i64* @ifile_size, align 8
  store i64 -1, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 1), align 8
  %69 = load i32, i32* @no_time, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %74

71:                                               ; preds = %67
  %72 = load i32, i32* @list, align 4
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %88

74:                                               ; preds = %71, %67
  %75 = load i32, i32* getelementptr inbounds (%struct.stat, %struct.stat* @istat, i32 0, i32 3), align 8
  %76 = and i32 %75, 61440
  %77 = icmp eq i32 %76, 32768
  br i1 %77, label %78, label %86

78:                                               ; preds = %74
  %79 = call { i64, i64 } @get_stat_mtime(%struct.stat* @istat) #14
  %80 = bitcast %struct.timespec* %1 to { i64, i64 }*
  %81 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %80, i32 0, i32 0
  %82 = extractvalue { i64, i64 } %79, 0
  store i64 %82, i64* %81, align 8
  %83 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %80, i32 0, i32 1
  %84 = extractvalue { i64, i64 } %79, 1
  store i64 %84, i64* %83, align 8
  %85 = bitcast %struct.timespec* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 bitcast (%struct.timespec* @time_stamp to i8*), i8* align 8 %85, i64 16, i1 false)
  br label %87

86:                                               ; preds = %74
  call void @gettime(%struct.timespec* @time_stamp)
  br label %87

87:                                               ; preds = %86, %78
  br label %88

88:                                               ; preds = %87, %71
  call void @clear_bufs()
  store i32 1, i32* @to_stdout, align 4
  store i32 0, i32* @part_nb, align 4
  store i32 0, i32* @ifd, align 4
  store i8 1, i8* @stdin_was_read, align 1
  %89 = load i32, i32* @decompress, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %99

91:                                               ; preds = %88
  %92 = load i32, i32* @ifd, align 4
  %93 = call i32 @get_method(i32 %92)
  store i32 %93, i32* @method, align 4
  %94 = load i32, i32* @method, align 4
  %95 = icmp slt i32 %94, 0
  br i1 %95, label %96, label %98

96:                                               ; preds = %91
  %97 = load i32, i32* @exit_code, align 4
  call void @do_exit(i32 %97) #13
  unreachable

98:                                               ; preds = %91
  br label %99

99:                                               ; preds = %98, %88
  %100 = load i32, i32* @list, align 4
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %102, label %105

102:                                              ; preds = %99
  %103 = load i32, i32* @ifd, align 4
  %104 = load i32, i32* @method, align 4
  call void @do_list(i32 %103, i32 %104)
  br label %146

105:                                              ; preds = %99
  br label %106

106:                                              ; preds = %121, %105
  %107 = load i32 (i32, i32)*, i32 (i32, i32)** @work, align 8
  %108 = call i32 %107(i32 0, i32 1)
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %111

110:                                              ; preds = %106
  br label %146

111:                                              ; preds = %106
  %112 = call i32 @input_eof()
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %114, label %115

114:                                              ; preds = %111
  br label %122

115:                                              ; preds = %111
  %116 = load i32, i32* @ifd, align 4
  %117 = call i32 @get_method(i32 %116)
  store i32 %117, i32* @method, align 4
  %118 = load i32, i32* @method, align 4
  %119 = icmp slt i32 %118, 0
  br i1 %119, label %120, label %121

120:                                              ; preds = %115
  br label %146

121:                                              ; preds = %115
  store i64 0, i64* @bytes_out, align 8
  br label %106

122:                                              ; preds = %114
  %123 = load i32, i32* @verbose, align 4
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %125, label %146

125:                                              ; preds = %122
  %126 = load i32, i32* @test, align 4
  %127 = icmp ne i32 %126, 0
  br i1 %127, label %128, label %131

128:                                              ; preds = %125
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %130 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %129, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.81, i64 0, i64 0))
  br label %145

131:                                              ; preds = %125
  %132 = load i32, i32* @decompress, align 4
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %144, label %134

134:                                              ; preds = %131
  %135 = load i64, i64* @bytes_in, align 8
  %136 = load i64, i64* @bytes_out, align 8
  %137 = load i64, i64* @header_bytes, align 8
  %138 = sub nsw i64 %136, %137
  %139 = sub nsw i64 %135, %138
  %140 = load i64, i64* @bytes_in, align 8
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  call void @display_ratio(i64 %139, i64 %140, %struct._IO_FILE* %141)
  %142 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %143 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %142, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.74, i64 0, i64 0))
  br label %144

144:                                              ; preds = %134, %131
  br label %145

145:                                              ; preds = %144, %128
  br label %146

146:                                              ; preds = %145, %122, %120, %110, %102
  ret void
}

declare dso_local i32 @close(i32) #6

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @do_list(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca [8 x i8], align 1
  %9 = alloca %struct.tm*, align 8
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  store i32 1, i32* %6, align 4
  store i64 9223372036854775807, i64* %7, align 8
  br label %10

10:                                               ; preds = %16, %2
  %11 = load i64, i64* %7, align 8
  %12 = icmp slt i64 9, %11
  br i1 %12, label %13, label %19

13:                                               ; preds = %10
  %14 = load i32, i32* %6, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %6, align 4
  br label %16

16:                                               ; preds = %13
  %17 = load i64, i64* %7, align 8
  %18 = sdiv i64 %17, 10
  store i64 %18, i64* %7, align 8
  br label %10, !llvm.loop !28

19:                                               ; preds = %10
  %20 = load i32, i32* @do_list.first_time, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %40

22:                                               ; preds = %19
  %23 = load i32, i32* %4, align 4
  %24 = icmp sge i32 %23, 0
  br i1 %24, label %25, label %40

25:                                               ; preds = %22
  store i32 0, i32* @do_list.first_time, align 4
  %26 = load i32, i32* @verbose, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %25
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.138, i64 0, i64 0))
  br label %30

30:                                               ; preds = %28, %25
  %31 = load i32, i32* @quiet, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %39, label %33

33:                                               ; preds = %30
  %34 = load i32, i32* %6, align 4
  %35 = load i32, i32* %6, align 4
  %36 = load i32, i32* %6, align 4
  %37 = load i32, i32* %6, align 4
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.139, i64 0, i64 0), i32 %34, i32 %35, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.140, i64 0, i64 0), i32 %36, i32 %37, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.141, i64 0, i64 0))
  br label %39

39:                                               ; preds = %33, %30
  br label %80

40:                                               ; preds = %22, %19
  %41 = load i32, i32* %4, align 4
  %42 = icmp slt i32 %41, 0
  br i1 %42, label %43, label %79

43:                                               ; preds = %40
  %44 = load i64, i64* @total_in, align 8
  %45 = icmp sle i64 %44, 0
  br i1 %45, label %49, label %46

46:                                               ; preds = %43
  %47 = load i64, i64* @total_out, align 8
  %48 = icmp sle i64 %47, 0
  br i1 %48, label %49, label %50

49:                                               ; preds = %46, %43
  br label %238

50:                                               ; preds = %46
  %51 = load i32, i32* @verbose, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %55

53:                                               ; preds = %50
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.142, i64 0, i64 0))
  br label %55

55:                                               ; preds = %53, %50
  %56 = load i32, i32* @verbose, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %61, label %58

58:                                               ; preds = %55
  %59 = load i32, i32* @quiet, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %70, label %61

61:                                               ; preds = %58, %55
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %63 = load i64, i64* @total_in, align 8
  %64 = load i32, i32* %6, align 4
  call void @fprint_off(%struct._IO_FILE* %62, i64 %63, i32 %64)
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.143, i64 0, i64 0))
  %66 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %67 = load i64, i64* @total_out, align 8
  %68 = load i32, i32* %6, align 4
  call void @fprint_off(%struct._IO_FILE* %66, i64 %67, i32 %68)
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.143, i64 0, i64 0))
  br label %70

70:                                               ; preds = %61, %58
  %71 = load i64, i64* @total_out, align 8
  %72 = load i64, i64* @total_in, align 8
  %73 = load i64, i64* @header_bytes, align 8
  %74 = sub nsw i64 %72, %73
  %75 = sub nsw i64 %71, %74
  %76 = load i64, i64* @total_out, align 8
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  call void @display_ratio(i64 %75, i64 %76, %struct._IO_FILE* %77)
  %78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.144, i64 0, i64 0))
  br label %238

79:                                               ; preds = %40
  br label %80

80:                                               ; preds = %79, %39
  store i64 -1, i64* %5, align 8
  store i64 -1, i64* @bytes_out, align 8
  %81 = load i64, i64* @ifile_size, align 8
  store i64 %81, i64* @bytes_in, align 8
  %82 = load i32, i32* %4, align 4
  %83 = icmp eq i32 %82, 8
  br i1 %83, label %84, label %164

84:                                               ; preds = %80
  %85 = load i32, i32* @last_member, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %164, label %87

87:                                               ; preds = %84
  %88 = load i32, i32* %3, align 4
  %89 = call i64 @lseek(i32 %88, i64 -8, i32 2) #15
  store i64 %89, i64* @bytes_in, align 8
  %90 = load i64, i64* @bytes_in, align 8
  %91 = icmp ne i64 %90, -1
  br i1 %91, label %92, label %163

92:                                               ; preds = %87
  %93 = load i64, i64* @bytes_in, align 8
  %94 = add nsw i64 %93, 8
  store i64 %94, i64* @bytes_in, align 8
  %95 = load i32, i32* %3, align 4
  %96 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i64 0, i64 0
  %97 = call i64 @read(i32 %95, i8* %96, i64 8)
  %98 = icmp ne i64 %97, 8
  br i1 %98, label %99, label %100

99:                                               ; preds = %92
  call void @read_error() #13
  unreachable

100:                                              ; preds = %92
  %101 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i64 0, i64 0
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i16
  %104 = zext i16 %103 to i32
  %105 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i64 0, i64 1
  %106 = load i8, i8* %105, align 1
  %107 = zext i8 %106 to i16
  %108 = zext i16 %107 to i32
  %109 = shl i32 %108, 8
  %110 = or i32 %104, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i64 0, i64 0
  %113 = getelementptr inbounds i8, i8* %112, i64 2
  %114 = getelementptr inbounds i8, i8* %113, i64 0
  %115 = load i8, i8* %114, align 1
  %116 = zext i8 %115 to i16
  %117 = zext i16 %116 to i32
  %118 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i64 0, i64 0
  %119 = getelementptr inbounds i8, i8* %118, i64 2
  %120 = getelementptr inbounds i8, i8* %119, i64 1
  %121 = load i8, i8* %120, align 1
  %122 = zext i8 %121 to i16
  %123 = zext i16 %122 to i32
  %124 = shl i32 %123, 8
  %125 = or i32 %117, %124
  %126 = sext i32 %125 to i64
  %127 = shl i64 %126, 16
  %128 = or i64 %111, %127
  store i64 %128, i64* %5, align 8
  %129 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i64 0, i64 0
  %130 = getelementptr inbounds i8, i8* %129, i64 4
  %131 = getelementptr inbounds i8, i8* %130, i64 0
  %132 = load i8, i8* %131, align 1
  %133 = zext i8 %132 to i16
  %134 = zext i16 %133 to i32
  %135 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i64 0, i64 0
  %136 = getelementptr inbounds i8, i8* %135, i64 4
  %137 = getelementptr inbounds i8, i8* %136, i64 1
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i16
  %140 = zext i16 %139 to i32
  %141 = shl i32 %140, 8
  %142 = or i32 %134, %141
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i64 0, i64 0
  %145 = getelementptr inbounds i8, i8* %144, i64 4
  %146 = getelementptr inbounds i8, i8* %145, i64 2
  %147 = getelementptr inbounds i8, i8* %146, i64 0
  %148 = load i8, i8* %147, align 1
  %149 = zext i8 %148 to i16
  %150 = zext i16 %149 to i32
  %151 = getelementptr inbounds [8 x i8], [8 x i8]* %8, i64 0, i64 0
  %152 = getelementptr inbounds i8, i8* %151, i64 4
  %153 = getelementptr inbounds i8, i8* %152, i64 2
  %154 = getelementptr inbounds i8, i8* %153, i64 1
  %155 = load i8, i8* %154, align 1
  %156 = zext i8 %155 to i16
  %157 = zext i16 %156 to i32
  %158 = shl i32 %157, 8
  %159 = or i32 %150, %158
  %160 = sext i32 %159 to i64
  %161 = shl i64 %160, 16
  %162 = or i64 %143, %161
  store i64 %162, i64* @bytes_out, align 8
  br label %163

163:                                              ; preds = %100, %87
  br label %164

164:                                              ; preds = %163, %84, %80
  %165 = load i32, i32* @verbose, align 4
  %166 = icmp ne i32 %165, 0
  br i1 %166, label %167, label %197

167:                                              ; preds = %164
  %168 = call %struct.tm* @localtime(i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 0)) #15
  store %struct.tm* %168, %struct.tm** %9, align 8
  %169 = load i32, i32* %4, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [9 x i8*], [9 x i8*]* @do_list.methods, i64 0, i64 %170
  %172 = load i8*, i8** %171, align 8
  %173 = load i64, i64* %5, align 8
  %174 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.145, i64 0, i64 0), i8* %172, i64 %173)
  %175 = load %struct.tm*, %struct.tm** %9, align 8
  %176 = icmp ne %struct.tm* %175, null
  br i1 %176, label %177, label %194

177:                                              ; preds = %167
  %178 = load %struct.tm*, %struct.tm** %9, align 8
  %179 = getelementptr inbounds %struct.tm, %struct.tm* %178, i32 0, i32 4
  %180 = load i32, i32* %179, align 8
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [12 x [4 x i8]], [12 x [4 x i8]]* @do_list.month_abbr, i64 0, i64 %181
  %183 = getelementptr inbounds [4 x i8], [4 x i8]* %182, i64 0, i64 0
  %184 = load %struct.tm*, %struct.tm** %9, align 8
  %185 = getelementptr inbounds %struct.tm, %struct.tm* %184, i32 0, i32 3
  %186 = load i32, i32* %185, align 4
  %187 = load %struct.tm*, %struct.tm** %9, align 8
  %188 = getelementptr inbounds %struct.tm, %struct.tm* %187, i32 0, i32 2
  %189 = load i32, i32* %188, align 8
  %190 = load %struct.tm*, %struct.tm** %9, align 8
  %191 = getelementptr inbounds %struct.tm, %struct.tm* %190, i32 0, i32 1
  %192 = load i32, i32* %191, align 4
  %193 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.146, i64 0, i64 0), i8* %183, i32 %186, i32 %189, i32 %192)
  br label %196

194:                                              ; preds = %167
  %195 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.147, i64 0, i64 0))
  br label %196

196:                                              ; preds = %194, %177
  br label %197

197:                                              ; preds = %196, %164
  %198 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %199 = load i64, i64* @bytes_in, align 8
  %200 = load i32, i32* %6, align 4
  call void @fprint_off(%struct._IO_FILE* %198, i64 %199, i32 %200)
  %201 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.143, i64 0, i64 0))
  %202 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %203 = load i64, i64* @bytes_out, align 8
  %204 = load i32, i32* %6, align 4
  call void @fprint_off(%struct._IO_FILE* %202, i64 %203, i32 %204)
  %205 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.143, i64 0, i64 0))
  %206 = load i64, i64* @bytes_in, align 8
  %207 = icmp eq i64 %206, -1
  br i1 %207, label %208, label %209

208:                                              ; preds = %197
  store i64 -1, i64* @total_in, align 8
  store i64 0, i64* @header_bytes, align 8
  store i64 0, i64* @bytes_out, align 8
  store i64 0, i64* @bytes_in, align 8
  br label %217

209:                                              ; preds = %197
  %210 = load i64, i64* @total_in, align 8
  %211 = icmp sge i64 %210, 0
  br i1 %211, label %212, label %216

212:                                              ; preds = %209
  %213 = load i64, i64* @bytes_in, align 8
  %214 = load i64, i64* @total_in, align 8
  %215 = add nsw i64 %214, %213
  store i64 %215, i64* @total_in, align 8
  br label %216

216:                                              ; preds = %212, %209
  br label %217

217:                                              ; preds = %216, %208
  %218 = load i64, i64* @bytes_out, align 8
  %219 = icmp eq i64 %218, -1
  br i1 %219, label %220, label %221

220:                                              ; preds = %217
  store i64 -1, i64* @total_out, align 8
  store i64 0, i64* @header_bytes, align 8
  store i64 0, i64* @bytes_out, align 8
  store i64 0, i64* @bytes_in, align 8
  br label %229

221:                                              ; preds = %217
  %222 = load i64, i64* @total_out, align 8
  %223 = icmp sge i64 %222, 0
  br i1 %223, label %224, label %228

224:                                              ; preds = %221
  %225 = load i64, i64* @bytes_out, align 8
  %226 = load i64, i64* @total_out, align 8
  %227 = add nsw i64 %226, %225
  store i64 %227, i64* @total_out, align 8
  br label %228

228:                                              ; preds = %224, %221
  br label %229

229:                                              ; preds = %228, %220
  %230 = load i64, i64* @bytes_out, align 8
  %231 = load i64, i64* @bytes_in, align 8
  %232 = load i64, i64* @header_bytes, align 8
  %233 = sub nsw i64 %231, %232
  %234 = sub nsw i64 %230, %233
  %235 = load i64, i64* @bytes_out, align 8
  %236 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  call void @display_ratio(i64 %234, i64 %235, %struct._IO_FILE* %236)
  %237 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.148, i64 0, i64 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  br label %238

238:                                              ; preds = %229, %70, %49
  ret void
}

declare dso_local i32 @fdatasync(i32) #6

; Function Attrs: nounwind readnone
declare dso_local i32* @__errno_location() #8

declare dso_local i32 @printf(i8*, ...) #6

; Function Attrs: nounwind
declare dso_local i64 @lseek(i32, i64, i32) #5

declare dso_local i64 @read(i32, i8*, i64) #6

; Function Attrs: nounwind
declare dso_local %struct.tm* @localtime(i64*) #5

; Function Attrs: nounwind
declare dso_local i32 @isatty(i32) #5

; Function Attrs: nounwind
declare dso_local i32 @fstat(i32, %struct.stat*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @progerror(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = call i32* @__errno_location() #16
  %5 = load i32, i32* %4, align 4
  store i32 %5, i32* %3, align 4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = load i8*, i8** @program_name, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0), i8* %7)
  %9 = load i32, i32* %3, align 4
  %10 = call i32* @__errno_location() #16
  store i32 %9, i32* %10, align 4
  %11 = load i8*, i8** %2, align 8
  call void @perror(i8* %11)
  store i32 1, i32* @exit_code, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @get_method(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca [10 x i8], align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca [2 x i8], align 1
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %16 = load i32, i32* @force, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %56

18:                                               ; preds = %1
  %19 = load i32, i32* @to_stdout, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %56

21:                                               ; preds = %18
  %22 = load i32, i32* @inptr, align 4
  %23 = load i32, i32* @insize, align 4
  %24 = icmp ult i32 %22, %23
  br i1 %24, label %25, label %32

25:                                               ; preds = %21
  %26 = load i32, i32* @inptr, align 4
  %27 = add i32 %26, 1
  store i32 %27, i32* @inptr, align 4
  %28 = zext i32 %26 to i64
  %29 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i32
  br label %34

32:                                               ; preds = %21
  %33 = call i32 @fill_inbuf(i32 1)
  br label %34

34:                                               ; preds = %32, %25
  %35 = phi i32 [ %31, %25 ], [ %33, %32 ]
  store i32 %35, i32* %6, align 4
  %36 = load i32, i32* %6, align 4
  %37 = trunc i32 %36 to i8
  %38 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  store i8 %37, i8* %38, align 1
  %39 = load i32, i32* @inptr, align 4
  %40 = load i32, i32* @insize, align 4
  %41 = icmp ult i32 %39, %40
  br i1 %41, label %42, label %49

42:                                               ; preds = %34
  %43 = load i32, i32* @inptr, align 4
  %44 = add i32 %43, 1
  store i32 %44, i32* @inptr, align 4
  %45 = zext i32 %43 to i64
  %46 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  br label %51

49:                                               ; preds = %34
  %50 = call i32 @fill_inbuf(i32 1)
  br label %51

51:                                               ; preds = %49, %42
  %52 = phi i32 [ %48, %42 ], [ %50, %49 ]
  store i32 %52, i32* %7, align 4
  %53 = load i32, i32* %7, align 4
  %54 = trunc i32 %53 to i8
  %55 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 1
  store i8 %54, i8* %55, align 1
  br label %112

56:                                               ; preds = %18, %1
  %57 = load i32, i32* @inptr, align 4
  %58 = load i32, i32* @insize, align 4
  %59 = icmp ult i32 %57, %58
  br i1 %59, label %60, label %67

60:                                               ; preds = %56
  %61 = load i32, i32* @inptr, align 4
  %62 = add i32 %61, 1
  store i32 %62, i32* @inptr, align 4
  %63 = zext i32 %61 to i64
  %64 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  br label %69

67:                                               ; preds = %56
  %68 = call i32 @fill_inbuf(i32 0)
  br label %69

69:                                               ; preds = %67, %60
  %70 = phi i32 [ %66, %60 ], [ %68, %67 ]
  %71 = trunc i32 %70 to i8
  %72 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  store i8 %71, i8* %72, align 1
  store i32 0, i32* %6, align 4
  %73 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  %74 = load i8, i8* %73, align 1
  %75 = icmp ne i8 %74, 0
  br i1 %75, label %76, label %93

76:                                               ; preds = %69
  %77 = load i32, i32* @inptr, align 4
  %78 = load i32, i32* @insize, align 4
  %79 = icmp ult i32 %77, %78
  br i1 %79, label %80, label %87

80:                                               ; preds = %76
  %81 = load i32, i32* @inptr, align 4
  %82 = add i32 %81, 1
  store i32 %82, i32* @inptr, align 4
  %83 = zext i32 %81 to i64
  %84 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  br label %89

87:                                               ; preds = %76
  %88 = call i32 @fill_inbuf(i32 0)
  br label %89

89:                                               ; preds = %87, %80
  %90 = phi i32 [ %86, %80 ], [ %88, %87 ]
  %91 = trunc i32 %90 to i8
  %92 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 1
  store i8 %91, i8* %92, align 1
  store i32 0, i32* %7, align 4
  br label %111

93:                                               ; preds = %69
  %94 = load i32, i32* @inptr, align 4
  %95 = load i32, i32* @insize, align 4
  %96 = icmp ult i32 %94, %95
  br i1 %96, label %97, label %104

97:                                               ; preds = %93
  %98 = load i32, i32* @inptr, align 4
  %99 = add i32 %98, 1
  store i32 %99, i32* @inptr, align 4
  %100 = zext i32 %98 to i64
  %101 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %100
  %102 = load i8, i8* %101, align 1
  %103 = zext i8 %102 to i32
  br label %106

104:                                              ; preds = %93
  %105 = call i32 @fill_inbuf(i32 1)
  br label %106

106:                                              ; preds = %104, %97
  %107 = phi i32 [ %103, %97 ], [ %105, %104 ]
  store i32 %107, i32* %7, align 4
  %108 = load i32, i32* %7, align 4
  %109 = trunc i32 %108 to i8
  %110 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 1
  store i8 %109, i8* %110, align 1
  br label %111

111:                                              ; preds = %106, %89
  br label %112

112:                                              ; preds = %111, %51
  store i32 -1, i32* @method, align 4
  %113 = load i32, i32* @part_nb, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* @part_nb, align 4
  store i64 0, i64* @header_bytes, align 8
  store i32 0, i32* @last_member, align 4
  %115 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  %116 = call i32 @memcmp(i8* %115, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.82, i64 0, i64 0), i64 2) #14
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %122, label %118

118:                                              ; preds = %112
  %119 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  %120 = call i32 @memcmp(i8* %119, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.83, i64 0, i64 0), i64 2) #14
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %555

122:                                              ; preds = %118, %112
  %123 = load i32, i32* @inptr, align 4
  %124 = load i32, i32* @insize, align 4
  %125 = icmp ult i32 %123, %124
  br i1 %125, label %126, label %133

126:                                              ; preds = %122
  %127 = load i32, i32* @inptr, align 4
  %128 = add i32 %127, 1
  store i32 %128, i32* @inptr, align 4
  %129 = zext i32 %127 to i64
  %130 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %129
  %131 = load i8, i8* %130, align 1
  %132 = zext i8 %131 to i32
  br label %135

133:                                              ; preds = %122
  %134 = call i32 @fill_inbuf(i32 0)
  br label %135

135:                                              ; preds = %133, %126
  %136 = phi i32 [ %132, %126 ], [ %134, %133 ]
  store i32 %136, i32* @method, align 4
  %137 = load i32, i32* @method, align 4
  %138 = icmp ne i32 %137, 8
  br i1 %138, label %139, label %144

139:                                              ; preds = %135
  %140 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %141 = load i8*, i8** @program_name, align 8
  %142 = load i32, i32* @method, align 4
  %143 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %140, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.84, i64 0, i64 0), i8* %141, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i32 %142)
  store i32 1, i32* @exit_code, align 4
  store i32 -1, i32* %2, align 4
  br label %684

144:                                              ; preds = %135
  store i32 (i32, i32)* @unzip, i32 (i32, i32)** @work, align 8
  %145 = load i32, i32* @inptr, align 4
  %146 = load i32, i32* @insize, align 4
  %147 = icmp ult i32 %145, %146
  br i1 %147, label %148, label %155

148:                                              ; preds = %144
  %149 = load i32, i32* @inptr, align 4
  %150 = add i32 %149, 1
  store i32 %150, i32* @inptr, align 4
  %151 = zext i32 %149 to i64
  %152 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %151
  %153 = load i8, i8* %152, align 1
  %154 = zext i8 %153 to i32
  br label %157

155:                                              ; preds = %144
  %156 = call i32 @fill_inbuf(i32 0)
  br label %157

157:                                              ; preds = %155, %148
  %158 = phi i32 [ %154, %148 ], [ %156, %155 ]
  %159 = trunc i32 %158 to i8
  store i8 %159, i8* %4, align 1
  %160 = load i8, i8* %4, align 1
  %161 = zext i8 %160 to i32
  %162 = and i32 %161, 32
  %163 = icmp ne i32 %162, 0
  br i1 %163, label %164, label %168

164:                                              ; preds = %157
  %165 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %166 = load i8*, i8** @program_name, align 8
  %167 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %165, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.85, i64 0, i64 0), i8* %166, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 1, i32* @exit_code, align 4
  store i32 -1, i32* %2, align 4
  br label %684

168:                                              ; preds = %157
  %169 = load i8, i8* %4, align 1
  %170 = zext i8 %169 to i32
  %171 = and i32 %170, 192
  %172 = icmp ne i32 %171, 0
  br i1 %172, label %173, label %183

173:                                              ; preds = %168
  %174 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %175 = load i8*, i8** @program_name, align 8
  %176 = load i8, i8* %4, align 1
  %177 = zext i8 %176 to i32
  %178 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %174, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.86, i64 0, i64 0), i8* %175, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i32 %177)
  store i32 1, i32* @exit_code, align 4
  %179 = load i32, i32* @force, align 4
  %180 = icmp sle i32 %179, 1
  br i1 %180, label %181, label %182

181:                                              ; preds = %173
  store i32 -1, i32* %2, align 4
  br label %684

182:                                              ; preds = %173
  br label %183

183:                                              ; preds = %182, %168
  %184 = load i32, i32* @inptr, align 4
  %185 = load i32, i32* @insize, align 4
  %186 = icmp ult i32 %184, %185
  br i1 %186, label %187, label %194

187:                                              ; preds = %183
  %188 = load i32, i32* @inptr, align 4
  %189 = add i32 %188, 1
  store i32 %189, i32* @inptr, align 4
  %190 = zext i32 %188 to i64
  %191 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %190
  %192 = load i8, i8* %191, align 1
  %193 = zext i8 %192 to i32
  br label %196

194:                                              ; preds = %183
  %195 = call i32 @fill_inbuf(i32 0)
  br label %196

196:                                              ; preds = %194, %187
  %197 = phi i32 [ %193, %187 ], [ %195, %194 ]
  %198 = sext i32 %197 to i64
  store i64 %198, i64* %8, align 8
  %199 = load i32, i32* @inptr, align 4
  %200 = load i32, i32* @insize, align 4
  %201 = icmp ult i32 %199, %200
  br i1 %201, label %202, label %209

202:                                              ; preds = %196
  %203 = load i32, i32* @inptr, align 4
  %204 = add i32 %203, 1
  store i32 %204, i32* @inptr, align 4
  %205 = zext i32 %203 to i64
  %206 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %205
  %207 = load i8, i8* %206, align 1
  %208 = zext i8 %207 to i32
  br label %211

209:                                              ; preds = %196
  %210 = call i32 @fill_inbuf(i32 0)
  br label %211

211:                                              ; preds = %209, %202
  %212 = phi i32 [ %208, %202 ], [ %210, %209 ]
  %213 = sext i32 %212 to i64
  %214 = shl i64 %213, 8
  %215 = load i64, i64* %8, align 8
  %216 = or i64 %215, %214
  store i64 %216, i64* %8, align 8
  %217 = load i32, i32* @inptr, align 4
  %218 = load i32, i32* @insize, align 4
  %219 = icmp ult i32 %217, %218
  br i1 %219, label %220, label %227

220:                                              ; preds = %211
  %221 = load i32, i32* @inptr, align 4
  %222 = add i32 %221, 1
  store i32 %222, i32* @inptr, align 4
  %223 = zext i32 %221 to i64
  %224 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %223
  %225 = load i8, i8* %224, align 1
  %226 = zext i8 %225 to i32
  br label %229

227:                                              ; preds = %211
  %228 = call i32 @fill_inbuf(i32 0)
  br label %229

229:                                              ; preds = %227, %220
  %230 = phi i32 [ %226, %220 ], [ %228, %227 ]
  %231 = sext i32 %230 to i64
  %232 = shl i64 %231, 16
  %233 = load i64, i64* %8, align 8
  %234 = or i64 %233, %232
  store i64 %234, i64* %8, align 8
  %235 = load i32, i32* @inptr, align 4
  %236 = load i32, i32* @insize, align 4
  %237 = icmp ult i32 %235, %236
  br i1 %237, label %238, label %245

238:                                              ; preds = %229
  %239 = load i32, i32* @inptr, align 4
  %240 = add i32 %239, 1
  store i32 %240, i32* @inptr, align 4
  %241 = zext i32 %239 to i64
  %242 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %241
  %243 = load i8, i8* %242, align 1
  %244 = zext i8 %243 to i32
  br label %247

245:                                              ; preds = %229
  %246 = call i32 @fill_inbuf(i32 0)
  br label %247

247:                                              ; preds = %245, %238
  %248 = phi i32 [ %244, %238 ], [ %246, %245 ]
  %249 = sext i32 %248 to i64
  %250 = shl i64 %249, 24
  %251 = load i64, i64* %8, align 8
  %252 = or i64 %251, %250
  store i64 %252, i64* %8, align 8
  %253 = load i64, i64* %8, align 8
  %254 = icmp ne i64 %253, 0
  br i1 %254, label %255, label %277

255:                                              ; preds = %247
  %256 = load i32, i32* @no_time, align 4
  %257 = icmp ne i32 %256, 0
  br i1 %257, label %277, label %258

258:                                              ; preds = %255
  %259 = load i64, i64* %8, align 8
  %260 = icmp ule i64 %259, 9223372036854775807
  br i1 %260, label %261, label %263

261:                                              ; preds = %258
  %262 = load i64, i64* %8, align 8
  store i64 %262, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 0), align 8
  store i64 0, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 1), align 8
  br label %276

263:                                              ; preds = %258
  %264 = load i32, i32* @quiet, align 4
  %265 = icmp ne i32 %264, 0
  br i1 %265, label %271, label %266

266:                                              ; preds = %263
  %267 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %268 = load i8*, i8** @program_name, align 8
  %269 = load i64, i64* %8, align 8
  %270 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %267, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.87, i64 0, i64 0), i8* %268, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i64 %269)
  br label %271

271:                                              ; preds = %266, %263
  %272 = load i32, i32* @exit_code, align 4
  %273 = icmp eq i32 %272, 0
  br i1 %273, label %274, label %275

274:                                              ; preds = %271
  store i32 2, i32* @exit_code, align 4
  br label %275

275:                                              ; preds = %274, %271
  store i64 9223372036854775807, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 0), align 8
  store i64 999999999, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 1), align 8
  br label %276

276:                                              ; preds = %275, %261
  br label %277

277:                                              ; preds = %276, %255, %247
  %278 = load i32, i32* @inptr, align 4
  %279 = load i32, i32* @insize, align 4
  %280 = icmp ult i32 %278, %279
  br i1 %280, label %281, label %288

281:                                              ; preds = %277
  %282 = load i32, i32* @inptr, align 4
  %283 = add i32 %282, 1
  store i32 %283, i32* @inptr, align 4
  %284 = zext i32 %282 to i64
  %285 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %284
  %286 = load i8, i8* %285, align 1
  %287 = zext i8 %286 to i32
  br label %290

288:                                              ; preds = %277
  %289 = call i32 @fill_inbuf(i32 0)
  br label %290

290:                                              ; preds = %288, %281
  %291 = phi i32 [ %287, %281 ], [ %289, %288 ]
  %292 = trunc i32 %291 to i8
  %293 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 8
  store i8 %292, i8* %293, align 1
  %294 = load i32, i32* @inptr, align 4
  %295 = load i32, i32* @insize, align 4
  %296 = icmp ult i32 %294, %295
  br i1 %296, label %297, label %304

297:                                              ; preds = %290
  %298 = load i32, i32* @inptr, align 4
  %299 = add i32 %298, 1
  store i32 %299, i32* @inptr, align 4
  %300 = zext i32 %298 to i64
  %301 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %300
  %302 = load i8, i8* %301, align 1
  %303 = zext i8 %302 to i32
  br label %306

304:                                              ; preds = %290
  %305 = call i32 @fill_inbuf(i32 0)
  br label %306

306:                                              ; preds = %304, %297
  %307 = phi i32 [ %303, %297 ], [ %305, %304 ]
  %308 = trunc i32 %307 to i8
  %309 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 9
  store i8 %308, i8* %309, align 1
  %310 = load i8, i8* %4, align 1
  %311 = zext i8 %310 to i32
  %312 = and i32 %311, 2
  %313 = icmp ne i32 %312, 0
  br i1 %313, label %314, label %339

314:                                              ; preds = %306
  %315 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 2
  store i8 8, i8* %315, align 1
  %316 = load i8, i8* %4, align 1
  %317 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 3
  store i8 %316, i8* %317, align 1
  %318 = load i64, i64* %8, align 8
  %319 = and i64 %318, 255
  %320 = trunc i64 %319 to i8
  %321 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 4
  store i8 %320, i8* %321, align 1
  %322 = load i64, i64* %8, align 8
  %323 = lshr i64 %322, 8
  %324 = and i64 %323, 255
  %325 = trunc i64 %324 to i8
  %326 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 5
  store i8 %325, i8* %326, align 1
  %327 = load i64, i64* %8, align 8
  %328 = lshr i64 %327, 16
  %329 = and i64 %328, 255
  %330 = trunc i64 %329 to i8
  %331 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 6
  store i8 %330, i8* %331, align 1
  %332 = load i64, i64* %8, align 8
  %333 = lshr i64 %332, 24
  %334 = trunc i64 %333 to i8
  %335 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 7
  store i8 %334, i8* %335, align 1
  %336 = call i64 @updcrc(i8* null, i32 0)
  %337 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  %338 = call i64 @updcrc(i8* %337, i32 10)
  br label %339

339:                                              ; preds = %314, %306
  %340 = load i8, i8* %4, align 1
  %341 = zext i8 %340 to i32
  %342 = and i32 %341, 4
  %343 = icmp ne i32 %342, 0
  br i1 %343, label %344, label %402

344:                                              ; preds = %339
  %345 = load i32, i32* @inptr, align 4
  %346 = load i32, i32* @insize, align 4
  %347 = icmp ult i32 %345, %346
  br i1 %347, label %348, label %355

348:                                              ; preds = %344
  %349 = load i32, i32* @inptr, align 4
  %350 = add i32 %349, 1
  store i32 %350, i32* @inptr, align 4
  %351 = zext i32 %349 to i64
  %352 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %351
  %353 = load i8, i8* %352, align 1
  %354 = zext i8 %353 to i32
  br label %357

355:                                              ; preds = %344
  %356 = call i32 @fill_inbuf(i32 0)
  br label %357

357:                                              ; preds = %355, %348
  %358 = phi i32 [ %354, %348 ], [ %356, %355 ]
  %359 = trunc i32 %358 to i8
  %360 = getelementptr inbounds [2 x i8], [2 x i8]* %9, i64 0, i64 0
  store i8 %359, i8* %360, align 1
  %361 = zext i8 %359 to i32
  store i32 %361, i32* %10, align 4
  %362 = load i32, i32* @inptr, align 4
  %363 = load i32, i32* @insize, align 4
  %364 = icmp ult i32 %362, %363
  br i1 %364, label %365, label %372

365:                                              ; preds = %357
  %366 = load i32, i32* @inptr, align 4
  %367 = add i32 %366, 1
  store i32 %367, i32* @inptr, align 4
  %368 = zext i32 %366 to i64
  %369 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %368
  %370 = load i8, i8* %369, align 1
  %371 = zext i8 %370 to i32
  br label %374

372:                                              ; preds = %357
  %373 = call i32 @fill_inbuf(i32 0)
  br label %374

374:                                              ; preds = %372, %365
  %375 = phi i32 [ %371, %365 ], [ %373, %372 ]
  %376 = trunc i32 %375 to i8
  %377 = getelementptr inbounds [2 x i8], [2 x i8]* %9, i64 0, i64 1
  store i8 %376, i8* %377, align 1
  %378 = zext i8 %376 to i32
  %379 = shl i32 %378, 8
  %380 = load i32, i32* %10, align 4
  %381 = or i32 %380, %379
  store i32 %381, i32* %10, align 4
  %382 = load i32, i32* @verbose, align 4
  %383 = icmp ne i32 %382, 0
  br i1 %383, label %384, label %389

384:                                              ; preds = %374
  %385 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %386 = load i8*, i8** @program_name, align 8
  %387 = load i32, i32* %10, align 4
  %388 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %385, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.88, i64 0, i64 0), i8* %386, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i32 %387)
  br label %389

389:                                              ; preds = %384, %374
  %390 = load i8, i8* %4, align 1
  %391 = zext i8 %390 to i32
  %392 = and i32 %391, 2
  %393 = icmp ne i32 %392, 0
  br i1 %393, label %394, label %397

394:                                              ; preds = %389
  %395 = getelementptr inbounds [2 x i8], [2 x i8]* %9, i64 0, i64 0
  %396 = call i64 @updcrc(i8* %395, i32 2)
  br label %397

397:                                              ; preds = %394, %389
  %398 = load i32, i32* %10, align 4
  %399 = zext i32 %398 to i64
  %400 = load i8, i8* %4, align 1
  %401 = zext i8 %400 to i32
  call void @discard_input_bytes(i64 %399, i32 %401)
  br label %402

402:                                              ; preds = %397, %339
  %403 = load i8, i8* %4, align 1
  %404 = zext i8 %403 to i32
  %405 = and i32 %404, 8
  %406 = icmp ne i32 %405, 0
  br i1 %406, label %407, label %484

407:                                              ; preds = %402
  %408 = load i32, i32* @no_name, align 4
  %409 = icmp ne i32 %408, 0
  br i1 %409, label %419, label %410

410:                                              ; preds = %407
  %411 = load i32, i32* @to_stdout, align 4
  %412 = icmp ne i32 %411, 0
  br i1 %412, label %413, label %416

413:                                              ; preds = %410
  %414 = load i32, i32* @list, align 4
  %415 = icmp ne i32 %414, 0
  br i1 %415, label %416, label %419

416:                                              ; preds = %413, %410
  %417 = load i32, i32* @part_nb, align 4
  %418 = icmp sgt i32 %417, 1
  br i1 %418, label %419, label %422

419:                                              ; preds = %416, %413, %407
  %420 = load i8, i8* %4, align 1
  %421 = zext i8 %420 to i32
  call void @discard_input_bytes(i64 -1, i32 %421)
  br label %483

422:                                              ; preds = %416
  %423 = call i8* @gzip_base_name(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0)) #14
  store i8* %423, i8** %11, align 8
  %424 = load i8*, i8** %11, align 8
  store i8* %424, i8** %12, align 8
  br label %425

425:                                              ; preds = %452, %422
  %426 = load i32, i32* @inptr, align 4
  %427 = load i32, i32* @insize, align 4
  %428 = icmp ult i32 %426, %427
  br i1 %428, label %429, label %436

429:                                              ; preds = %425
  %430 = load i32, i32* @inptr, align 4
  %431 = add i32 %430, 1
  store i32 %431, i32* @inptr, align 4
  %432 = zext i32 %430 to i64
  %433 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %432
  %434 = load i8, i8* %433, align 1
  %435 = zext i8 %434 to i32
  br label %438

436:                                              ; preds = %425
  %437 = call i32 @fill_inbuf(i32 0)
  br label %438

438:                                              ; preds = %436, %429
  %439 = phi i32 [ %435, %429 ], [ %437, %436 ]
  %440 = trunc i32 %439 to i8
  %441 = load i8*, i8** %11, align 8
  store i8 %440, i8* %441, align 1
  %442 = load i8*, i8** %11, align 8
  %443 = getelementptr inbounds i8, i8* %442, i32 1
  store i8* %443, i8** %11, align 8
  %444 = load i8, i8* %442, align 1
  %445 = sext i8 %444 to i32
  %446 = icmp eq i32 %445, 0
  br i1 %446, label %447, label %448

447:                                              ; preds = %438
  br label %453

448:                                              ; preds = %438
  %449 = load i8*, i8** %11, align 8
  %450 = icmp uge i8* %449, getelementptr inbounds (i8, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0), i64 1024)
  br i1 %450, label %451, label %452

451:                                              ; preds = %448
  call void @gzip_error(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.89, i64 0, i64 0)) #13
  unreachable

452:                                              ; preds = %448
  br label %425

453:                                              ; preds = %447
  %454 = load i8, i8* %4, align 1
  %455 = zext i8 %454 to i32
  %456 = and i32 %455, 2
  %457 = icmp ne i32 %456, 0
  br i1 %457, label %458, label %467

458:                                              ; preds = %453
  %459 = load i8*, i8** %12, align 8
  %460 = load i8*, i8** %11, align 8
  %461 = load i8*, i8** %12, align 8
  %462 = ptrtoint i8* %460 to i64
  %463 = ptrtoint i8* %461 to i64
  %464 = sub i64 %462, %463
  %465 = trunc i64 %464 to i32
  %466 = call i64 @updcrc(i8* %459, i32 %465)
  br label %467

467:                                              ; preds = %458, %453
  %468 = load i8*, i8** %12, align 8
  %469 = call i8* @gzip_base_name(i8* %468) #14
  store i8* %469, i8** %11, align 8
  %470 = load i8*, i8** %12, align 8
  %471 = load i8*, i8** %11, align 8
  %472 = load i8*, i8** %11, align 8
  %473 = call i64 @strlen(i8* %472) #14
  %474 = add i64 %473, 1
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %470, i8* align 1 %471, i64 %474, i1 false)
  %475 = load i32, i32* @list, align 4
  %476 = icmp ne i32 %475, 0
  br i1 %476, label %482, label %477

477:                                              ; preds = %467
  %478 = load i8*, i8** %12, align 8
  %479 = icmp ne i8* %478, null
  br i1 %479, label %480, label %481

480:                                              ; preds = %477
  store i32 0, i32* @list, align 4
  br label %481

481:                                              ; preds = %480, %477
  br label %482

482:                                              ; preds = %481, %467
  br label %483

483:                                              ; preds = %482, %419
  br label %484

484:                                              ; preds = %483, %402
  %485 = load i8, i8* %4, align 1
  %486 = zext i8 %485 to i32
  %487 = and i32 %486, 16
  %488 = icmp ne i32 %487, 0
  br i1 %488, label %489, label %492

489:                                              ; preds = %484
  %490 = load i8, i8* %4, align 1
  %491 = zext i8 %490 to i32
  call void @discard_input_bytes(i64 -1, i32 %491)
  br label %492

492:                                              ; preds = %489, %484
  %493 = load i8, i8* %4, align 1
  %494 = zext i8 %493 to i32
  %495 = and i32 %494, 2
  %496 = icmp ne i32 %495, 0
  br i1 %496, label %497, label %547

497:                                              ; preds = %492
  %498 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  %499 = call i64 @updcrc(i8* %498, i32 0)
  %500 = and i64 %499, 65535
  %501 = trunc i64 %500 to i32
  store i32 %501, i32* %13, align 4
  %502 = load i32, i32* @inptr, align 4
  %503 = load i32, i32* @insize, align 4
  %504 = icmp ult i32 %502, %503
  br i1 %504, label %505, label %512

505:                                              ; preds = %497
  %506 = load i32, i32* @inptr, align 4
  %507 = add i32 %506, 1
  store i32 %507, i32* @inptr, align 4
  %508 = zext i32 %506 to i64
  %509 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %508
  %510 = load i8, i8* %509, align 1
  %511 = zext i8 %510 to i32
  br label %514

512:                                              ; preds = %497
  %513 = call i32 @fill_inbuf(i32 0)
  br label %514

514:                                              ; preds = %512, %505
  %515 = phi i32 [ %511, %505 ], [ %513, %512 ]
  store i32 %515, i32* %14, align 4
  %516 = load i32, i32* @inptr, align 4
  %517 = load i32, i32* @insize, align 4
  %518 = icmp ult i32 %516, %517
  br i1 %518, label %519, label %526

519:                                              ; preds = %514
  %520 = load i32, i32* @inptr, align 4
  %521 = add i32 %520, 1
  store i32 %521, i32* @inptr, align 4
  %522 = zext i32 %520 to i64
  %523 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %522
  %524 = load i8, i8* %523, align 1
  %525 = zext i8 %524 to i32
  br label %528

526:                                              ; preds = %514
  %527 = call i32 @fill_inbuf(i32 0)
  br label %528

528:                                              ; preds = %526, %519
  %529 = phi i32 [ %525, %519 ], [ %527, %526 ]
  %530 = shl i32 %529, 8
  %531 = load i32, i32* %14, align 4
  %532 = or i32 %531, %530
  store i32 %532, i32* %14, align 4
  %533 = load i32, i32* %14, align 4
  %534 = load i32, i32* %13, align 4
  %535 = icmp ne i32 %533, %534
  br i1 %535, label %536, label %546

536:                                              ; preds = %528
  %537 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %538 = load i8*, i8** @program_name, align 8
  %539 = load i32, i32* %14, align 4
  %540 = load i32, i32* %13, align 4
  %541 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %537, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.90, i64 0, i64 0), i8* %538, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i32 %539, i32 %540)
  store i32 1, i32* @exit_code, align 4
  %542 = load i32, i32* @force, align 4
  %543 = icmp sle i32 %542, 1
  br i1 %543, label %544, label %545

544:                                              ; preds = %536
  store i32 -1, i32* %2, align 4
  br label %684

545:                                              ; preds = %536
  br label %546

546:                                              ; preds = %545, %528
  br label %547

547:                                              ; preds = %546, %492
  %548 = load i32, i32* @part_nb, align 4
  %549 = icmp eq i32 %548, 1
  br i1 %549, label %550, label %554

550:                                              ; preds = %547
  %551 = load i32, i32* @inptr, align 4
  %552 = add i32 %551, 8
  %553 = zext i32 %552 to i64
  store i64 %553, i64* @header_bytes, align 8
  br label %554

554:                                              ; preds = %550, %547
  br label %614

555:                                              ; preds = %118
  %556 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  %557 = call i32 @memcmp(i8* %556, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.91, i64 0, i64 0), i64 2) #14
  %558 = icmp eq i32 %557, 0
  br i1 %558, label %559, label %571

559:                                              ; preds = %555
  %560 = load i32, i32* @inptr, align 4
  %561 = icmp eq i32 %560, 2
  br i1 %561, label %562, label %571

562:                                              ; preds = %559
  %563 = call i32 @memcmp(i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.91, i64 0, i64 0), i64 4) #14
  %564 = icmp eq i32 %563, 0
  br i1 %564, label %565, label %571

565:                                              ; preds = %562
  store i32 0, i32* @inptr, align 4
  store i32 (i32, i32)* @unzip, i32 (i32, i32)** @work, align 8
  %566 = load i32, i32* %3, align 4
  %567 = call i32 @check_zipfile(i32 %566)
  %568 = icmp ne i32 %567, 0
  br i1 %568, label %569, label %570

569:                                              ; preds = %565
  store i32 -1, i32* %2, align 4
  br label %684

570:                                              ; preds = %565
  store i32 1, i32* @last_member, align 4
  br label %613

571:                                              ; preds = %562, %559, %555
  %572 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  %573 = call i32 @memcmp(i8* %572, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.92, i64 0, i64 0), i64 2) #14
  %574 = icmp eq i32 %573, 0
  br i1 %574, label %575, label %576

575:                                              ; preds = %571
  store i32 (i32, i32)* @unpack, i32 (i32, i32)** @work, align 8
  store i32 2, i32* @method, align 4
  br label %612

576:                                              ; preds = %571
  %577 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  %578 = call i32 @memcmp(i8* %577, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.93, i64 0, i64 0), i64 2) #14
  %579 = icmp eq i32 %578, 0
  br i1 %579, label %580, label %581

580:                                              ; preds = %576
  store i32 (i32, i32)* @unlzw, i32 (i32, i32)** @work, align 8
  store i32 1, i32* @method, align 4
  store i32 1, i32* @last_member, align 4
  br label %611

581:                                              ; preds = %576
  %582 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  %583 = call i32 @memcmp(i8* %582, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.94, i64 0, i64 0), i64 2) #14
  %584 = icmp eq i32 %583, 0
  br i1 %584, label %585, label %586

585:                                              ; preds = %581
  store i32 (i32, i32)* @unlzh, i32 (i32, i32)** @work, align 8
  store i32 3, i32* @method, align 4
  store i32 1, i32* @last_member, align 4
  br label %610

586:                                              ; preds = %581
  %587 = load i32, i32* @force, align 4
  %588 = icmp ne i32 %587, 0
  br i1 %588, label %589, label %609

589:                                              ; preds = %586
  %590 = load i32, i32* @to_stdout, align 4
  %591 = icmp ne i32 %590, 0
  br i1 %591, label %592, label %609

592:                                              ; preds = %589
  %593 = load i32, i32* @list, align 4
  %594 = icmp ne i32 %593, 0
  br i1 %594, label %609, label %595

595:                                              ; preds = %592
  store i32 0, i32* @method, align 4
  store i32 (i32, i32)* @copy, i32 (i32, i32)** @work, align 8
  %596 = load i32, i32* %7, align 4
  %597 = icmp ne i32 %596, -1
  br i1 %597, label %598, label %601

598:                                              ; preds = %595
  %599 = load i32, i32* @inptr, align 4
  %600 = add i32 %599, -1
  store i32 %600, i32* @inptr, align 4
  br label %601

601:                                              ; preds = %598, %595
  store i32 1, i32* @last_member, align 4
  %602 = load i32, i32* %6, align 4
  %603 = icmp ne i32 %602, -1
  br i1 %603, label %604, label %608

604:                                              ; preds = %601
  %605 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  call void @write_buf(i32 1, i8* %605, i32 1)
  %606 = load i64, i64* @bytes_out, align 8
  %607 = add nsw i64 %606, 1
  store i64 %607, i64* @bytes_out, align 8
  br label %608

608:                                              ; preds = %604, %601
  br label %609

609:                                              ; preds = %608, %592, %589, %586
  br label %610

610:                                              ; preds = %609, %585
  br label %611

611:                                              ; preds = %610, %580
  br label %612

612:                                              ; preds = %611, %575
  br label %613

613:                                              ; preds = %612, %570
  br label %614

614:                                              ; preds = %613, %554
  %615 = load i32, i32* @method, align 4
  %616 = icmp sge i32 %615, 0
  br i1 %616, label %617, label %619

617:                                              ; preds = %614
  %618 = load i32, i32* @method, align 4
  store i32 %618, i32* %2, align 4
  br label %684

619:                                              ; preds = %614
  %620 = load i32, i32* @part_nb, align 4
  %621 = icmp eq i32 %620, 1
  br i1 %621, label %622, label %626

622:                                              ; preds = %619
  %623 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %624 = load i8*, i8** @program_name, align 8
  %625 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %623, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.95, i64 0, i64 0), i8* %624, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 1, i32* @exit_code, align 4
  store i32 -1, i32* %2, align 4
  br label %684

626:                                              ; preds = %619
  %627 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i64 0, i64 0
  %628 = load i8, i8* %627, align 1
  %629 = zext i8 %628 to i32
  %630 = icmp eq i32 %629, 0
  br i1 %630, label %631, label %672

631:                                              ; preds = %626
  %632 = load i32, i32* %7, align 4
  store i32 %632, i32* %15, align 4
  br label %633

633:                                              ; preds = %650, %631
  %634 = load i32, i32* %15, align 4
  %635 = icmp eq i32 %634, 0
  br i1 %635, label %636, label %652

636:                                              ; preds = %633
  br label %637

637:                                              ; preds = %636
  %638 = load i32, i32* @inptr, align 4
  %639 = load i32, i32* @insize, align 4
  %640 = icmp ult i32 %638, %639
  br i1 %640, label %641, label %648

641:                                              ; preds = %637
  %642 = load i32, i32* @inptr, align 4
  %643 = add i32 %642, 1
  store i32 %643, i32* @inptr, align 4
  %644 = zext i32 %642 to i64
  %645 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %644
  %646 = load i8, i8* %645, align 1
  %647 = zext i8 %646 to i32
  br label %650

648:                                              ; preds = %637
  %649 = call i32 @fill_inbuf(i32 1)
  br label %650

650:                                              ; preds = %648, %641
  %651 = phi i32 [ %647, %641 ], [ %649, %648 ]
  store i32 %651, i32* %15, align 4
  br label %633, !llvm.loop !29

652:                                              ; preds = %633
  %653 = load i32, i32* %15, align 4
  %654 = icmp eq i32 %653, -1
  br i1 %654, label %655, label %671

655:                                              ; preds = %652
  %656 = load i32, i32* @verbose, align 4
  %657 = icmp ne i32 %656, 0
  br i1 %657, label %658, label %670

658:                                              ; preds = %655
  %659 = load i32, i32* @quiet, align 4
  %660 = icmp ne i32 %659, 0
  br i1 %660, label %665, label %661

661:                                              ; preds = %658
  %662 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %663 = load i8*, i8** @program_name, align 8
  %664 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %662, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.96, i64 0, i64 0), i8* %663, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %665

665:                                              ; preds = %661, %658
  %666 = load i32, i32* @exit_code, align 4
  %667 = icmp eq i32 %666, 0
  br i1 %667, label %668, label %669

668:                                              ; preds = %665
  store i32 2, i32* @exit_code, align 4
  br label %669

669:                                              ; preds = %668, %665
  br label %670

670:                                              ; preds = %669, %655
  store i32 -3, i32* %2, align 4
  br label %684

671:                                              ; preds = %652
  br label %672

672:                                              ; preds = %671, %626
  %673 = load i32, i32* @quiet, align 4
  %674 = icmp ne i32 %673, 0
  br i1 %674, label %679, label %675

675:                                              ; preds = %672
  %676 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %677 = load i8*, i8** @program_name, align 8
  %678 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %676, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.97, i64 0, i64 0), i8* %677, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %679

679:                                              ; preds = %675, %672
  %680 = load i32, i32* @exit_code, align 4
  %681 = icmp eq i32 %680, 0
  br i1 %681, label %682, label %683

682:                                              ; preds = %679
  store i32 2, i32* @exit_code, align 4
  br label %683

683:                                              ; preds = %682, %679
  store i32 -2, i32* %2, align 4
  br label %684

684:                                              ; preds = %683, %670, %622, %617, %569, %544, %181, %164, %139
  %685 = load i32, i32* %2, align 4
  ret i32 %685
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @input_eof() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @decompress, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %0
  %5 = load i32, i32* @last_member, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %4, %0
  store i32 1, i32* %1, align 4
  br label %21

8:                                                ; preds = %4
  %9 = load i32, i32* @inptr, align 4
  %10 = load i32, i32* @insize, align 4
  %11 = icmp eq i32 %9, %10
  br i1 %11, label %12, label %20

12:                                               ; preds = %8
  %13 = load i32, i32* @insize, align 4
  %14 = icmp ne i32 %13, 32768
  br i1 %14, label %18, label %15

15:                                               ; preds = %12
  %16 = call i32 @fill_inbuf(i32 1)
  %17 = icmp eq i32 %16, -1
  br i1 %17, label %18, label %19

18:                                               ; preds = %15, %12
  store i32 1, i32* %1, align 4
  br label %21

19:                                               ; preds = %15
  store i32 0, i32* @inptr, align 4
  br label %20

20:                                               ; preds = %19, %8
  store i32 0, i32* %1, align 4
  br label %21

21:                                               ; preds = %20, %18, %7
  %22 = load i32, i32* %1, align 4
  ret i32 %22
}

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8*, i8*, i64) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @discard_input_bytes(i64 %0, i32 %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  store i64 %0, i64* %3, align 8
  store i32 %1, i32* %4, align 4
  br label %6

6:                                                ; preds = %41, %2
  %7 = load i64, i64* %3, align 8
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %9, label %42

9:                                                ; preds = %6
  %10 = load i32, i32* @inptr, align 4
  %11 = load i32, i32* @insize, align 4
  %12 = icmp ult i32 %10, %11
  br i1 %12, label %13, label %20

13:                                               ; preds = %9
  %14 = load i32, i32* @inptr, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* @inptr, align 4
  %16 = zext i32 %14 to i64
  %17 = getelementptr inbounds [32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i32
  br label %22

20:                                               ; preds = %9
  %21 = call i32 @fill_inbuf(i32 0)
  br label %22

22:                                               ; preds = %20, %13
  %23 = phi i32 [ %19, %13 ], [ %21, %20 ]
  %24 = trunc i32 %23 to i8
  store i8 %24, i8* %5, align 1
  %25 = load i32, i32* %4, align 4
  %26 = and i32 %25, 2
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %22
  %29 = call i64 @updcrc(i8* %5, i32 1)
  br label %30

30:                                               ; preds = %28, %22
  %31 = load i64, i64* %3, align 8
  %32 = icmp ne i64 %31, -1
  br i1 %32, label %33, label %36

33:                                               ; preds = %30
  %34 = load i64, i64* %3, align 8
  %35 = add i64 %34, -1
  store i64 %35, i64* %3, align 8
  br label %41

36:                                               ; preds = %30
  %37 = load i8, i8* %5, align 1
  %38 = icmp ne i8 %37, 0
  br i1 %38, label %40, label %39

39:                                               ; preds = %36
  br label %42

40:                                               ; preds = %36
  br label %41

41:                                               ; preds = %40, %33
  br label %6, !llvm.loop !30

42:                                               ; preds = %39, %6
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @perror(i8*) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @open_input_file(i8* %0, %struct.stat* %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca %struct.stat*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8**, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store %struct.stat* %1, %struct.stat** %5, align 8
  store i32 0, i32* %7, align 4
  store i8** getelementptr inbounds ([6 x i8*], [6 x i8*]* @open_input_file.suffixes, i64 0, i64 0), i8*** %8, align 8
  %13 = load i32, i32* @ascii, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %2
  %16 = load i32, i32* @decompress, align 4
  %17 = icmp ne i32 %16, 0
  %18 = xor i1 %17, true
  br label %19

19:                                               ; preds = %15, %2
  %20 = phi i1 [ false, %2 ], [ %18, %15 ]
  %21 = zext i1 %20 to i64
  %22 = select i1 %20, i32 0, i32 0
  %23 = or i32 2304, %22
  store i32 %23, i32* %11, align 4
  %24 = load i8*, i8** @z_suffix, align 8
  %25 = load i8**, i8*** %8, align 8
  store i8* %24, i8** %25, align 8
  %26 = load i8*, i8** %4, align 8
  %27 = call i64 @strlen(i8* %26) #14
  %28 = icmp ule i64 1023, %27
  br i1 %28, label %29, label %30

29:                                               ; preds = %19
  br label %111

30:                                               ; preds = %19
  %31 = load i8*, i8** %4, align 8
  %32 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i8* %31) #15
  %33 = load i32, i32* %11, align 4
  %34 = load %struct.stat*, %struct.stat** %5, align 8
  %35 = call i32 @open_and_stat(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i32 %33, %struct.stat* %34)
  store i32 %35, i32* %10, align 4
  %36 = load i32, i32* %10, align 4
  %37 = icmp sle i32 0, %36
  br i1 %37, label %38, label %40

38:                                               ; preds = %30
  %39 = load i32, i32* %10, align 4
  store i32 %39, i32* %3, align 4
  br label %116

40:                                               ; preds = %30
  %41 = load i32, i32* @decompress, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %47

43:                                               ; preds = %40
  %44 = call i32* @__errno_location() #16
  %45 = load i32, i32* %44, align 4
  %46 = icmp ne i32 %45, 2
  br i1 %46, label %47, label %48

47:                                               ; preds = %43, %40
  call void @progerror(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 -1, i32* %3, align 4
  br label %116

48:                                               ; preds = %43
  %49 = call i8* @get_suffix(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i8* %49, i8** %9, align 8
  %50 = load i8*, i8** %9, align 8
  %51 = icmp ne i8* %50, null
  br i1 %51, label %52, label %53

52:                                               ; preds = %48
  call void @progerror(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 -1, i32* %3, align 4
  br label %116

53:                                               ; preds = %48
  %54 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0)) #14
  %55 = trunc i64 %54 to i32
  store i32 %55, i32* %6, align 4
  %56 = load i8*, i8** @z_suffix, align 8
  %57 = call i32 @strcmp(i8* %56, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0)) #14
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %62

59:                                               ; preds = %53
  %60 = load i8**, i8*** %8, align 8
  %61 = getelementptr inbounds i8*, i8** %60, i32 1
  store i8** %61, i8*** %8, align 8
  br label %62

62:                                               ; preds = %59, %53
  br label %63

63:                                               ; preds = %99, %62
  %64 = load i8**, i8*** %8, align 8
  %65 = load i8*, i8** %64, align 8
  store i8* %65, i8** %9, align 8
  store i8* %65, i8** %12, align 8
  %66 = load i8*, i8** %4, align 8
  %67 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i8* %66) #15
  %68 = load i32, i32* %6, align 4
  %69 = sext i32 %68 to i64
  %70 = load i8*, i8** %9, align 8
  %71 = call i64 @strlen(i8* %70) #14
  %72 = add i64 %69, %71
  %73 = icmp ule i64 1024, %72
  br i1 %73, label %74, label %75

74:                                               ; preds = %63
  br label %111

75:                                               ; preds = %63
  %76 = load i8*, i8** %9, align 8
  %77 = call i8* @strcat(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i8* %76) #15
  %78 = load i32, i32* %11, align 4
  %79 = load %struct.stat*, %struct.stat** %5, align 8
  %80 = call i32 @open_and_stat(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i32 %78, %struct.stat* %79)
  store i32 %80, i32* %10, align 4
  %81 = load i32, i32* %10, align 4
  %82 = icmp sle i32 0, %81
  br i1 %82, label %83, label %85

83:                                               ; preds = %75
  %84 = load i32, i32* %10, align 4
  store i32 %84, i32* %3, align 4
  br label %116

85:                                               ; preds = %75
  %86 = call i32* @__errno_location() #16
  %87 = load i32, i32* %86, align 4
  %88 = icmp ne i32 %87, 2
  br i1 %88, label %89, label %90

89:                                               ; preds = %85
  call void @progerror(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 -1, i32* %3, align 4
  br label %116

90:                                               ; preds = %85
  %91 = load i8*, i8** %12, align 8
  %92 = load i8*, i8** @z_suffix, align 8
  %93 = call i32 @strcmp(i8* %91, i8* %92) #14
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %98

95:                                               ; preds = %90
  %96 = call i32* @__errno_location() #16
  %97 = load i32, i32* %96, align 4
  store i32 %97, i32* %7, align 4
  br label %98

98:                                               ; preds = %95, %90
  br label %99

99:                                               ; preds = %98
  %100 = load i8**, i8*** %8, align 8
  %101 = getelementptr inbounds i8*, i8** %100, i32 1
  store i8** %101, i8*** %8, align 8
  %102 = load i8*, i8** %101, align 8
  %103 = icmp ne i8* %102, null
  br i1 %103, label %63, label %104, !llvm.loop !31

104:                                              ; preds = %99
  %105 = load i8*, i8** %4, align 8
  %106 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i8* %105) #15
  %107 = load i8*, i8** @z_suffix, align 8
  %108 = call i8* @strcat(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i8* %107) #15
  %109 = load i32, i32* %7, align 4
  %110 = call i32* @__errno_location() #16
  store i32 %109, i32* %110, align 4
  call void @progerror(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 -1, i32* %3, align 4
  br label %116

111:                                              ; preds = %74, %29
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %113 = load i8*, i8** @program_name, align 8
  %114 = load i8*, i8** %4, align 8
  %115 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %112, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.114, i64 0, i64 0), i8* %113, i8* %114)
  store i32 1, i32* @exit_code, align 4
  store i32 -1, i32* %3, align 4
  br label %116

116:                                              ; preds = %111, %104, %89, %83, %52, %47, %38
  %117 = load i32, i32* %3, align 4
  ret i32 %117
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @treat_dir(i32 %0, i8* %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca %struct.__dirstream*, align 8
  %6 = alloca [1024 x i8], align 16
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store i32 %0, i32* %3, align 4
  store i8* %1, i8** %4, align 8
  %11 = load i32, i32* %3, align 4
  %12 = call %struct.__dirstream* @fdopendir(i32 %11)
  store %struct.__dirstream* %12, %struct.__dirstream** %5, align 8
  %13 = load %struct.__dirstream*, %struct.__dirstream** %5, align 8
  %14 = icmp eq %struct.__dirstream* %13, null
  br i1 %14, label %15, label %19

15:                                               ; preds = %2
  %16 = load i8*, i8** %4, align 8
  call void @progerror(i8* %16)
  %17 = load i32, i32* %3, align 4
  %18 = call i32 @close(i32 %17)
  br label %101

19:                                               ; preds = %2
  %20 = load %struct.__dirstream*, %struct.__dirstream** %5, align 8
  %21 = call i8* @streamsavedir(%struct.__dirstream* %20, i32 0)
  store i8* %21, i8** %7, align 8
  %22 = load i8*, i8** %7, align 8
  %23 = icmp ne i8* %22, null
  br i1 %23, label %26, label %24

24:                                               ; preds = %19
  %25 = load i8*, i8** %4, align 8
  call void @progerror(i8* %25)
  br label %26

26:                                               ; preds = %24, %19
  %27 = load %struct.__dirstream*, %struct.__dirstream** %5, align 8
  %28 = call i32 @closedir(%struct.__dirstream* %27)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %26
  %31 = load i8*, i8** %4, align 8
  call void @progerror(i8* %31)
  br label %32

32:                                               ; preds = %30, %26
  %33 = load i8*, i8** %7, align 8
  %34 = icmp ne i8* %33, null
  br i1 %34, label %36, label %35

35:                                               ; preds = %32
  br label %101

36:                                               ; preds = %32
  %37 = load i8*, i8** %7, align 8
  store i8* %37, i8** %8, align 8
  br label %38

38:                                               ; preds = %94, %36
  %39 = load i8*, i8** %8, align 8
  %40 = load i8, i8* %39, align 1
  %41 = icmp ne i8 %40, 0
  br i1 %41, label %42, label %99

42:                                               ; preds = %38
  %43 = load i8*, i8** %4, align 8
  %44 = call i64 @strlen(i8* %43) #14
  store i64 %44, i64* %10, align 8
  %45 = load i8*, i8** %8, align 8
  %46 = call i64 @strlen(i8* %45) #14
  store i64 %46, i64* %9, align 8
  %47 = load i8*, i8** %8, align 8
  %48 = call i32 @strcmp(i8* %47, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.119, i64 0, i64 0)) #14
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %54, label %50

50:                                               ; preds = %42
  %51 = load i8*, i8** %8, align 8
  %52 = call i32 @strcmp(i8* %51, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.120, i64 0, i64 0)) #14
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %55

54:                                               ; preds = %50, %42
  br label %94

55:                                               ; preds = %50
  %56 = load i64, i64* %10, align 8
  %57 = load i64, i64* %9, align 8
  %58 = add i64 %56, %57
  %59 = icmp ult i64 %58, 1022
  br i1 %59, label %60, label %87

60:                                               ; preds = %55
  %61 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i64 0, i64 0
  %62 = load i8*, i8** %4, align 8
  %63 = call i8* @strcpy(i8* %61, i8* %62) #15
  %64 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i64 0, i64 0
  %65 = call i8* @last_component(i8* %64) #14
  %66 = load i8, i8* %65, align 1
  %67 = sext i8 %66 to i32
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %80

69:                                               ; preds = %60
  %70 = load i64, i64* %10, align 8
  %71 = sub i64 %70, 1
  %72 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i64 0, i64 %71
  %73 = load i8, i8* %72, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp eq i32 %74, 47
  br i1 %75, label %80, label %76

76:                                               ; preds = %69
  %77 = load i64, i64* %10, align 8
  %78 = add i64 %77, 1
  store i64 %78, i64* %10, align 8
  %79 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i64 0, i64 %77
  store i8 47, i8* %79, align 1
  br label %80

80:                                               ; preds = %76, %69, %60
  %81 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i64 0, i64 0
  %82 = load i64, i64* %10, align 8
  %83 = getelementptr inbounds i8, i8* %81, i64 %82
  %84 = load i8*, i8** %8, align 8
  %85 = call i8* @strcpy(i8* %83, i8* %84) #15
  %86 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i64 0, i64 0
  call void @treat_file(i8* %86)
  br label %93

87:                                               ; preds = %55
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %89 = load i8*, i8** @program_name, align 8
  %90 = load i8*, i8** %4, align 8
  %91 = load i8*, i8** %8, align 8
  %92 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %88, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.121, i64 0, i64 0), i8* %89, i8* %90, i8* %91)
  store i32 1, i32* @exit_code, align 4
  br label %93

93:                                               ; preds = %87, %80
  br label %94

94:                                               ; preds = %93, %54
  %95 = load i64, i64* %9, align 8
  %96 = add i64 %95, 1
  %97 = load i8*, i8** %8, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 %96
  store i8* %98, i8** %8, align 8
  br label %38, !llvm.loop !32

99:                                               ; preds = %38
  %100 = load i8*, i8** %7, align 8
  call void @free(i8* %100) #15
  br label %101

101:                                              ; preds = %99, %35, %15
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @make_ofname() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = call i8* @strcpy(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0)) #15
  %4 = call i8* @get_suffix(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  store i8* %4, i8** %2, align 8
  %5 = load i32, i32* @decompress, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %58

7:                                                ; preds = %0
  %8 = load i8*, i8** %2, align 8
  %9 = icmp eq i8* %8, null
  br i1 %9, label %10, label %42

10:                                               ; preds = %7
  %11 = load i32, i32* @recursive, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %20, label %13

13:                                               ; preds = %10
  %14 = load i32, i32* @list, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %19, label %16

16:                                               ; preds = %13
  %17 = load i32, i32* @test, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %16, %13
  store i32 0, i32* %1, align 4
  br label %102

20:                                               ; preds = %16, %10
  %21 = load i32, i32* @verbose, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %29, label %23

23:                                               ; preds = %20
  %24 = load i32, i32* @recursive, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %41, label %26

26:                                               ; preds = %23
  %27 = load i32, i32* @quiet, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %41, label %29

29:                                               ; preds = %26, %20
  %30 = load i32, i32* @quiet, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %36, label %32

32:                                               ; preds = %29
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = load i8*, i8** @program_name, align 8
  %35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.122, i64 0, i64 0), i8* %34, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %36

36:                                               ; preds = %32, %29
  %37 = load i32, i32* @exit_code, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %40

39:                                               ; preds = %36
  store i32 2, i32* @exit_code, align 4
  br label %40

40:                                               ; preds = %39, %36
  br label %41

41:                                               ; preds = %40, %26, %23
  store i32 2, i32* %1, align 4
  br label %102

42:                                               ; preds = %7
  %43 = load i8*, i8** %2, align 8
  %44 = call i8* @strlwr(i8* %43)
  %45 = load i8*, i8** %2, align 8
  %46 = call i32 @strcmp(i8* %45, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.116, i64 0, i64 0)) #14
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %52, label %48

48:                                               ; preds = %42
  %49 = load i8*, i8** %2, align 8
  %50 = call i32 @strcmp(i8* %49, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.115, i64 0, i64 0)) #14
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %55

52:                                               ; preds = %48, %42
  %53 = load i8*, i8** %2, align 8
  %54 = call i8* @strcpy(i8* %53, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.123, i64 0, i64 0)) #15
  br label %57

55:                                               ; preds = %48
  %56 = load i8*, i8** %2, align 8
  store i8 0, i8* %56, align 1
  br label %57

57:                                               ; preds = %55, %52
  br label %89

58:                                               ; preds = %0
  %59 = load i8*, i8** %2, align 8
  %60 = icmp ne i8* %59, null
  br i1 %60, label %61, label %79

61:                                               ; preds = %58
  %62 = load i32, i32* @force, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %79, label %64

64:                                               ; preds = %61
  %65 = load i32, i32* @verbose, align 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %73, label %67

67:                                               ; preds = %64
  %68 = load i32, i32* @recursive, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %78, label %70

70:                                               ; preds = %67
  %71 = load i32, i32* @quiet, align 4
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %78, label %73

73:                                               ; preds = %70, %64
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %75 = load i8*, i8** @program_name, align 8
  %76 = load i8*, i8** %2, align 8
  %77 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %74, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.124, i64 0, i64 0), i8* %75, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i8* %76)
  br label %78

78:                                               ; preds = %73, %70, %67
  store i32 2, i32* %1, align 4
  br label %102

79:                                               ; preds = %61, %58
  store i32 0, i32* @save_orig_name, align 4
  %80 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0)) #14
  %81 = load i64, i64* @z_len, align 8
  %82 = add i64 %80, %81
  %83 = icmp ule i64 1024, %82
  br i1 %83, label %84, label %85

84:                                               ; preds = %79
  br label %90

85:                                               ; preds = %79
  %86 = load i8*, i8** @z_suffix, align 8
  %87 = call i8* @strcat(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0), i8* %86) #15
  br label %88

88:                                               ; preds = %85
  br label %89

89:                                               ; preds = %88, %57
  store i32 0, i32* %1, align 4
  br label %102

90:                                               ; preds = %84
  %91 = load i32, i32* @quiet, align 4
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %97, label %93

93:                                               ; preds = %90
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %95 = load i8*, i8** @program_name, align 8
  %96 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %94, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.114, i64 0, i64 0), i8* %95, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %97

97:                                               ; preds = %93, %90
  %98 = load i32, i32* @exit_code, align 4
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %101

100:                                              ; preds = %97
  store i32 2, i32* @exit_code, align 4
  br label %101

101:                                              ; preds = %100, %97
  store i32 2, i32* %1, align 4
  br label %102

102:                                              ; preds = %101, %89, %78, %41, %19
  %103 = load i32, i32* %1, align 4
  ret i32 %103
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @create_outfile() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.__sigset_t, align 8
  store i32 0, i32* %2, align 4
  %10 = load i32, i32* @ascii, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %0
  %13 = load i32, i32* @decompress, align 4
  %14 = icmp ne i32 %13, 0
  br label %15

15:                                               ; preds = %12, %0
  %16 = phi i1 [ false, %0 ], [ %14, %12 ]
  %17 = zext i1 %16 to i64
  %18 = select i1 %16, i32 0, i32 0
  %19 = or i32 193, %18
  store i32 %19, i32* %3, align 4
  store i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0), i8** %4, align 8
  store i32 -100, i32* %5, align 4
  %20 = load i32, i32* @keep, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %34, label %22

22:                                               ; preds = %15
  %23 = call i8* @last_component(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0)) #14
  store i8* %23, i8** %6, align 8
  %24 = load i8*, i8** %6, align 8
  %25 = ptrtoint i8* %24 to i64
  %26 = sub i64 %25, ptrtoint ([1024 x i8]* @ofname to i64)
  %27 = call i32 @atdir_set(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0), i64 %26)
  store i32 %27, i32* %7, align 4
  %28 = load i32, i32* %7, align 4
  %29 = icmp sle i32 0, %28
  br i1 %29, label %30, label %33

30:                                               ; preds = %22
  %31 = load i8*, i8** %6, align 8
  store i8* %31, i8** %4, align 8
  %32 = load i32, i32* %7, align 4
  store i32 %32, i32* %5, align 4
  br label %33

33:                                               ; preds = %30, %22
  br label %34

34:                                               ; preds = %33, %15
  br label %35

35:                                               ; preds = %60, %34
  %36 = call i32 @sigprocmask(i32 0, %struct.__sigset_t* @caught_signals, %struct.__sigset_t* %9) #15
  %37 = load i32, i32* %5, align 4
  %38 = load i8*, i8** %4, align 8
  %39 = load i32, i32* %3, align 4
  %40 = call i32 (i32, i8*, i32, ...) @openat_safer(i32 %37, i8* %38, i32 %39, i32 384)
  store i32 %40, i32* @ofd, align 4
  store volatile i32 %40, i32* @remove_ofname_fd, align 4
  %41 = call i32* @__errno_location() #16
  %42 = load i32, i32* %41, align 4
  store i32 %42, i32* %8, align 4
  %43 = call i32 @sigprocmask(i32 2, %struct.__sigset_t* %9, %struct.__sigset_t* null) #15
  %44 = load i32, i32* @ofd, align 4
  %45 = icmp sle i32 0, %44
  br i1 %45, label %46, label %47

46:                                               ; preds = %35
  br label %61

47:                                               ; preds = %35
  %48 = load i32, i32* %8, align 4
  switch i32 %48, label %57 [
    i32 36, label %49
    i32 17, label %50
  ]

49:                                               ; preds = %47
  call void @shorten_name(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  store i32 1, i32* %2, align 4
  br label %60

50:                                               ; preds = %47
  %51 = call i32 @check_ofname()
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %56

53:                                               ; preds = %50
  %54 = load i32, i32* @ifd, align 4
  %55 = call i32 @close(i32 %54)
  store i32 1, i32* %1, align 4
  br label %80

56:                                               ; preds = %50
  br label %60

57:                                               ; preds = %47
  call void @progerror(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  %58 = load i32, i32* @ifd, align 4
  %59 = call i32 @close(i32 %58)
  store i32 1, i32* %1, align 4
  br label %80

60:                                               ; preds = %56, %49
  br label %35

61:                                               ; preds = %46
  %62 = load i32, i32* %2, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %79

64:                                               ; preds = %61
  %65 = load i32, i32* @decompress, align 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %79

67:                                               ; preds = %64
  %68 = load i32, i32* @quiet, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %74, label %70

70:                                               ; preds = %67
  %71 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %72 = load i8*, i8** @program_name, align 8
  %73 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %71, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.125, i64 0, i64 0), i8* %72, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  br label %74

74:                                               ; preds = %70, %67
  %75 = load i32, i32* @exit_code, align 4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %78

77:                                               ; preds = %74
  store i32 2, i32* @exit_code, align 4
  br label %78

78:                                               ; preds = %77, %74
  br label %79

79:                                               ; preds = %78, %64, %61
  store i32 0, i32* %1, align 4
  br label %80

80:                                               ; preds = %79, %57, %53
  %81 = load i32, i32* %1, align 4
  ret i32 %81
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @copy_stat(%struct.stat* %0) #0 {
  %2 = alloca %struct.stat*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca [2 x %struct.timespec], align 16
  %7 = alloca %struct.timespec, align 8
  %8 = alloca %struct.timespec, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.stat* %0, %struct.stat** %2, align 8
  %11 = load %struct.stat*, %struct.stat** %2, align 8
  %12 = getelementptr inbounds %struct.stat, %struct.stat* %11, i32 0, i32 3
  %13 = load i32, i32* %12, align 8
  %14 = and i32 %13, 511
  store i32 %14, i32* %3, align 4
  %15 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %6, i64 0, i64 0
  %16 = load %struct.stat*, %struct.stat** %2, align 8
  %17 = call { i64, i64 } @get_stat_atime(%struct.stat* %16) #14
  %18 = bitcast %struct.timespec* %7 to { i64, i64 }*
  %19 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %18, i32 0, i32 0
  %20 = extractvalue { i64, i64 } %17, 0
  store i64 %20, i64* %19, align 8
  %21 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %18, i32 0, i32 1
  %22 = extractvalue { i64, i64 } %17, 1
  store i64 %22, i64* %21, align 8
  %23 = bitcast %struct.timespec* %15 to i8*
  %24 = bitcast %struct.timespec* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %23, i8* align 8 %24, i64 16, i1 false)
  %25 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %6, i64 0, i64 1
  %26 = load %struct.stat*, %struct.stat** %2, align 8
  %27 = call { i64, i64 } @get_stat_mtime(%struct.stat* %26) #14
  %28 = bitcast %struct.timespec* %8 to { i64, i64 }*
  %29 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %28, i32 0, i32 0
  %30 = extractvalue { i64, i64 } %27, 0
  store i64 %30, i64* %29, align 8
  %31 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %28, i32 0, i32 1
  %32 = extractvalue { i64, i64 } %27, 1
  store i64 %32, i64* %31, align 8
  %33 = bitcast %struct.timespec* %25 to i8*
  %34 = bitcast %struct.timespec* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %33, i8* align 8 %34, i64 16, i1 false)
  %35 = load i32, i32* @decompress, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %55

37:                                               ; preds = %1
  %38 = load i64, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 1), align 8
  %39 = icmp sle i64 0, %38
  br i1 %39, label %40, label %55

40:                                               ; preds = %37
  %41 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %6, i64 0, i64 1
  %42 = getelementptr inbounds %struct.timespec, %struct.timespec* %41, i32 0, i32 0
  %43 = load i64, i64* %42, align 16
  %44 = load i64, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 0), align 8
  %45 = icmp eq i64 %43, %44
  br i1 %45, label %46, label %52

46:                                               ; preds = %40
  %47 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %6, i64 0, i64 1
  %48 = getelementptr inbounds %struct.timespec, %struct.timespec* %47, i32 0, i32 1
  %49 = load i64, i64* %48, align 8
  %50 = load i64, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 1), align 8
  %51 = icmp eq i64 %49, %50
  br label %52

52:                                               ; preds = %46, %40
  %53 = phi i1 [ false, %40 ], [ %51, %46 ]
  %54 = xor i1 %53, true
  br label %55

55:                                               ; preds = %52, %37, %1
  %56 = phi i1 [ false, %37 ], [ false, %1 ], [ %54, %52 ]
  %57 = zext i1 %56 to i8
  store i8 %57, i8* %5, align 1
  %58 = load i8, i8* %5, align 1
  %59 = trunc i8 %58 to i1
  br i1 %59, label %60, label %63

60:                                               ; preds = %55
  %61 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %6, i64 0, i64 1
  %62 = bitcast %struct.timespec* %61 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %62, i8* align 8 bitcast (%struct.timespec* @time_stamp to i8*), i64 16, i1 false)
  br label %63

63:                                               ; preds = %60, %55
  %64 = load i32, i32* @ofd, align 4
  %65 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %6, i64 0, i64 0
  %66 = call i32 @fdutimens(i32 %64, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0), %struct.timespec* %65)
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %78

68:                                               ; preds = %63
  %69 = load i8, i8* %5, align 1
  %70 = trunc i8 %69 to i1
  br i1 %70, label %71, label %77

71:                                               ; preds = %68
  %72 = load i32, i32* @verbose, align 4
  %73 = icmp slt i32 1, %72
  br i1 %73, label %74, label %77

74:                                               ; preds = %71
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %76 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %75, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.132, i64 0, i64 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  br label %77

77:                                               ; preds = %74, %71, %68
  br label %98

78:                                               ; preds = %63
  %79 = call i32* @__errno_location() #16
  %80 = load i32, i32* %79, align 4
  store i32 %80, i32* %9, align 4
  %81 = load i32, i32* @quiet, align 4
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %87, label %83

83:                                               ; preds = %78
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %85 = load i8*, i8** @program_name, align 8
  %86 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %84, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0), i8* %85)
  br label %87

87:                                               ; preds = %83, %78
  %88 = load i32, i32* @exit_code, align 4
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %90, label %91

90:                                               ; preds = %87
  store i32 2, i32* @exit_code, align 4
  br label %91

91:                                               ; preds = %90, %87
  %92 = load i32, i32* @quiet, align 4
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %97, label %94

94:                                               ; preds = %91
  %95 = load i32, i32* %9, align 4
  %96 = call i32* @__errno_location() #16
  store i32 %95, i32* %96, align 4
  call void @perror(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  br label %97

97:                                               ; preds = %94, %91
  br label %98

98:                                               ; preds = %97, %77
  %99 = load i32, i32* @ofd, align 4
  %100 = load %struct.stat*, %struct.stat** %2, align 8
  %101 = getelementptr inbounds %struct.stat, %struct.stat* %100, i32 0, i32 5
  %102 = load i32, i32* %101, align 8
  call void @do_chown(i32 %99, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0), i32 -1, i32 %102)
  %103 = load i32, i32* @ofd, align 4
  %104 = load i32, i32* %3, align 4
  %105 = call i32 @fchmod(i32 %103, i32 %104) #15
  store i32 %105, i32* %4, align 4
  %106 = load i32, i32* %4, align 4
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %108, label %128

108:                                              ; preds = %98
  %109 = call i32* @__errno_location() #16
  %110 = load i32, i32* %109, align 4
  store i32 %110, i32* %10, align 4
  %111 = load i32, i32* @quiet, align 4
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %117, label %113

113:                                              ; preds = %108
  %114 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %115 = load i8*, i8** @program_name, align 8
  %116 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %114, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0), i8* %115)
  br label %117

117:                                              ; preds = %113, %108
  %118 = load i32, i32* @exit_code, align 4
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %120, label %121

120:                                              ; preds = %117
  store i32 2, i32* @exit_code, align 4
  br label %121

121:                                              ; preds = %120, %117
  %122 = load i32, i32* @quiet, align 4
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %127, label %124

124:                                              ; preds = %121
  %125 = load i32, i32* %10, align 4
  %126 = call i32* @__errno_location() #16
  store i32 %125, i32* %126, align 4
  call void @perror(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  br label %127

127:                                              ; preds = %124, %121
  br label %128

128:                                              ; preds = %127, %98
  %129 = load i32, i32* @ofd, align 4
  %130 = load %struct.stat*, %struct.stat** %2, align 8
  %131 = getelementptr inbounds %struct.stat, %struct.stat* %130, i32 0, i32 4
  %132 = load i32, i32* %131, align 4
  call void @do_chown(i32 %129, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0), i32 %132, i32 -1)
  ret void
}

declare dso_local i32 @fsync(i32) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i1 @atdir_eq(i8* %0, i64 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  store i8* @dot, i8** %3, align 8
  store i64 1, i64* %4, align 8
  br label %8

8:                                                ; preds = %7, %2
  %9 = load i8*, i8** %3, align 8
  %10 = load i64, i64* %4, align 8
  %11 = call i32 @memcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @dfname, i64 0, i64 0), i8* %9, i64 %10) #14
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %19

13:                                               ; preds = %8
  %14 = load i64, i64* %4, align 8
  %15 = getelementptr inbounds [1024 x i8], [1024 x i8]* @dfname, i64 0, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = icmp ne i8 %16, 0
  %18 = xor i1 %17, true
  br label %19

19:                                               ; preds = %13, %8
  %20 = phi i1 [ false, %8 ], [ %18, %13 ]
  ret i1 %20
}

; Function Attrs: nounwind
declare dso_local i32 @sigprocmask(i32, %struct.__sigset_t*, %struct.__sigset_t*) #5

; Function Attrs: nounwind
declare dso_local i32 @unlinkat(i32, i8*, i32) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @remove_output_file() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.__sigset_t, align 8
  %3 = call i32 @sigprocmask(i32 0, %struct.__sigset_t* @caught_signals, %struct.__sigset_t* %2) #15
  %4 = load volatile i32, i32* @remove_ofname_fd, align 4
  store i32 %4, i32* %1, align 4
  %5 = load i32, i32* %1, align 4
  %6 = icmp sle i32 0, %5
  br i1 %6, label %7, label %11

7:                                                ; preds = %0
  store volatile i32 -1, i32* @remove_ofname_fd, align 4
  %8 = load i32, i32* %1, align 4
  %9 = call i32 @close(i32 %8)
  %10 = call i32 @xunlink(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  br label %11

11:                                               ; preds = %7, %0
  %12 = call i32 @sigprocmask(i32 2, %struct.__sigset_t* %2, %struct.__sigset_t* null) #15
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @do_chown(i32 %0, i8* %1, i32 %2, i32 %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %10 = load i32, i32* %5, align 4
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %8, align 4
  %13 = call i32 @fchown(i32 %10, i32 %11, i32 %12) #15
  store i32 %13, i32* %9, align 4
  %14 = load i32, i32* %9, align 4
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @fchmod(i32, i32) #5

; Function Attrs: nounwind
declare dso_local i32 @fchown(i32, i32, i32) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @atdir_set(i8* %0, i64 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = load i64, i64* %4, align 8
  %7 = call zeroext i1 @atdir_eq(i8* %5, i64 %6)
  br i1 %7, label %24, label %8

8:                                                ; preds = %2
  %9 = load i32, i32* @dfd, align 4
  %10 = icmp sle i32 0, %9
  br i1 %10, label %11, label %14

11:                                               ; preds = %8
  %12 = load i32, i32* @dfd, align 4
  %13 = call i32 @close(i32 %12)
  br label %14

14:                                               ; preds = %11, %8
  %15 = load i64, i64* %4, align 8
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  store i8* @dot, i8** %3, align 8
  store i64 1, i64* %4, align 8
  br label %18

18:                                               ; preds = %17, %14
  %19 = load i8*, i8** %3, align 8
  %20 = load i64, i64* %4, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 getelementptr inbounds ([1024 x i8], [1024 x i8]* @dfname, i64 0, i64 0), i8* align 1 %19, i64 %20, i1 false)
  %21 = load i64, i64* %4, align 8
  %22 = getelementptr inbounds [1024 x i8], [1024 x i8]* @dfname, i64 0, i64 %21
  store i8 0, i8* %22, align 1
  %23 = call i32 (i8*, i32, ...) @open_safer(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @dfname, i64 0, i64 0), i32 65536)
  store i32 %23, i32* @dfd, align 4
  br label %24

24:                                               ; preds = %18, %2
  %25 = load i32, i32* @dfd, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @shorten_name(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  store i8* null, i8** %4, align 8
  store i32 3, i32* %6, align 4
  %8 = load i8*, i8** %2, align 8
  %9 = call i64 @strlen(i8* %8) #14
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %3, align 4
  %11 = load i32, i32* @decompress, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %23

13:                                               ; preds = %1
  %14 = load i32, i32* %3, align 4
  %15 = icmp sle i32 %14, 1
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  call void @gzip_error(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.126, i64 0, i64 0)) #13
  unreachable

17:                                               ; preds = %13
  %18 = load i8*, i8** %2, align 8
  %19 = load i32, i32* %3, align 4
  %20 = sub nsw i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, i8* %18, i64 %21
  store i8 0, i8* %22, align 1
  br label %122

23:                                               ; preds = %1
  %24 = load i8*, i8** %2, align 8
  %25 = call i8* @get_suffix(i8* %24)
  store i8* %25, i8** %7, align 8
  %26 = load i8*, i8** %7, align 8
  %27 = icmp ne i8* %26, null
  br i1 %27, label %29, label %28

28:                                               ; preds = %23
  call void @gzip_error(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.127, i64 0, i64 0)) #13
  unreachable

29:                                               ; preds = %23
  %30 = load i8*, i8** %7, align 8
  store i8 0, i8* %30, align 1
  store i32 1, i32* @save_orig_name, align 4
  %31 = load i32, i32* %3, align 4
  %32 = icmp sgt i32 %31, 4
  br i1 %32, label %33, label %42

33:                                               ; preds = %29
  %34 = load i8*, i8** %7, align 8
  %35 = getelementptr inbounds i8, i8* %34, i64 -4
  %36 = call i32 @strcmp(i8* %35, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.123, i64 0, i64 0)) #14
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %42

38:                                               ; preds = %33
  %39 = load i8*, i8** %7, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 -4
  %41 = call i8* @strcpy(i8* %40, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.116, i64 0, i64 0)) #15
  br label %122

42:                                               ; preds = %33, %29
  br label %43

43:                                               ; preds = %80, %42
  %44 = load i8*, i8** %2, align 8
  %45 = call i8* @last_component(i8* %44) #14
  store i8* %45, i8** %7, align 8
  br label %46

46:                                               ; preds = %71, %43
  %47 = load i8*, i8** %7, align 8
  %48 = load i8, i8* %47, align 1
  %49 = icmp ne i8 %48, 0
  br i1 %49, label %50, label %72

50:                                               ; preds = %46
  %51 = load i8*, i8** %7, align 8
  %52 = call i64 @strcspn(i8* %51, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.119, i64 0, i64 0)) #14
  %53 = trunc i64 %52 to i32
  store i32 %53, i32* %5, align 4
  %54 = load i32, i32* %5, align 4
  %55 = load i8*, i8** %7, align 8
  %56 = sext i32 %54 to i64
  %57 = getelementptr inbounds i8, i8* %55, i64 %56
  store i8* %57, i8** %7, align 8
  %58 = load i32, i32* %5, align 4
  %59 = load i32, i32* %6, align 4
  %60 = icmp sgt i32 %58, %59
  br i1 %60, label %61, label %64

61:                                               ; preds = %50
  %62 = load i8*, i8** %7, align 8
  %63 = getelementptr inbounds i8, i8* %62, i64 -1
  store i8* %63, i8** %4, align 8
  br label %64

64:                                               ; preds = %61, %50
  %65 = load i8*, i8** %7, align 8
  %66 = load i8, i8* %65, align 1
  %67 = icmp ne i8 %66, 0
  br i1 %67, label %68, label %71

68:                                               ; preds = %64
  %69 = load i8*, i8** %7, align 8
  %70 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %70, i8** %7, align 8
  br label %71

71:                                               ; preds = %68, %64
  br label %46, !llvm.loop !33

72:                                               ; preds = %46
  br label %73

73:                                               ; preds = %72
  %74 = load i8*, i8** %4, align 8
  %75 = icmp eq i8* %74, null
  br i1 %75, label %76, label %80

76:                                               ; preds = %73
  %77 = load i32, i32* %6, align 4
  %78 = add nsw i32 %77, -1
  store i32 %78, i32* %6, align 4
  %79 = icmp ne i32 %78, 0
  br label %80

80:                                               ; preds = %76, %73
  %81 = phi i1 [ false, %73 ], [ %79, %76 ]
  br i1 %81, label %43, label %82, !llvm.loop !34

82:                                               ; preds = %80
  %83 = load i8*, i8** %4, align 8
  %84 = icmp ne i8* %83, null
  br i1 %84, label %85, label %100

85:                                               ; preds = %82
  br label %86

86:                                               ; preds = %92, %85
  %87 = load i8*, i8** %4, align 8
  %88 = getelementptr inbounds i8, i8* %87, i64 1
  %89 = load i8, i8* %88, align 1
  %90 = load i8*, i8** %4, align 8
  %91 = getelementptr inbounds i8, i8* %90, i64 0
  store i8 %89, i8* %91, align 1
  br label %92

92:                                               ; preds = %86
  %93 = load i8*, i8** %4, align 8
  %94 = getelementptr inbounds i8, i8* %93, i32 1
  store i8* %94, i8** %4, align 8
  %95 = load i8, i8* %93, align 1
  %96 = icmp ne i8 %95, 0
  br i1 %96, label %86, label %97, !llvm.loop !35

97:                                               ; preds = %92
  %98 = load i8*, i8** %4, align 8
  %99 = getelementptr inbounds i8, i8* %98, i32 -1
  store i8* %99, i8** %4, align 8
  br label %118

100:                                              ; preds = %82
  %101 = load i8*, i8** %2, align 8
  %102 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.119, i64 0, i64 0), align 1
  %103 = sext i8 %102 to i32
  %104 = call i8* @strrchr(i8* %101, i32 %103) #14
  store i8* %104, i8** %4, align 8
  %105 = load i8*, i8** %4, align 8
  %106 = icmp ne i8* %105, null
  br i1 %106, label %108, label %107

107:                                              ; preds = %100
  call void @gzip_error(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.128, i64 0, i64 0)) #13
  unreachable

108:                                              ; preds = %100
  %109 = load i8*, i8** %4, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 1
  %111 = load i8, i8* %110, align 1
  %112 = sext i8 %111 to i32
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %117

114:                                              ; preds = %108
  %115 = load i8*, i8** %4, align 8
  %116 = getelementptr inbounds i8, i8* %115, i32 -1
  store i8* %116, i8** %4, align 8
  br label %117

117:                                              ; preds = %114, %108
  br label %118

118:                                              ; preds = %117, %97
  %119 = load i8*, i8** %4, align 8
  %120 = load i8*, i8** @z_suffix, align 8
  %121 = call i8* @strcpy(i8* %119, i8* %120) #15
  br label %122

122:                                              ; preds = %118, %38, %17
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @check_ofname() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load i32, i32* @force, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %35, label %5

5:                                                ; preds = %0
  store i32 0, i32* %2, align 4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = load i8*, i8** @program_name, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.129, i64 0, i64 0), i8* %7, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  %9 = load i32, i32* @foreground, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %24

11:                                               ; preds = %5
  %12 = load i8, i8* @presume_input_tty, align 1
  %13 = trunc i8 %12 to i1
  br i1 %13, label %17, label %14

14:                                               ; preds = %11
  %15 = call i32 @isatty(i32 0) #15
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %24

17:                                               ; preds = %14, %11
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.130, i64 0, i64 0))
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 @rpl_fflush(%struct._IO_FILE* %20)
  %22 = call zeroext i1 @yesno()
  %23 = zext i1 %22 to i32
  store i32 %23, i32* %2, align 4
  br label %24

24:                                               ; preds = %17, %14, %5
  %25 = load i32, i32* %2, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %34, label %27

27:                                               ; preds = %24
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.131, i64 0, i64 0))
  %30 = load i32, i32* @exit_code, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %27
  store i32 2, i32* @exit_code, align 4
  br label %33

33:                                               ; preds = %32, %27
  store i32 1, i32* %1, align 4
  br label %40

34:                                               ; preds = %24
  br label %35

35:                                               ; preds = %34, %0
  %36 = call i32 @xunlink(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %35
  call void @progerror(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  store i32 1, i32* %1, align 4
  br label %40

39:                                               ; preds = %35
  store i32 0, i32* %1, align 4
  br label %40

40:                                               ; preds = %39, %38, %33
  %41 = load i32, i32* %1, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @get_suffix(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [33 x i8], align 16
  %6 = alloca i8**, align 8
  %7 = alloca i8, align 1
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  store i8 0, i8* %7, align 1
  store i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @get_suffix.known_suffixes, i64 0, i64 1), i8*** %6, align 8
  br label %12

12:                                               ; preds = %36, %1
  %13 = load i8**, i8*** %6, align 8
  %14 = load i8*, i8** %13, align 8
  %15 = icmp ne i8* %14, null
  br i1 %15, label %16, label %39

16:                                               ; preds = %12
  %17 = load i8**, i8*** %6, align 8
  %18 = load i8*, i8** %17, align 8
  %19 = call i64 @strlen(i8* %18) #14
  store i64 %19, i64* %8, align 8
  %20 = load i64, i64* @z_len, align 8
  %21 = load i64, i64* %8, align 8
  %22 = icmp ult i64 %20, %21
  br i1 %22, label %23, label %35

23:                                               ; preds = %16
  %24 = load i8*, i8** @z_suffix, align 8
  %25 = load i8**, i8*** %6, align 8
  %26 = load i8*, i8** %25, align 8
  %27 = load i64, i64* %8, align 8
  %28 = getelementptr inbounds i8, i8* %26, i64 %27
  %29 = load i64, i64* @z_len, align 8
  %30 = sub i64 0, %29
  %31 = getelementptr inbounds i8, i8* %28, i64 %30
  %32 = call i32 @strcmp(i8* %24, i8* %31) #14
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %35

34:                                               ; preds = %23
  store i8 1, i8* %7, align 1
  br label %39

35:                                               ; preds = %23, %16
  br label %36

36:                                               ; preds = %35
  %37 = load i8**, i8*** %6, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i32 1
  store i8** %38, i8*** %6, align 8
  br label %12, !llvm.loop !36

39:                                               ; preds = %34, %12
  %40 = load i8*, i8** @z_suffix, align 8
  %41 = call noalias i8* @xstrdup(i8* %40)
  store i8* %41, i8** %9, align 8
  %42 = load i8*, i8** %9, align 8
  %43 = call i8* @strlwr(i8* %42)
  %44 = load i8*, i8** %9, align 8
  %45 = load i8, i8* %7, align 1
  %46 = trunc i8 %45 to i1
  %47 = zext i1 %46 to i64
  %48 = select i1 %46, i64 8, i64 0
  %49 = getelementptr inbounds [10 x i8*], [10 x i8*]* @get_suffix.known_suffixes, i64 0, i64 %48
  store i8* %44, i8** %49, align 8
  %50 = load i8, i8* %7, align 1
  %51 = trunc i8 %50 to i1
  %52 = zext i1 %51 to i32
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @get_suffix.known_suffixes, i64 0, i64 0), i64 %53
  store i8** %54, i8*** %6, align 8
  %55 = load i8*, i8** %2, align 8
  %56 = call i64 @strlen(i8* %55) #14
  %57 = trunc i64 %56 to i32
  store i32 %57, i32* %3, align 4
  %58 = load i32, i32* %3, align 4
  %59 = icmp sle i32 %58, 32
  br i1 %59, label %60, label %64

60:                                               ; preds = %39
  %61 = getelementptr inbounds [33 x i8], [33 x i8]* %5, i64 0, i64 0
  %62 = load i8*, i8** %2, align 8
  %63 = call i8* @strcpy(i8* %61, i8* %62) #15
  br label %73

64:                                               ; preds = %39
  %65 = getelementptr inbounds [33 x i8], [33 x i8]* %5, i64 0, i64 0
  %66 = load i8*, i8** %2, align 8
  %67 = load i32, i32* %3, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, i8* %66, i64 %68
  %70 = getelementptr inbounds i8, i8* %69, i64 -30
  %71 = getelementptr inbounds i8, i8* %70, i64 -2
  %72 = call i8* @strcpy(i8* %65, i8* %71) #15
  br label %73

73:                                               ; preds = %64, %60
  %74 = getelementptr inbounds [33 x i8], [33 x i8]* %5, i64 0, i64 0
  %75 = call i8* @strlwr(i8* %74)
  %76 = getelementptr inbounds [33 x i8], [33 x i8]* %5, i64 0, i64 0
  %77 = call i64 @strlen(i8* %76) #14
  %78 = trunc i64 %77 to i32
  store i32 %78, i32* %4, align 4
  store i8* null, i8** %10, align 8
  br label %79

79:                                               ; preds = %120, %73
  %80 = load i8**, i8*** %6, align 8
  %81 = load i8*, i8** %80, align 8
  %82 = call i64 @strlen(i8* %81) #14
  %83 = trunc i64 %82 to i32
  store i32 %83, i32* %11, align 4
  %84 = load i32, i32* %4, align 4
  %85 = load i32, i32* %11, align 4
  %86 = icmp sgt i32 %84, %85
  br i1 %86, label %87, label %119

87:                                               ; preds = %79
  %88 = load i32, i32* %4, align 4
  %89 = load i32, i32* %11, align 4
  %90 = sub nsw i32 %88, %89
  %91 = sub nsw i32 %90, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [33 x i8], [33 x i8]* %5, i64 0, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = sext i8 %94 to i32
  %96 = icmp eq i32 %95, 47
  br i1 %96, label %119, label %97

97:                                               ; preds = %87
  %98 = getelementptr inbounds [33 x i8], [33 x i8]* %5, i64 0, i64 0
  %99 = load i32, i32* %4, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8* %98, i64 %100
  %102 = load i32, i32* %11, align 4
  %103 = sext i32 %102 to i64
  %104 = sub i64 0, %103
  %105 = getelementptr inbounds i8, i8* %101, i64 %104
  %106 = load i8**, i8*** %6, align 8
  %107 = load i8*, i8** %106, align 8
  %108 = call i32 @strcmp(i8* %105, i8* %107) #14
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %119

110:                                              ; preds = %97
  %111 = load i8*, i8** %2, align 8
  %112 = load i32, i32* %3, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8, i8* %111, i64 %113
  %115 = load i32, i32* %11, align 4
  %116 = sext i32 %115 to i64
  %117 = sub i64 0, %116
  %118 = getelementptr inbounds i8, i8* %114, i64 %117
  store i8* %118, i8** %10, align 8
  br label %125

119:                                              ; preds = %97, %87, %79
  br label %120

120:                                              ; preds = %119
  %121 = load i8**, i8*** %6, align 8
  %122 = getelementptr inbounds i8*, i8** %121, i32 1
  store i8** %122, i8*** %6, align 8
  %123 = load i8*, i8** %122, align 8
  %124 = icmp ne i8* %123, null
  br i1 %124, label %79, label %125, !llvm.loop !37

125:                                              ; preds = %120, %110
  %126 = load i8*, i8** %9, align 8
  call void @free(i8* %126) #15
  %127 = load i8*, i8** %10, align 8
  ret i8* %127
}

; Function Attrs: nounwind readonly
declare dso_local i64 @strcspn(i8*, i8*) #4

; Function Attrs: nounwind readonly
declare dso_local i8* @strrchr(i8*, i32) #4

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #5

declare dso_local %struct.__dirstream* @fdopendir(i32) #6

declare dso_local i32 @closedir(%struct.__dirstream*) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @open_and_stat(i8* %0, i32 %1, %struct.stat* %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.stat*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store %struct.stat* %2, %struct.stat** %7, align 8
  store i32 -100, i32* %9, align 4
  %14 = load i8*, i8** %5, align 8
  store i8* %14, i8** %10, align 8
  %15 = load i32, i32* @to_stdout, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %23, label %17

17:                                               ; preds = %3
  %18 = load i32, i32* @force, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %23, label %20

20:                                               ; preds = %17
  %21 = load i32, i32* %6, align 4
  %22 = or i32 %21, 131072
  store i32 %22, i32* %6, align 4
  br label %23

23:                                               ; preds = %20, %17, %3
  %24 = load i32, i32* @keep, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %42, label %26

26:                                               ; preds = %23
  %27 = load i8*, i8** %5, align 8
  %28 = call i8* @last_component(i8* %27) #14
  store i8* %28, i8** %11, align 8
  %29 = load i8*, i8** %5, align 8
  %30 = load i8*, i8** %11, align 8
  %31 = load i8*, i8** %5, align 8
  %32 = ptrtoint i8* %30 to i64
  %33 = ptrtoint i8* %31 to i64
  %34 = sub i64 %32, %33
  %35 = call i32 @atdir_set(i8* %29, i64 %34)
  store i32 %35, i32* %12, align 4
  %36 = load i32, i32* %12, align 4
  %37 = icmp sle i32 0, %36
  br i1 %37, label %38, label %41

38:                                               ; preds = %26
  %39 = load i8*, i8** %11, align 8
  store i8* %39, i8** %10, align 8
  %40 = load i32, i32* %12, align 4
  store i32 %40, i32* %9, align 4
  br label %41

41:                                               ; preds = %38, %26
  br label %42

42:                                               ; preds = %41, %23
  %43 = load i32, i32* %9, align 4
  %44 = load i8*, i8** %10, align 8
  %45 = load i32, i32* %6, align 4
  %46 = call i32 (i32, i8*, i32, ...) @openat_safer(i32 %43, i8* %44, i32 %45)
  store i32 %46, i32* %8, align 4
  %47 = load i32, i32* %8, align 4
  %48 = icmp sle i32 0, %47
  br i1 %48, label %49, label %61

49:                                               ; preds = %42
  %50 = load i32, i32* %8, align 4
  %51 = load %struct.stat*, %struct.stat** %7, align 8
  %52 = call i32 @fstat(i32 %50, %struct.stat* %51) #15
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %61

54:                                               ; preds = %49
  %55 = call i32* @__errno_location() #16
  %56 = load i32, i32* %55, align 4
  store i32 %56, i32* %13, align 4
  %57 = load i32, i32* %8, align 4
  %58 = call i32 @close(i32 %57)
  %59 = load i32, i32* %13, align 4
  %60 = call i32* @__errno_location() #16
  store i32 %59, i32* %60, align 4
  store i32 -1, i32* %4, align 4
  br label %63

61:                                               ; preds = %49, %42
  %62 = load i32, i32* %8, align 4
  store i32 %62, i32* %4, align 4
  br label %63

63:                                               ; preds = %61, %54
  %64 = load i32, i32* %4, align 4
  ret i32 %64
}

; Function Attrs: nounwind
declare dso_local i32 @sigemptyset(%struct.__sigset_t*) #5

; Function Attrs: nounwind
declare dso_local i32 @sigaction(i32, %struct.sigaction*, %struct.sigaction*) #5

; Function Attrs: nounwind
declare dso_local i32 @sigaddset(%struct.__sigset_t*, i32) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @abort_gzip_signal(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @remove_output_file()
  %3 = load i32, i32* %2, align 4
  %4 = load volatile i32, i32* @exiting_signal, align 4
  %5 = icmp eq i32 %3, %4
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  call void @_exit(i32 2) #13
  unreachable

7:                                                ; preds = %1
  %8 = load i32, i32* %2, align 4
  %9 = call void (i32)* @signal(i32 %8, void (i32)* null) #15
  %10 = load i32, i32* %2, align 4
  %11 = call i32 @raise(i32 %10) #15
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @sigismember(%struct.__sigset_t*, i32) #5

; Function Attrs: noreturn
declare dso_local void @_exit(i32) #9

; Function Attrs: nounwind
declare dso_local void (i32)* @signal(i32, void (i32)*) #5

; Function Attrs: nounwind
declare dso_local i32 @raise(i32) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #10

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal void @abort_gzip() #7 {
  call void @remove_output_file()
  call void @do_exit(i32 1) #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @inflate() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* @outcnt, align 4
  store i32 0, i32* @bk, align 4
  store i64 0, i64* @bb, align 8
  store i32 0, i32* %4, align 4
  br label %5

5:                                                ; preds = %17, %0
  store i32 0, i32* @hufts, align 4
  %6 = call i32 @inflate_block(i32* %2)
  store i32 %6, i32* %3, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %5
  %9 = load i32, i32* %3, align 4
  store i32 %9, i32* %1, align 4
  br label %32

10:                                               ; preds = %5
  %11 = load i32, i32* @hufts, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp ugt i32 %11, %12
  br i1 %13, label %14, label %16

14:                                               ; preds = %10
  %15 = load i32, i32* @hufts, align 4
  store i32 %15, i32* %4, align 4
  br label %16

16:                                               ; preds = %14, %10
  br label %17

17:                                               ; preds = %16
  %18 = load i32, i32* %2, align 4
  %19 = icmp ne i32 %18, 0
  %20 = xor i1 %19, true
  br i1 %20, label %5, label %21, !llvm.loop !38

21:                                               ; preds = %17
  br label %22

22:                                               ; preds = %25, %21
  %23 = load i32, i32* @bk, align 4
  %24 = icmp uge i32 %23, 8
  br i1 %24, label %25, label %30

25:                                               ; preds = %22
  %26 = load i32, i32* @bk, align 4
  %27 = sub i32 %26, 8
  store i32 %27, i32* @bk, align 4
  %28 = load i32, i32* @inptr, align 4
  %29 = add i32 %28, -1
  store i32 %29, i32* @inptr, align 4
  br label %22, !llvm.loop !39

30:                                               ; preds = %22
  %31 = load i32, i32* @outcnt, align 4
  store i32 %31, i32* @outcnt, align 4
  call void @flush_window()
  store i32 0, i32* %1, align 4
  br label %32

32:                                               ; preds = %30, %8
  %33 = load i32, i32* %1, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @inflate_block(i32* %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  %8 = load i64, i64* @bb, align 8
  store i64 %8, i64* %6, align 8
  %9 = load i32, i32* @bk, align 4
  store i32 %9, i32* %7, align 4
  %10 = load i32, i32* @outcnt, align 4
  store i32 %10, i32* %5, align 4
  br label %11

11:                                               ; preds = %28, %1
  %12 = load i32, i32* %7, align 4
  %13 = icmp ult i32 %12, 1
  br i1 %13, label %14, label %39

14:                                               ; preds = %11
  %15 = load i32, i32* @inptr, align 4
  %16 = load i32, i32* @insize, align 4
  %17 = icmp ult i32 %15, %16
  br i1 %17, label %18, label %25

18:                                               ; preds = %14
  %19 = load i32, i32* @inptr, align 4
  %20 = add i32 %19, 1
  store i32 %20, i32* @inptr, align 4
  %21 = zext i32 %19 to i64
  %22 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  br label %28

25:                                               ; preds = %14
  %26 = load i32, i32* %5, align 4
  store i32 %26, i32* @outcnt, align 4
  %27 = call i32 @fill_inbuf(i32 0)
  br label %28

28:                                               ; preds = %25, %18
  %29 = phi i32 [ %24, %18 ], [ %27, %25 ]
  %30 = trunc i32 %29 to i8
  %31 = zext i8 %30 to i64
  %32 = load i32, i32* %7, align 4
  %33 = zext i32 %32 to i64
  %34 = shl i64 %31, %33
  %35 = load i64, i64* %6, align 8
  %36 = or i64 %35, %34
  store i64 %36, i64* %6, align 8
  %37 = load i32, i32* %7, align 4
  %38 = add i32 %37, 8
  store i32 %38, i32* %7, align 4
  br label %11, !llvm.loop !40

39:                                               ; preds = %11
  %40 = load i64, i64* %6, align 8
  %41 = trunc i64 %40 to i32
  %42 = and i32 %41, 1
  %43 = load i32*, i32** %3, align 8
  store i32 %42, i32* %43, align 4
  %44 = load i64, i64* %6, align 8
  %45 = lshr i64 %44, 1
  store i64 %45, i64* %6, align 8
  %46 = load i32, i32* %7, align 4
  %47 = sub i32 %46, 1
  store i32 %47, i32* %7, align 4
  br label %48

48:                                               ; preds = %65, %39
  %49 = load i32, i32* %7, align 4
  %50 = icmp ult i32 %49, 2
  br i1 %50, label %51, label %76

51:                                               ; preds = %48
  %52 = load i32, i32* @inptr, align 4
  %53 = load i32, i32* @insize, align 4
  %54 = icmp ult i32 %52, %53
  br i1 %54, label %55, label %62

55:                                               ; preds = %51
  %56 = load i32, i32* @inptr, align 4
  %57 = add i32 %56, 1
  store i32 %57, i32* @inptr, align 4
  %58 = zext i32 %56 to i64
  %59 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %58
  %60 = load i8, i8* %59, align 1
  %61 = zext i8 %60 to i32
  br label %65

62:                                               ; preds = %51
  %63 = load i32, i32* %5, align 4
  store i32 %63, i32* @outcnt, align 4
  %64 = call i32 @fill_inbuf(i32 0)
  br label %65

65:                                               ; preds = %62, %55
  %66 = phi i32 [ %61, %55 ], [ %64, %62 ]
  %67 = trunc i32 %66 to i8
  %68 = zext i8 %67 to i64
  %69 = load i32, i32* %7, align 4
  %70 = zext i32 %69 to i64
  %71 = shl i64 %68, %70
  %72 = load i64, i64* %6, align 8
  %73 = or i64 %72, %71
  store i64 %73, i64* %6, align 8
  %74 = load i32, i32* %7, align 4
  %75 = add i32 %74, 8
  store i32 %75, i32* %7, align 4
  br label %48, !llvm.loop !41

76:                                               ; preds = %48
  %77 = load i64, i64* %6, align 8
  %78 = trunc i64 %77 to i32
  %79 = and i32 %78, 3
  store i32 %79, i32* %4, align 4
  %80 = load i64, i64* %6, align 8
  %81 = lshr i64 %80, 2
  store i64 %81, i64* %6, align 8
  %82 = load i32, i32* %7, align 4
  %83 = sub i32 %82, 2
  store i32 %83, i32* %7, align 4
  %84 = load i64, i64* %6, align 8
  store i64 %84, i64* @bb, align 8
  %85 = load i32, i32* %7, align 4
  store i32 %85, i32* @bk, align 4
  %86 = load i32, i32* %4, align 4
  %87 = icmp eq i32 %86, 2
  br i1 %87, label %88, label %90

88:                                               ; preds = %76
  %89 = call i32 @inflate_dynamic()
  store i32 %89, i32* %2, align 4
  br label %101

90:                                               ; preds = %76
  %91 = load i32, i32* %4, align 4
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %93, label %95

93:                                               ; preds = %90
  %94 = call i32 @inflate_stored()
  store i32 %94, i32* %2, align 4
  br label %101

95:                                               ; preds = %90
  %96 = load i32, i32* %4, align 4
  %97 = icmp eq i32 %96, 1
  br i1 %97, label %98, label %100

98:                                               ; preds = %95
  %99 = call i32 @inflate_fixed()
  store i32 %99, i32* %2, align 4
  br label %101

100:                                              ; preds = %95
  store i32 2, i32* %2, align 4
  br label %101

101:                                              ; preds = %100, %98, %93, %88
  %102 = load i32, i32* %2, align 4
  ret i32 %102
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @inflate_dynamic() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.huft*, align 8
  %9 = alloca %struct.huft*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca [316 x i32], align 16
  %16 = alloca i64, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = load i64, i64* @bb, align 8
  store i64 %19, i64* %16, align 8
  %20 = load i32, i32* @bk, align 4
  store i32 %20, i32* %17, align 4
  %21 = load i32, i32* @outcnt, align 4
  store i32 %21, i32* %7, align 4
  br label %22

22:                                               ; preds = %39, %0
  %23 = load i32, i32* %17, align 4
  %24 = icmp ult i32 %23, 5
  br i1 %24, label %25, label %50

25:                                               ; preds = %22
  %26 = load i32, i32* @inptr, align 4
  %27 = load i32, i32* @insize, align 4
  %28 = icmp ult i32 %26, %27
  br i1 %28, label %29, label %36

29:                                               ; preds = %25
  %30 = load i32, i32* @inptr, align 4
  %31 = add i32 %30, 1
  store i32 %31, i32* @inptr, align 4
  %32 = zext i32 %30 to i64
  %33 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %32
  %34 = load i8, i8* %33, align 1
  %35 = zext i8 %34 to i32
  br label %39

36:                                               ; preds = %25
  %37 = load i32, i32* %7, align 4
  store i32 %37, i32* @outcnt, align 4
  %38 = call i32 @fill_inbuf(i32 0)
  br label %39

39:                                               ; preds = %36, %29
  %40 = phi i32 [ %35, %29 ], [ %38, %36 ]
  %41 = trunc i32 %40 to i8
  %42 = zext i8 %41 to i64
  %43 = load i32, i32* %17, align 4
  %44 = zext i32 %43 to i64
  %45 = shl i64 %42, %44
  %46 = load i64, i64* %16, align 8
  %47 = or i64 %46, %45
  store i64 %47, i64* %16, align 8
  %48 = load i32, i32* %17, align 4
  %49 = add i32 %48, 8
  store i32 %49, i32* %17, align 4
  br label %22, !llvm.loop !42

50:                                               ; preds = %22
  %51 = load i64, i64* %16, align 8
  %52 = trunc i64 %51 to i32
  %53 = and i32 %52, 31
  %54 = add i32 257, %53
  store i32 %54, i32* %13, align 4
  %55 = load i64, i64* %16, align 8
  %56 = lshr i64 %55, 5
  store i64 %56, i64* %16, align 8
  %57 = load i32, i32* %17, align 4
  %58 = sub i32 %57, 5
  store i32 %58, i32* %17, align 4
  br label %59

59:                                               ; preds = %76, %50
  %60 = load i32, i32* %17, align 4
  %61 = icmp ult i32 %60, 5
  br i1 %61, label %62, label %87

62:                                               ; preds = %59
  %63 = load i32, i32* @inptr, align 4
  %64 = load i32, i32* @insize, align 4
  %65 = icmp ult i32 %63, %64
  br i1 %65, label %66, label %73

66:                                               ; preds = %62
  %67 = load i32, i32* @inptr, align 4
  %68 = add i32 %67, 1
  store i32 %68, i32* @inptr, align 4
  %69 = zext i32 %67 to i64
  %70 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %69
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  br label %76

73:                                               ; preds = %62
  %74 = load i32, i32* %7, align 4
  store i32 %74, i32* @outcnt, align 4
  %75 = call i32 @fill_inbuf(i32 0)
  br label %76

76:                                               ; preds = %73, %66
  %77 = phi i32 [ %72, %66 ], [ %75, %73 ]
  %78 = trunc i32 %77 to i8
  %79 = zext i8 %78 to i64
  %80 = load i32, i32* %17, align 4
  %81 = zext i32 %80 to i64
  %82 = shl i64 %79, %81
  %83 = load i64, i64* %16, align 8
  %84 = or i64 %83, %82
  store i64 %84, i64* %16, align 8
  %85 = load i32, i32* %17, align 4
  %86 = add i32 %85, 8
  store i32 %86, i32* %17, align 4
  br label %59, !llvm.loop !43

87:                                               ; preds = %59
  %88 = load i64, i64* %16, align 8
  %89 = trunc i64 %88 to i32
  %90 = and i32 %89, 31
  %91 = add i32 1, %90
  store i32 %91, i32* %14, align 4
  %92 = load i64, i64* %16, align 8
  %93 = lshr i64 %92, 5
  store i64 %93, i64* %16, align 8
  %94 = load i32, i32* %17, align 4
  %95 = sub i32 %94, 5
  store i32 %95, i32* %17, align 4
  br label %96

96:                                               ; preds = %113, %87
  %97 = load i32, i32* %17, align 4
  %98 = icmp ult i32 %97, 4
  br i1 %98, label %99, label %124

99:                                               ; preds = %96
  %100 = load i32, i32* @inptr, align 4
  %101 = load i32, i32* @insize, align 4
  %102 = icmp ult i32 %100, %101
  br i1 %102, label %103, label %110

103:                                              ; preds = %99
  %104 = load i32, i32* @inptr, align 4
  %105 = add i32 %104, 1
  store i32 %105, i32* @inptr, align 4
  %106 = zext i32 %104 to i64
  %107 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %106
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  br label %113

110:                                              ; preds = %99
  %111 = load i32, i32* %7, align 4
  store i32 %111, i32* @outcnt, align 4
  %112 = call i32 @fill_inbuf(i32 0)
  br label %113

113:                                              ; preds = %110, %103
  %114 = phi i32 [ %109, %103 ], [ %112, %110 ]
  %115 = trunc i32 %114 to i8
  %116 = zext i8 %115 to i64
  %117 = load i32, i32* %17, align 4
  %118 = zext i32 %117 to i64
  %119 = shl i64 %116, %118
  %120 = load i64, i64* %16, align 8
  %121 = or i64 %120, %119
  store i64 %121, i64* %16, align 8
  %122 = load i32, i32* %17, align 4
  %123 = add i32 %122, 8
  store i32 %123, i32* %17, align 4
  br label %96, !llvm.loop !44

124:                                              ; preds = %96
  %125 = load i64, i64* %16, align 8
  %126 = trunc i64 %125 to i32
  %127 = and i32 %126, 15
  %128 = add i32 4, %127
  store i32 %128, i32* %12, align 4
  %129 = load i64, i64* %16, align 8
  %130 = lshr i64 %129, 4
  store i64 %130, i64* %16, align 8
  %131 = load i32, i32* %17, align 4
  %132 = sub i32 %131, 4
  store i32 %132, i32* %17, align 4
  %133 = load i32, i32* %13, align 4
  %134 = icmp ugt i32 %133, 286
  br i1 %134, label %138, label %135

135:                                              ; preds = %124
  %136 = load i32, i32* %14, align 4
  %137 = icmp ugt i32 %136, 30
  br i1 %137, label %138, label %139

138:                                              ; preds = %135, %124
  store i32 1, i32* %1, align 4
  br label %520

139:                                              ; preds = %135
  store i32 0, i32* %3, align 4
  br label %140

140:                                              ; preds = %187, %139
  %141 = load i32, i32* %3, align 4
  %142 = load i32, i32* %12, align 4
  %143 = icmp ult i32 %141, %142
  br i1 %143, label %144, label %190

144:                                              ; preds = %140
  br label %145

145:                                              ; preds = %162, %144
  %146 = load i32, i32* %17, align 4
  %147 = icmp ult i32 %146, 3
  br i1 %147, label %148, label %173

148:                                              ; preds = %145
  %149 = load i32, i32* @inptr, align 4
  %150 = load i32, i32* @insize, align 4
  %151 = icmp ult i32 %149, %150
  br i1 %151, label %152, label %159

152:                                              ; preds = %148
  %153 = load i32, i32* @inptr, align 4
  %154 = add i32 %153, 1
  store i32 %154, i32* @inptr, align 4
  %155 = zext i32 %153 to i64
  %156 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %155
  %157 = load i8, i8* %156, align 1
  %158 = zext i8 %157 to i32
  br label %162

159:                                              ; preds = %148
  %160 = load i32, i32* %7, align 4
  store i32 %160, i32* @outcnt, align 4
  %161 = call i32 @fill_inbuf(i32 0)
  br label %162

162:                                              ; preds = %159, %152
  %163 = phi i32 [ %158, %152 ], [ %161, %159 ]
  %164 = trunc i32 %163 to i8
  %165 = zext i8 %164 to i64
  %166 = load i32, i32* %17, align 4
  %167 = zext i32 %166 to i64
  %168 = shl i64 %165, %167
  %169 = load i64, i64* %16, align 8
  %170 = or i64 %169, %168
  store i64 %170, i64* %16, align 8
  %171 = load i32, i32* %17, align 4
  %172 = add i32 %171, 8
  store i32 %172, i32* %17, align 4
  br label %145, !llvm.loop !45

173:                                              ; preds = %145
  %174 = load i64, i64* %16, align 8
  %175 = trunc i64 %174 to i32
  %176 = and i32 %175, 7
  %177 = load i32, i32* %3, align 4
  %178 = zext i32 %177 to i64
  %179 = getelementptr inbounds [19 x i32], [19 x i32]* @border, i64 0, i64 %178
  %180 = load i32, i32* %179, align 4
  %181 = zext i32 %180 to i64
  %182 = getelementptr inbounds [316 x i32], [316 x i32]* %15, i64 0, i64 %181
  store i32 %176, i32* %182, align 4
  %183 = load i64, i64* %16, align 8
  %184 = lshr i64 %183, 3
  store i64 %184, i64* %16, align 8
  %185 = load i32, i32* %17, align 4
  %186 = sub i32 %185, 3
  store i32 %186, i32* %17, align 4
  br label %187

187:                                              ; preds = %173
  %188 = load i32, i32* %3, align 4
  %189 = add i32 %188, 1
  store i32 %189, i32* %3, align 4
  br label %140, !llvm.loop !46

190:                                              ; preds = %140
  br label %191

191:                                              ; preds = %201, %190
  %192 = load i32, i32* %3, align 4
  %193 = icmp ult i32 %192, 19
  br i1 %193, label %194, label %204

194:                                              ; preds = %191
  %195 = load i32, i32* %3, align 4
  %196 = zext i32 %195 to i64
  %197 = getelementptr inbounds [19 x i32], [19 x i32]* @border, i64 0, i64 %196
  %198 = load i32, i32* %197, align 4
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds [316 x i32], [316 x i32]* %15, i64 0, i64 %199
  store i32 0, i32* %200, align 4
  br label %201

201:                                              ; preds = %194
  %202 = load i32, i32* %3, align 4
  %203 = add i32 %202, 1
  store i32 %203, i32* %3, align 4
  br label %191, !llvm.loop !47

204:                                              ; preds = %191
  store i32 7, i32* %10, align 4
  %205 = getelementptr inbounds [316 x i32], [316 x i32]* %15, i64 0, i64 0
  %206 = call i32 @huft_build(i32* %205, i32 19, i32 19, i16* null, i16* null, %struct.huft** %8, i32* %10)
  store i32 %206, i32* %2, align 4
  %207 = icmp ne i32 %206, 0
  br i1 %207, label %208, label %216

208:                                              ; preds = %204
  %209 = load i32, i32* %2, align 4
  %210 = icmp eq i32 %209, 1
  br i1 %210, label %211, label %214

211:                                              ; preds = %208
  %212 = load %struct.huft*, %struct.huft** %8, align 8
  %213 = call i32 @huft_free(%struct.huft* %212)
  br label %214

214:                                              ; preds = %211, %208
  %215 = load i32, i32* %2, align 4
  store i32 %215, i32* %1, align 4
  br label %520

216:                                              ; preds = %204
  %217 = load %struct.huft*, %struct.huft** %8, align 8
  %218 = icmp eq %struct.huft* %217, null
  br i1 %218, label %219, label %220

219:                                              ; preds = %216
  store i32 2, i32* %1, align 4
  br label %520

220:                                              ; preds = %216
  %221 = load i32, i32* %13, align 4
  %222 = load i32, i32* %14, align 4
  %223 = add i32 %221, %222
  store i32 %223, i32* %6, align 4
  %224 = load i32, i32* %10, align 4
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [17 x i16], [17 x i16]* @mask_bits, i64 0, i64 %225
  %227 = load i16, i16* %226, align 2
  %228 = zext i16 %227 to i32
  store i32 %228, i32* %5, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %2, align 4
  br label %229

229:                                              ; preds = %468, %220
  %230 = load i32, i32* %2, align 4
  %231 = load i32, i32* %6, align 4
  %232 = icmp ult i32 %230, %231
  br i1 %232, label %233, label %469

233:                                              ; preds = %229
  br label %234

234:                                              ; preds = %252, %233
  %235 = load i32, i32* %17, align 4
  %236 = load i32, i32* %10, align 4
  %237 = icmp ult i32 %235, %236
  br i1 %237, label %238, label %263

238:                                              ; preds = %234
  %239 = load i32, i32* @inptr, align 4
  %240 = load i32, i32* @insize, align 4
  %241 = icmp ult i32 %239, %240
  br i1 %241, label %242, label %249

242:                                              ; preds = %238
  %243 = load i32, i32* @inptr, align 4
  %244 = add i32 %243, 1
  store i32 %244, i32* @inptr, align 4
  %245 = zext i32 %243 to i64
  %246 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %245
  %247 = load i8, i8* %246, align 1
  %248 = zext i8 %247 to i32
  br label %252

249:                                              ; preds = %238
  %250 = load i32, i32* %7, align 4
  store i32 %250, i32* @outcnt, align 4
  %251 = call i32 @fill_inbuf(i32 0)
  br label %252

252:                                              ; preds = %249, %242
  %253 = phi i32 [ %248, %242 ], [ %251, %249 ]
  %254 = trunc i32 %253 to i8
  %255 = zext i8 %254 to i64
  %256 = load i32, i32* %17, align 4
  %257 = zext i32 %256 to i64
  %258 = shl i64 %255, %257
  %259 = load i64, i64* %16, align 8
  %260 = or i64 %259, %258
  store i64 %260, i64* %16, align 8
  %261 = load i32, i32* %17, align 4
  %262 = add i32 %261, 8
  store i32 %262, i32* %17, align 4
  br label %234, !llvm.loop !48

263:                                              ; preds = %234
  %264 = load %struct.huft*, %struct.huft** %8, align 8
  %265 = load i64, i64* %16, align 8
  %266 = trunc i64 %265 to i32
  %267 = load i32, i32* %5, align 4
  %268 = and i32 %266, %267
  %269 = zext i32 %268 to i64
  %270 = getelementptr inbounds %struct.huft, %struct.huft* %264, i64 %269
  store %struct.huft* %270, %struct.huft** %9, align 8
  %271 = getelementptr inbounds %struct.huft, %struct.huft* %270, i32 0, i32 1
  %272 = load i8, i8* %271, align 1
  %273 = zext i8 %272 to i32
  store i32 %273, i32* %3, align 4
  %274 = load i32, i32* %3, align 4
  %275 = load i64, i64* %16, align 8
  %276 = zext i32 %274 to i64
  %277 = lshr i64 %275, %276
  store i64 %277, i64* %16, align 8
  %278 = load i32, i32* %3, align 4
  %279 = load i32, i32* %17, align 4
  %280 = sub i32 %279, %278
  store i32 %280, i32* %17, align 4
  %281 = load %struct.huft*, %struct.huft** %9, align 8
  %282 = getelementptr inbounds %struct.huft, %struct.huft* %281, i32 0, i32 2
  %283 = bitcast %union.anon.0* %282 to i16*
  %284 = load i16, i16* %283, align 8
  %285 = zext i16 %284 to i32
  store i32 %285, i32* %3, align 4
  %286 = load i32, i32* %3, align 4
  %287 = icmp ult i32 %286, 16
  br i1 %287, label %288, label %294

288:                                              ; preds = %263
  %289 = load i32, i32* %3, align 4
  store i32 %289, i32* %4, align 4
  %290 = load i32, i32* %2, align 4
  %291 = add nsw i32 %290, 1
  store i32 %291, i32* %2, align 4
  %292 = sext i32 %290 to i64
  %293 = getelementptr inbounds [316 x i32], [316 x i32]* %15, i64 0, i64 %292
  store i32 %289, i32* %293, align 4
  br label %468

294:                                              ; preds = %263
  %295 = load i32, i32* %3, align 4
  %296 = icmp eq i32 %295, 16
  br i1 %296, label %297, label %353

297:                                              ; preds = %294
  br label %298

298:                                              ; preds = %315, %297
  %299 = load i32, i32* %17, align 4
  %300 = icmp ult i32 %299, 2
  br i1 %300, label %301, label %326

301:                                              ; preds = %298
  %302 = load i32, i32* @inptr, align 4
  %303 = load i32, i32* @insize, align 4
  %304 = icmp ult i32 %302, %303
  br i1 %304, label %305, label %312

305:                                              ; preds = %301
  %306 = load i32, i32* @inptr, align 4
  %307 = add i32 %306, 1
  store i32 %307, i32* @inptr, align 4
  %308 = zext i32 %306 to i64
  %309 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %308
  %310 = load i8, i8* %309, align 1
  %311 = zext i8 %310 to i32
  br label %315

312:                                              ; preds = %301
  %313 = load i32, i32* %7, align 4
  store i32 %313, i32* @outcnt, align 4
  %314 = call i32 @fill_inbuf(i32 0)
  br label %315

315:                                              ; preds = %312, %305
  %316 = phi i32 [ %311, %305 ], [ %314, %312 ]
  %317 = trunc i32 %316 to i8
  %318 = zext i8 %317 to i64
  %319 = load i32, i32* %17, align 4
  %320 = zext i32 %319 to i64
  %321 = shl i64 %318, %320
  %322 = load i64, i64* %16, align 8
  %323 = or i64 %322, %321
  store i64 %323, i64* %16, align 8
  %324 = load i32, i32* %17, align 4
  %325 = add i32 %324, 8
  store i32 %325, i32* %17, align 4
  br label %298, !llvm.loop !49

326:                                              ; preds = %298
  %327 = load i64, i64* %16, align 8
  %328 = trunc i64 %327 to i32
  %329 = and i32 %328, 3
  %330 = add i32 3, %329
  store i32 %330, i32* %3, align 4
  %331 = load i64, i64* %16, align 8
  %332 = lshr i64 %331, 2
  store i64 %332, i64* %16, align 8
  %333 = load i32, i32* %17, align 4
  %334 = sub i32 %333, 2
  store i32 %334, i32* %17, align 4
  %335 = load i32, i32* %2, align 4
  %336 = load i32, i32* %3, align 4
  %337 = add i32 %335, %336
  %338 = load i32, i32* %6, align 4
  %339 = icmp ugt i32 %337, %338
  br i1 %339, label %340, label %341

340:                                              ; preds = %326
  store i32 1, i32* %1, align 4
  br label %520

341:                                              ; preds = %326
  br label %342

342:                                              ; preds = %346, %341
  %343 = load i32, i32* %3, align 4
  %344 = add i32 %343, -1
  store i32 %344, i32* %3, align 4
  %345 = icmp ne i32 %343, 0
  br i1 %345, label %346, label %352

346:                                              ; preds = %342
  %347 = load i32, i32* %4, align 4
  %348 = load i32, i32* %2, align 4
  %349 = add nsw i32 %348, 1
  store i32 %349, i32* %2, align 4
  %350 = sext i32 %348 to i64
  %351 = getelementptr inbounds [316 x i32], [316 x i32]* %15, i64 0, i64 %350
  store i32 %347, i32* %351, align 4
  br label %342, !llvm.loop !50

352:                                              ; preds = %342
  br label %467

353:                                              ; preds = %294
  %354 = load i32, i32* %3, align 4
  %355 = icmp eq i32 %354, 17
  br i1 %355, label %356, label %411

356:                                              ; preds = %353
  br label %357

357:                                              ; preds = %374, %356
  %358 = load i32, i32* %17, align 4
  %359 = icmp ult i32 %358, 3
  br i1 %359, label %360, label %385

360:                                              ; preds = %357
  %361 = load i32, i32* @inptr, align 4
  %362 = load i32, i32* @insize, align 4
  %363 = icmp ult i32 %361, %362
  br i1 %363, label %364, label %371

364:                                              ; preds = %360
  %365 = load i32, i32* @inptr, align 4
  %366 = add i32 %365, 1
  store i32 %366, i32* @inptr, align 4
  %367 = zext i32 %365 to i64
  %368 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %367
  %369 = load i8, i8* %368, align 1
  %370 = zext i8 %369 to i32
  br label %374

371:                                              ; preds = %360
  %372 = load i32, i32* %7, align 4
  store i32 %372, i32* @outcnt, align 4
  %373 = call i32 @fill_inbuf(i32 0)
  br label %374

374:                                              ; preds = %371, %364
  %375 = phi i32 [ %370, %364 ], [ %373, %371 ]
  %376 = trunc i32 %375 to i8
  %377 = zext i8 %376 to i64
  %378 = load i32, i32* %17, align 4
  %379 = zext i32 %378 to i64
  %380 = shl i64 %377, %379
  %381 = load i64, i64* %16, align 8
  %382 = or i64 %381, %380
  store i64 %382, i64* %16, align 8
  %383 = load i32, i32* %17, align 4
  %384 = add i32 %383, 8
  store i32 %384, i32* %17, align 4
  br label %357, !llvm.loop !51

385:                                              ; preds = %357
  %386 = load i64, i64* %16, align 8
  %387 = trunc i64 %386 to i32
  %388 = and i32 %387, 7
  %389 = add i32 3, %388
  store i32 %389, i32* %3, align 4
  %390 = load i64, i64* %16, align 8
  %391 = lshr i64 %390, 3
  store i64 %391, i64* %16, align 8
  %392 = load i32, i32* %17, align 4
  %393 = sub i32 %392, 3
  store i32 %393, i32* %17, align 4
  %394 = load i32, i32* %2, align 4
  %395 = load i32, i32* %3, align 4
  %396 = add i32 %394, %395
  %397 = load i32, i32* %6, align 4
  %398 = icmp ugt i32 %396, %397
  br i1 %398, label %399, label %400

399:                                              ; preds = %385
  store i32 1, i32* %1, align 4
  br label %520

400:                                              ; preds = %385
  br label %401

401:                                              ; preds = %405, %400
  %402 = load i32, i32* %3, align 4
  %403 = add i32 %402, -1
  store i32 %403, i32* %3, align 4
  %404 = icmp ne i32 %402, 0
  br i1 %404, label %405, label %410

405:                                              ; preds = %401
  %406 = load i32, i32* %2, align 4
  %407 = add nsw i32 %406, 1
  store i32 %407, i32* %2, align 4
  %408 = sext i32 %406 to i64
  %409 = getelementptr inbounds [316 x i32], [316 x i32]* %15, i64 0, i64 %408
  store i32 0, i32* %409, align 4
  br label %401, !llvm.loop !52

410:                                              ; preds = %401
  store i32 0, i32* %4, align 4
  br label %466

411:                                              ; preds = %353
  br label %412

412:                                              ; preds = %429, %411
  %413 = load i32, i32* %17, align 4
  %414 = icmp ult i32 %413, 7
  br i1 %414, label %415, label %440

415:                                              ; preds = %412
  %416 = load i32, i32* @inptr, align 4
  %417 = load i32, i32* @insize, align 4
  %418 = icmp ult i32 %416, %417
  br i1 %418, label %419, label %426

419:                                              ; preds = %415
  %420 = load i32, i32* @inptr, align 4
  %421 = add i32 %420, 1
  store i32 %421, i32* @inptr, align 4
  %422 = zext i32 %420 to i64
  %423 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %422
  %424 = load i8, i8* %423, align 1
  %425 = zext i8 %424 to i32
  br label %429

426:                                              ; preds = %415
  %427 = load i32, i32* %7, align 4
  store i32 %427, i32* @outcnt, align 4
  %428 = call i32 @fill_inbuf(i32 0)
  br label %429

429:                                              ; preds = %426, %419
  %430 = phi i32 [ %425, %419 ], [ %428, %426 ]
  %431 = trunc i32 %430 to i8
  %432 = zext i8 %431 to i64
  %433 = load i32, i32* %17, align 4
  %434 = zext i32 %433 to i64
  %435 = shl i64 %432, %434
  %436 = load i64, i64* %16, align 8
  %437 = or i64 %436, %435
  store i64 %437, i64* %16, align 8
  %438 = load i32, i32* %17, align 4
  %439 = add i32 %438, 8
  store i32 %439, i32* %17, align 4
  br label %412, !llvm.loop !53

440:                                              ; preds = %412
  %441 = load i64, i64* %16, align 8
  %442 = trunc i64 %441 to i32
  %443 = and i32 %442, 127
  %444 = add i32 11, %443
  store i32 %444, i32* %3, align 4
  %445 = load i64, i64* %16, align 8
  %446 = lshr i64 %445, 7
  store i64 %446, i64* %16, align 8
  %447 = load i32, i32* %17, align 4
  %448 = sub i32 %447, 7
  store i32 %448, i32* %17, align 4
  %449 = load i32, i32* %2, align 4
  %450 = load i32, i32* %3, align 4
  %451 = add i32 %449, %450
  %452 = load i32, i32* %6, align 4
  %453 = icmp ugt i32 %451, %452
  br i1 %453, label %454, label %455

454:                                              ; preds = %440
  store i32 1, i32* %1, align 4
  br label %520

455:                                              ; preds = %440
  br label %456

456:                                              ; preds = %460, %455
  %457 = load i32, i32* %3, align 4
  %458 = add i32 %457, -1
  store i32 %458, i32* %3, align 4
  %459 = icmp ne i32 %457, 0
  br i1 %459, label %460, label %465

460:                                              ; preds = %456
  %461 = load i32, i32* %2, align 4
  %462 = add nsw i32 %461, 1
  store i32 %462, i32* %2, align 4
  %463 = sext i32 %461 to i64
  %464 = getelementptr inbounds [316 x i32], [316 x i32]* %15, i64 0, i64 %463
  store i32 0, i32* %464, align 4
  br label %456, !llvm.loop !54

465:                                              ; preds = %456
  store i32 0, i32* %4, align 4
  br label %466

466:                                              ; preds = %465, %410
  br label %467

467:                                              ; preds = %466, %352
  br label %468

468:                                              ; preds = %467, %288
  br label %229, !llvm.loop !55

469:                                              ; preds = %229
  %470 = load %struct.huft*, %struct.huft** %8, align 8
  %471 = call i32 @huft_free(%struct.huft* %470)
  %472 = load i64, i64* %16, align 8
  store i64 %472, i64* @bb, align 8
  %473 = load i32, i32* %17, align 4
  store i32 %473, i32* @bk, align 4
  %474 = load i32, i32* @lbits, align 4
  store i32 %474, i32* %10, align 4
  %475 = getelementptr inbounds [316 x i32], [316 x i32]* %15, i64 0, i64 0
  %476 = load i32, i32* %13, align 4
  %477 = call i32 @huft_build(i32* %475, i32 %476, i32 257, i16* getelementptr inbounds ([31 x i16], [31 x i16]* @cplens, i64 0, i64 0), i16* getelementptr inbounds ([31 x i16], [31 x i16]* @cplext, i64 0, i64 0), %struct.huft** %8, i32* %10)
  store i32 %477, i32* %2, align 4
  %478 = icmp ne i32 %477, 0
  br i1 %478, label %479, label %487

479:                                              ; preds = %469
  %480 = load i32, i32* %2, align 4
  %481 = icmp eq i32 %480, 1
  br i1 %481, label %482, label %485

482:                                              ; preds = %479
  %483 = load %struct.huft*, %struct.huft** %8, align 8
  %484 = call i32 @huft_free(%struct.huft* %483)
  br label %485

485:                                              ; preds = %482, %479
  %486 = load i32, i32* %2, align 4
  store i32 %486, i32* %1, align 4
  br label %520

487:                                              ; preds = %469
  %488 = load i32, i32* @dbits, align 4
  store i32 %488, i32* %11, align 4
  %489 = getelementptr inbounds [316 x i32], [316 x i32]* %15, i64 0, i64 0
  %490 = load i32, i32* %13, align 4
  %491 = zext i32 %490 to i64
  %492 = getelementptr inbounds i32, i32* %489, i64 %491
  %493 = load i32, i32* %14, align 4
  %494 = call i32 @huft_build(i32* %492, i32 %493, i32 0, i16* getelementptr inbounds ([30 x i16], [30 x i16]* @cpdist, i64 0, i64 0), i16* getelementptr inbounds ([30 x i16], [30 x i16]* @cpdext, i64 0, i64 0), %struct.huft** %9, i32* %11)
  store i32 %494, i32* %2, align 4
  %495 = icmp ne i32 %494, 0
  br i1 %495, label %496, label %506

496:                                              ; preds = %487
  %497 = load i32, i32* %2, align 4
  %498 = icmp eq i32 %497, 1
  br i1 %498, label %499, label %502

499:                                              ; preds = %496
  %500 = load %struct.huft*, %struct.huft** %9, align 8
  %501 = call i32 @huft_free(%struct.huft* %500)
  br label %502

502:                                              ; preds = %499, %496
  %503 = load %struct.huft*, %struct.huft** %8, align 8
  %504 = call i32 @huft_free(%struct.huft* %503)
  %505 = load i32, i32* %2, align 4
  store i32 %505, i32* %1, align 4
  br label %520

506:                                              ; preds = %487
  %507 = load %struct.huft*, %struct.huft** %8, align 8
  %508 = load %struct.huft*, %struct.huft** %9, align 8
  %509 = load i32, i32* %10, align 4
  %510 = load i32, i32* %11, align 4
  %511 = call i32 @inflate_codes(%struct.huft* %507, %struct.huft* %508, i32 %509, i32 %510)
  %512 = icmp ne i32 %511, 0
  %513 = zext i1 %512 to i64
  %514 = select i1 %512, i32 1, i32 0
  store i32 %514, i32* %18, align 4
  %515 = load %struct.huft*, %struct.huft** %8, align 8
  %516 = call i32 @huft_free(%struct.huft* %515)
  %517 = load %struct.huft*, %struct.huft** %9, align 8
  %518 = call i32 @huft_free(%struct.huft* %517)
  %519 = load i32, i32* %18, align 4
  store i32 %519, i32* %1, align 4
  br label %520

520:                                              ; preds = %506, %502, %485, %454, %399, %340, %219, %214, %138
  %521 = load i32, i32* %1, align 4
  ret i32 %521
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @inflate_stored() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = load i64, i64* @bb, align 8
  store i64 %6, i64* %4, align 8
  %7 = load i32, i32* @bk, align 4
  store i32 %7, i32* %5, align 4
  %8 = load i32, i32* @outcnt, align 4
  store i32 %8, i32* %3, align 4
  %9 = load i32, i32* %5, align 4
  %10 = and i32 %9, 7
  store i32 %10, i32* %2, align 4
  %11 = load i32, i32* %2, align 4
  %12 = load i64, i64* %4, align 8
  %13 = zext i32 %11 to i64
  %14 = lshr i64 %12, %13
  store i64 %14, i64* %4, align 8
  %15 = load i32, i32* %2, align 4
  %16 = load i32, i32* %5, align 4
  %17 = sub i32 %16, %15
  store i32 %17, i32* %5, align 4
  br label %18

18:                                               ; preds = %35, %0
  %19 = load i32, i32* %5, align 4
  %20 = icmp ult i32 %19, 16
  br i1 %20, label %21, label %46

21:                                               ; preds = %18
  %22 = load i32, i32* @inptr, align 4
  %23 = load i32, i32* @insize, align 4
  %24 = icmp ult i32 %22, %23
  br i1 %24, label %25, label %32

25:                                               ; preds = %21
  %26 = load i32, i32* @inptr, align 4
  %27 = add i32 %26, 1
  store i32 %27, i32* @inptr, align 4
  %28 = zext i32 %26 to i64
  %29 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i32
  br label %35

32:                                               ; preds = %21
  %33 = load i32, i32* %3, align 4
  store i32 %33, i32* @outcnt, align 4
  %34 = call i32 @fill_inbuf(i32 0)
  br label %35

35:                                               ; preds = %32, %25
  %36 = phi i32 [ %31, %25 ], [ %34, %32 ]
  %37 = trunc i32 %36 to i8
  %38 = zext i8 %37 to i64
  %39 = load i32, i32* %5, align 4
  %40 = zext i32 %39 to i64
  %41 = shl i64 %38, %40
  %42 = load i64, i64* %4, align 8
  %43 = or i64 %42, %41
  store i64 %43, i64* %4, align 8
  %44 = load i32, i32* %5, align 4
  %45 = add i32 %44, 8
  store i32 %45, i32* %5, align 4
  br label %18, !llvm.loop !56

46:                                               ; preds = %18
  %47 = load i64, i64* %4, align 8
  %48 = trunc i64 %47 to i32
  %49 = and i32 %48, 65535
  store i32 %49, i32* %2, align 4
  %50 = load i64, i64* %4, align 8
  %51 = lshr i64 %50, 16
  store i64 %51, i64* %4, align 8
  %52 = load i32, i32* %5, align 4
  %53 = sub i32 %52, 16
  store i32 %53, i32* %5, align 4
  br label %54

54:                                               ; preds = %71, %46
  %55 = load i32, i32* %5, align 4
  %56 = icmp ult i32 %55, 16
  br i1 %56, label %57, label %82

57:                                               ; preds = %54
  %58 = load i32, i32* @inptr, align 4
  %59 = load i32, i32* @insize, align 4
  %60 = icmp ult i32 %58, %59
  br i1 %60, label %61, label %68

61:                                               ; preds = %57
  %62 = load i32, i32* @inptr, align 4
  %63 = add i32 %62, 1
  store i32 %63, i32* @inptr, align 4
  %64 = zext i32 %62 to i64
  %65 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %64
  %66 = load i8, i8* %65, align 1
  %67 = zext i8 %66 to i32
  br label %71

68:                                               ; preds = %57
  %69 = load i32, i32* %3, align 4
  store i32 %69, i32* @outcnt, align 4
  %70 = call i32 @fill_inbuf(i32 0)
  br label %71

71:                                               ; preds = %68, %61
  %72 = phi i32 [ %67, %61 ], [ %70, %68 ]
  %73 = trunc i32 %72 to i8
  %74 = zext i8 %73 to i64
  %75 = load i32, i32* %5, align 4
  %76 = zext i32 %75 to i64
  %77 = shl i64 %74, %76
  %78 = load i64, i64* %4, align 8
  %79 = or i64 %78, %77
  store i64 %79, i64* %4, align 8
  %80 = load i32, i32* %5, align 4
  %81 = add i32 %80, 8
  store i32 %81, i32* %5, align 4
  br label %54, !llvm.loop !57

82:                                               ; preds = %54
  %83 = load i32, i32* %2, align 4
  %84 = load i64, i64* %4, align 8
  %85 = xor i64 %84, -1
  %86 = and i64 %85, 65535
  %87 = trunc i64 %86 to i32
  %88 = icmp ne i32 %83, %87
  br i1 %88, label %89, label %90

89:                                               ; preds = %82
  store i32 1, i32* %1, align 4
  br label %148

90:                                               ; preds = %82
  %91 = load i64, i64* %4, align 8
  %92 = lshr i64 %91, 16
  store i64 %92, i64* %4, align 8
  %93 = load i32, i32* %5, align 4
  %94 = sub i32 %93, 16
  store i32 %94, i32* %5, align 4
  br label %95

95:                                               ; preds = %139, %90
  %96 = load i32, i32* %2, align 4
  %97 = add i32 %96, -1
  store i32 %97, i32* %2, align 4
  %98 = icmp ne i32 %96, 0
  br i1 %98, label %99, label %144

99:                                               ; preds = %95
  br label %100

100:                                              ; preds = %117, %99
  %101 = load i32, i32* %5, align 4
  %102 = icmp ult i32 %101, 8
  br i1 %102, label %103, label %128

103:                                              ; preds = %100
  %104 = load i32, i32* @inptr, align 4
  %105 = load i32, i32* @insize, align 4
  %106 = icmp ult i32 %104, %105
  br i1 %106, label %107, label %114

107:                                              ; preds = %103
  %108 = load i32, i32* @inptr, align 4
  %109 = add i32 %108, 1
  store i32 %109, i32* @inptr, align 4
  %110 = zext i32 %108 to i64
  %111 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %110
  %112 = load i8, i8* %111, align 1
  %113 = zext i8 %112 to i32
  br label %117

114:                                              ; preds = %103
  %115 = load i32, i32* %3, align 4
  store i32 %115, i32* @outcnt, align 4
  %116 = call i32 @fill_inbuf(i32 0)
  br label %117

117:                                              ; preds = %114, %107
  %118 = phi i32 [ %113, %107 ], [ %116, %114 ]
  %119 = trunc i32 %118 to i8
  %120 = zext i8 %119 to i64
  %121 = load i32, i32* %5, align 4
  %122 = zext i32 %121 to i64
  %123 = shl i64 %120, %122
  %124 = load i64, i64* %4, align 8
  %125 = or i64 %124, %123
  store i64 %125, i64* %4, align 8
  %126 = load i32, i32* %5, align 4
  %127 = add i32 %126, 8
  store i32 %127, i32* %5, align 4
  br label %100, !llvm.loop !58

128:                                              ; preds = %100
  %129 = load i64, i64* %4, align 8
  %130 = trunc i64 %129 to i8
  %131 = load i32, i32* %3, align 4
  %132 = add i32 %131, 1
  store i32 %132, i32* %3, align 4
  %133 = zext i32 %131 to i64
  %134 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %133
  store i8 %130, i8* %134, align 1
  %135 = load i32, i32* %3, align 4
  %136 = icmp eq i32 %135, 32768
  br i1 %136, label %137, label %139

137:                                              ; preds = %128
  %138 = load i32, i32* %3, align 4
  store i32 %138, i32* @outcnt, align 4
  call void @flush_window()
  store i32 0, i32* %3, align 4
  br label %139

139:                                              ; preds = %137, %128
  %140 = load i64, i64* %4, align 8
  %141 = lshr i64 %140, 8
  store i64 %141, i64* %4, align 8
  %142 = load i32, i32* %5, align 4
  %143 = sub i32 %142, 8
  store i32 %143, i32* %5, align 4
  br label %95, !llvm.loop !59

144:                                              ; preds = %95
  %145 = load i32, i32* %3, align 4
  store i32 %145, i32* @outcnt, align 4
  %146 = load i64, i64* %4, align 8
  store i64 %146, i64* @bb, align 8
  %147 = load i32, i32* %5, align 4
  store i32 %147, i32* @bk, align 4
  store i32 0, i32* %1, align 4
  br label %148

148:                                              ; preds = %144, %89
  %149 = load i32, i32* %1, align 4
  ret i32 %149
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @inflate_fixed() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.huft*, align 8
  %4 = alloca %struct.huft*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [288 x i32], align 16
  store i32 0, i32* %2, align 4
  br label %8

8:                                                ; preds = %15, %0
  %9 = load i32, i32* %2, align 4
  %10 = icmp slt i32 %9, 144
  br i1 %10, label %11, label %18

11:                                               ; preds = %8
  %12 = load i32, i32* %2, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [288 x i32], [288 x i32]* %7, i64 0, i64 %13
  store i32 8, i32* %14, align 4
  br label %15

15:                                               ; preds = %11
  %16 = load i32, i32* %2, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %2, align 4
  br label %8, !llvm.loop !60

18:                                               ; preds = %8
  br label %19

19:                                               ; preds = %26, %18
  %20 = load i32, i32* %2, align 4
  %21 = icmp slt i32 %20, 256
  br i1 %21, label %22, label %29

22:                                               ; preds = %19
  %23 = load i32, i32* %2, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [288 x i32], [288 x i32]* %7, i64 0, i64 %24
  store i32 9, i32* %25, align 4
  br label %26

26:                                               ; preds = %22
  %27 = load i32, i32* %2, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %2, align 4
  br label %19, !llvm.loop !61

29:                                               ; preds = %19
  br label %30

30:                                               ; preds = %37, %29
  %31 = load i32, i32* %2, align 4
  %32 = icmp slt i32 %31, 280
  br i1 %32, label %33, label %40

33:                                               ; preds = %30
  %34 = load i32, i32* %2, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [288 x i32], [288 x i32]* %7, i64 0, i64 %35
  store i32 7, i32* %36, align 4
  br label %37

37:                                               ; preds = %33
  %38 = load i32, i32* %2, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %2, align 4
  br label %30, !llvm.loop !62

40:                                               ; preds = %30
  br label %41

41:                                               ; preds = %48, %40
  %42 = load i32, i32* %2, align 4
  %43 = icmp slt i32 %42, 288
  br i1 %43, label %44, label %51

44:                                               ; preds = %41
  %45 = load i32, i32* %2, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [288 x i32], [288 x i32]* %7, i64 0, i64 %46
  store i32 8, i32* %47, align 4
  br label %48

48:                                               ; preds = %44
  %49 = load i32, i32* %2, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %2, align 4
  br label %41, !llvm.loop !63

51:                                               ; preds = %41
  store i32 7, i32* %5, align 4
  %52 = getelementptr inbounds [288 x i32], [288 x i32]* %7, i64 0, i64 0
  %53 = call i32 @huft_build(i32* %52, i32 288, i32 257, i16* getelementptr inbounds ([31 x i16], [31 x i16]* @cplens, i64 0, i64 0), i16* getelementptr inbounds ([31 x i16], [31 x i16]* @cplext, i64 0, i64 0), %struct.huft** %3, i32* %5)
  store i32 %53, i32* %2, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %57

55:                                               ; preds = %51
  %56 = load i32, i32* %2, align 4
  store i32 %56, i32* %1, align 4
  br label %89

57:                                               ; preds = %51
  store i32 0, i32* %2, align 4
  br label %58

58:                                               ; preds = %65, %57
  %59 = load i32, i32* %2, align 4
  %60 = icmp slt i32 %59, 30
  br i1 %60, label %61, label %68

61:                                               ; preds = %58
  %62 = load i32, i32* %2, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [288 x i32], [288 x i32]* %7, i64 0, i64 %63
  store i32 5, i32* %64, align 4
  br label %65

65:                                               ; preds = %61
  %66 = load i32, i32* %2, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %2, align 4
  br label %58, !llvm.loop !64

68:                                               ; preds = %58
  store i32 5, i32* %6, align 4
  %69 = getelementptr inbounds [288 x i32], [288 x i32]* %7, i64 0, i64 0
  %70 = call i32 @huft_build(i32* %69, i32 30, i32 0, i16* getelementptr inbounds ([30 x i16], [30 x i16]* @cpdist, i64 0, i64 0), i16* getelementptr inbounds ([30 x i16], [30 x i16]* @cpdext, i64 0, i64 0), %struct.huft** %4, i32* %6)
  store i32 %70, i32* %2, align 4
  %71 = icmp sgt i32 %70, 1
  br i1 %71, label %72, label %76

72:                                               ; preds = %68
  %73 = load %struct.huft*, %struct.huft** %3, align 8
  %74 = call i32 @huft_free(%struct.huft* %73)
  %75 = load i32, i32* %2, align 4
  store i32 %75, i32* %1, align 4
  br label %89

76:                                               ; preds = %68
  %77 = load %struct.huft*, %struct.huft** %3, align 8
  %78 = load %struct.huft*, %struct.huft** %4, align 8
  %79 = load i32, i32* %5, align 4
  %80 = load i32, i32* %6, align 4
  %81 = call i32 @inflate_codes(%struct.huft* %77, %struct.huft* %78, i32 %79, i32 %80)
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %84

83:                                               ; preds = %76
  store i32 1, i32* %1, align 4
  br label %89

84:                                               ; preds = %76
  %85 = load %struct.huft*, %struct.huft** %3, align 8
  %86 = call i32 @huft_free(%struct.huft* %85)
  %87 = load %struct.huft*, %struct.huft** %4, align 8
  %88 = call i32 @huft_free(%struct.huft* %87)
  store i32 0, i32* %1, align 4
  br label %89

89:                                               ; preds = %84, %83, %72, %55
  %90 = load i32, i32* %1, align 4
  ret i32 %90
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @huft_build(i32* %0, i32 %1, i32 %2, i16* %3, i16* %4, %struct.huft** %5, i32* %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i16*, align 8
  %13 = alloca i16*, align 8
  %14 = alloca %struct.huft**, align 8
  %15 = alloca i32*, align 8
  %16 = alloca i32, align 4
  %17 = alloca [17 x i32], align 16
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32*, align 8
  %26 = alloca %struct.huft*, align 8
  %27 = alloca %struct.huft, align 8
  %28 = alloca [16 x %struct.huft*], align 16
  %29 = alloca [288 x i32], align 16
  %30 = alloca i32, align 4
  %31 = alloca [17 x i32], align 16
  %32 = alloca i32*, align 8
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  store i32* %0, i32** %9, align 8
  store i32 %1, i32* %10, align 4
  store i32 %2, i32* %11, align 4
  store i16* %3, i16** %12, align 8
  store i16* %4, i16** %13, align 8
  store %struct.huft** %5, %struct.huft*** %14, align 8
  store i32* %6, i32** %15, align 8
  %35 = getelementptr inbounds [17 x i32], [17 x i32]* %17, i64 0, i64 0
  %36 = bitcast i32* %35 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %36, i8 0, i64 68, i1 false)
  %37 = load i32*, i32** %9, align 8
  store i32* %37, i32** %25, align 8
  %38 = load i32, i32* %10, align 4
  store i32 %38, i32* %21, align 4
  br label %39

39:                                               ; preds = %48, %7
  %40 = load i32*, i32** %25, align 8
  %41 = load i32, i32* %40, align 4
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds [17 x i32], [17 x i32]* %17, i64 0, i64 %42
  %44 = load i32, i32* %43, align 4
  %45 = add i32 %44, 1
  store i32 %45, i32* %43, align 4
  %46 = load i32*, i32** %25, align 8
  %47 = getelementptr inbounds i32, i32* %46, i32 1
  store i32* %47, i32** %25, align 8
  br label %48

48:                                               ; preds = %39
  %49 = load i32, i32* %21, align 4
  %50 = add i32 %49, -1
  store i32 %50, i32* %21, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %39, label %52, !llvm.loop !65

52:                                               ; preds = %48
  %53 = getelementptr inbounds [17 x i32], [17 x i32]* %17, i64 0, i64 0
  %54 = load i32, i32* %53, align 16
  %55 = load i32, i32* %10, align 4
  %56 = icmp eq i32 %54, %55
  br i1 %56, label %57, label %86

57:                                               ; preds = %52
  %58 = call noalias i8* @malloc(i64 48) #15
  %59 = bitcast i8* %58 to %struct.huft*
  store %struct.huft* %59, %struct.huft** %26, align 8
  %60 = load %struct.huft*, %struct.huft** %26, align 8
  %61 = icmp ne %struct.huft* %60, null
  br i1 %61, label %63, label %62

62:                                               ; preds = %57
  store i32 3, i32* %8, align 4
  br label %496

63:                                               ; preds = %57
  %64 = load i32, i32* @hufts, align 4
  %65 = add i32 %64, 3
  store i32 %65, i32* @hufts, align 4
  %66 = load %struct.huft*, %struct.huft** %26, align 8
  %67 = getelementptr inbounds %struct.huft, %struct.huft* %66, i64 0
  %68 = getelementptr inbounds %struct.huft, %struct.huft* %67, i32 0, i32 2
  %69 = bitcast %union.anon.0* %68 to %struct.huft**
  store %struct.huft* null, %struct.huft** %69, align 8
  %70 = load %struct.huft*, %struct.huft** %26, align 8
  %71 = getelementptr inbounds %struct.huft, %struct.huft* %70, i64 1
  %72 = getelementptr inbounds %struct.huft, %struct.huft* %71, i32 0, i32 0
  store i8 99, i8* %72, align 8
  %73 = load %struct.huft*, %struct.huft** %26, align 8
  %74 = getelementptr inbounds %struct.huft, %struct.huft* %73, i64 1
  %75 = getelementptr inbounds %struct.huft, %struct.huft* %74, i32 0, i32 1
  store i8 1, i8* %75, align 1
  %76 = load %struct.huft*, %struct.huft** %26, align 8
  %77 = getelementptr inbounds %struct.huft, %struct.huft* %76, i64 2
  %78 = getelementptr inbounds %struct.huft, %struct.huft* %77, i32 0, i32 0
  store i8 99, i8* %78, align 8
  %79 = load %struct.huft*, %struct.huft** %26, align 8
  %80 = getelementptr inbounds %struct.huft, %struct.huft* %79, i64 2
  %81 = getelementptr inbounds %struct.huft, %struct.huft* %80, i32 0, i32 1
  store i8 1, i8* %81, align 1
  %82 = load %struct.huft*, %struct.huft** %26, align 8
  %83 = getelementptr inbounds %struct.huft, %struct.huft* %82, i64 1
  %84 = load %struct.huft**, %struct.huft*** %14, align 8
  store %struct.huft* %83, %struct.huft** %84, align 8
  %85 = load i32*, i32** %15, align 8
  store i32 1, i32* %85, align 4
  store i32 0, i32* %8, align 4
  br label %496

86:                                               ; preds = %52
  %87 = load i32*, i32** %15, align 8
  %88 = load i32, i32* %87, align 4
  store i32 %88, i32* %24, align 4
  store i32 1, i32* %22, align 4
  br label %89

89:                                               ; preds = %100, %86
  %90 = load i32, i32* %22, align 4
  %91 = icmp ule i32 %90, 16
  br i1 %91, label %92, label %103

92:                                               ; preds = %89
  %93 = load i32, i32* %22, align 4
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds [17 x i32], [17 x i32]* %17, i64 0, i64 %94
  %96 = load i32, i32* %95, align 4
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %99

98:                                               ; preds = %92
  br label %103

99:                                               ; preds = %92
  br label %100

100:                                              ; preds = %99
  %101 = load i32, i32* %22, align 4
  %102 = add i32 %101, 1
  store i32 %102, i32* %22, align 4
  br label %89, !llvm.loop !66

103:                                              ; preds = %98, %89
  %104 = load i32, i32* %22, align 4
  store i32 %104, i32* %23, align 4
  %105 = load i32, i32* %24, align 4
  %106 = load i32, i32* %22, align 4
  %107 = icmp ult i32 %105, %106
  br i1 %107, label %108, label %110

108:                                              ; preds = %103
  %109 = load i32, i32* %22, align 4
  store i32 %109, i32* %24, align 4
  br label %110

110:                                              ; preds = %108, %103
  store i32 16, i32* %21, align 4
  br label %111

111:                                              ; preds = %122, %110
  %112 = load i32, i32* %21, align 4
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %114, label %125

114:                                              ; preds = %111
  %115 = load i32, i32* %21, align 4
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds [17 x i32], [17 x i32]* %17, i64 0, i64 %116
  %118 = load i32, i32* %117, align 4
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %121

120:                                              ; preds = %114
  br label %125

121:                                              ; preds = %114
  br label %122

122:                                              ; preds = %121
  %123 = load i32, i32* %21, align 4
  %124 = add i32 %123, -1
  store i32 %124, i32* %21, align 4
  br label %111, !llvm.loop !67

125:                                              ; preds = %120, %111
  %126 = load i32, i32* %21, align 4
  store i32 %126, i32* %19, align 4
  %127 = load i32, i32* %24, align 4
  %128 = load i32, i32* %21, align 4
  %129 = icmp ugt i32 %127, %128
  br i1 %129, label %130, label %132

130:                                              ; preds = %125
  %131 = load i32, i32* %21, align 4
  store i32 %131, i32* %24, align 4
  br label %132

132:                                              ; preds = %130, %125
  %133 = load i32, i32* %24, align 4
  %134 = load i32*, i32** %15, align 8
  store i32 %133, i32* %134, align 4
  %135 = load i32, i32* %22, align 4
  %136 = shl i32 1, %135
  store i32 %136, i32* %33, align 4
  br label %137

137:                                              ; preds = %151, %132
  %138 = load i32, i32* %22, align 4
  %139 = load i32, i32* %21, align 4
  %140 = icmp ult i32 %138, %139
  br i1 %140, label %141, label %156

141:                                              ; preds = %137
  %142 = load i32, i32* %22, align 4
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds [17 x i32], [17 x i32]* %17, i64 0, i64 %143
  %145 = load i32, i32* %144, align 4
  %146 = load i32, i32* %33, align 4
  %147 = sub i32 %146, %145
  store i32 %147, i32* %33, align 4
  %148 = icmp slt i32 %147, 0
  br i1 %148, label %149, label %150

149:                                              ; preds = %141
  store i32 2, i32* %8, align 4
  br label %496

150:                                              ; preds = %141
  br label %151

151:                                              ; preds = %150
  %152 = load i32, i32* %22, align 4
  %153 = add i32 %152, 1
  store i32 %153, i32* %22, align 4
  %154 = load i32, i32* %33, align 4
  %155 = shl i32 %154, 1
  store i32 %155, i32* %33, align 4
  br label %137, !llvm.loop !68

156:                                              ; preds = %137
  %157 = load i32, i32* %21, align 4
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds [17 x i32], [17 x i32]* %17, i64 0, i64 %158
  %160 = load i32, i32* %159, align 4
  %161 = load i32, i32* %33, align 4
  %162 = sub i32 %161, %160
  store i32 %162, i32* %33, align 4
  %163 = icmp slt i32 %162, 0
  br i1 %163, label %164, label %165

164:                                              ; preds = %156
  store i32 2, i32* %8, align 4
  br label %496

165:                                              ; preds = %156
  %166 = load i32, i32* %33, align 4
  %167 = load i32, i32* %21, align 4
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds [17 x i32], [17 x i32]* %17, i64 0, i64 %168
  %170 = load i32, i32* %169, align 4
  %171 = add i32 %170, %166
  store i32 %171, i32* %169, align 4
  store i32 0, i32* %22, align 4
  %172 = getelementptr inbounds [17 x i32], [17 x i32]* %31, i64 0, i64 1
  store i32 0, i32* %172, align 4
  %173 = getelementptr inbounds [17 x i32], [17 x i32]* %17, i64 0, i64 0
  %174 = getelementptr inbounds i32, i32* %173, i64 1
  store i32* %174, i32** %25, align 8
  %175 = getelementptr inbounds [17 x i32], [17 x i32]* %31, i64 0, i64 0
  %176 = getelementptr inbounds i32, i32* %175, i64 2
  store i32* %176, i32** %32, align 8
  br label %177

177:                                              ; preds = %181, %165
  %178 = load i32, i32* %21, align 4
  %179 = add i32 %178, -1
  store i32 %179, i32* %21, align 4
  %180 = icmp ne i32 %179, 0
  br i1 %180, label %181, label %189

181:                                              ; preds = %177
  %182 = load i32*, i32** %25, align 8
  %183 = getelementptr inbounds i32, i32* %182, i32 1
  store i32* %183, i32** %25, align 8
  %184 = load i32, i32* %182, align 4
  %185 = load i32, i32* %22, align 4
  %186 = add i32 %185, %184
  store i32 %186, i32* %22, align 4
  %187 = load i32*, i32** %32, align 8
  %188 = getelementptr inbounds i32, i32* %187, i32 1
  store i32* %188, i32** %32, align 8
  store i32 %186, i32* %187, align 4
  br label %177, !llvm.loop !69

189:                                              ; preds = %177
  %190 = load i32*, i32** %9, align 8
  store i32* %190, i32** %25, align 8
  store i32 0, i32* %21, align 4
  br label %191

191:                                              ; preds = %206, %189
  %192 = load i32*, i32** %25, align 8
  %193 = getelementptr inbounds i32, i32* %192, i32 1
  store i32* %193, i32** %25, align 8
  %194 = load i32, i32* %192, align 4
  store i32 %194, i32* %22, align 4
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %196, label %205

196:                                              ; preds = %191
  %197 = load i32, i32* %21, align 4
  %198 = load i32, i32* %22, align 4
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds [17 x i32], [17 x i32]* %31, i64 0, i64 %199
  %201 = load i32, i32* %200, align 4
  %202 = add i32 %201, 1
  store i32 %202, i32* %200, align 4
  %203 = zext i32 %201 to i64
  %204 = getelementptr inbounds [288 x i32], [288 x i32]* %29, i64 0, i64 %203
  store i32 %197, i32* %204, align 4
  br label %205

205:                                              ; preds = %196, %191
  br label %206

206:                                              ; preds = %205
  %207 = load i32, i32* %21, align 4
  %208 = add i32 %207, 1
  store i32 %208, i32* %21, align 4
  %209 = load i32, i32* %10, align 4
  %210 = icmp ult i32 %208, %209
  br i1 %210, label %191, label %211, !llvm.loop !70

211:                                              ; preds = %206
  %212 = load i32, i32* %19, align 4
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [17 x i32], [17 x i32]* %31, i64 0, i64 %213
  %215 = load i32, i32* %214, align 4
  store i32 %215, i32* %10, align 4
  store i32 0, i32* %21, align 4
  %216 = getelementptr inbounds [17 x i32], [17 x i32]* %31, i64 0, i64 0
  store i32 0, i32* %216, align 16
  %217 = getelementptr inbounds [288 x i32], [288 x i32]* %29, i64 0, i64 0
  store i32* %217, i32** %25, align 8
  store i32 -1, i32* %20, align 4
  %218 = load i32, i32* %24, align 4
  %219 = sub nsw i32 0, %218
  store i32 %219, i32* %30, align 4
  %220 = getelementptr inbounds [16 x %struct.huft*], [16 x %struct.huft*]* %28, i64 0, i64 0
  store %struct.huft* null, %struct.huft** %220, align 16
  store %struct.huft* null, %struct.huft** %26, align 8
  store i32 0, i32* %34, align 4
  br label %221

221:                                              ; preds = %484, %211
  %222 = load i32, i32* %23, align 4
  %223 = load i32, i32* %19, align 4
  %224 = icmp sle i32 %222, %223
  br i1 %224, label %225, label %487

225:                                              ; preds = %221
  %226 = load i32, i32* %23, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [17 x i32], [17 x i32]* %17, i64 0, i64 %227
  %229 = load i32, i32* %228, align 4
  store i32 %229, i32* %16, align 4
  br label %230

230:                                              ; preds = %482, %225
  %231 = load i32, i32* %16, align 4
  %232 = add i32 %231, -1
  store i32 %232, i32* %16, align 4
  %233 = icmp ne i32 %231, 0
  br i1 %233, label %234, label %483

234:                                              ; preds = %230
  br label %235

235:                                              ; preds = %364, %234
  %236 = load i32, i32* %23, align 4
  %237 = load i32, i32* %30, align 4
  %238 = load i32, i32* %24, align 4
  %239 = add nsw i32 %237, %238
  %240 = icmp sgt i32 %236, %239
  br i1 %240, label %241, label %365

241:                                              ; preds = %235
  %242 = load i32, i32* %20, align 4
  %243 = add nsw i32 %242, 1
  store i32 %243, i32* %20, align 4
  %244 = load i32, i32* %24, align 4
  %245 = load i32, i32* %30, align 4
  %246 = add nsw i32 %245, %244
  store i32 %246, i32* %30, align 4
  %247 = load i32, i32* %19, align 4
  %248 = load i32, i32* %30, align 4
  %249 = sub nsw i32 %247, %248
  store i32 %249, i32* %34, align 4
  %250 = load i32, i32* %24, align 4
  %251 = icmp ugt i32 %249, %250
  br i1 %251, label %252, label %254

252:                                              ; preds = %241
  %253 = load i32, i32* %24, align 4
  br label %256

254:                                              ; preds = %241
  %255 = load i32, i32* %34, align 4
  br label %256

256:                                              ; preds = %254, %252
  %257 = phi i32 [ %253, %252 ], [ %255, %254 ]
  store i32 %257, i32* %34, align 4
  %258 = load i32, i32* %23, align 4
  %259 = load i32, i32* %30, align 4
  %260 = sub nsw i32 %258, %259
  store i32 %260, i32* %22, align 4
  %261 = shl i32 1, %260
  store i32 %261, i32* %18, align 4
  %262 = load i32, i32* %16, align 4
  %263 = add i32 %262, 1
  %264 = icmp ugt i32 %261, %263
  br i1 %264, label %265, label %298

265:                                              ; preds = %256
  %266 = load i32, i32* %16, align 4
  %267 = add i32 %266, 1
  %268 = load i32, i32* %18, align 4
  %269 = sub i32 %268, %267
  store i32 %269, i32* %18, align 4
  %270 = getelementptr inbounds [17 x i32], [17 x i32]* %17, i64 0, i64 0
  %271 = load i32, i32* %23, align 4
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds i32, i32* %270, i64 %272
  store i32* %273, i32** %32, align 8
  %274 = load i32, i32* %22, align 4
  %275 = load i32, i32* %34, align 4
  %276 = icmp ult i32 %274, %275
  br i1 %276, label %277, label %297

277:                                              ; preds = %265
  br label %278

278:                                              ; preds = %291, %277
  %279 = load i32, i32* %22, align 4
  %280 = add i32 %279, 1
  store i32 %280, i32* %22, align 4
  %281 = load i32, i32* %34, align 4
  %282 = icmp ult i32 %280, %281
  br i1 %282, label %283, label %296

283:                                              ; preds = %278
  %284 = load i32, i32* %18, align 4
  %285 = shl i32 %284, 1
  store i32 %285, i32* %18, align 4
  %286 = load i32*, i32** %32, align 8
  %287 = getelementptr inbounds i32, i32* %286, i32 1
  store i32* %287, i32** %32, align 8
  %288 = load i32, i32* %287, align 4
  %289 = icmp ule i32 %285, %288
  br i1 %289, label %290, label %291

290:                                              ; preds = %283
  br label %296

291:                                              ; preds = %283
  %292 = load i32*, i32** %32, align 8
  %293 = load i32, i32* %292, align 4
  %294 = load i32, i32* %18, align 4
  %295 = sub i32 %294, %293
  store i32 %295, i32* %18, align 4
  br label %278, !llvm.loop !71

296:                                              ; preds = %290, %278
  br label %297

297:                                              ; preds = %296, %265
  br label %298

298:                                              ; preds = %297, %256
  %299 = load i32, i32* %22, align 4
  %300 = shl i32 1, %299
  store i32 %300, i32* %34, align 4
  %301 = load i32, i32* %34, align 4
  %302 = add i32 %301, 1
  %303 = zext i32 %302 to i64
  %304 = mul i64 %303, 16
  %305 = call noalias i8* @malloc(i64 %304) #15
  %306 = bitcast i8* %305 to %struct.huft*
  store %struct.huft* %306, %struct.huft** %26, align 8
  %307 = icmp eq %struct.huft* %306, null
  br i1 %307, label %308, label %316

308:                                              ; preds = %298
  %309 = load i32, i32* %20, align 4
  %310 = icmp ne i32 %309, 0
  br i1 %310, label %311, label %315

311:                                              ; preds = %308
  %312 = getelementptr inbounds [16 x %struct.huft*], [16 x %struct.huft*]* %28, i64 0, i64 0
  %313 = load %struct.huft*, %struct.huft** %312, align 16
  %314 = call i32 @huft_free(%struct.huft* %313)
  br label %315

315:                                              ; preds = %311, %308
  store i32 3, i32* %8, align 4
  br label %496

316:                                              ; preds = %298
  %317 = load i32, i32* %34, align 4
  %318 = add i32 %317, 1
  %319 = load i32, i32* @hufts, align 4
  %320 = add i32 %319, %318
  store i32 %320, i32* @hufts, align 4
  %321 = load %struct.huft*, %struct.huft** %26, align 8
  %322 = getelementptr inbounds %struct.huft, %struct.huft* %321, i64 1
  %323 = load %struct.huft**, %struct.huft*** %14, align 8
  store %struct.huft* %322, %struct.huft** %323, align 8
  %324 = load %struct.huft*, %struct.huft** %26, align 8
  %325 = getelementptr inbounds %struct.huft, %struct.huft* %324, i32 0, i32 2
  %326 = bitcast %union.anon.0* %325 to %struct.huft**
  store %struct.huft** %326, %struct.huft*** %14, align 8
  store %struct.huft* null, %struct.huft** %326, align 8
  %327 = load %struct.huft*, %struct.huft** %26, align 8
  %328 = getelementptr inbounds %struct.huft, %struct.huft* %327, i32 1
  store %struct.huft* %328, %struct.huft** %26, align 8
  %329 = load i32, i32* %20, align 4
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds [16 x %struct.huft*], [16 x %struct.huft*]* %28, i64 0, i64 %330
  store %struct.huft* %328, %struct.huft** %331, align 8
  %332 = load i32, i32* %20, align 4
  %333 = icmp ne i32 %332, 0
  br i1 %333, label %334, label %364

334:                                              ; preds = %316
  %335 = load i32, i32* %21, align 4
  %336 = load i32, i32* %20, align 4
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [17 x i32], [17 x i32]* %31, i64 0, i64 %337
  store i32 %335, i32* %338, align 4
  %339 = load i32, i32* %24, align 4
  %340 = trunc i32 %339 to i8
  %341 = getelementptr inbounds %struct.huft, %struct.huft* %27, i32 0, i32 1
  store i8 %340, i8* %341, align 1
  %342 = load i32, i32* %22, align 4
  %343 = add i32 16, %342
  %344 = trunc i32 %343 to i8
  %345 = getelementptr inbounds %struct.huft, %struct.huft* %27, i32 0, i32 0
  store i8 %344, i8* %345, align 8
  %346 = load %struct.huft*, %struct.huft** %26, align 8
  %347 = getelementptr inbounds %struct.huft, %struct.huft* %27, i32 0, i32 2
  %348 = bitcast %union.anon.0* %347 to %struct.huft**
  store %struct.huft* %346, %struct.huft** %348, align 8
  %349 = load i32, i32* %21, align 4
  %350 = load i32, i32* %30, align 4
  %351 = load i32, i32* %24, align 4
  %352 = sub nsw i32 %350, %351
  %353 = lshr i32 %349, %352
  store i32 %353, i32* %22, align 4
  %354 = load i32, i32* %20, align 4
  %355 = sub nsw i32 %354, 1
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds [16 x %struct.huft*], [16 x %struct.huft*]* %28, i64 0, i64 %356
  %358 = load %struct.huft*, %struct.huft** %357, align 8
  %359 = load i32, i32* %22, align 4
  %360 = zext i32 %359 to i64
  %361 = getelementptr inbounds %struct.huft, %struct.huft* %358, i64 %360
  %362 = bitcast %struct.huft* %361 to i8*
  %363 = bitcast %struct.huft* %27 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %362, i8* align 8 %363, i64 16, i1 false)
  br label %364

364:                                              ; preds = %334, %316
  br label %235, !llvm.loop !72

365:                                              ; preds = %235
  %366 = load i32, i32* %23, align 4
  %367 = load i32, i32* %30, align 4
  %368 = sub nsw i32 %366, %367
  %369 = trunc i32 %368 to i8
  %370 = getelementptr inbounds %struct.huft, %struct.huft* %27, i32 0, i32 1
  store i8 %369, i8* %370, align 1
  %371 = load i32*, i32** %25, align 8
  %372 = getelementptr inbounds [288 x i32], [288 x i32]* %29, i64 0, i64 0
  %373 = load i32, i32* %10, align 4
  %374 = zext i32 %373 to i64
  %375 = getelementptr inbounds i32, i32* %372, i64 %374
  %376 = icmp uge i32* %371, %375
  br i1 %376, label %377, label %379

377:                                              ; preds = %365
  %378 = getelementptr inbounds %struct.huft, %struct.huft* %27, i32 0, i32 0
  store i8 99, i8* %378, align 8
  br label %422

379:                                              ; preds = %365
  %380 = load i32*, i32** %25, align 8
  %381 = load i32, i32* %380, align 4
  %382 = load i32, i32* %11, align 4
  %383 = icmp ult i32 %381, %382
  br i1 %383, label %384, label %399

384:                                              ; preds = %379
  %385 = load i32*, i32** %25, align 8
  %386 = load i32, i32* %385, align 4
  %387 = icmp ult i32 %386, 256
  %388 = zext i1 %387 to i64
  %389 = select i1 %387, i32 16, i32 15
  %390 = trunc i32 %389 to i8
  %391 = getelementptr inbounds %struct.huft, %struct.huft* %27, i32 0, i32 0
  store i8 %390, i8* %391, align 8
  %392 = load i32*, i32** %25, align 8
  %393 = load i32, i32* %392, align 4
  %394 = trunc i32 %393 to i16
  %395 = getelementptr inbounds %struct.huft, %struct.huft* %27, i32 0, i32 2
  %396 = bitcast %union.anon.0* %395 to i16*
  store i16 %394, i16* %396, align 8
  %397 = load i32*, i32** %25, align 8
  %398 = getelementptr inbounds i32, i32* %397, i32 1
  store i32* %398, i32** %25, align 8
  br label %421

399:                                              ; preds = %379
  %400 = load i16*, i16** %13, align 8
  %401 = load i32*, i32** %25, align 8
  %402 = load i32, i32* %401, align 4
  %403 = load i32, i32* %11, align 4
  %404 = sub i32 %402, %403
  %405 = zext i32 %404 to i64
  %406 = getelementptr inbounds i16, i16* %400, i64 %405
  %407 = load i16, i16* %406, align 2
  %408 = trunc i16 %407 to i8
  %409 = getelementptr inbounds %struct.huft, %struct.huft* %27, i32 0, i32 0
  store i8 %408, i8* %409, align 8
  %410 = load i16*, i16** %12, align 8
  %411 = load i32*, i32** %25, align 8
  %412 = getelementptr inbounds i32, i32* %411, i32 1
  store i32* %412, i32** %25, align 8
  %413 = load i32, i32* %411, align 4
  %414 = load i32, i32* %11, align 4
  %415 = sub i32 %413, %414
  %416 = zext i32 %415 to i64
  %417 = getelementptr inbounds i16, i16* %410, i64 %416
  %418 = load i16, i16* %417, align 2
  %419 = getelementptr inbounds %struct.huft, %struct.huft* %27, i32 0, i32 2
  %420 = bitcast %union.anon.0* %419 to i16*
  store i16 %418, i16* %420, align 8
  br label %421

421:                                              ; preds = %399, %384
  br label %422

422:                                              ; preds = %421, %377
  %423 = load i32, i32* %23, align 4
  %424 = load i32, i32* %30, align 4
  %425 = sub nsw i32 %423, %424
  %426 = shl i32 1, %425
  store i32 %426, i32* %18, align 4
  %427 = load i32, i32* %21, align 4
  %428 = load i32, i32* %30, align 4
  %429 = lshr i32 %427, %428
  store i32 %429, i32* %22, align 4
  br label %430

430:                                              ; preds = %441, %422
  %431 = load i32, i32* %22, align 4
  %432 = load i32, i32* %34, align 4
  %433 = icmp ult i32 %431, %432
  br i1 %433, label %434, label %445

434:                                              ; preds = %430
  %435 = load %struct.huft*, %struct.huft** %26, align 8
  %436 = load i32, i32* %22, align 4
  %437 = zext i32 %436 to i64
  %438 = getelementptr inbounds %struct.huft, %struct.huft* %435, i64 %437
  %439 = bitcast %struct.huft* %438 to i8*
  %440 = bitcast %struct.huft* %27 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %439, i8* align 8 %440, i64 16, i1 false)
  br label %441

441:                                              ; preds = %434
  %442 = load i32, i32* %18, align 4
  %443 = load i32, i32* %22, align 4
  %444 = add i32 %443, %442
  store i32 %444, i32* %22, align 4
  br label %430, !llvm.loop !73

445:                                              ; preds = %430
  %446 = load i32, i32* %23, align 4
  %447 = sub nsw i32 %446, 1
  %448 = shl i32 1, %447
  store i32 %448, i32* %22, align 4
  br label %449

449:                                              ; preds = %458, %445
  %450 = load i32, i32* %21, align 4
  %451 = load i32, i32* %22, align 4
  %452 = and i32 %450, %451
  %453 = icmp ne i32 %452, 0
  br i1 %453, label %454, label %461

454:                                              ; preds = %449
  %455 = load i32, i32* %22, align 4
  %456 = load i32, i32* %21, align 4
  %457 = xor i32 %456, %455
  store i32 %457, i32* %21, align 4
  br label %458

458:                                              ; preds = %454
  %459 = load i32, i32* %22, align 4
  %460 = lshr i32 %459, 1
  store i32 %460, i32* %22, align 4
  br label %449, !llvm.loop !74

461:                                              ; preds = %449
  %462 = load i32, i32* %22, align 4
  %463 = load i32, i32* %21, align 4
  %464 = xor i32 %463, %462
  store i32 %464, i32* %21, align 4
  br label %465

465:                                              ; preds = %476, %461
  %466 = load i32, i32* %21, align 4
  %467 = load i32, i32* %30, align 4
  %468 = shl i32 1, %467
  %469 = sub nsw i32 %468, 1
  %470 = and i32 %466, %469
  %471 = load i32, i32* %20, align 4
  %472 = sext i32 %471 to i64
  %473 = getelementptr inbounds [17 x i32], [17 x i32]* %31, i64 0, i64 %472
  %474 = load i32, i32* %473, align 4
  %475 = icmp ne i32 %470, %474
  br i1 %475, label %476, label %482

476:                                              ; preds = %465
  %477 = load i32, i32* %20, align 4
  %478 = add nsw i32 %477, -1
  store i32 %478, i32* %20, align 4
  %479 = load i32, i32* %24, align 4
  %480 = load i32, i32* %30, align 4
  %481 = sub nsw i32 %480, %479
  store i32 %481, i32* %30, align 4
  br label %465, !llvm.loop !75

482:                                              ; preds = %465
  br label %230, !llvm.loop !76

483:                                              ; preds = %230
  br label %484

484:                                              ; preds = %483
  %485 = load i32, i32* %23, align 4
  %486 = add nsw i32 %485, 1
  store i32 %486, i32* %23, align 4
  br label %221, !llvm.loop !77

487:                                              ; preds = %221
  %488 = load i32, i32* %33, align 4
  %489 = icmp ne i32 %488, 0
  br i1 %489, label %490, label %493

490:                                              ; preds = %487
  %491 = load i32, i32* %19, align 4
  %492 = icmp ne i32 %491, 1
  br label %493

493:                                              ; preds = %490, %487
  %494 = phi i1 [ false, %487 ], [ %492, %490 ]
  %495 = zext i1 %494 to i32
  store i32 %495, i32* %8, align 4
  br label %496

496:                                              ; preds = %493, %315, %164, %149, %63, %62
  %497 = load i32, i32* %8, align 4
  ret i32 %497
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @huft_free(%struct.huft* %0) #0 {
  %2 = alloca %struct.huft*, align 8
  %3 = alloca %struct.huft*, align 8
  %4 = alloca %struct.huft*, align 8
  store %struct.huft* %0, %struct.huft** %2, align 8
  %5 = load %struct.huft*, %struct.huft** %2, align 8
  store %struct.huft* %5, %struct.huft** %3, align 8
  br label %6

6:                                                ; preds = %9, %1
  %7 = load %struct.huft*, %struct.huft** %3, align 8
  %8 = icmp ne %struct.huft* %7, null
  br i1 %8, label %9, label %18

9:                                                ; preds = %6
  %10 = load %struct.huft*, %struct.huft** %3, align 8
  %11 = getelementptr inbounds %struct.huft, %struct.huft* %10, i32 -1
  store %struct.huft* %11, %struct.huft** %3, align 8
  %12 = getelementptr inbounds %struct.huft, %struct.huft* %11, i32 0, i32 2
  %13 = bitcast %union.anon.0* %12 to %struct.huft**
  %14 = load %struct.huft*, %struct.huft** %13, align 8
  store %struct.huft* %14, %struct.huft** %4, align 8
  %15 = load %struct.huft*, %struct.huft** %3, align 8
  %16 = bitcast %struct.huft* %15 to i8*
  call void @free(i8* %16) #15
  %17 = load %struct.huft*, %struct.huft** %4, align 8
  store %struct.huft* %17, %struct.huft** %3, align 8
  br label %6, !llvm.loop !78

18:                                               ; preds = %6
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @inflate_codes(%struct.huft* %0, %struct.huft* %1, i32 %2, i32 %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.huft*, align 8
  %7 = alloca %struct.huft*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.huft*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  store %struct.huft* %0, %struct.huft** %6, align 8
  store %struct.huft* %1, %struct.huft** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %19 = load i64, i64* @bb, align 8
  store i64 %19, i64* %17, align 8
  %20 = load i32, i32* @bk, align 4
  store i32 %20, i32* %18, align 4
  %21 = load i32, i32* @outcnt, align 4
  store i32 %21, i32* %13, align 4
  %22 = load i32, i32* %8, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [17 x i16], [17 x i16]* @mask_bits, i64 0, i64 %23
  %25 = load i16, i16* %24, align 2
  %26 = zext i16 %25 to i32
  store i32 %26, i32* %15, align 4
  %27 = load i32, i32* %9, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [17 x i16], [17 x i16]* @mask_bits, i64 0, i64 %28
  %30 = load i16, i16* %29, align 2
  %31 = zext i16 %30 to i32
  store i32 %31, i32* %16, align 4
  br label %32

32:                                               ; preds = %489, %4
  br label %33

33:                                               ; preds = %51, %32
  %34 = load i32, i32* %18, align 4
  %35 = load i32, i32* %8, align 4
  %36 = icmp ult i32 %34, %35
  br i1 %36, label %37, label %62

37:                                               ; preds = %33
  %38 = load i32, i32* @inptr, align 4
  %39 = load i32, i32* @insize, align 4
  %40 = icmp ult i32 %38, %39
  br i1 %40, label %41, label %48

41:                                               ; preds = %37
  %42 = load i32, i32* @inptr, align 4
  %43 = add i32 %42, 1
  store i32 %43, i32* @inptr, align 4
  %44 = zext i32 %42 to i64
  %45 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %44
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  br label %51

48:                                               ; preds = %37
  %49 = load i32, i32* %13, align 4
  store i32 %49, i32* @outcnt, align 4
  %50 = call i32 @fill_inbuf(i32 0)
  br label %51

51:                                               ; preds = %48, %41
  %52 = phi i32 [ %47, %41 ], [ %50, %48 ]
  %53 = trunc i32 %52 to i8
  %54 = zext i8 %53 to i64
  %55 = load i32, i32* %18, align 4
  %56 = zext i32 %55 to i64
  %57 = shl i64 %54, %56
  %58 = load i64, i64* %17, align 8
  %59 = or i64 %58, %57
  store i64 %59, i64* %17, align 8
  %60 = load i32, i32* %18, align 4
  %61 = add i32 %60, 8
  store i32 %61, i32* %18, align 4
  br label %33, !llvm.loop !79

62:                                               ; preds = %33
  %63 = load %struct.huft*, %struct.huft** %6, align 8
  %64 = load i64, i64* %17, align 8
  %65 = trunc i64 %64 to i32
  %66 = load i32, i32* %15, align 4
  %67 = and i32 %65, %66
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds %struct.huft, %struct.huft* %63, i64 %68
  store %struct.huft* %69, %struct.huft** %14, align 8
  %70 = getelementptr inbounds %struct.huft, %struct.huft* %69, i32 0, i32 0
  %71 = load i8, i8* %70, align 8
  %72 = zext i8 %71 to i32
  store i32 %72, i32* %10, align 4
  %73 = icmp ugt i32 %72, 16
  br i1 %73, label %74, label %145

74:                                               ; preds = %62
  br label %75

75:                                               ; preds = %125, %74
  %76 = load i32, i32* %10, align 4
  %77 = icmp eq i32 %76, 99
  br i1 %77, label %78, label %79

78:                                               ; preds = %75
  store i32 1, i32* %5, align 4
  br label %494

79:                                               ; preds = %75
  %80 = load %struct.huft*, %struct.huft** %14, align 8
  %81 = getelementptr inbounds %struct.huft, %struct.huft* %80, i32 0, i32 1
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = load i64, i64* %17, align 8
  %85 = zext i32 %83 to i64
  %86 = lshr i64 %84, %85
  store i64 %86, i64* %17, align 8
  %87 = load %struct.huft*, %struct.huft** %14, align 8
  %88 = getelementptr inbounds %struct.huft, %struct.huft* %87, i32 0, i32 1
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i32
  %91 = load i32, i32* %18, align 4
  %92 = sub i32 %91, %90
  store i32 %92, i32* %18, align 4
  %93 = load i32, i32* %10, align 4
  %94 = sub i32 %93, 16
  store i32 %94, i32* %10, align 4
  br label %95

95:                                               ; preds = %113, %79
  %96 = load i32, i32* %18, align 4
  %97 = load i32, i32* %10, align 4
  %98 = icmp ult i32 %96, %97
  br i1 %98, label %99, label %124

99:                                               ; preds = %95
  %100 = load i32, i32* @inptr, align 4
  %101 = load i32, i32* @insize, align 4
  %102 = icmp ult i32 %100, %101
  br i1 %102, label %103, label %110

103:                                              ; preds = %99
  %104 = load i32, i32* @inptr, align 4
  %105 = add i32 %104, 1
  store i32 %105, i32* @inptr, align 4
  %106 = zext i32 %104 to i64
  %107 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %106
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  br label %113

110:                                              ; preds = %99
  %111 = load i32, i32* %13, align 4
  store i32 %111, i32* @outcnt, align 4
  %112 = call i32 @fill_inbuf(i32 0)
  br label %113

113:                                              ; preds = %110, %103
  %114 = phi i32 [ %109, %103 ], [ %112, %110 ]
  %115 = trunc i32 %114 to i8
  %116 = zext i8 %115 to i64
  %117 = load i32, i32* %18, align 4
  %118 = zext i32 %117 to i64
  %119 = shl i64 %116, %118
  %120 = load i64, i64* %17, align 8
  %121 = or i64 %120, %119
  store i64 %121, i64* %17, align 8
  %122 = load i32, i32* %18, align 4
  %123 = add i32 %122, 8
  store i32 %123, i32* %18, align 4
  br label %95, !llvm.loop !80

124:                                              ; preds = %95
  br label %125

125:                                              ; preds = %124
  %126 = load %struct.huft*, %struct.huft** %14, align 8
  %127 = getelementptr inbounds %struct.huft, %struct.huft* %126, i32 0, i32 2
  %128 = bitcast %union.anon.0* %127 to %struct.huft**
  %129 = load %struct.huft*, %struct.huft** %128, align 8
  %130 = load i64, i64* %17, align 8
  %131 = trunc i64 %130 to i32
  %132 = load i32, i32* %10, align 4
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds [17 x i16], [17 x i16]* @mask_bits, i64 0, i64 %133
  %135 = load i16, i16* %134, align 2
  %136 = zext i16 %135 to i32
  %137 = and i32 %131, %136
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds %struct.huft, %struct.huft* %129, i64 %138
  store %struct.huft* %139, %struct.huft** %14, align 8
  %140 = getelementptr inbounds %struct.huft, %struct.huft* %139, i32 0, i32 0
  %141 = load i8, i8* %140, align 8
  %142 = zext i8 %141 to i32
  store i32 %142, i32* %10, align 4
  %143 = icmp ugt i32 %142, 16
  br i1 %143, label %75, label %144, !llvm.loop !81

144:                                              ; preds = %125
  br label %145

145:                                              ; preds = %144, %62
  %146 = load %struct.huft*, %struct.huft** %14, align 8
  %147 = getelementptr inbounds %struct.huft, %struct.huft* %146, i32 0, i32 1
  %148 = load i8, i8* %147, align 1
  %149 = zext i8 %148 to i32
  %150 = load i64, i64* %17, align 8
  %151 = zext i32 %149 to i64
  %152 = lshr i64 %150, %151
  store i64 %152, i64* %17, align 8
  %153 = load %struct.huft*, %struct.huft** %14, align 8
  %154 = getelementptr inbounds %struct.huft, %struct.huft* %153, i32 0, i32 1
  %155 = load i8, i8* %154, align 1
  %156 = zext i8 %155 to i32
  %157 = load i32, i32* %18, align 4
  %158 = sub i32 %157, %156
  store i32 %158, i32* %18, align 4
  %159 = load i32, i32* %10, align 4
  %160 = icmp eq i32 %159, 16
  br i1 %160, label %161, label %176

161:                                              ; preds = %145
  %162 = load %struct.huft*, %struct.huft** %14, align 8
  %163 = getelementptr inbounds %struct.huft, %struct.huft* %162, i32 0, i32 2
  %164 = bitcast %union.anon.0* %163 to i16*
  %165 = load i16, i16* %164, align 8
  %166 = trunc i16 %165 to i8
  %167 = load i32, i32* %13, align 4
  %168 = add i32 %167, 1
  store i32 %168, i32* %13, align 4
  %169 = zext i32 %167 to i64
  %170 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %169
  store i8 %166, i8* %170, align 1
  %171 = load i32, i32* %13, align 4
  %172 = icmp eq i32 %171, 32768
  br i1 %172, label %173, label %175

173:                                              ; preds = %161
  %174 = load i32, i32* %13, align 4
  store i32 %174, i32* @outcnt, align 4
  call void @flush_window()
  store i32 0, i32* %13, align 4
  br label %175

175:                                              ; preds = %173, %161
  br label %489

176:                                              ; preds = %145
  %177 = load i32, i32* %10, align 4
  %178 = icmp eq i32 %177, 15
  br i1 %178, label %179, label %180

179:                                              ; preds = %176
  br label %490

180:                                              ; preds = %176
  br label %181

181:                                              ; preds = %199, %180
  %182 = load i32, i32* %18, align 4
  %183 = load i32, i32* %10, align 4
  %184 = icmp ult i32 %182, %183
  br i1 %184, label %185, label %210

185:                                              ; preds = %181
  %186 = load i32, i32* @inptr, align 4
  %187 = load i32, i32* @insize, align 4
  %188 = icmp ult i32 %186, %187
  br i1 %188, label %189, label %196

189:                                              ; preds = %185
  %190 = load i32, i32* @inptr, align 4
  %191 = add i32 %190, 1
  store i32 %191, i32* @inptr, align 4
  %192 = zext i32 %190 to i64
  %193 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %192
  %194 = load i8, i8* %193, align 1
  %195 = zext i8 %194 to i32
  br label %199

196:                                              ; preds = %185
  %197 = load i32, i32* %13, align 4
  store i32 %197, i32* @outcnt, align 4
  %198 = call i32 @fill_inbuf(i32 0)
  br label %199

199:                                              ; preds = %196, %189
  %200 = phi i32 [ %195, %189 ], [ %198, %196 ]
  %201 = trunc i32 %200 to i8
  %202 = zext i8 %201 to i64
  %203 = load i32, i32* %18, align 4
  %204 = zext i32 %203 to i64
  %205 = shl i64 %202, %204
  %206 = load i64, i64* %17, align 8
  %207 = or i64 %206, %205
  store i64 %207, i64* %17, align 8
  %208 = load i32, i32* %18, align 4
  %209 = add i32 %208, 8
  store i32 %209, i32* %18, align 4
  br label %181, !llvm.loop !82

210:                                              ; preds = %181
  %211 = load %struct.huft*, %struct.huft** %14, align 8
  %212 = getelementptr inbounds %struct.huft, %struct.huft* %211, i32 0, i32 2
  %213 = bitcast %union.anon.0* %212 to i16*
  %214 = load i16, i16* %213, align 8
  %215 = zext i16 %214 to i32
  %216 = load i64, i64* %17, align 8
  %217 = trunc i64 %216 to i32
  %218 = load i32, i32* %10, align 4
  %219 = zext i32 %218 to i64
  %220 = getelementptr inbounds [17 x i16], [17 x i16]* @mask_bits, i64 0, i64 %219
  %221 = load i16, i16* %220, align 2
  %222 = zext i16 %221 to i32
  %223 = and i32 %217, %222
  %224 = add i32 %215, %223
  store i32 %224, i32* %11, align 4
  %225 = load i32, i32* %10, align 4
  %226 = load i64, i64* %17, align 8
  %227 = zext i32 %225 to i64
  %228 = lshr i64 %226, %227
  store i64 %228, i64* %17, align 8
  %229 = load i32, i32* %10, align 4
  %230 = load i32, i32* %18, align 4
  %231 = sub i32 %230, %229
  store i32 %231, i32* %18, align 4
  br label %232

232:                                              ; preds = %250, %210
  %233 = load i32, i32* %18, align 4
  %234 = load i32, i32* %9, align 4
  %235 = icmp ult i32 %233, %234
  br i1 %235, label %236, label %261

236:                                              ; preds = %232
  %237 = load i32, i32* @inptr, align 4
  %238 = load i32, i32* @insize, align 4
  %239 = icmp ult i32 %237, %238
  br i1 %239, label %240, label %247

240:                                              ; preds = %236
  %241 = load i32, i32* @inptr, align 4
  %242 = add i32 %241, 1
  store i32 %242, i32* @inptr, align 4
  %243 = zext i32 %241 to i64
  %244 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %243
  %245 = load i8, i8* %244, align 1
  %246 = zext i8 %245 to i32
  br label %250

247:                                              ; preds = %236
  %248 = load i32, i32* %13, align 4
  store i32 %248, i32* @outcnt, align 4
  %249 = call i32 @fill_inbuf(i32 0)
  br label %250

250:                                              ; preds = %247, %240
  %251 = phi i32 [ %246, %240 ], [ %249, %247 ]
  %252 = trunc i32 %251 to i8
  %253 = zext i8 %252 to i64
  %254 = load i32, i32* %18, align 4
  %255 = zext i32 %254 to i64
  %256 = shl i64 %253, %255
  %257 = load i64, i64* %17, align 8
  %258 = or i64 %257, %256
  store i64 %258, i64* %17, align 8
  %259 = load i32, i32* %18, align 4
  %260 = add i32 %259, 8
  store i32 %260, i32* %18, align 4
  br label %232, !llvm.loop !83

261:                                              ; preds = %232
  %262 = load %struct.huft*, %struct.huft** %7, align 8
  %263 = load i64, i64* %17, align 8
  %264 = trunc i64 %263 to i32
  %265 = load i32, i32* %16, align 4
  %266 = and i32 %264, %265
  %267 = zext i32 %266 to i64
  %268 = getelementptr inbounds %struct.huft, %struct.huft* %262, i64 %267
  store %struct.huft* %268, %struct.huft** %14, align 8
  %269 = getelementptr inbounds %struct.huft, %struct.huft* %268, i32 0, i32 0
  %270 = load i8, i8* %269, align 8
  %271 = zext i8 %270 to i32
  store i32 %271, i32* %10, align 4
  %272 = icmp ugt i32 %271, 16
  br i1 %272, label %273, label %344

273:                                              ; preds = %261
  br label %274

274:                                              ; preds = %324, %273
  %275 = load i32, i32* %10, align 4
  %276 = icmp eq i32 %275, 99
  br i1 %276, label %277, label %278

277:                                              ; preds = %274
  store i32 1, i32* %5, align 4
  br label %494

278:                                              ; preds = %274
  %279 = load %struct.huft*, %struct.huft** %14, align 8
  %280 = getelementptr inbounds %struct.huft, %struct.huft* %279, i32 0, i32 1
  %281 = load i8, i8* %280, align 1
  %282 = zext i8 %281 to i32
  %283 = load i64, i64* %17, align 8
  %284 = zext i32 %282 to i64
  %285 = lshr i64 %283, %284
  store i64 %285, i64* %17, align 8
  %286 = load %struct.huft*, %struct.huft** %14, align 8
  %287 = getelementptr inbounds %struct.huft, %struct.huft* %286, i32 0, i32 1
  %288 = load i8, i8* %287, align 1
  %289 = zext i8 %288 to i32
  %290 = load i32, i32* %18, align 4
  %291 = sub i32 %290, %289
  store i32 %291, i32* %18, align 4
  %292 = load i32, i32* %10, align 4
  %293 = sub i32 %292, 16
  store i32 %293, i32* %10, align 4
  br label %294

294:                                              ; preds = %312, %278
  %295 = load i32, i32* %18, align 4
  %296 = load i32, i32* %10, align 4
  %297 = icmp ult i32 %295, %296
  br i1 %297, label %298, label %323

298:                                              ; preds = %294
  %299 = load i32, i32* @inptr, align 4
  %300 = load i32, i32* @insize, align 4
  %301 = icmp ult i32 %299, %300
  br i1 %301, label %302, label %309

302:                                              ; preds = %298
  %303 = load i32, i32* @inptr, align 4
  %304 = add i32 %303, 1
  store i32 %304, i32* @inptr, align 4
  %305 = zext i32 %303 to i64
  %306 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %305
  %307 = load i8, i8* %306, align 1
  %308 = zext i8 %307 to i32
  br label %312

309:                                              ; preds = %298
  %310 = load i32, i32* %13, align 4
  store i32 %310, i32* @outcnt, align 4
  %311 = call i32 @fill_inbuf(i32 0)
  br label %312

312:                                              ; preds = %309, %302
  %313 = phi i32 [ %308, %302 ], [ %311, %309 ]
  %314 = trunc i32 %313 to i8
  %315 = zext i8 %314 to i64
  %316 = load i32, i32* %18, align 4
  %317 = zext i32 %316 to i64
  %318 = shl i64 %315, %317
  %319 = load i64, i64* %17, align 8
  %320 = or i64 %319, %318
  store i64 %320, i64* %17, align 8
  %321 = load i32, i32* %18, align 4
  %322 = add i32 %321, 8
  store i32 %322, i32* %18, align 4
  br label %294, !llvm.loop !84

323:                                              ; preds = %294
  br label %324

324:                                              ; preds = %323
  %325 = load %struct.huft*, %struct.huft** %14, align 8
  %326 = getelementptr inbounds %struct.huft, %struct.huft* %325, i32 0, i32 2
  %327 = bitcast %union.anon.0* %326 to %struct.huft**
  %328 = load %struct.huft*, %struct.huft** %327, align 8
  %329 = load i64, i64* %17, align 8
  %330 = trunc i64 %329 to i32
  %331 = load i32, i32* %10, align 4
  %332 = zext i32 %331 to i64
  %333 = getelementptr inbounds [17 x i16], [17 x i16]* @mask_bits, i64 0, i64 %332
  %334 = load i16, i16* %333, align 2
  %335 = zext i16 %334 to i32
  %336 = and i32 %330, %335
  %337 = zext i32 %336 to i64
  %338 = getelementptr inbounds %struct.huft, %struct.huft* %328, i64 %337
  store %struct.huft* %338, %struct.huft** %14, align 8
  %339 = getelementptr inbounds %struct.huft, %struct.huft* %338, i32 0, i32 0
  %340 = load i8, i8* %339, align 8
  %341 = zext i8 %340 to i32
  store i32 %341, i32* %10, align 4
  %342 = icmp ugt i32 %341, 16
  br i1 %342, label %274, label %343, !llvm.loop !85

343:                                              ; preds = %324
  br label %344

344:                                              ; preds = %343, %261
  %345 = load %struct.huft*, %struct.huft** %14, align 8
  %346 = getelementptr inbounds %struct.huft, %struct.huft* %345, i32 0, i32 1
  %347 = load i8, i8* %346, align 1
  %348 = zext i8 %347 to i32
  %349 = load i64, i64* %17, align 8
  %350 = zext i32 %348 to i64
  %351 = lshr i64 %349, %350
  store i64 %351, i64* %17, align 8
  %352 = load %struct.huft*, %struct.huft** %14, align 8
  %353 = getelementptr inbounds %struct.huft, %struct.huft* %352, i32 0, i32 1
  %354 = load i8, i8* %353, align 1
  %355 = zext i8 %354 to i32
  %356 = load i32, i32* %18, align 4
  %357 = sub i32 %356, %355
  store i32 %357, i32* %18, align 4
  br label %358

358:                                              ; preds = %376, %344
  %359 = load i32, i32* %18, align 4
  %360 = load i32, i32* %10, align 4
  %361 = icmp ult i32 %359, %360
  br i1 %361, label %362, label %387

362:                                              ; preds = %358
  %363 = load i32, i32* @inptr, align 4
  %364 = load i32, i32* @insize, align 4
  %365 = icmp ult i32 %363, %364
  br i1 %365, label %366, label %373

366:                                              ; preds = %362
  %367 = load i32, i32* @inptr, align 4
  %368 = add i32 %367, 1
  store i32 %368, i32* @inptr, align 4
  %369 = zext i32 %367 to i64
  %370 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %369
  %371 = load i8, i8* %370, align 1
  %372 = zext i8 %371 to i32
  br label %376

373:                                              ; preds = %362
  %374 = load i32, i32* %13, align 4
  store i32 %374, i32* @outcnt, align 4
  %375 = call i32 @fill_inbuf(i32 0)
  br label %376

376:                                              ; preds = %373, %366
  %377 = phi i32 [ %372, %366 ], [ %375, %373 ]
  %378 = trunc i32 %377 to i8
  %379 = zext i8 %378 to i64
  %380 = load i32, i32* %18, align 4
  %381 = zext i32 %380 to i64
  %382 = shl i64 %379, %381
  %383 = load i64, i64* %17, align 8
  %384 = or i64 %383, %382
  store i64 %384, i64* %17, align 8
  %385 = load i32, i32* %18, align 4
  %386 = add i32 %385, 8
  store i32 %386, i32* %18, align 4
  br label %358, !llvm.loop !86

387:                                              ; preds = %358
  %388 = load i32, i32* %13, align 4
  %389 = load %struct.huft*, %struct.huft** %14, align 8
  %390 = getelementptr inbounds %struct.huft, %struct.huft* %389, i32 0, i32 2
  %391 = bitcast %union.anon.0* %390 to i16*
  %392 = load i16, i16* %391, align 8
  %393 = zext i16 %392 to i32
  %394 = sub i32 %388, %393
  %395 = load i64, i64* %17, align 8
  %396 = trunc i64 %395 to i32
  %397 = load i32, i32* %10, align 4
  %398 = zext i32 %397 to i64
  %399 = getelementptr inbounds [17 x i16], [17 x i16]* @mask_bits, i64 0, i64 %398
  %400 = load i16, i16* %399, align 2
  %401 = zext i16 %400 to i32
  %402 = and i32 %396, %401
  %403 = sub i32 %394, %402
  store i32 %403, i32* %12, align 4
  %404 = load i32, i32* %10, align 4
  %405 = load i64, i64* %17, align 8
  %406 = zext i32 %404 to i64
  %407 = lshr i64 %405, %406
  store i64 %407, i64* %17, align 8
  %408 = load i32, i32* %10, align 4
  %409 = load i32, i32* %18, align 4
  %410 = sub i32 %409, %408
  store i32 %410, i32* %18, align 4
  br label %411

411:                                              ; preds = %485, %387
  %412 = load i32, i32* %12, align 4
  %413 = and i32 %412, 32767
  store i32 %413, i32* %12, align 4
  %414 = load i32, i32* %13, align 4
  %415 = icmp ugt i32 %413, %414
  br i1 %415, label %416, label %418

416:                                              ; preds = %411
  %417 = load i32, i32* %12, align 4
  br label %420

418:                                              ; preds = %411
  %419 = load i32, i32* %13, align 4
  br label %420

420:                                              ; preds = %418, %416
  %421 = phi i32 [ %417, %416 ], [ %419, %418 ]
  %422 = sub i32 32768, %421
  store i32 %422, i32* %10, align 4
  %423 = load i32, i32* %11, align 4
  %424 = icmp ugt i32 %422, %423
  br i1 %424, label %425, label %427

425:                                              ; preds = %420
  %426 = load i32, i32* %11, align 4
  br label %429

427:                                              ; preds = %420
  %428 = load i32, i32* %10, align 4
  br label %429

429:                                              ; preds = %427, %425
  %430 = phi i32 [ %426, %425 ], [ %428, %427 ]
  store i32 %430, i32* %10, align 4
  %431 = load i32, i32* %11, align 4
  %432 = sub i32 %431, %430
  store i32 %432, i32* %11, align 4
  %433 = load i32, i32* %10, align 4
  %434 = load i32, i32* %12, align 4
  %435 = load i32, i32* %13, align 4
  %436 = icmp ult i32 %434, %435
  br i1 %436, label %437, label %441

437:                                              ; preds = %429
  %438 = load i32, i32* %13, align 4
  %439 = load i32, i32* %12, align 4
  %440 = sub i32 %438, %439
  br label %445

441:                                              ; preds = %429
  %442 = load i32, i32* %12, align 4
  %443 = load i32, i32* %13, align 4
  %444 = sub i32 %442, %443
  br label %445

445:                                              ; preds = %441, %437
  %446 = phi i32 [ %440, %437 ], [ %444, %441 ]
  %447 = icmp ule i32 %433, %446
  br i1 %447, label %448, label %463

448:                                              ; preds = %445
  %449 = load i32, i32* %13, align 4
  %450 = zext i32 %449 to i64
  %451 = getelementptr inbounds i8, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i64 %450
  %452 = load i32, i32* %12, align 4
  %453 = zext i32 %452 to i64
  %454 = getelementptr inbounds i8, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i64 %453
  %455 = load i32, i32* %10, align 4
  %456 = zext i32 %455 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %451, i8* align 1 %454, i64 %456, i1 false)
  %457 = load i32, i32* %10, align 4
  %458 = load i32, i32* %13, align 4
  %459 = add i32 %458, %457
  store i32 %459, i32* %13, align 4
  %460 = load i32, i32* %10, align 4
  %461 = load i32, i32* %12, align 4
  %462 = add i32 %461, %460
  store i32 %462, i32* %12, align 4
  br label %479

463:                                              ; preds = %445
  br label %464

464:                                              ; preds = %474, %463
  %465 = load i32, i32* %12, align 4
  %466 = add i32 %465, 1
  store i32 %466, i32* %12, align 4
  %467 = zext i32 %465 to i64
  %468 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %467
  %469 = load i8, i8* %468, align 1
  %470 = load i32, i32* %13, align 4
  %471 = add i32 %470, 1
  store i32 %471, i32* %13, align 4
  %472 = zext i32 %470 to i64
  %473 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %472
  store i8 %469, i8* %473, align 1
  br label %474

474:                                              ; preds = %464
  %475 = load i32, i32* %10, align 4
  %476 = add i32 %475, -1
  store i32 %476, i32* %10, align 4
  %477 = icmp ne i32 %476, 0
  br i1 %477, label %464, label %478, !llvm.loop !87

478:                                              ; preds = %474
  br label %479

479:                                              ; preds = %478, %448
  %480 = load i32, i32* %13, align 4
  %481 = icmp eq i32 %480, 32768
  br i1 %481, label %482, label %484

482:                                              ; preds = %479
  %483 = load i32, i32* %13, align 4
  store i32 %483, i32* @outcnt, align 4
  call void @flush_window()
  store i32 0, i32* %13, align 4
  br label %484

484:                                              ; preds = %482, %479
  br label %485

485:                                              ; preds = %484
  %486 = load i32, i32* %11, align 4
  %487 = icmp ne i32 %486, 0
  br i1 %487, label %411, label %488, !llvm.loop !88

488:                                              ; preds = %485
  br label %489

489:                                              ; preds = %488, %175
  br label %32

490:                                              ; preds = %179
  %491 = load i32, i32* %13, align 4
  store i32 %491, i32* @outcnt, align 4
  %492 = load i64, i64* %17, align 8
  store i64 %492, i64* @bb, align 8
  %493 = load i32, i32* %18, align 4
  store i32 %493, i32* @bk, align 4
  store i32 0, i32* %5, align 4
  br label %494

494:                                              ; preds = %490, %277, %78
  %495 = load i32, i32* %5, align 4
  ret i32 %495
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @lzw(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* @msg_done, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i32 1, i32* %3, align 4
  br label %17

9:                                                ; preds = %2
  store i32 1, i32* @msg_done, align 4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.149, i64 0, i64 0))
  %12 = load i32, i32* %4, align 4
  %13 = load i32, i32* %5, align 4
  %14 = icmp ne i32 %12, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %9
  store i32 1, i32* @exit_code, align 4
  br label %16

16:                                               ; preds = %15, %9
  store i32 1, i32* %3, align 4
  br label %17

17:                                               ; preds = %16, %8
  %18 = load i32, i32* %3, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @ct_init(i16* %0, i32* %1) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i16* %0, i16** %3, align 8
  store i32* %1, i32** %4, align 8
  %10 = load i16*, i16** %3, align 8
  store i16* %10, i16** @file_type, align 8
  %11 = load i32*, i32** %4, align 8
  store i32* %11, i32** @file_method, align 8
  store i64 0, i64* @input_len, align 8
  store i64 0, i64* @compressed_len, align 8
  %12 = load i16, i16* getelementptr inbounds ([30 x %struct.ct_data], [30 x %struct.ct_data]* @static_dtree, i64 0, i64 0, i32 1, i32 0), align 2
  %13 = zext i16 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %2
  br label %205

16:                                               ; preds = %2
  store i32 0, i32* %7, align 4
  store i32 0, i32* %8, align 4
  br label %17

17:                                               ; preds = %44, %16
  %18 = load i32, i32* %8, align 4
  %19 = icmp slt i32 %18, 28
  br i1 %19, label %20, label %47

20:                                               ; preds = %17
  %21 = load i32, i32* %7, align 4
  %22 = load i32, i32* %8, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [29 x i32], [29 x i32]* @base_length, i64 0, i64 %23
  store i32 %21, i32* %24, align 4
  store i32 0, i32* %5, align 4
  br label %25

25:                                               ; preds = %40, %20
  %26 = load i32, i32* %5, align 4
  %27 = load i32, i32* %8, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [29 x i32], [29 x i32]* @extra_lbits, i64 0, i64 %28
  %30 = load i32, i32* %29, align 4
  %31 = shl i32 1, %30
  %32 = icmp slt i32 %26, %31
  br i1 %32, label %33, label %43

33:                                               ; preds = %25
  %34 = load i32, i32* %8, align 4
  %35 = trunc i32 %34 to i8
  %36 = load i32, i32* %7, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %7, align 4
  %38 = sext i32 %36 to i64
  %39 = getelementptr inbounds [256 x i8], [256 x i8]* @length_code, i64 0, i64 %38
  store i8 %35, i8* %39, align 1
  br label %40

40:                                               ; preds = %33
  %41 = load i32, i32* %5, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %5, align 4
  br label %25, !llvm.loop !89

43:                                               ; preds = %25
  br label %44

44:                                               ; preds = %43
  %45 = load i32, i32* %8, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %8, align 4
  br label %17, !llvm.loop !90

47:                                               ; preds = %17
  %48 = load i32, i32* %8, align 4
  %49 = trunc i32 %48 to i8
  %50 = load i32, i32* %7, align 4
  %51 = sub nsw i32 %50, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [256 x i8], [256 x i8]* @length_code, i64 0, i64 %52
  store i8 %49, i8* %53, align 1
  store i32 0, i32* %9, align 4
  store i32 0, i32* %8, align 4
  br label %54

54:                                               ; preds = %81, %47
  %55 = load i32, i32* %8, align 4
  %56 = icmp slt i32 %55, 16
  br i1 %56, label %57, label %84

57:                                               ; preds = %54
  %58 = load i32, i32* %9, align 4
  %59 = load i32, i32* %8, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [30 x i32], [30 x i32]* @base_dist, i64 0, i64 %60
  store i32 %58, i32* %61, align 4
  store i32 0, i32* %5, align 4
  br label %62

62:                                               ; preds = %77, %57
  %63 = load i32, i32* %5, align 4
  %64 = load i32, i32* %8, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [30 x i32], [30 x i32]* @extra_dbits, i64 0, i64 %65
  %67 = load i32, i32* %66, align 4
  %68 = shl i32 1, %67
  %69 = icmp slt i32 %63, %68
  br i1 %69, label %70, label %80

70:                                               ; preds = %62
  %71 = load i32, i32* %8, align 4
  %72 = trunc i32 %71 to i8
  %73 = load i32, i32* %9, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %9, align 4
  %75 = sext i32 %73 to i64
  %76 = getelementptr inbounds [512 x i8], [512 x i8]* @dist_code, i64 0, i64 %75
  store i8 %72, i8* %76, align 1
  br label %77

77:                                               ; preds = %70
  %78 = load i32, i32* %5, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %5, align 4
  br label %62, !llvm.loop !91

80:                                               ; preds = %62
  br label %81

81:                                               ; preds = %80
  %82 = load i32, i32* %8, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %8, align 4
  br label %54, !llvm.loop !92

84:                                               ; preds = %54
  %85 = load i32, i32* %9, align 4
  %86 = ashr i32 %85, 7
  store i32 %86, i32* %9, align 4
  br label %87

87:                                               ; preds = %117, %84
  %88 = load i32, i32* %8, align 4
  %89 = icmp slt i32 %88, 30
  br i1 %89, label %90, label %120

90:                                               ; preds = %87
  %91 = load i32, i32* %9, align 4
  %92 = shl i32 %91, 7
  %93 = load i32, i32* %8, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [30 x i32], [30 x i32]* @base_dist, i64 0, i64 %94
  store i32 %92, i32* %95, align 4
  store i32 0, i32* %5, align 4
  br label %96

96:                                               ; preds = %113, %90
  %97 = load i32, i32* %5, align 4
  %98 = load i32, i32* %8, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [30 x i32], [30 x i32]* @extra_dbits, i64 0, i64 %99
  %101 = load i32, i32* %100, align 4
  %102 = sub nsw i32 %101, 7
  %103 = shl i32 1, %102
  %104 = icmp slt i32 %97, %103
  br i1 %104, label %105, label %116

105:                                              ; preds = %96
  %106 = load i32, i32* %8, align 4
  %107 = trunc i32 %106 to i8
  %108 = load i32, i32* %9, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %9, align 4
  %110 = add nsw i32 256, %108
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [512 x i8], [512 x i8]* @dist_code, i64 0, i64 %111
  store i8 %107, i8* %112, align 1
  br label %113

113:                                              ; preds = %105
  %114 = load i32, i32* %5, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %5, align 4
  br label %96, !llvm.loop !93

116:                                              ; preds = %96
  br label %117

117:                                              ; preds = %116
  %118 = load i32, i32* %8, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %8, align 4
  br label %87, !llvm.loop !94

120:                                              ; preds = %87
  store i32 0, i32* %6, align 4
  br label %121

121:                                              ; preds = %128, %120
  %122 = load i32, i32* %6, align 4
  %123 = icmp sle i32 %122, 15
  br i1 %123, label %124, label %131

124:                                              ; preds = %121
  %125 = load i32, i32* %6, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [16 x i16], [16 x i16]* @bl_count, i64 0, i64 %126
  store i16 0, i16* %127, align 2
  br label %128

128:                                              ; preds = %124
  %129 = load i32, i32* %6, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, i32* %6, align 4
  br label %121, !llvm.loop !95

131:                                              ; preds = %121
  store i32 0, i32* %5, align 4
  br label %132

132:                                              ; preds = %135, %131
  %133 = load i32, i32* %5, align 4
  %134 = icmp sle i32 %133, 143
  br i1 %134, label %135, label %144

135:                                              ; preds = %132
  %136 = load i32, i32* %5, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %5, align 4
  %138 = sext i32 %136 to i64
  %139 = getelementptr inbounds [288 x %struct.ct_data], [288 x %struct.ct_data]* @static_ltree, i64 0, i64 %138
  %140 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %139, i32 0, i32 1
  %141 = bitcast %union.anon.5* %140 to i16*
  store i16 8, i16* %141, align 2
  %142 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @bl_count, i64 0, i64 8), align 16
  %143 = add i16 %142, 1
  store i16 %143, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @bl_count, i64 0, i64 8), align 16
  br label %132, !llvm.loop !96

144:                                              ; preds = %132
  br label %145

145:                                              ; preds = %148, %144
  %146 = load i32, i32* %5, align 4
  %147 = icmp sle i32 %146, 255
  br i1 %147, label %148, label %157

148:                                              ; preds = %145
  %149 = load i32, i32* %5, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %5, align 4
  %151 = sext i32 %149 to i64
  %152 = getelementptr inbounds [288 x %struct.ct_data], [288 x %struct.ct_data]* @static_ltree, i64 0, i64 %151
  %153 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %152, i32 0, i32 1
  %154 = bitcast %union.anon.5* %153 to i16*
  store i16 9, i16* %154, align 2
  %155 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @bl_count, i64 0, i64 9), align 2
  %156 = add i16 %155, 1
  store i16 %156, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @bl_count, i64 0, i64 9), align 2
  br label %145, !llvm.loop !97

157:                                              ; preds = %145
  br label %158

158:                                              ; preds = %161, %157
  %159 = load i32, i32* %5, align 4
  %160 = icmp sle i32 %159, 279
  br i1 %160, label %161, label %170

161:                                              ; preds = %158
  %162 = load i32, i32* %5, align 4
  %163 = add nsw i32 %162, 1
  store i32 %163, i32* %5, align 4
  %164 = sext i32 %162 to i64
  %165 = getelementptr inbounds [288 x %struct.ct_data], [288 x %struct.ct_data]* @static_ltree, i64 0, i64 %164
  %166 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %165, i32 0, i32 1
  %167 = bitcast %union.anon.5* %166 to i16*
  store i16 7, i16* %167, align 2
  %168 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @bl_count, i64 0, i64 7), align 2
  %169 = add i16 %168, 1
  store i16 %169, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @bl_count, i64 0, i64 7), align 2
  br label %158, !llvm.loop !98

170:                                              ; preds = %158
  br label %171

171:                                              ; preds = %174, %170
  %172 = load i32, i32* %5, align 4
  %173 = icmp sle i32 %172, 287
  br i1 %173, label %174, label %183

174:                                              ; preds = %171
  %175 = load i32, i32* %5, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, i32* %5, align 4
  %177 = sext i32 %175 to i64
  %178 = getelementptr inbounds [288 x %struct.ct_data], [288 x %struct.ct_data]* @static_ltree, i64 0, i64 %177
  %179 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %178, i32 0, i32 1
  %180 = bitcast %union.anon.5* %179 to i16*
  store i16 8, i16* %180, align 2
  %181 = load i16, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @bl_count, i64 0, i64 8), align 16
  %182 = add i16 %181, 1
  store i16 %182, i16* getelementptr inbounds ([16 x i16], [16 x i16]* @bl_count, i64 0, i64 8), align 16
  br label %171, !llvm.loop !99

183:                                              ; preds = %171
  call void @gen_codes(%struct.ct_data* getelementptr inbounds ([288 x %struct.ct_data], [288 x %struct.ct_data]* @static_ltree, i64 0, i64 0), i32 287)
  store i32 0, i32* %5, align 4
  br label %184

184:                                              ; preds = %201, %183
  %185 = load i32, i32* %5, align 4
  %186 = icmp slt i32 %185, 30
  br i1 %186, label %187, label %204

187:                                              ; preds = %184
  %188 = load i32, i32* %5, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [30 x %struct.ct_data], [30 x %struct.ct_data]* @static_dtree, i64 0, i64 %189
  %191 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %190, i32 0, i32 1
  %192 = bitcast %union.anon.5* %191 to i16*
  store i16 5, i16* %192, align 2
  %193 = load i32, i32* %5, align 4
  %194 = call i32 @bi_reverse(i32 %193, i32 5) #16
  %195 = trunc i32 %194 to i16
  %196 = load i32, i32* %5, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [30 x %struct.ct_data], [30 x %struct.ct_data]* @static_dtree, i64 0, i64 %197
  %199 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %198, i32 0, i32 0
  %200 = bitcast %union.anon.5* %199 to i16*
  store i16 %195, i16* %200, align 4
  br label %201

201:                                              ; preds = %187
  %202 = load i32, i32* %5, align 4
  %203 = add nsw i32 %202, 1
  store i32 %203, i32* %5, align 4
  br label %184, !llvm.loop !100

204:                                              ; preds = %184
  call void @init_block()
  br label %205

205:                                              ; preds = %204, %15
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @gen_codes(%struct.ct_data* %0, i32 %1) #0 {
  %3 = alloca %struct.ct_data*, align 8
  %4 = alloca i32, align 4
  %5 = alloca [16 x i16], align 16
  %6 = alloca i16, align 2
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.ct_data* %0, %struct.ct_data** %3, align 8
  store i32 %1, i32* %4, align 4
  store i16 0, i16* %6, align 2
  store i32 1, i32* %7, align 4
  br label %10

10:                                               ; preds = %28, %2
  %11 = load i32, i32* %7, align 4
  %12 = icmp sle i32 %11, 15
  br i1 %12, label %13, label %31

13:                                               ; preds = %10
  %14 = load i16, i16* %6, align 2
  %15 = zext i16 %14 to i32
  %16 = load i32, i32* %7, align 4
  %17 = sub nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [16 x i16], [16 x i16]* @bl_count, i64 0, i64 %18
  %20 = load i16, i16* %19, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %15, %21
  %23 = shl i32 %22, 1
  %24 = trunc i32 %23 to i16
  store i16 %24, i16* %6, align 2
  %25 = load i32, i32* %7, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [16 x i16], [16 x i16]* %5, i64 0, i64 %26
  store i16 %24, i16* %27, align 2
  br label %28

28:                                               ; preds = %13
  %29 = load i32, i32* %7, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %7, align 4
  br label %10, !llvm.loop !101

31:                                               ; preds = %10
  store i32 0, i32* %8, align 4
  br label %32

32:                                               ; preds = %64, %31
  %33 = load i32, i32* %8, align 4
  %34 = load i32, i32* %4, align 4
  %35 = icmp sle i32 %33, %34
  br i1 %35, label %36, label %67

36:                                               ; preds = %32
  %37 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %38 = load i32, i32* %8, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %37, i64 %39
  %41 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %40, i32 0, i32 1
  %42 = bitcast %union.anon.5* %41 to i16*
  %43 = load i16, i16* %42, align 2
  %44 = zext i16 %43 to i32
  store i32 %44, i32* %9, align 4
  %45 = load i32, i32* %9, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %48

47:                                               ; preds = %36
  br label %64

48:                                               ; preds = %36
  %49 = load i32, i32* %9, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [16 x i16], [16 x i16]* %5, i64 0, i64 %50
  %52 = load i16, i16* %51, align 2
  %53 = add i16 %52, 1
  store i16 %53, i16* %51, align 2
  %54 = zext i16 %52 to i32
  %55 = load i32, i32* %9, align 4
  %56 = call i32 @bi_reverse(i32 %54, i32 %55) #16
  %57 = trunc i32 %56 to i16
  %58 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %59 = load i32, i32* %8, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %58, i64 %60
  %62 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %61, i32 0, i32 0
  %63 = bitcast %union.anon.5* %62 to i16*
  store i16 %57, i16* %63, align 2
  br label %64

64:                                               ; preds = %48, %47
  %65 = load i32, i32* %8, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %8, align 4
  br label %32, !llvm.loop !102

67:                                               ; preds = %32
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @init_block() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %2

2:                                                ; preds = %11, %0
  %3 = load i32, i32* %1, align 4
  %4 = icmp slt i32 %3, 286
  br i1 %4, label %5, label %14

5:                                                ; preds = %2
  %6 = load i32, i32* %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [573 x %struct.ct_data], [573 x %struct.ct_data]* @dyn_ltree, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %8, i32 0, i32 0
  %10 = bitcast %union.anon.5* %9 to i16*
  store i16 0, i16* %10, align 4
  br label %11

11:                                               ; preds = %5
  %12 = load i32, i32* %1, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %1, align 4
  br label %2, !llvm.loop !103

14:                                               ; preds = %2
  store i32 0, i32* %1, align 4
  br label %15

15:                                               ; preds = %24, %14
  %16 = load i32, i32* %1, align 4
  %17 = icmp slt i32 %16, 30
  br i1 %17, label %18, label %27

18:                                               ; preds = %15
  %19 = load i32, i32* %1, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [61 x %struct.ct_data], [61 x %struct.ct_data]* @dyn_dtree, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %21, i32 0, i32 0
  %23 = bitcast %union.anon.5* %22 to i16*
  store i16 0, i16* %23, align 4
  br label %24

24:                                               ; preds = %18
  %25 = load i32, i32* %1, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %1, align 4
  br label %15, !llvm.loop !104

27:                                               ; preds = %15
  store i32 0, i32* %1, align 4
  br label %28

28:                                               ; preds = %37, %27
  %29 = load i32, i32* %1, align 4
  %30 = icmp slt i32 %29, 19
  br i1 %30, label %31, label %40

31:                                               ; preds = %28
  %32 = load i32, i32* %1, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 %33
  %35 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %34, i32 0, i32 0
  %36 = bitcast %union.anon.5* %35 to i16*
  store i16 0, i16* %36, align 4
  br label %37

37:                                               ; preds = %31
  %38 = load i32, i32* %1, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %1, align 4
  br label %28, !llvm.loop !105

40:                                               ; preds = %28
  store i16 1, i16* getelementptr inbounds ([573 x %struct.ct_data], [573 x %struct.ct_data]* @dyn_ltree, i64 0, i64 256, i32 0, i32 0), align 16
  store i64 0, i64* @static_len, align 8
  store i64 0, i64* @opt_len, align 8
  store i32 0, i32* @last_flags, align 4
  store i32 0, i32* @last_dist, align 4
  store i32 0, i32* @last_lit, align 4
  store i8 0, i8* @flags, align 1
  store i8 1, i8* @flag_bit, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @flush_block(i8* %0, i64 %1, i32 %2, i32 %3) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i64 %1, i64* %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %12 = load i8, i8* @flags, align 1
  %13 = load i32, i32* @last_flags, align 4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds [4096 x i8], [4096 x i8]* @flag_buf, i64 0, i64 %14
  store i8 %12, i8* %15, align 1
  %16 = load i16*, i16** @file_type, align 8
  %17 = load i16, i16* %16, align 2
  %18 = zext i16 %17 to i32
  %19 = icmp eq i32 %18, 65535
  br i1 %19, label %20, label %21

20:                                               ; preds = %4
  call void @set_file_type()
  br label %21

21:                                               ; preds = %20, %4
  call void @build_tree(%struct.tree_desc* @l_desc)
  call void @build_tree(%struct.tree_desc* @d_desc)
  %22 = call i32 @build_bl_tree()
  store i32 %22, i32* %11, align 4
  %23 = load i64, i64* @opt_len, align 8
  %24 = add i64 %23, 3
  %25 = add i64 %24, 7
  %26 = lshr i64 %25, 3
  store i64 %26, i64* %9, align 8
  %27 = load i64, i64* @static_len, align 8
  %28 = add i64 %27, 3
  %29 = add i64 %28, 7
  %30 = lshr i64 %29, 3
  store i64 %30, i64* %10, align 8
  %31 = load i64, i64* %6, align 8
  %32 = load i64, i64* @input_len, align 8
  %33 = add i64 %32, %31
  store i64 %33, i64* @input_len, align 8
  %34 = load i64, i64* %10, align 8
  %35 = load i64, i64* %9, align 8
  %36 = icmp ule i64 %34, %35
  br i1 %36, label %37, label %39

37:                                               ; preds = %21
  %38 = load i64, i64* %10, align 8
  store i64 %38, i64* %9, align 8
  br label %39

39:                                               ; preds = %37, %21
  %40 = load i64, i64* %6, align 8
  %41 = load i64, i64* %9, align 8
  %42 = icmp ule i64 %40, %41
  br i1 %42, label %43, label %61

43:                                               ; preds = %39
  %44 = load i32, i32* %8, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %61

46:                                               ; preds = %43
  %47 = load i64, i64* @compressed_len, align 8
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %49, label %61

49:                                               ; preds = %46
  br i1 false, label %50, label %61

50:                                               ; preds = %49
  %51 = load i8*, i8** %5, align 8
  %52 = icmp ne i8* %51, null
  br i1 %52, label %54, label %53

53:                                               ; preds = %50
  call void @gzip_error(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.152, i64 0, i64 0)) #13
  unreachable

54:                                               ; preds = %50
  %55 = load i8*, i8** %5, align 8
  %56 = load i64, i64* %6, align 8
  %57 = trunc i64 %56 to i32
  call void @copy_block(i8* %55, i32 %57, i32 0)
  %58 = load i64, i64* %6, align 8
  %59 = shl i64 %58, 3
  store i64 %59, i64* @compressed_len, align 8
  %60 = load i32*, i32** @file_method, align 8
  store i32 0, i32* %60, align 4
  br label %110

61:                                               ; preds = %49, %46, %43, %39
  %62 = load i64, i64* %6, align 8
  %63 = add i64 %62, 4
  %64 = load i64, i64* %9, align 8
  %65 = icmp ule i64 %63, %64
  br i1 %65, label %66, label %84

66:                                               ; preds = %61
  %67 = load i8*, i8** %5, align 8
  %68 = icmp ne i8* %67, null
  br i1 %68, label %69, label %84

69:                                               ; preds = %66
  %70 = load i32, i32* %8, align 4
  %71 = add nsw i32 0, %70
  call void @send_bits(i32 %71, i32 3)
  %72 = load i64, i64* @compressed_len, align 8
  %73 = add nsw i64 %72, 3
  %74 = add nsw i64 %73, 7
  %75 = and i64 %74, -8
  store i64 %75, i64* @compressed_len, align 8
  %76 = load i64, i64* %6, align 8
  %77 = add i64 %76, 4
  %78 = shl i64 %77, 3
  %79 = load i64, i64* @compressed_len, align 8
  %80 = add i64 %79, %78
  store i64 %80, i64* @compressed_len, align 8
  %81 = load i8*, i8** %5, align 8
  %82 = load i64, i64* %6, align 8
  %83 = trunc i64 %82 to i32
  call void @copy_block(i8* %81, i32 %83, i32 1)
  br label %109

84:                                               ; preds = %66, %61
  %85 = load i64, i64* %10, align 8
  %86 = load i64, i64* %9, align 8
  %87 = icmp eq i64 %85, %86
  br i1 %87, label %88, label %95

88:                                               ; preds = %84
  %89 = load i32, i32* %8, align 4
  %90 = add nsw i32 2, %89
  call void @send_bits(i32 %90, i32 3)
  call void @compress_block(%struct.ct_data* getelementptr inbounds ([288 x %struct.ct_data], [288 x %struct.ct_data]* @static_ltree, i64 0, i64 0), %struct.ct_data* getelementptr inbounds ([30 x %struct.ct_data], [30 x %struct.ct_data]* @static_dtree, i64 0, i64 0))
  %91 = load i64, i64* @static_len, align 8
  %92 = add i64 3, %91
  %93 = load i64, i64* @compressed_len, align 8
  %94 = add i64 %93, %92
  store i64 %94, i64* @compressed_len, align 8
  br label %108

95:                                               ; preds = %84
  %96 = load i32, i32* %8, align 4
  %97 = add nsw i32 4, %96
  call void @send_bits(i32 %97, i32 3)
  %98 = load i32, i32* getelementptr inbounds (%struct.tree_desc, %struct.tree_desc* @l_desc, i32 0, i32 6), align 4
  %99 = add nsw i32 %98, 1
  %100 = load i32, i32* getelementptr inbounds (%struct.tree_desc, %struct.tree_desc* @d_desc, i32 0, i32 6), align 4
  %101 = add nsw i32 %100, 1
  %102 = load i32, i32* %11, align 4
  %103 = add nsw i32 %102, 1
  call void @send_all_trees(i32 %99, i32 %101, i32 %103)
  call void @compress_block(%struct.ct_data* getelementptr inbounds ([573 x %struct.ct_data], [573 x %struct.ct_data]* @dyn_ltree, i64 0, i64 0), %struct.ct_data* getelementptr inbounds ([61 x %struct.ct_data], [61 x %struct.ct_data]* @dyn_dtree, i64 0, i64 0))
  %104 = load i64, i64* @opt_len, align 8
  %105 = add i64 3, %104
  %106 = load i64, i64* @compressed_len, align 8
  %107 = add i64 %106, %105
  store i64 %107, i64* @compressed_len, align 8
  br label %108

108:                                              ; preds = %95, %88
  br label %109

109:                                              ; preds = %108, %69
  br label %110

110:                                              ; preds = %109, %54
  call void @init_block()
  %111 = load i32, i32* %8, align 4
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %116

113:                                              ; preds = %110
  call void @bi_windup()
  %114 = load i64, i64* @compressed_len, align 8
  %115 = add nsw i64 %114, 7
  store i64 %115, i64* @compressed_len, align 8
  br label %132

116:                                              ; preds = %110
  %117 = load i32, i32* %7, align 4
  %118 = icmp ne i32 %117, 0
  br i1 %118, label %119, label %131

119:                                              ; preds = %116
  %120 = load i64, i64* @compressed_len, align 8
  %121 = srem i64 %120, 8
  %122 = icmp ne i64 %121, 0
  br i1 %122, label %123, label %131

123:                                              ; preds = %119
  %124 = load i32, i32* %8, align 4
  %125 = add nsw i32 0, %124
  call void @send_bits(i32 %125, i32 3)
  %126 = load i64, i64* @compressed_len, align 8
  %127 = add nsw i64 %126, 3
  %128 = add nsw i64 %127, 7
  %129 = and i64 %128, -8
  store i64 %129, i64* @compressed_len, align 8
  %130 = load i8*, i8** %5, align 8
  call void @copy_block(i8* %130, i32 0, i32 1)
  br label %131

131:                                              ; preds = %123, %119, %116
  br label %132

132:                                              ; preds = %131, %113
  %133 = load i64, i64* @compressed_len, align 8
  %134 = ashr i64 %133, 3
  ret i64 %134
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @set_file_type() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  br label %4

4:                                                ; preds = %7, %0
  %5 = load i32, i32* %1, align 4
  %6 = icmp slt i32 %5, 7
  br i1 %6, label %7, label %18

7:                                                ; preds = %4
  %8 = load i32, i32* %1, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %1, align 4
  %10 = sext i32 %8 to i64
  %11 = getelementptr inbounds [573 x %struct.ct_data], [573 x %struct.ct_data]* @dyn_ltree, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %11, i32 0, i32 0
  %13 = bitcast %union.anon.5* %12 to i16*
  %14 = load i16, i16* %13, align 4
  %15 = zext i16 %14 to i32
  %16 = load i32, i32* %3, align 4
  %17 = add i32 %16, %15
  store i32 %17, i32* %3, align 4
  br label %4, !llvm.loop !106

18:                                               ; preds = %4
  br label %19

19:                                               ; preds = %22, %18
  %20 = load i32, i32* %1, align 4
  %21 = icmp slt i32 %20, 128
  br i1 %21, label %22, label %33

22:                                               ; preds = %19
  %23 = load i32, i32* %1, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %1, align 4
  %25 = sext i32 %23 to i64
  %26 = getelementptr inbounds [573 x %struct.ct_data], [573 x %struct.ct_data]* @dyn_ltree, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %26, i32 0, i32 0
  %28 = bitcast %union.anon.5* %27 to i16*
  %29 = load i16, i16* %28, align 4
  %30 = zext i16 %29 to i32
  %31 = load i32, i32* %2, align 4
  %32 = add i32 %31, %30
  store i32 %32, i32* %2, align 4
  br label %19, !llvm.loop !107

33:                                               ; preds = %19
  br label %34

34:                                               ; preds = %37, %33
  %35 = load i32, i32* %1, align 4
  %36 = icmp slt i32 %35, 256
  br i1 %36, label %37, label %48

37:                                               ; preds = %34
  %38 = load i32, i32* %1, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %1, align 4
  %40 = sext i32 %38 to i64
  %41 = getelementptr inbounds [573 x %struct.ct_data], [573 x %struct.ct_data]* @dyn_ltree, i64 0, i64 %40
  %42 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %41, i32 0, i32 0
  %43 = bitcast %union.anon.5* %42 to i16*
  %44 = load i16, i16* %43, align 4
  %45 = zext i16 %44 to i32
  %46 = load i32, i32* %3, align 4
  %47 = add i32 %46, %45
  store i32 %47, i32* %3, align 4
  br label %34, !llvm.loop !108

48:                                               ; preds = %34
  %49 = load i32, i32* %3, align 4
  %50 = load i32, i32* %2, align 4
  %51 = lshr i32 %50, 2
  %52 = icmp ugt i32 %49, %51
  %53 = zext i1 %52 to i64
  %54 = select i1 %52, i32 0, i32 1
  %55 = trunc i32 %54 to i16
  %56 = load i16*, i16** @file_type, align 8
  store i16 %55, i16* %56, align 2
  %57 = load i16*, i16** @file_type, align 8
  %58 = load i16, i16* %57, align 2
  %59 = zext i16 %58 to i32
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %63

61:                                               ; preds = %48
  br i1 false, label %62, label %63

62:                                               ; preds = %61
  call void @warning(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1.153, i64 0, i64 0))
  br label %63

63:                                               ; preds = %62, %61, %48
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @build_tree(%struct.tree_desc* %0) #0 {
  %2 = alloca %struct.tree_desc*, align 8
  %3 = alloca %struct.ct_data*, align 8
  %4 = alloca %struct.ct_data*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.tree_desc* %0, %struct.tree_desc** %2, align 8
  %11 = load %struct.tree_desc*, %struct.tree_desc** %2, align 8
  %12 = getelementptr inbounds %struct.tree_desc, %struct.tree_desc* %11, i32 0, i32 0
  %13 = load %struct.ct_data*, %struct.ct_data** %12, align 8
  store %struct.ct_data* %13, %struct.ct_data** %3, align 8
  %14 = load %struct.tree_desc*, %struct.tree_desc** %2, align 8
  %15 = getelementptr inbounds %struct.tree_desc, %struct.tree_desc* %14, i32 0, i32 1
  %16 = load %struct.ct_data*, %struct.ct_data** %15, align 8
  store %struct.ct_data* %16, %struct.ct_data** %4, align 8
  %17 = load %struct.tree_desc*, %struct.tree_desc** %2, align 8
  %18 = getelementptr inbounds %struct.tree_desc, %struct.tree_desc* %17, i32 0, i32 4
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %5, align 4
  store i32 -1, i32* %8, align 4
  %20 = load i32, i32* %5, align 4
  store i32 %20, i32* %9, align 4
  store i32 0, i32* @heap_len, align 4
  store i32 573, i32* @heap_max, align 4
  store i32 0, i32* %6, align 4
  br label %21

21:                                               ; preds = %52, %1
  %22 = load i32, i32* %6, align 4
  %23 = load i32, i32* %5, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %55

25:                                               ; preds = %21
  %26 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %27 = load i32, i32* %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %26, i64 %28
  %30 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %29, i32 0, i32 0
  %31 = bitcast %union.anon.5* %30 to i16*
  %32 = load i16, i16* %31, align 2
  %33 = zext i16 %32 to i32
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %44

35:                                               ; preds = %25
  %36 = load i32, i32* %6, align 4
  store i32 %36, i32* %8, align 4
  %37 = load i32, i32* @heap_len, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* @heap_len, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %39
  store i32 %36, i32* %40, align 4
  %41 = load i32, i32* %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [573 x i8], [573 x i8]* @depth, i64 0, i64 %42
  store i8 0, i8* %43, align 1
  br label %51

44:                                               ; preds = %25
  %45 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %46 = load i32, i32* %6, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %45, i64 %47
  %49 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %48, i32 0, i32 1
  %50 = bitcast %union.anon.5* %49 to i16*
  store i16 0, i16* %50, align 2
  br label %51

51:                                               ; preds = %44, %35
  br label %52

52:                                               ; preds = %51
  %53 = load i32, i32* %6, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %6, align 4
  br label %21, !llvm.loop !109

55:                                               ; preds = %21
  br label %56

56:                                               ; preds = %96, %55
  %57 = load i32, i32* @heap_len, align 4
  %58 = icmp slt i32 %57, 2
  br i1 %58, label %59, label %97

59:                                               ; preds = %56
  %60 = load i32, i32* %8, align 4
  %61 = icmp slt i32 %60, 2
  br i1 %61, label %62, label %65

62:                                               ; preds = %59
  %63 = load i32, i32* %8, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %8, align 4
  br label %66

65:                                               ; preds = %59
  br label %66

66:                                               ; preds = %65, %62
  %67 = phi i32 [ %64, %62 ], [ 0, %65 ]
  %68 = load i32, i32* @heap_len, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* @heap_len, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %70
  store i32 %67, i32* %71, align 4
  store i32 %67, i32* %10, align 4
  %72 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %73 = load i32, i32* %10, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %72, i64 %74
  %76 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %75, i32 0, i32 0
  %77 = bitcast %union.anon.5* %76 to i16*
  store i16 1, i16* %77, align 2
  %78 = load i32, i32* %10, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [573 x i8], [573 x i8]* @depth, i64 0, i64 %79
  store i8 0, i8* %80, align 1
  %81 = load i64, i64* @opt_len, align 8
  %82 = add i64 %81, -1
  store i64 %82, i64* @opt_len, align 8
  %83 = load %struct.ct_data*, %struct.ct_data** %4, align 8
  %84 = icmp ne %struct.ct_data* %83, null
  br i1 %84, label %85, label %96

85:                                               ; preds = %66
  %86 = load %struct.ct_data*, %struct.ct_data** %4, align 8
  %87 = load i32, i32* %10, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %86, i64 %88
  %90 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %89, i32 0, i32 1
  %91 = bitcast %union.anon.5* %90 to i16*
  %92 = load i16, i16* %91, align 2
  %93 = zext i16 %92 to i64
  %94 = load i64, i64* @static_len, align 8
  %95 = sub i64 %94, %93
  store i64 %95, i64* @static_len, align 8
  br label %96

96:                                               ; preds = %85, %66
  br label %56, !llvm.loop !110

97:                                               ; preds = %56
  %98 = load i32, i32* %8, align 4
  %99 = load %struct.tree_desc*, %struct.tree_desc** %2, align 8
  %100 = getelementptr inbounds %struct.tree_desc, %struct.tree_desc* %99, i32 0, i32 6
  store i32 %98, i32* %100, align 4
  %101 = load i32, i32* @heap_len, align 4
  %102 = sdiv i32 %101, 2
  store i32 %102, i32* %6, align 4
  br label %103

103:                                              ; preds = %109, %97
  %104 = load i32, i32* %6, align 4
  %105 = icmp sge i32 %104, 1
  br i1 %105, label %106, label %112

106:                                              ; preds = %103
  %107 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %108 = load i32, i32* %6, align 4
  call void @pqdownheap(%struct.ct_data* %107, i32 %108)
  br label %109

109:                                              ; preds = %106
  %110 = load i32, i32* %6, align 4
  %111 = add nsw i32 %110, -1
  store i32 %111, i32* %6, align 4
  br label %103, !llvm.loop !111

112:                                              ; preds = %103
  br label %113

113:                                              ; preds = %203, %112
  %114 = load i32, i32* getelementptr inbounds ([573 x i32], [573 x i32]* @heap, i64 0, i64 1), align 4
  store i32 %114, i32* %6, align 4
  %115 = load i32, i32* @heap_len, align 4
  %116 = add nsw i32 %115, -1
  store i32 %116, i32* @heap_len, align 4
  %117 = sext i32 %115 to i64
  %118 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %117
  %119 = load i32, i32* %118, align 4
  store i32 %119, i32* getelementptr inbounds ([573 x i32], [573 x i32]* @heap, i64 0, i64 1), align 4
  %120 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  call void @pqdownheap(%struct.ct_data* %120, i32 1)
  %121 = load i32, i32* getelementptr inbounds ([573 x i32], [573 x i32]* @heap, i64 0, i64 1), align 4
  store i32 %121, i32* %7, align 4
  %122 = load i32, i32* %6, align 4
  %123 = load i32, i32* @heap_max, align 4
  %124 = add nsw i32 %123, -1
  store i32 %124, i32* @heap_max, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %125
  store i32 %122, i32* %126, align 4
  %127 = load i32, i32* %7, align 4
  %128 = load i32, i32* @heap_max, align 4
  %129 = add nsw i32 %128, -1
  store i32 %129, i32* @heap_max, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %130
  store i32 %127, i32* %131, align 4
  %132 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %133 = load i32, i32* %6, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %132, i64 %134
  %136 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %135, i32 0, i32 0
  %137 = bitcast %union.anon.5* %136 to i16*
  %138 = load i16, i16* %137, align 2
  %139 = zext i16 %138 to i32
  %140 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %141 = load i32, i32* %7, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %140, i64 %142
  %144 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %143, i32 0, i32 0
  %145 = bitcast %union.anon.5* %144 to i16*
  %146 = load i16, i16* %145, align 2
  %147 = zext i16 %146 to i32
  %148 = add nsw i32 %139, %147
  %149 = trunc i32 %148 to i16
  %150 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %151 = load i32, i32* %9, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %150, i64 %152
  %154 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %153, i32 0, i32 0
  %155 = bitcast %union.anon.5* %154 to i16*
  store i16 %149, i16* %155, align 2
  %156 = load i32, i32* %6, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [573 x i8], [573 x i8]* @depth, i64 0, i64 %157
  %159 = load i8, i8* %158, align 1
  %160 = zext i8 %159 to i32
  %161 = load i32, i32* %7, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [573 x i8], [573 x i8]* @depth, i64 0, i64 %162
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  %166 = icmp sge i32 %160, %165
  br i1 %166, label %167, label %173

167:                                              ; preds = %113
  %168 = load i32, i32* %6, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [573 x i8], [573 x i8]* @depth, i64 0, i64 %169
  %171 = load i8, i8* %170, align 1
  %172 = zext i8 %171 to i32
  br label %179

173:                                              ; preds = %113
  %174 = load i32, i32* %7, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [573 x i8], [573 x i8]* @depth, i64 0, i64 %175
  %177 = load i8, i8* %176, align 1
  %178 = zext i8 %177 to i32
  br label %179

179:                                              ; preds = %173, %167
  %180 = phi i32 [ %172, %167 ], [ %178, %173 ]
  %181 = add nsw i32 %180, 1
  %182 = trunc i32 %181 to i8
  %183 = load i32, i32* %9, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [573 x i8], [573 x i8]* @depth, i64 0, i64 %184
  store i8 %182, i8* %185, align 1
  %186 = load i32, i32* %9, align 4
  %187 = trunc i32 %186 to i16
  %188 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %189 = load i32, i32* %7, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %188, i64 %190
  %192 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %191, i32 0, i32 1
  %193 = bitcast %union.anon.5* %192 to i16*
  store i16 %187, i16* %193, align 2
  %194 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %195 = load i32, i32* %6, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %194, i64 %196
  %198 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %197, i32 0, i32 1
  %199 = bitcast %union.anon.5* %198 to i16*
  store i16 %187, i16* %199, align 2
  %200 = load i32, i32* %9, align 4
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* %9, align 4
  store i32 %200, i32* getelementptr inbounds ([573 x i32], [573 x i32]* @heap, i64 0, i64 1), align 4
  %202 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  call void @pqdownheap(%struct.ct_data* %202, i32 1)
  br label %203

203:                                              ; preds = %179
  %204 = load i32, i32* @heap_len, align 4
  %205 = icmp sge i32 %204, 2
  br i1 %205, label %113, label %206, !llvm.loop !112

206:                                              ; preds = %203
  %207 = load i32, i32* getelementptr inbounds ([573 x i32], [573 x i32]* @heap, i64 0, i64 1), align 4
  %208 = load i32, i32* @heap_max, align 4
  %209 = add nsw i32 %208, -1
  store i32 %209, i32* @heap_max, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %210
  store i32 %207, i32* %211, align 4
  %212 = load %struct.tree_desc*, %struct.tree_desc** %2, align 8
  call void @gen_bitlen(%struct.tree_desc* %212)
  %213 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %214 = load i32, i32* %8, align 4
  call void @gen_codes(%struct.ct_data* %213, i32 %214)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @build_bl_tree() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.tree_desc, %struct.tree_desc* @l_desc, i32 0, i32 6), align 4
  call void @scan_tree(%struct.ct_data* getelementptr inbounds ([573 x %struct.ct_data], [573 x %struct.ct_data]* @dyn_ltree, i64 0, i64 0), i32 %2)
  %3 = load i32, i32* getelementptr inbounds (%struct.tree_desc, %struct.tree_desc* @d_desc, i32 0, i32 6), align 4
  call void @scan_tree(%struct.ct_data* getelementptr inbounds ([61 x %struct.ct_data], [61 x %struct.ct_data]* @dyn_dtree, i64 0, i64 0), i32 %3)
  call void @build_tree(%struct.tree_desc* @bl_desc)
  store i32 18, i32* %1, align 4
  br label %4

4:                                                ; preds = %21, %0
  %5 = load i32, i32* %1, align 4
  %6 = icmp sge i32 %5, 3
  br i1 %6, label %7, label %24

7:                                                ; preds = %4
  %8 = load i32, i32* %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [19 x i8], [19 x i8]* @bl_order, i64 0, i64 %9
  %11 = load i8, i8* %10, align 1
  %12 = zext i8 %11 to i64
  %13 = getelementptr inbounds [39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %13, i32 0, i32 1
  %15 = bitcast %union.anon.5* %14 to i16*
  %16 = load i16, i16* %15, align 2
  %17 = zext i16 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %7
  br label %24

20:                                               ; preds = %7
  br label %21

21:                                               ; preds = %20
  %22 = load i32, i32* %1, align 4
  %23 = add nsw i32 %22, -1
  store i32 %23, i32* %1, align 4
  br label %4, !llvm.loop !113

24:                                               ; preds = %19, %4
  %25 = load i32, i32* %1, align 4
  %26 = add nsw i32 %25, 1
  %27 = mul nsw i32 3, %26
  %28 = add nsw i32 %27, 5
  %29 = add nsw i32 %28, 5
  %30 = add nsw i32 %29, 4
  %31 = sext i32 %30 to i64
  %32 = load i64, i64* @opt_len, align 8
  %33 = add i64 %32, %31
  store i64 %33, i64* @opt_len, align 8
  %34 = load i32, i32* %1, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @compress_block(%struct.ct_data* %0, %struct.ct_data* %1) #0 {
  %3 = alloca %struct.ct_data*, align 8
  %4 = alloca %struct.ct_data*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.ct_data* %0, %struct.ct_data** %3, align 8
  store %struct.ct_data* %1, %struct.ct_data** %4, align 8
  store i32 0, i32* %7, align 4
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  store i8 0, i8* %10, align 1
  %13 = load i32, i32* @last_lit, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %162

15:                                               ; preds = %2
  br label %16

16:                                               ; preds = %157, %15
  %17 = load i32, i32* %7, align 4
  %18 = and i32 %17, 7
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %26

20:                                               ; preds = %16
  %21 = load i32, i32* %9, align 4
  %22 = add i32 %21, 1
  store i32 %22, i32* %9, align 4
  %23 = zext i32 %21 to i64
  %24 = getelementptr inbounds [4096 x i8], [4096 x i8]* @flag_buf, i64 0, i64 %23
  %25 = load i8, i8* %24, align 1
  store i8 %25, i8* %10, align 1
  br label %26

26:                                               ; preds = %20, %16
  %27 = load i32, i32* %7, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %7, align 4
  %29 = zext i32 %27 to i64
  %30 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %29
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i32
  store i32 %32, i32* %6, align 4
  %33 = load i8, i8* %10, align 1
  %34 = zext i8 %33 to i32
  %35 = and i32 %34, 1
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %54

37:                                               ; preds = %26
  %38 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %39 = load i32, i32* %6, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %38, i64 %40
  %42 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %41, i32 0, i32 0
  %43 = bitcast %union.anon.5* %42 to i16*
  %44 = load i16, i16* %43, align 2
  %45 = zext i16 %44 to i32
  %46 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %47 = load i32, i32* %6, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %46, i64 %48
  %50 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %49, i32 0, i32 1
  %51 = bitcast %union.anon.5* %50 to i16*
  %52 = load i16, i16* %51, align 2
  %53 = zext i16 %52 to i32
  call void @send_bits(i32 %45, i32 %53)
  br label %152

54:                                               ; preds = %26
  %55 = load i32, i32* %6, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [256 x i8], [256 x i8]* @length_code, i64 0, i64 %56
  %58 = load i8, i8* %57, align 1
  %59 = zext i8 %58 to i32
  store i32 %59, i32* %11, align 4
  %60 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %61 = load i32, i32* %11, align 4
  %62 = add i32 %61, 256
  %63 = add i32 %62, 1
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %60, i64 %64
  %66 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %65, i32 0, i32 0
  %67 = bitcast %union.anon.5* %66 to i16*
  %68 = load i16, i16* %67, align 2
  %69 = zext i16 %68 to i32
  %70 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %71 = load i32, i32* %11, align 4
  %72 = add i32 %71, 256
  %73 = add i32 %72, 1
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %70, i64 %74
  %76 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %75, i32 0, i32 1
  %77 = bitcast %union.anon.5* %76 to i16*
  %78 = load i16, i16* %77, align 2
  %79 = zext i16 %78 to i32
  call void @send_bits(i32 %69, i32 %79)
  %80 = load i32, i32* %11, align 4
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds [29 x i32], [29 x i32]* @extra_lbits, i64 0, i64 %81
  %83 = load i32, i32* %82, align 4
  store i32 %83, i32* %12, align 4
  %84 = load i32, i32* %12, align 4
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %86, label %95

86:                                               ; preds = %54
  %87 = load i32, i32* %11, align 4
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds [29 x i32], [29 x i32]* @base_length, i64 0, i64 %88
  %90 = load i32, i32* %89, align 4
  %91 = load i32, i32* %6, align 4
  %92 = sub nsw i32 %91, %90
  store i32 %92, i32* %6, align 4
  %93 = load i32, i32* %6, align 4
  %94 = load i32, i32* %12, align 4
  call void @send_bits(i32 %93, i32 %94)
  br label %95

95:                                               ; preds = %86, %54
  %96 = load i32, i32* %8, align 4
  %97 = add i32 %96, 1
  store i32 %97, i32* %8, align 4
  %98 = zext i32 %96 to i64
  %99 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([32768 x i16]* @d_buf to [0 x i16]*), i64 0, i64 %98
  %100 = load i16, i16* %99, align 2
  %101 = zext i16 %100 to i32
  store i32 %101, i32* %5, align 4
  %102 = load i32, i32* %5, align 4
  %103 = icmp ult i32 %102, 256
  br i1 %103, label %104, label %110

104:                                              ; preds = %95
  %105 = load i32, i32* %5, align 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds [512 x i8], [512 x i8]* @dist_code, i64 0, i64 %106
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  br label %118

110:                                              ; preds = %95
  %111 = load i32, i32* %5, align 4
  %112 = lshr i32 %111, 7
  %113 = add i32 256, %112
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds [512 x i8], [512 x i8]* @dist_code, i64 0, i64 %114
  %116 = load i8, i8* %115, align 1
  %117 = zext i8 %116 to i32
  br label %118

118:                                              ; preds = %110, %104
  %119 = phi i32 [ %109, %104 ], [ %117, %110 ]
  store i32 %119, i32* %11, align 4
  %120 = load %struct.ct_data*, %struct.ct_data** %4, align 8
  %121 = load i32, i32* %11, align 4
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %120, i64 %122
  %124 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %123, i32 0, i32 0
  %125 = bitcast %union.anon.5* %124 to i16*
  %126 = load i16, i16* %125, align 2
  %127 = zext i16 %126 to i32
  %128 = load %struct.ct_data*, %struct.ct_data** %4, align 8
  %129 = load i32, i32* %11, align 4
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %128, i64 %130
  %132 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %131, i32 0, i32 1
  %133 = bitcast %union.anon.5* %132 to i16*
  %134 = load i16, i16* %133, align 2
  %135 = zext i16 %134 to i32
  call void @send_bits(i32 %127, i32 %135)
  %136 = load i32, i32* %11, align 4
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds [30 x i32], [30 x i32]* @extra_dbits, i64 0, i64 %137
  %139 = load i32, i32* %138, align 4
  store i32 %139, i32* %12, align 4
  %140 = load i32, i32* %12, align 4
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %151

142:                                              ; preds = %118
  %143 = load i32, i32* %11, align 4
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds [30 x i32], [30 x i32]* @base_dist, i64 0, i64 %144
  %146 = load i32, i32* %145, align 4
  %147 = load i32, i32* %5, align 4
  %148 = sub i32 %147, %146
  store i32 %148, i32* %5, align 4
  %149 = load i32, i32* %5, align 4
  %150 = load i32, i32* %12, align 4
  call void @send_bits(i32 %149, i32 %150)
  br label %151

151:                                              ; preds = %142, %118
  br label %152

152:                                              ; preds = %151, %37
  %153 = load i8, i8* %10, align 1
  %154 = zext i8 %153 to i32
  %155 = ashr i32 %154, 1
  %156 = trunc i32 %155 to i8
  store i8 %156, i8* %10, align 1
  br label %157

157:                                              ; preds = %152
  %158 = load i32, i32* %7, align 4
  %159 = load i32, i32* @last_lit, align 4
  %160 = icmp ult i32 %158, %159
  br i1 %160, label %16, label %161, !llvm.loop !114

161:                                              ; preds = %157
  br label %162

162:                                              ; preds = %161, %2
  %163 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %164 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %163, i64 256
  %165 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %164, i32 0, i32 0
  %166 = bitcast %union.anon.5* %165 to i16*
  %167 = load i16, i16* %166, align 2
  %168 = zext i16 %167 to i32
  %169 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %170 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %169, i64 256
  %171 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %170, i32 0, i32 1
  %172 = bitcast %union.anon.5* %171 to i16*
  %173 = load i16, i16* %172, align 2
  %174 = zext i16 %173 to i32
  call void @send_bits(i32 %168, i32 %174)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @send_all_trees(i32 %0, i32 %1, i32 %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %8 = load i32, i32* %4, align 4
  %9 = sub nsw i32 %8, 257
  call void @send_bits(i32 %9, i32 5)
  %10 = load i32, i32* %5, align 4
  %11 = sub nsw i32 %10, 1
  call void @send_bits(i32 %11, i32 5)
  %12 = load i32, i32* %6, align 4
  %13 = sub nsw i32 %12, 4
  call void @send_bits(i32 %13, i32 4)
  store i32 0, i32* %7, align 4
  br label %14

14:                                               ; preds = %29, %3
  %15 = load i32, i32* %7, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %32

18:                                               ; preds = %14
  %19 = load i32, i32* %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [19 x i8], [19 x i8]* @bl_order, i64 0, i64 %20
  %22 = load i8, i8* %21, align 1
  %23 = zext i8 %22 to i64
  %24 = getelementptr inbounds [39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %24, i32 0, i32 1
  %26 = bitcast %union.anon.5* %25 to i16*
  %27 = load i16, i16* %26, align 2
  %28 = zext i16 %27 to i32
  call void @send_bits(i32 %28, i32 3)
  br label %29

29:                                               ; preds = %18
  %30 = load i32, i32* %7, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %7, align 4
  br label %14, !llvm.loop !115

32:                                               ; preds = %14
  %33 = load i32, i32* %4, align 4
  %34 = sub nsw i32 %33, 1
  call void @send_tree(%struct.ct_data* getelementptr inbounds ([573 x %struct.ct_data], [573 x %struct.ct_data]* @dyn_ltree, i64 0, i64 0), i32 %34)
  %35 = load i32, i32* %5, align 4
  %36 = sub nsw i32 %35, 1
  call void @send_tree(%struct.ct_data* getelementptr inbounds ([61 x %struct.ct_data], [61 x %struct.ct_data]* @dyn_dtree, i64 0, i64 0), i32 %36)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @send_tree(%struct.ct_data* %0, i32 %1) #0 {
  %3 = alloca %struct.ct_data*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.ct_data* %0, %struct.ct_data** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 -1, i32* %6, align 4
  %12 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %13 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %12, i64 0
  %14 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %13, i32 0, i32 1
  %15 = bitcast %union.anon.5* %14 to i16*
  %16 = load i16, i16* %15, align 2
  %17 = zext i16 %16 to i32
  store i32 %17, i32* %8, align 4
  store i32 0, i32* %9, align 4
  store i32 7, i32* %10, align 4
  store i32 4, i32* %11, align 4
  %18 = load i32, i32* %8, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %2
  store i32 138, i32* %10, align 4
  store i32 3, i32* %11, align 4
  br label %21

21:                                               ; preds = %20, %2
  store i32 0, i32* %5, align 4
  br label %22

22:                                               ; preds = %135, %21
  %23 = load i32, i32* %5, align 4
  %24 = load i32, i32* %4, align 4
  %25 = icmp sle i32 %23, %24
  br i1 %25, label %26, label %138

26:                                               ; preds = %22
  %27 = load i32, i32* %8, align 4
  store i32 %27, i32* %7, align 4
  %28 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %29 = load i32, i32* %5, align 4
  %30 = add nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %28, i64 %31
  %33 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %32, i32 0, i32 1
  %34 = bitcast %union.anon.5* %33 to i16*
  %35 = load i16, i16* %34, align 2
  %36 = zext i16 %35 to i32
  store i32 %36, i32* %8, align 4
  %37 = load i32, i32* %9, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %9, align 4
  %39 = load i32, i32* %10, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %46

41:                                               ; preds = %26
  %42 = load i32, i32* %7, align 4
  %43 = load i32, i32* %8, align 4
  %44 = icmp eq i32 %42, %43
  br i1 %44, label %45, label %46

45:                                               ; preds = %41
  br label %135

46:                                               ; preds = %41, %26
  %47 = load i32, i32* %9, align 4
  %48 = load i32, i32* %11, align 4
  %49 = icmp slt i32 %47, %48
  br i1 %49, label %50, label %71

50:                                               ; preds = %46
  br label %51

51:                                               ; preds = %66, %50
  %52 = load i32, i32* %7, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 %53
  %55 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %54, i32 0, i32 0
  %56 = bitcast %union.anon.5* %55 to i16*
  %57 = load i16, i16* %56, align 4
  %58 = zext i16 %57 to i32
  %59 = load i32, i32* %7, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 %60
  %62 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %61, i32 0, i32 1
  %63 = bitcast %union.anon.5* %62 to i16*
  %64 = load i16, i16* %63, align 2
  %65 = zext i16 %64 to i32
  call void @send_bits(i32 %58, i32 %65)
  br label %66

66:                                               ; preds = %51
  %67 = load i32, i32* %9, align 4
  %68 = add nsw i32 %67, -1
  store i32 %68, i32* %9, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %51, label %70, !llvm.loop !116

70:                                               ; preds = %66
  br label %121

71:                                               ; preds = %46
  %72 = load i32, i32* %7, align 4
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %102

74:                                               ; preds = %71
  %75 = load i32, i32* %7, align 4
  %76 = load i32, i32* %6, align 4
  %77 = icmp ne i32 %75, %76
  br i1 %77, label %78, label %95

78:                                               ; preds = %74
  %79 = load i32, i32* %7, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 %80
  %82 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %81, i32 0, i32 0
  %83 = bitcast %union.anon.5* %82 to i16*
  %84 = load i16, i16* %83, align 4
  %85 = zext i16 %84 to i32
  %86 = load i32, i32* %7, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 %87
  %89 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %88, i32 0, i32 1
  %90 = bitcast %union.anon.5* %89 to i16*
  %91 = load i16, i16* %90, align 2
  %92 = zext i16 %91 to i32
  call void @send_bits(i32 %85, i32 %92)
  %93 = load i32, i32* %9, align 4
  %94 = add nsw i32 %93, -1
  store i32 %94, i32* %9, align 4
  br label %95

95:                                               ; preds = %78, %74
  %96 = load i16, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 16, i32 0, i32 0), align 16
  %97 = zext i16 %96 to i32
  %98 = load i16, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 16, i32 1, i32 0), align 2
  %99 = zext i16 %98 to i32
  call void @send_bits(i32 %97, i32 %99)
  %100 = load i32, i32* %9, align 4
  %101 = sub nsw i32 %100, 3
  call void @send_bits(i32 %101, i32 2)
  br label %120

102:                                              ; preds = %71
  %103 = load i32, i32* %9, align 4
  %104 = icmp sle i32 %103, 10
  br i1 %104, label %105, label %112

105:                                              ; preds = %102
  %106 = load i16, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 17, i32 0, i32 0), align 4
  %107 = zext i16 %106 to i32
  %108 = load i16, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 17, i32 1, i32 0), align 2
  %109 = zext i16 %108 to i32
  call void @send_bits(i32 %107, i32 %109)
  %110 = load i32, i32* %9, align 4
  %111 = sub nsw i32 %110, 3
  call void @send_bits(i32 %111, i32 3)
  br label %119

112:                                              ; preds = %102
  %113 = load i16, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 18, i32 0, i32 0), align 8
  %114 = zext i16 %113 to i32
  %115 = load i16, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 18, i32 1, i32 0), align 2
  %116 = zext i16 %115 to i32
  call void @send_bits(i32 %114, i32 %116)
  %117 = load i32, i32* %9, align 4
  %118 = sub nsw i32 %117, 11
  call void @send_bits(i32 %118, i32 7)
  br label %119

119:                                              ; preds = %112, %105
  br label %120

120:                                              ; preds = %119, %95
  br label %121

121:                                              ; preds = %120, %70
  br label %122

122:                                              ; preds = %121
  store i32 0, i32* %9, align 4
  %123 = load i32, i32* %7, align 4
  store i32 %123, i32* %6, align 4
  %124 = load i32, i32* %8, align 4
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %127

126:                                              ; preds = %122
  store i32 138, i32* %10, align 4
  store i32 3, i32* %11, align 4
  br label %134

127:                                              ; preds = %122
  %128 = load i32, i32* %7, align 4
  %129 = load i32, i32* %8, align 4
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %132

131:                                              ; preds = %127
  store i32 6, i32* %10, align 4
  store i32 3, i32* %11, align 4
  br label %133

132:                                              ; preds = %127
  store i32 7, i32* %10, align 4
  store i32 4, i32* %11, align 4
  br label %133

133:                                              ; preds = %132, %131
  br label %134

134:                                              ; preds = %133, %126
  br label %135

135:                                              ; preds = %134, %45
  %136 = load i32, i32* %5, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %5, align 4
  br label %22, !llvm.loop !117

138:                                              ; preds = %22
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @scan_tree(%struct.ct_data* %0, i32 %1) #0 {
  %3 = alloca %struct.ct_data*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.ct_data* %0, %struct.ct_data** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 -1, i32* %6, align 4
  %12 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %13 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %12, i64 0
  %14 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %13, i32 0, i32 1
  %15 = bitcast %union.anon.5* %14 to i16*
  %16 = load i16, i16* %15, align 2
  %17 = zext i16 %16 to i32
  store i32 %17, i32* %8, align 4
  store i32 0, i32* %9, align 4
  store i32 7, i32* %10, align 4
  store i32 4, i32* %11, align 4
  %18 = load i32, i32* %8, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %2
  store i32 138, i32* %10, align 4
  store i32 3, i32* %11, align 4
  br label %21

21:                                               ; preds = %20, %2
  %22 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %23 = load i32, i32* %4, align 4
  %24 = add nsw i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %22, i64 %25
  %27 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %26, i32 0, i32 1
  %28 = bitcast %union.anon.5* %27 to i16*
  store i16 -1, i16* %28, align 2
  store i32 0, i32* %5, align 4
  br label %29

29:                                               ; preds = %111, %21
  %30 = load i32, i32* %5, align 4
  %31 = load i32, i32* %4, align 4
  %32 = icmp sle i32 %30, %31
  br i1 %32, label %33, label %114

33:                                               ; preds = %29
  %34 = load i32, i32* %8, align 4
  store i32 %34, i32* %7, align 4
  %35 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %36 = load i32, i32* %5, align 4
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %35, i64 %38
  %40 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %39, i32 0, i32 1
  %41 = bitcast %union.anon.5* %40 to i16*
  %42 = load i16, i16* %41, align 2
  %43 = zext i16 %42 to i32
  store i32 %43, i32* %8, align 4
  %44 = load i32, i32* %9, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %9, align 4
  %46 = load i32, i32* %10, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %53

48:                                               ; preds = %33
  %49 = load i32, i32* %7, align 4
  %50 = load i32, i32* %8, align 4
  %51 = icmp eq i32 %49, %50
  br i1 %51, label %52, label %53

52:                                               ; preds = %48
  br label %111

53:                                               ; preds = %48, %33
  %54 = load i32, i32* %9, align 4
  %55 = load i32, i32* %11, align 4
  %56 = icmp slt i32 %54, %55
  br i1 %56, label %57, label %68

57:                                               ; preds = %53
  %58 = load i32, i32* %9, align 4
  %59 = load i32, i32* %7, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 %60
  %62 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %61, i32 0, i32 0
  %63 = bitcast %union.anon.5* %62 to i16*
  %64 = load i16, i16* %63, align 4
  %65 = zext i16 %64 to i32
  %66 = add nsw i32 %65, %58
  %67 = trunc i32 %66 to i16
  store i16 %67, i16* %63, align 4
  br label %97

68:                                               ; preds = %53
  %69 = load i32, i32* %7, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %86

71:                                               ; preds = %68
  %72 = load i32, i32* %7, align 4
  %73 = load i32, i32* %6, align 4
  %74 = icmp ne i32 %72, %73
  br i1 %74, label %75, label %83

75:                                               ; preds = %71
  %76 = load i32, i32* %7, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 %77
  %79 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %78, i32 0, i32 0
  %80 = bitcast %union.anon.5* %79 to i16*
  %81 = load i16, i16* %80, align 4
  %82 = add i16 %81, 1
  store i16 %82, i16* %80, align 4
  br label %83

83:                                               ; preds = %75, %71
  %84 = load i16, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 16, i32 0, i32 0), align 16
  %85 = add i16 %84, 1
  store i16 %85, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 16, i32 0, i32 0), align 16
  br label %96

86:                                               ; preds = %68
  %87 = load i32, i32* %9, align 4
  %88 = icmp sle i32 %87, 10
  br i1 %88, label %89, label %92

89:                                               ; preds = %86
  %90 = load i16, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 17, i32 0, i32 0), align 4
  %91 = add i16 %90, 1
  store i16 %91, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 17, i32 0, i32 0), align 4
  br label %95

92:                                               ; preds = %86
  %93 = load i16, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 18, i32 0, i32 0), align 8
  %94 = add i16 %93, 1
  store i16 %94, i16* getelementptr inbounds ([39 x %struct.ct_data], [39 x %struct.ct_data]* @bl_tree, i64 0, i64 18, i32 0, i32 0), align 8
  br label %95

95:                                               ; preds = %92, %89
  br label %96

96:                                               ; preds = %95, %83
  br label %97

97:                                               ; preds = %96, %57
  br label %98

98:                                               ; preds = %97
  store i32 0, i32* %9, align 4
  %99 = load i32, i32* %7, align 4
  store i32 %99, i32* %6, align 4
  %100 = load i32, i32* %8, align 4
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %103

102:                                              ; preds = %98
  store i32 138, i32* %10, align 4
  store i32 3, i32* %11, align 4
  br label %110

103:                                              ; preds = %98
  %104 = load i32, i32* %7, align 4
  %105 = load i32, i32* %8, align 4
  %106 = icmp eq i32 %104, %105
  br i1 %106, label %107, label %108

107:                                              ; preds = %103
  store i32 6, i32* %10, align 4
  store i32 3, i32* %11, align 4
  br label %109

108:                                              ; preds = %103
  store i32 7, i32* %10, align 4
  store i32 4, i32* %11, align 4
  br label %109

109:                                              ; preds = %108, %107
  br label %110

110:                                              ; preds = %109, %102
  br label %111

111:                                              ; preds = %110, %52
  %112 = load i32, i32* %5, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %5, align 4
  br label %29, !llvm.loop !118

114:                                              ; preds = %29
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @pqdownheap(%struct.ct_data* %0, i32 %1) #0 {
  %3 = alloca %struct.ct_data*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.ct_data* %0, %struct.ct_data** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load i32, i32* %4, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %8
  %10 = load i32, i32* %9, align 4
  store i32 %10, i32* %5, align 4
  %11 = load i32, i32* %4, align 4
  %12 = shl i32 %11, 1
  store i32 %12, i32* %6, align 4
  br label %13

13:                                               ; preds = %151, %2
  %14 = load i32, i32* %6, align 4
  %15 = load i32, i32* @heap_len, align 4
  %16 = icmp sle i32 %14, %15
  br i1 %16, label %17, label %162

17:                                               ; preds = %13
  %18 = load i32, i32* %6, align 4
  %19 = load i32, i32* @heap_len, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %93

21:                                               ; preds = %17
  %22 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %23 = load i32, i32* %6, align 4
  %24 = add nsw i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %25
  %27 = load i32, i32* %26, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %22, i64 %28
  %30 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %29, i32 0, i32 0
  %31 = bitcast %union.anon.5* %30 to i16*
  %32 = load i16, i16* %31, align 2
  %33 = zext i16 %32 to i32
  %34 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %35 = load i32, i32* %6, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %36
  %38 = load i32, i32* %37, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %34, i64 %39
  %41 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %40, i32 0, i32 0
  %42 = bitcast %union.anon.5* %41 to i16*
  %43 = load i16, i16* %42, align 2
  %44 = zext i16 %43 to i32
  %45 = icmp slt i32 %33, %44
  br i1 %45, label %90, label %46

46:                                               ; preds = %21
  %47 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %48 = load i32, i32* %6, align 4
  %49 = add nsw i32 %48, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %50
  %52 = load i32, i32* %51, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %47, i64 %53
  %55 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %54, i32 0, i32 0
  %56 = bitcast %union.anon.5* %55 to i16*
  %57 = load i16, i16* %56, align 2
  %58 = zext i16 %57 to i32
  %59 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %60 = load i32, i32* %6, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %61
  %63 = load i32, i32* %62, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %59, i64 %64
  %66 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %65, i32 0, i32 0
  %67 = bitcast %union.anon.5* %66 to i16*
  %68 = load i16, i16* %67, align 2
  %69 = zext i16 %68 to i32
  %70 = icmp eq i32 %58, %69
  br i1 %70, label %71, label %93

71:                                               ; preds = %46
  %72 = load i32, i32* %6, align 4
  %73 = add nsw i32 %72, 1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %74
  %76 = load i32, i32* %75, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [573 x i8], [573 x i8]* @depth, i64 0, i64 %77
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = load i32, i32* %6, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %82
  %84 = load i32, i32* %83, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [573 x i8], [573 x i8]* @depth, i64 0, i64 %85
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = icmp sle i32 %80, %88
  br i1 %89, label %90, label %93

90:                                               ; preds = %71, %21
  %91 = load i32, i32* %6, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %6, align 4
  br label %93

93:                                               ; preds = %90, %71, %46, %17
  %94 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %95 = load i32, i32* %5, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %94, i64 %96
  %98 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %97, i32 0, i32 0
  %99 = bitcast %union.anon.5* %98 to i16*
  %100 = load i16, i16* %99, align 2
  %101 = zext i16 %100 to i32
  %102 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %103 = load i32, i32* %6, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %104
  %106 = load i32, i32* %105, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %102, i64 %107
  %109 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %108, i32 0, i32 0
  %110 = bitcast %union.anon.5* %109 to i16*
  %111 = load i16, i16* %110, align 2
  %112 = zext i16 %111 to i32
  %113 = icmp slt i32 %101, %112
  br i1 %113, label %150, label %114

114:                                              ; preds = %93
  %115 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %116 = load i32, i32* %5, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %115, i64 %117
  %119 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %118, i32 0, i32 0
  %120 = bitcast %union.anon.5* %119 to i16*
  %121 = load i16, i16* %120, align 2
  %122 = zext i16 %121 to i32
  %123 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %124 = load i32, i32* %6, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %125
  %127 = load i32, i32* %126, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %123, i64 %128
  %130 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %129, i32 0, i32 0
  %131 = bitcast %union.anon.5* %130 to i16*
  %132 = load i16, i16* %131, align 2
  %133 = zext i16 %132 to i32
  %134 = icmp eq i32 %122, %133
  br i1 %134, label %135, label %151

135:                                              ; preds = %114
  %136 = load i32, i32* %5, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [573 x i8], [573 x i8]* @depth, i64 0, i64 %137
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = load i32, i32* %6, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %142
  %144 = load i32, i32* %143, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [573 x i8], [573 x i8]* @depth, i64 0, i64 %145
  %147 = load i8, i8* %146, align 1
  %148 = zext i8 %147 to i32
  %149 = icmp sle i32 %140, %148
  br i1 %149, label %150, label %151

150:                                              ; preds = %135, %93
  br label %162

151:                                              ; preds = %135, %114
  %152 = load i32, i32* %6, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %153
  %155 = load i32, i32* %154, align 4
  %156 = load i32, i32* %4, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %157
  store i32 %155, i32* %158, align 4
  %159 = load i32, i32* %6, align 4
  store i32 %159, i32* %4, align 4
  %160 = load i32, i32* %6, align 4
  %161 = shl i32 %160, 1
  store i32 %161, i32* %6, align 4
  br label %13, !llvm.loop !119

162:                                              ; preds = %150, %13
  %163 = load i32, i32* %5, align 4
  %164 = load i32, i32* %4, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %165
  store i32 %163, i32* %166, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @gen_bitlen(%struct.tree_desc* %0) #0 {
  %2 = alloca %struct.tree_desc*, align 8
  %3 = alloca %struct.ct_data*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.ct_data*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i16, align 2
  %15 = alloca i32, align 4
  store %struct.tree_desc* %0, %struct.tree_desc** %2, align 8
  %16 = load %struct.tree_desc*, %struct.tree_desc** %2, align 8
  %17 = getelementptr inbounds %struct.tree_desc, %struct.tree_desc* %16, i32 0, i32 0
  %18 = load %struct.ct_data*, %struct.ct_data** %17, align 8
  store %struct.ct_data* %18, %struct.ct_data** %3, align 8
  %19 = load %struct.tree_desc*, %struct.tree_desc** %2, align 8
  %20 = getelementptr inbounds %struct.tree_desc, %struct.tree_desc* %19, i32 0, i32 2
  %21 = load i32*, i32** %20, align 8
  store i32* %21, i32** %4, align 8
  %22 = load %struct.tree_desc*, %struct.tree_desc** %2, align 8
  %23 = getelementptr inbounds %struct.tree_desc, %struct.tree_desc* %22, i32 0, i32 3
  %24 = load i32, i32* %23, align 8
  store i32 %24, i32* %5, align 4
  %25 = load %struct.tree_desc*, %struct.tree_desc** %2, align 8
  %26 = getelementptr inbounds %struct.tree_desc, %struct.tree_desc* %25, i32 0, i32 6
  %27 = load i32, i32* %26, align 4
  store i32 %27, i32* %6, align 4
  %28 = load %struct.tree_desc*, %struct.tree_desc** %2, align 8
  %29 = getelementptr inbounds %struct.tree_desc, %struct.tree_desc* %28, i32 0, i32 5
  %30 = load i32, i32* %29, align 8
  store i32 %30, i32* %7, align 4
  %31 = load %struct.tree_desc*, %struct.tree_desc** %2, align 8
  %32 = getelementptr inbounds %struct.tree_desc, %struct.tree_desc* %31, i32 0, i32 1
  %33 = load %struct.ct_data*, %struct.ct_data** %32, align 8
  store %struct.ct_data* %33, %struct.ct_data** %8, align 8
  store i32 0, i32* %15, align 4
  store i32 0, i32* %12, align 4
  br label %34

34:                                               ; preds = %41, %1
  %35 = load i32, i32* %12, align 4
  %36 = icmp sle i32 %35, 15
  br i1 %36, label %37, label %44

37:                                               ; preds = %34
  %38 = load i32, i32* %12, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [16 x i16], [16 x i16]* @bl_count, i64 0, i64 %39
  store i16 0, i16* %40, align 2
  br label %41

41:                                               ; preds = %37
  %42 = load i32, i32* %12, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %12, align 4
  br label %34, !llvm.loop !120

44:                                               ; preds = %34
  %45 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %46 = load i32, i32* @heap_max, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %45, i64 %50
  %52 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %51, i32 0, i32 1
  %53 = bitcast %union.anon.5* %52 to i16*
  store i16 0, i16* %53, align 2
  %54 = load i32, i32* @heap_max, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %9, align 4
  br label %56

56:                                               ; preds = %153, %44
  %57 = load i32, i32* %9, align 4
  %58 = icmp slt i32 %57, 573
  br i1 %58, label %59, label %156

59:                                               ; preds = %56
  %60 = load i32, i32* %9, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %61
  %63 = load i32, i32* %62, align 4
  store i32 %63, i32* %10, align 4
  %64 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %65 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %66 = load i32, i32* %10, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %65, i64 %67
  %69 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %68, i32 0, i32 1
  %70 = bitcast %union.anon.5* %69 to i16*
  %71 = load i16, i16* %70, align 2
  %72 = zext i16 %71 to i64
  %73 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %64, i64 %72
  %74 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %73, i32 0, i32 1
  %75 = bitcast %union.anon.5* %74 to i16*
  %76 = load i16, i16* %75, align 2
  %77 = zext i16 %76 to i32
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %12, align 4
  %79 = load i32, i32* %12, align 4
  %80 = load i32, i32* %7, align 4
  %81 = icmp sgt i32 %79, %80
  br i1 %81, label %82, label %86

82:                                               ; preds = %59
  %83 = load i32, i32* %7, align 4
  store i32 %83, i32* %12, align 4
  %84 = load i32, i32* %15, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %15, align 4
  br label %86

86:                                               ; preds = %82, %59
  %87 = load i32, i32* %12, align 4
  %88 = trunc i32 %87 to i16
  %89 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %90 = load i32, i32* %10, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %89, i64 %91
  %93 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %92, i32 0, i32 1
  %94 = bitcast %union.anon.5* %93 to i16*
  store i16 %88, i16* %94, align 2
  %95 = load i32, i32* %10, align 4
  %96 = load i32, i32* %6, align 4
  %97 = icmp sgt i32 %95, %96
  br i1 %97, label %98, label %99

98:                                               ; preds = %86
  br label %153

99:                                               ; preds = %86
  %100 = load i32, i32* %12, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [16 x i16], [16 x i16]* @bl_count, i64 0, i64 %101
  %103 = load i16, i16* %102, align 2
  %104 = add i16 %103, 1
  store i16 %104, i16* %102, align 2
  store i32 0, i32* %13, align 4
  %105 = load i32, i32* %10, align 4
  %106 = load i32, i32* %5, align 4
  %107 = icmp sge i32 %105, %106
  br i1 %107, label %108, label %116

108:                                              ; preds = %99
  %109 = load i32*, i32** %4, align 8
  %110 = load i32, i32* %10, align 4
  %111 = load i32, i32* %5, align 4
  %112 = sub nsw i32 %110, %111
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32* %109, i64 %113
  %115 = load i32, i32* %114, align 4
  store i32 %115, i32* %13, align 4
  br label %116

116:                                              ; preds = %108, %99
  %117 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %118 = load i32, i32* %10, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %117, i64 %119
  %121 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %120, i32 0, i32 0
  %122 = bitcast %union.anon.5* %121 to i16*
  %123 = load i16, i16* %122, align 2
  store i16 %123, i16* %14, align 2
  %124 = load i16, i16* %14, align 2
  %125 = zext i16 %124 to i64
  %126 = load i32, i32* %12, align 4
  %127 = load i32, i32* %13, align 4
  %128 = add nsw i32 %126, %127
  %129 = sext i32 %128 to i64
  %130 = mul i64 %125, %129
  %131 = load i64, i64* @opt_len, align 8
  %132 = add i64 %131, %130
  store i64 %132, i64* @opt_len, align 8
  %133 = load %struct.ct_data*, %struct.ct_data** %8, align 8
  %134 = icmp ne %struct.ct_data* %133, null
  br i1 %134, label %135, label %152

135:                                              ; preds = %116
  %136 = load i16, i16* %14, align 2
  %137 = zext i16 %136 to i64
  %138 = load %struct.ct_data*, %struct.ct_data** %8, align 8
  %139 = load i32, i32* %10, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %138, i64 %140
  %142 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %141, i32 0, i32 1
  %143 = bitcast %union.anon.5* %142 to i16*
  %144 = load i16, i16* %143, align 2
  %145 = zext i16 %144 to i32
  %146 = load i32, i32* %13, align 4
  %147 = add nsw i32 %145, %146
  %148 = sext i32 %147 to i64
  %149 = mul i64 %137, %148
  %150 = load i64, i64* @static_len, align 8
  %151 = add i64 %150, %149
  store i64 %151, i64* @static_len, align 8
  br label %152

152:                                              ; preds = %135, %116
  br label %153

153:                                              ; preds = %152, %98
  %154 = load i32, i32* %9, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %9, align 4
  br label %56, !llvm.loop !121

156:                                              ; preds = %56
  %157 = load i32, i32* %15, align 4
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %159, label %160

159:                                              ; preds = %156
  br label %271

160:                                              ; preds = %156
  br label %161

161:                                              ; preds = %195, %160
  %162 = load i32, i32* %7, align 4
  %163 = sub nsw i32 %162, 1
  store i32 %163, i32* %12, align 4
  br label %164

164:                                              ; preds = %171, %161
  %165 = load i32, i32* %12, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [16 x i16], [16 x i16]* @bl_count, i64 0, i64 %166
  %168 = load i16, i16* %167, align 2
  %169 = zext i16 %168 to i32
  %170 = icmp eq i32 %169, 0
  br i1 %170, label %171, label %174

171:                                              ; preds = %164
  %172 = load i32, i32* %12, align 4
  %173 = add nsw i32 %172, -1
  store i32 %173, i32* %12, align 4
  br label %164, !llvm.loop !122

174:                                              ; preds = %164
  %175 = load i32, i32* %12, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [16 x i16], [16 x i16]* @bl_count, i64 0, i64 %176
  %178 = load i16, i16* %177, align 2
  %179 = add i16 %178, -1
  store i16 %179, i16* %177, align 2
  %180 = load i32, i32* %12, align 4
  %181 = add nsw i32 %180, 1
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [16 x i16], [16 x i16]* @bl_count, i64 0, i64 %182
  %184 = load i16, i16* %183, align 2
  %185 = zext i16 %184 to i32
  %186 = add nsw i32 %185, 2
  %187 = trunc i32 %186 to i16
  store i16 %187, i16* %183, align 2
  %188 = load i32, i32* %7, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [16 x i16], [16 x i16]* @bl_count, i64 0, i64 %189
  %191 = load i16, i16* %190, align 2
  %192 = add i16 %191, -1
  store i16 %192, i16* %190, align 2
  %193 = load i32, i32* %15, align 4
  %194 = sub nsw i32 %193, 2
  store i32 %194, i32* %15, align 4
  br label %195

195:                                              ; preds = %174
  %196 = load i32, i32* %15, align 4
  %197 = icmp sgt i32 %196, 0
  br i1 %197, label %161, label %198, !llvm.loop !123

198:                                              ; preds = %195
  %199 = load i32, i32* %7, align 4
  store i32 %199, i32* %12, align 4
  br label %200

200:                                              ; preds = %268, %198
  %201 = load i32, i32* %12, align 4
  %202 = icmp ne i32 %201, 0
  br i1 %202, label %203, label %271

203:                                              ; preds = %200
  %204 = load i32, i32* %12, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds [16 x i16], [16 x i16]* @bl_count, i64 0, i64 %205
  %207 = load i16, i16* %206, align 2
  %208 = zext i16 %207 to i32
  store i32 %208, i32* %10, align 4
  br label %209

209:                                              ; preds = %264, %221, %203
  %210 = load i32, i32* %10, align 4
  %211 = icmp ne i32 %210, 0
  br i1 %211, label %212, label %267

212:                                              ; preds = %209
  %213 = load i32, i32* %9, align 4
  %214 = add nsw i32 %213, -1
  store i32 %214, i32* %9, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [573 x i32], [573 x i32]* @heap, i64 0, i64 %215
  %217 = load i32, i32* %216, align 4
  store i32 %217, i32* %11, align 4
  %218 = load i32, i32* %11, align 4
  %219 = load i32, i32* %6, align 4
  %220 = icmp sgt i32 %218, %219
  br i1 %220, label %221, label %222

221:                                              ; preds = %212
  br label %209, !llvm.loop !124

222:                                              ; preds = %212
  %223 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %224 = load i32, i32* %11, align 4
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %223, i64 %225
  %227 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %226, i32 0, i32 1
  %228 = bitcast %union.anon.5* %227 to i16*
  %229 = load i16, i16* %228, align 2
  %230 = zext i16 %229 to i32
  %231 = load i32, i32* %12, align 4
  %232 = icmp ne i32 %230, %231
  br i1 %232, label %233, label %264

233:                                              ; preds = %222
  %234 = load i32, i32* %12, align 4
  %235 = sext i32 %234 to i64
  %236 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %237 = load i32, i32* %11, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %236, i64 %238
  %240 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %239, i32 0, i32 1
  %241 = bitcast %union.anon.5* %240 to i16*
  %242 = load i16, i16* %241, align 2
  %243 = zext i16 %242 to i64
  %244 = sub nsw i64 %235, %243
  %245 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %246 = load i32, i32* %11, align 4
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %245, i64 %247
  %249 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %248, i32 0, i32 0
  %250 = bitcast %union.anon.5* %249 to i16*
  %251 = load i16, i16* %250, align 2
  %252 = zext i16 %251 to i64
  %253 = mul nsw i64 %244, %252
  %254 = load i64, i64* @opt_len, align 8
  %255 = add i64 %254, %253
  store i64 %255, i64* @opt_len, align 8
  %256 = load i32, i32* %12, align 4
  %257 = trunc i32 %256 to i16
  %258 = load %struct.ct_data*, %struct.ct_data** %3, align 8
  %259 = load i32, i32* %11, align 4
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %258, i64 %260
  %262 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %261, i32 0, i32 1
  %263 = bitcast %union.anon.5* %262 to i16*
  store i16 %257, i16* %263, align 2
  br label %264

264:                                              ; preds = %233, %222
  %265 = load i32, i32* %10, align 4
  %266 = add nsw i32 %265, -1
  store i32 %266, i32* %10, align 4
  br label %209, !llvm.loop !124

267:                                              ; preds = %209
  br label %268

268:                                              ; preds = %267
  %269 = load i32, i32* %12, align 4
  %270 = add nsw i32 %269, -1
  store i32 %270, i32* %12, align 4
  br label %200, !llvm.loop !125

271:                                              ; preds = %200, %159
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @ct_tally(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  %9 = load i32, i32* %5, align 4
  %10 = trunc i32 %9 to i8
  %11 = load i32, i32* @last_lit, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* @last_lit, align 4
  %13 = zext i32 %11 to i64
  %14 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %13
  store i8 %10, i8* %14, align 1
  %15 = load i32, i32* %4, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %25

17:                                               ; preds = %2
  %18 = load i32, i32* %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [573 x %struct.ct_data], [573 x %struct.ct_data]* @dyn_ltree, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %20, i32 0, i32 0
  %22 = bitcast %union.anon.5* %21 to i16*
  %23 = load i16, i16* %22, align 4
  %24 = add i16 %23, 1
  store i16 %24, i16* %22, align 4
  br label %77

25:                                               ; preds = %2
  %26 = load i32, i32* %4, align 4
  %27 = add nsw i32 %26, -1
  store i32 %27, i32* %4, align 4
  %28 = load i32, i32* %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [256 x i8], [256 x i8]* @length_code, i64 0, i64 %29
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = add nsw i32 %32, 256
  %34 = add nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [573 x %struct.ct_data], [573 x %struct.ct_data]* @dyn_ltree, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %36, i32 0, i32 0
  %38 = bitcast %union.anon.5* %37 to i16*
  %39 = load i16, i16* %38, align 4
  %40 = add i16 %39, 1
  store i16 %40, i16* %38, align 4
  %41 = load i32, i32* %4, align 4
  %42 = icmp slt i32 %41, 256
  br i1 %42, label %43, label %49

43:                                               ; preds = %25
  %44 = load i32, i32* %4, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [512 x i8], [512 x i8]* @dist_code, i64 0, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  br label %57

49:                                               ; preds = %25
  %50 = load i32, i32* %4, align 4
  %51 = ashr i32 %50, 7
  %52 = add nsw i32 256, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [512 x i8], [512 x i8]* @dist_code, i64 0, i64 %53
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i32
  br label %57

57:                                               ; preds = %49, %43
  %58 = phi i32 [ %48, %43 ], [ %56, %49 ]
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [61 x %struct.ct_data], [61 x %struct.ct_data]* @dyn_dtree, i64 0, i64 %59
  %61 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %60, i32 0, i32 0
  %62 = bitcast %union.anon.5* %61 to i16*
  %63 = load i16, i16* %62, align 4
  %64 = add i16 %63, 1
  store i16 %64, i16* %62, align 4
  %65 = load i32, i32* %4, align 4
  %66 = trunc i32 %65 to i16
  %67 = load i32, i32* @last_dist, align 4
  %68 = add i32 %67, 1
  store i32 %68, i32* @last_dist, align 4
  %69 = zext i32 %67 to i64
  %70 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([32768 x i16]* @d_buf to [0 x i16]*), i64 0, i64 %69
  store i16 %66, i16* %70, align 2
  %71 = load i8, i8* @flag_bit, align 1
  %72 = zext i8 %71 to i32
  %73 = load i8, i8* @flags, align 1
  %74 = zext i8 %73 to i32
  %75 = or i32 %74, %72
  %76 = trunc i32 %75 to i8
  store i8 %76, i8* @flags, align 1
  br label %77

77:                                               ; preds = %57, %17
  %78 = load i8, i8* @flag_bit, align 1
  %79 = zext i8 %78 to i32
  %80 = shl i32 %79, 1
  %81 = trunc i32 %80 to i8
  store i8 %81, i8* @flag_bit, align 1
  %82 = load i32, i32* @last_lit, align 4
  %83 = and i32 %82, 7
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %85, label %91

85:                                               ; preds = %77
  %86 = load i8, i8* @flags, align 1
  %87 = load i32, i32* @last_flags, align 4
  %88 = add i32 %87, 1
  store i32 %88, i32* @last_flags, align 4
  %89 = zext i32 %87 to i64
  %90 = getelementptr inbounds [4096 x i8], [4096 x i8]* @flag_buf, i64 0, i64 %89
  store i8 %86, i8* %90, align 1
  store i8 0, i8* @flags, align 1
  store i8 1, i8* @flag_bit, align 1
  br label %91

91:                                               ; preds = %85, %77
  %92 = load i32, i32* @level, align 4
  %93 = icmp sgt i32 %92, 2
  br i1 %93, label %94, label %143

94:                                               ; preds = %91
  %95 = load i32, i32* @last_lit, align 4
  %96 = and i32 %95, 4095
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %98, label %143

98:                                               ; preds = %94
  %99 = load i32, i32* @last_lit, align 4
  %100 = zext i32 %99 to i64
  %101 = mul i64 %100, 8
  store i64 %101, i64* %6, align 8
  %102 = load i32, i32* @strstart, align 4
  %103 = zext i32 %102 to i64
  %104 = load i64, i64* @block_start, align 8
  %105 = sub i64 %103, %104
  store i64 %105, i64* %7, align 8
  store i32 0, i32* %8, align 4
  br label %106

106:                                              ; preds = %126, %98
  %107 = load i32, i32* %8, align 4
  %108 = icmp slt i32 %107, 30
  br i1 %108, label %109, label %129

109:                                              ; preds = %106
  %110 = load i32, i32* %8, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [61 x %struct.ct_data], [61 x %struct.ct_data]* @dyn_dtree, i64 0, i64 %111
  %113 = getelementptr inbounds %struct.ct_data, %struct.ct_data* %112, i32 0, i32 0
  %114 = bitcast %union.anon.5* %113 to i16*
  %115 = load i16, i16* %114, align 4
  %116 = zext i16 %115 to i64
  %117 = load i32, i32* %8, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [30 x i32], [30 x i32]* @extra_dbits, i64 0, i64 %118
  %120 = load i32, i32* %119, align 4
  %121 = sext i32 %120 to i64
  %122 = add nsw i64 5, %121
  %123 = mul i64 %116, %122
  %124 = load i64, i64* %6, align 8
  %125 = add i64 %124, %123
  store i64 %125, i64* %6, align 8
  br label %126

126:                                              ; preds = %109
  %127 = load i32, i32* %8, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %8, align 4
  br label %106, !llvm.loop !126

129:                                              ; preds = %106
  %130 = load i64, i64* %6, align 8
  %131 = lshr i64 %130, 3
  store i64 %131, i64* %6, align 8
  %132 = load i32, i32* @last_dist, align 4
  %133 = load i32, i32* @last_lit, align 4
  %134 = udiv i32 %133, 2
  %135 = icmp ult i32 %132, %134
  br i1 %135, label %136, label %142

136:                                              ; preds = %129
  %137 = load i64, i64* %6, align 8
  %138 = load i64, i64* %7, align 8
  %139 = udiv i64 %138, 2
  %140 = icmp ult i64 %137, %139
  br i1 %140, label %141, label %142

141:                                              ; preds = %136
  store i32 1, i32* %3, align 4
  br label %152

142:                                              ; preds = %136, %129
  br label %143

143:                                              ; preds = %142, %94, %91
  %144 = load i32, i32* @last_lit, align 4
  %145 = icmp eq i32 %144, 32767
  br i1 %145, label %149, label %146

146:                                              ; preds = %143
  %147 = load i32, i32* @last_dist, align 4
  %148 = icmp eq i32 %147, 32768
  br label %149

149:                                              ; preds = %146, %143
  %150 = phi i1 [ true, %143 ], [ %148, %146 ]
  %151 = zext i1 %150 to i32
  store i32 %151, i32* %3, align 4
  br label %152

152:                                              ; preds = %149, %141
  %153 = load i32, i32* %3, align 4
  ret i32 %153
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @unlzh(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %6 = load i32, i32* %3, align 4
  store i32 %6, i32* @ifd, align 4
  %7 = load i32, i32* %4, align 4
  store i32 %7, i32* @ofd, align 4
  call void @decode_start()
  br label %8

8:                                                ; preds = %22, %2
  %9 = load i32, i32* @done, align 4
  %10 = icmp ne i32 %9, 0
  %11 = xor i1 %10, true
  br i1 %11, label %12, label %23

12:                                               ; preds = %8
  %13 = call i32 @decode(i32 8192, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0))
  store i32 %13, i32* %5, align 4
  %14 = load i32, i32* @test, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %22, label %16

16:                                               ; preds = %12
  %17 = load i32, i32* %5, align 4
  %18 = icmp ugt i32 %17, 0
  br i1 %18, label %19, label %22

19:                                               ; preds = %16
  %20 = load i32, i32* %4, align 4
  %21 = load i32, i32* %5, align 4
  call void @write_buf(i32 %20, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i32 %21)
  br label %22

22:                                               ; preds = %19, %16, %12
  br label %8, !llvm.loop !127

23:                                               ; preds = %8
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @decode_start() #0 {
  call void @huf_decode_start()
  store i32 0, i32* @j, align 4
  store i32 0, i32* @done, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @decode(i32 %0, i8* %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8* %1, i8** %5, align 8
  store i32 0, i32* %6, align 4
  br label %8

8:                                                ; preds = %31, %2
  %9 = load i32, i32* @j, align 4
  %10 = add nsw i32 %9, -1
  store i32 %10, i32* @j, align 4
  %11 = icmp sge i32 %10, 0
  br i1 %11, label %12, label %32

12:                                               ; preds = %8
  %13 = load i8*, i8** %5, align 8
  %14 = load i32, i32* @decode.i, align 4
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i8, i8* %13, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = load i8*, i8** %5, align 8
  %19 = load i32, i32* %6, align 4
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i8, i8* %18, i64 %20
  store i8 %17, i8* %21, align 1
  %22 = load i32, i32* @decode.i, align 4
  %23 = add i32 %22, 1
  %24 = and i32 %23, 8191
  store i32 %24, i32* @decode.i, align 4
  %25 = load i32, i32* %6, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %6, align 4
  %27 = load i32, i32* %4, align 4
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %29, label %31

29:                                               ; preds = %12
  %30 = load i32, i32* %6, align 4
  store i32 %30, i32* %3, align 4
  br label %90

31:                                               ; preds = %12
  br label %8, !llvm.loop !128

32:                                               ; preds = %8
  br label %33

33:                                               ; preds = %89, %32
  %34 = call i32 @decode_c()
  store i32 %34, i32* %7, align 4
  %35 = load i32, i32* %7, align 4
  %36 = icmp eq i32 %35, 510
  br i1 %36, label %37, label %39

37:                                               ; preds = %33
  store i32 1, i32* @done, align 4
  %38 = load i32, i32* %6, align 4
  store i32 %38, i32* %3, align 4
  br label %90

39:                                               ; preds = %33
  %40 = load i32, i32* %7, align 4
  %41 = icmp ule i32 %40, 255
  br i1 %41, label %42, label %56

42:                                               ; preds = %39
  %43 = load i32, i32* %7, align 4
  %44 = trunc i32 %43 to i8
  %45 = load i8*, i8** %5, align 8
  %46 = load i32, i32* %6, align 4
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8* %45, i64 %47
  store i8 %44, i8* %48, align 1
  %49 = load i32, i32* %6, align 4
  %50 = add i32 %49, 1
  store i32 %50, i32* %6, align 4
  %51 = load i32, i32* %4, align 4
  %52 = icmp eq i32 %50, %51
  br i1 %52, label %53, label %55

53:                                               ; preds = %42
  %54 = load i32, i32* %6, align 4
  store i32 %54, i32* %3, align 4
  br label %90

55:                                               ; preds = %42
  br label %89

56:                                               ; preds = %39
  %57 = load i32, i32* %7, align 4
  %58 = sub i32 %57, 253
  store i32 %58, i32* @j, align 4
  %59 = load i32, i32* %6, align 4
  %60 = call i32 @decode_p()
  %61 = sub i32 %59, %60
  %62 = sub i32 %61, 1
  %63 = and i32 %62, 8191
  store i32 %63, i32* @decode.i, align 4
  br label %64

64:                                               ; preds = %87, %56
  %65 = load i32, i32* @j, align 4
  %66 = add nsw i32 %65, -1
  store i32 %66, i32* @j, align 4
  %67 = icmp sge i32 %66, 0
  br i1 %67, label %68, label %88

68:                                               ; preds = %64
  %69 = load i8*, i8** %5, align 8
  %70 = load i32, i32* @decode.i, align 4
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8* %69, i64 %71
  %73 = load i8, i8* %72, align 1
  %74 = load i8*, i8** %5, align 8
  %75 = load i32, i32* %6, align 4
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8* %74, i64 %76
  store i8 %73, i8* %77, align 1
  %78 = load i32, i32* @decode.i, align 4
  %79 = add i32 %78, 1
  %80 = and i32 %79, 8191
  store i32 %80, i32* @decode.i, align 4
  %81 = load i32, i32* %6, align 4
  %82 = add i32 %81, 1
  store i32 %82, i32* %6, align 4
  %83 = load i32, i32* %4, align 4
  %84 = icmp eq i32 %82, %83
  br i1 %84, label %85, label %87

85:                                               ; preds = %68
  %86 = load i32, i32* %6, align 4
  store i32 %86, i32* %3, align 4
  br label %90

87:                                               ; preds = %68
  br label %64, !llvm.loop !129

88:                                               ; preds = %64
  br label %89

89:                                               ; preds = %88, %55
  br label %33

90:                                               ; preds = %85, %53, %37, %29
  %91 = load i32, i32* %3, align 4
  ret i32 %91
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @decode_c() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = load i32, i32* @blocksize, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %12

6:                                                ; preds = %0
  %7 = call i32 @getbits(i32 16)
  store i32 %7, i32* @blocksize, align 4
  %8 = load i32, i32* @blocksize, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  store i32 510, i32* %1, align 4
  br label %57

11:                                               ; preds = %6
  call void @read_pt_len(i32 19, i32 5, i32 3)
  call void @read_c_len()
  call void @read_pt_len(i32 14, i32 4, i32 -1)
  br label %12

12:                                               ; preds = %11, %0
  %13 = load i32, i32* @blocksize, align 4
  %14 = add i32 %13, -1
  store i32 %14, i32* @blocksize, align 4
  %15 = load i16, i16* @bitbuf, align 2
  %16 = zext i16 %15 to i32
  %17 = ashr i32 %16, 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([32768 x i16]* @d_buf to [0 x i16]*), i64 0, i64 %18
  %20 = load i16, i16* %19, align 2
  %21 = zext i16 %20 to i32
  store i32 %21, i32* %2, align 4
  %22 = load i32, i32* %2, align 4
  %23 = icmp uge i32 %22, 510
  br i1 %23, label %24, label %50

24:                                               ; preds = %12
  store i32 8, i32* %3, align 4
  br label %25

25:                                               ; preds = %46, %24
  %26 = load i16, i16* @bitbuf, align 2
  %27 = zext i16 %26 to i32
  %28 = load i32, i32* %3, align 4
  %29 = and i32 %27, %28
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %37

31:                                               ; preds = %25
  %32 = load i32, i32* %2, align 4
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %33
  %35 = load i16, i16* %34, align 2
  %36 = zext i16 %35 to i32
  store i32 %36, i32* %2, align 4
  br label %43

37:                                               ; preds = %25
  %38 = load i32, i32* %2, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %39
  %41 = load i16, i16* %40, align 2
  %42 = zext i16 %41 to i32
  store i32 %42, i32* %2, align 4
  br label %43

43:                                               ; preds = %37, %31
  %44 = load i32, i32* %3, align 4
  %45 = lshr i32 %44, 1
  store i32 %45, i32* %3, align 4
  br label %46

46:                                               ; preds = %43
  %47 = load i32, i32* %2, align 4
  %48 = icmp uge i32 %47, 510
  br i1 %48, label %25, label %49, !llvm.loop !130

49:                                               ; preds = %46
  br label %50

50:                                               ; preds = %49, %12
  %51 = load i32, i32* %2, align 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %52
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  call void @fillbuf(i32 %55)
  %56 = load i32, i32* %2, align 4
  store i32 %56, i32* %1, align 4
  br label %57

57:                                               ; preds = %50, %10
  %58 = load i32, i32* %1, align 4
  ret i32 %58
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @decode_p() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load i16, i16* @bitbuf, align 2
  %4 = zext i16 %3 to i32
  %5 = ashr i32 %4, 8
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [256 x i16], [256 x i16]* @pt_table, i64 0, i64 %6
  %8 = load i16, i16* %7, align 2
  %9 = zext i16 %8 to i32
  store i32 %9, i32* %1, align 4
  %10 = load i32, i32* %1, align 4
  %11 = icmp uge i32 %10, 14
  br i1 %11, label %12, label %38

12:                                               ; preds = %0
  store i32 128, i32* %2, align 4
  br label %13

13:                                               ; preds = %34, %12
  %14 = load i16, i16* @bitbuf, align 2
  %15 = zext i16 %14 to i32
  %16 = load i32, i32* %2, align 4
  %17 = and i32 %15, %16
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %25

19:                                               ; preds = %13
  %20 = load i32, i32* %1, align 4
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %21
  %23 = load i16, i16* %22, align 2
  %24 = zext i16 %23 to i32
  store i32 %24, i32* %1, align 4
  br label %31

25:                                               ; preds = %13
  %26 = load i32, i32* %1, align 4
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %27
  %29 = load i16, i16* %28, align 2
  %30 = zext i16 %29 to i32
  store i32 %30, i32* %1, align 4
  br label %31

31:                                               ; preds = %25, %19
  %32 = load i32, i32* %2, align 4
  %33 = lshr i32 %32, 1
  store i32 %33, i32* %2, align 4
  br label %34

34:                                               ; preds = %31
  %35 = load i32, i32* %1, align 4
  %36 = icmp uge i32 %35, 14
  br i1 %36, label %13, label %37, !llvm.loop !131

37:                                               ; preds = %34
  br label %38

38:                                               ; preds = %37, %0
  %39 = load i32, i32* %1, align 4
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds [32 x i8], [32 x i8]* @pt_len, i64 0, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  call void @fillbuf(i32 %43)
  %44 = load i32, i32* %1, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %54

46:                                               ; preds = %38
  %47 = load i32, i32* %1, align 4
  %48 = sub i32 %47, 1
  %49 = shl i32 1, %48
  %50 = load i32, i32* %1, align 4
  %51 = sub i32 %50, 1
  %52 = call i32 @getbits(i32 %51)
  %53 = add i32 %49, %52
  store i32 %53, i32* %1, align 4
  br label %54

54:                                               ; preds = %46, %38
  %55 = load i32, i32* %1, align 4
  ret i32 %55
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @fillbuf(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = load i16, i16* @bitbuf, align 2
  %5 = zext i16 %4 to i32
  %6 = shl i32 %5, %3
  %7 = trunc i32 %6 to i16
  store i16 %7, i16* @bitbuf, align 2
  br label %8

8:                                                ; preds = %39, %1
  %9 = load i32, i32* %2, align 4
  %10 = load i32, i32* @bitcount, align 4
  %11 = icmp sgt i32 %9, %10
  br i1 %11, label %12, label %40

12:                                               ; preds = %8
  %13 = load i32, i32* @subbitbuf, align 4
  %14 = load i32, i32* @bitcount, align 4
  %15 = load i32, i32* %2, align 4
  %16 = sub nsw i32 %15, %14
  store i32 %16, i32* %2, align 4
  %17 = shl i32 %13, %16
  %18 = load i16, i16* @bitbuf, align 2
  %19 = zext i16 %18 to i32
  %20 = or i32 %19, %17
  %21 = trunc i32 %20 to i16
  store i16 %21, i16* @bitbuf, align 2
  %22 = load i32, i32* @inptr, align 4
  %23 = load i32, i32* @insize, align 4
  %24 = icmp ult i32 %22, %23
  br i1 %24, label %25, label %32

25:                                               ; preds = %12
  %26 = load i32, i32* @inptr, align 4
  %27 = add i32 %26, 1
  store i32 %27, i32* @inptr, align 4
  %28 = zext i32 %26 to i64
  %29 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i32
  br label %34

32:                                               ; preds = %12
  %33 = call i32 @fill_inbuf(i32 1)
  br label %34

34:                                               ; preds = %32, %25
  %35 = phi i32 [ %31, %25 ], [ %33, %32 ]
  store i32 %35, i32* @subbitbuf, align 4
  %36 = load i32, i32* @subbitbuf, align 4
  %37 = icmp eq i32 %36, -1
  br i1 %37, label %38, label %39

38:                                               ; preds = %34
  store i32 0, i32* @subbitbuf, align 4
  br label %39

39:                                               ; preds = %38, %34
  store i32 8, i32* @bitcount, align 4
  br label %8, !llvm.loop !132

40:                                               ; preds = %8
  %41 = load i32, i32* @subbitbuf, align 4
  %42 = load i32, i32* %2, align 4
  %43 = load i32, i32* @bitcount, align 4
  %44 = sub nsw i32 %43, %42
  store i32 %44, i32* @bitcount, align 4
  %45 = lshr i32 %41, %44
  %46 = load i16, i16* @bitbuf, align 2
  %47 = zext i16 %46 to i32
  %48 = or i32 %47, %45
  %49 = trunc i32 %48 to i16
  store i16 %49, i16* @bitbuf, align 2
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @getbits(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %4 = load i16, i16* @bitbuf, align 2
  %5 = zext i16 %4 to i32
  %6 = load i32, i32* %2, align 4
  %7 = sext i32 %6 to i64
  %8 = sub i64 16, %7
  %9 = trunc i64 %8 to i32
  %10 = ashr i32 %5, %9
  store i32 %10, i32* %3, align 4
  %11 = load i32, i32* %2, align 4
  call void @fillbuf(i32 %11)
  %12 = load i32, i32* %3, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @read_pt_len(i32 %0, i32 %1, i32 %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %11 = load i32, i32* %5, align 4
  %12 = call i32 @getbits(i32 %11)
  store i32 %12, i32* %9, align 4
  %13 = load i32, i32* %9, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %43

15:                                               ; preds = %3
  %16 = load i32, i32* %5, align 4
  %17 = call i32 @getbits(i32 %16)
  store i32 %17, i32* %8, align 4
  store i32 0, i32* %7, align 4
  br label %18

18:                                               ; preds = %26, %15
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %4, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %29

22:                                               ; preds = %18
  %23 = load i32, i32* %7, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [32 x i8], [32 x i8]* @pt_len, i64 0, i64 %24
  store i8 0, i8* %25, align 1
  br label %26

26:                                               ; preds = %22
  %27 = load i32, i32* %7, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %7, align 4
  br label %18, !llvm.loop !133

29:                                               ; preds = %18
  store i32 0, i32* %7, align 4
  br label %30

30:                                               ; preds = %39, %29
  %31 = load i32, i32* %7, align 4
  %32 = icmp slt i32 %31, 256
  br i1 %32, label %33, label %42

33:                                               ; preds = %30
  %34 = load i32, i32* %8, align 4
  %35 = trunc i32 %34 to i16
  %36 = load i32, i32* %7, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [256 x i16], [256 x i16]* @pt_table, i64 0, i64 %37
  store i16 %35, i16* %38, align 2
  br label %39

39:                                               ; preds = %33
  %40 = load i32, i32* %7, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %7, align 4
  br label %30, !llvm.loop !134

42:                                               ; preds = %30
  br label %114

43:                                               ; preds = %3
  store i32 0, i32* %7, align 4
  br label %44

44:                                               ; preds = %101, %43
  %45 = load i32, i32* %7, align 4
  %46 = load i32, i32* %9, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %48, label %102

48:                                               ; preds = %44
  %49 = load i16, i16* @bitbuf, align 2
  %50 = zext i16 %49 to i32
  %51 = ashr i32 %50, 13
  store i32 %51, i32* %8, align 4
  %52 = load i32, i32* %8, align 4
  %53 = icmp eq i32 %52, 7
  br i1 %53, label %54, label %71

54:                                               ; preds = %48
  store i32 4096, i32* %10, align 4
  br label %55

55:                                               ; preds = %61, %54
  %56 = load i32, i32* %10, align 4
  %57 = load i16, i16* @bitbuf, align 2
  %58 = zext i16 %57 to i32
  %59 = and i32 %56, %58
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %66

61:                                               ; preds = %55
  %62 = load i32, i32* %10, align 4
  %63 = lshr i32 %62, 1
  store i32 %63, i32* %10, align 4
  %64 = load i32, i32* %8, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %8, align 4
  br label %55, !llvm.loop !135

66:                                               ; preds = %55
  %67 = load i32, i32* %8, align 4
  %68 = icmp slt i32 16, %67
  br i1 %68, label %69, label %70

69:                                               ; preds = %66
  call void @gzip_error(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.158, i64 0, i64 0)) #13
  unreachable

70:                                               ; preds = %66
  br label %71

71:                                               ; preds = %70, %48
  %72 = load i32, i32* %8, align 4
  %73 = icmp slt i32 %72, 7
  br i1 %73, label %74, label %75

74:                                               ; preds = %71
  br label %78

75:                                               ; preds = %71
  %76 = load i32, i32* %8, align 4
  %77 = sub nsw i32 %76, 3
  br label %78

78:                                               ; preds = %75, %74
  %79 = phi i32 [ 3, %74 ], [ %77, %75 ]
  call void @fillbuf(i32 %79)
  %80 = load i32, i32* %8, align 4
  %81 = trunc i32 %80 to i8
  %82 = load i32, i32* %7, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %7, align 4
  %84 = sext i32 %82 to i64
  %85 = getelementptr inbounds [32 x i8], [32 x i8]* @pt_len, i64 0, i64 %84
  store i8 %81, i8* %85, align 1
  %86 = load i32, i32* %7, align 4
  %87 = load i32, i32* %6, align 4
  %88 = icmp eq i32 %86, %87
  br i1 %88, label %89, label %101

89:                                               ; preds = %78
  %90 = call i32 @getbits(i32 2)
  store i32 %90, i32* %8, align 4
  br label %91

91:                                               ; preds = %95, %89
  %92 = load i32, i32* %8, align 4
  %93 = add nsw i32 %92, -1
  store i32 %93, i32* %8, align 4
  %94 = icmp sge i32 %93, 0
  br i1 %94, label %95, label %100

95:                                               ; preds = %91
  %96 = load i32, i32* %7, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %7, align 4
  %98 = sext i32 %96 to i64
  %99 = getelementptr inbounds [32 x i8], [32 x i8]* @pt_len, i64 0, i64 %98
  store i8 0, i8* %99, align 1
  br label %91, !llvm.loop !136

100:                                              ; preds = %91
  br label %101

101:                                              ; preds = %100, %78
  br label %44, !llvm.loop !137

102:                                              ; preds = %44
  br label %103

103:                                              ; preds = %107, %102
  %104 = load i32, i32* %7, align 4
  %105 = load i32, i32* %4, align 4
  %106 = icmp slt i32 %104, %105
  br i1 %106, label %107, label %112

107:                                              ; preds = %103
  %108 = load i32, i32* %7, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %7, align 4
  %110 = sext i32 %108 to i64
  %111 = getelementptr inbounds [32 x i8], [32 x i8]* @pt_len, i64 0, i64 %110
  store i8 0, i8* %111, align 1
  br label %103, !llvm.loop !138

112:                                              ; preds = %103
  %113 = load i32, i32* %4, align 4
  call void @make_table(i32 %113, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @pt_len, i64 0, i64 0), i32 8, i16* getelementptr inbounds ([256 x i16], [256 x i16]* @pt_table, i64 0, i64 0))
  br label %114

114:                                              ; preds = %112, %42
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @read_c_len() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = call i32 @getbits(i32 9)
  store i32 %5, i32* %3, align 4
  %6 = load i32, i32* %3, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %34

8:                                                ; preds = %0
  %9 = call i32 @getbits(i32 9)
  store i32 %9, i32* %2, align 4
  store i32 0, i32* %1, align 4
  br label %10

10:                                               ; preds = %17, %8
  %11 = load i32, i32* %1, align 4
  %12 = icmp slt i32 %11, 510
  br i1 %12, label %13, label %20

13:                                               ; preds = %10
  %14 = load i32, i32* %1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %15
  store i8 0, i8* %16, align 1
  br label %17

17:                                               ; preds = %13
  %18 = load i32, i32* %1, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %1, align 4
  br label %10, !llvm.loop !139

20:                                               ; preds = %10
  store i32 0, i32* %1, align 4
  br label %21

21:                                               ; preds = %30, %20
  %22 = load i32, i32* %1, align 4
  %23 = icmp slt i32 %22, 4096
  br i1 %23, label %24, label %33

24:                                               ; preds = %21
  %25 = load i32, i32* %2, align 4
  %26 = trunc i32 %25 to i16
  %27 = load i32, i32* %1, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([32768 x i16]* @d_buf to [0 x i16]*), i64 0, i64 %28
  store i16 %26, i16* %29, align 2
  br label %30

30:                                               ; preds = %24
  %31 = load i32, i32* %1, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %1, align 4
  br label %21, !llvm.loop !140

33:                                               ; preds = %21
  br label %127

34:                                               ; preds = %0
  store i32 0, i32* %1, align 4
  br label %35

35:                                               ; preds = %116, %34
  %36 = load i32, i32* %1, align 4
  %37 = load i32, i32* %3, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %117

39:                                               ; preds = %35
  %40 = load i16, i16* @bitbuf, align 2
  %41 = zext i16 %40 to i32
  %42 = ashr i32 %41, 8
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [256 x i16], [256 x i16]* @pt_table, i64 0, i64 %43
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i32
  store i32 %46, i32* %2, align 4
  %47 = load i32, i32* %2, align 4
  %48 = icmp sge i32 %47, 19
  br i1 %48, label %49, label %75

49:                                               ; preds = %39
  store i32 128, i32* %4, align 4
  br label %50

50:                                               ; preds = %71, %49
  %51 = load i16, i16* @bitbuf, align 2
  %52 = zext i16 %51 to i32
  %53 = load i32, i32* %4, align 4
  %54 = and i32 %52, %53
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %62

56:                                               ; preds = %50
  %57 = load i32, i32* %2, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %58
  %60 = load i16, i16* %59, align 2
  %61 = zext i16 %60 to i32
  store i32 %61, i32* %2, align 4
  br label %68

62:                                               ; preds = %50
  %63 = load i32, i32* %2, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %64
  %66 = load i16, i16* %65, align 2
  %67 = zext i16 %66 to i32
  store i32 %67, i32* %2, align 4
  br label %68

68:                                               ; preds = %62, %56
  %69 = load i32, i32* %4, align 4
  %70 = lshr i32 %69, 1
  store i32 %70, i32* %4, align 4
  br label %71

71:                                               ; preds = %68
  %72 = load i32, i32* %2, align 4
  %73 = icmp sge i32 %72, 19
  br i1 %73, label %50, label %74, !llvm.loop !141

74:                                               ; preds = %71
  br label %75

75:                                               ; preds = %74, %39
  %76 = load i32, i32* %2, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [32 x i8], [32 x i8]* @pt_len, i64 0, i64 %77
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  call void @fillbuf(i32 %80)
  %81 = load i32, i32* %2, align 4
  %82 = icmp sle i32 %81, 2
  br i1 %82, label %83, label %108

83:                                               ; preds = %75
  %84 = load i32, i32* %2, align 4
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %87

86:                                               ; preds = %83
  store i32 1, i32* %2, align 4
  br label %97

87:                                               ; preds = %83
  %88 = load i32, i32* %2, align 4
  %89 = icmp eq i32 %88, 1
  br i1 %89, label %90, label %93

90:                                               ; preds = %87
  %91 = call i32 @getbits(i32 4)
  %92 = add i32 %91, 3
  store i32 %92, i32* %2, align 4
  br label %96

93:                                               ; preds = %87
  %94 = call i32 @getbits(i32 9)
  %95 = add i32 %94, 20
  store i32 %95, i32* %2, align 4
  br label %96

96:                                               ; preds = %93, %90
  br label %97

97:                                               ; preds = %96, %86
  br label %98

98:                                               ; preds = %102, %97
  %99 = load i32, i32* %2, align 4
  %100 = add nsw i32 %99, -1
  store i32 %100, i32* %2, align 4
  %101 = icmp sge i32 %100, 0
  br i1 %101, label %102, label %107

102:                                              ; preds = %98
  %103 = load i32, i32* %1, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %1, align 4
  %105 = sext i32 %103 to i64
  %106 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %105
  store i8 0, i8* %106, align 1
  br label %98, !llvm.loop !142

107:                                              ; preds = %98
  br label %116

108:                                              ; preds = %75
  %109 = load i32, i32* %2, align 4
  %110 = sub nsw i32 %109, 2
  %111 = trunc i32 %110 to i8
  %112 = load i32, i32* %1, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %1, align 4
  %114 = sext i32 %112 to i64
  %115 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %114
  store i8 %111, i8* %115, align 1
  br label %116

116:                                              ; preds = %108, %107
  br label %35, !llvm.loop !143

117:                                              ; preds = %35
  br label %118

118:                                              ; preds = %121, %117
  %119 = load i32, i32* %1, align 4
  %120 = icmp slt i32 %119, 510
  br i1 %120, label %121, label %126

121:                                              ; preds = %118
  %122 = load i32, i32* %1, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %1, align 4
  %124 = sext i32 %122 to i64
  %125 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %124
  store i8 0, i8* %125, align 1
  br label %118, !llvm.loop !144

126:                                              ; preds = %118
  call void @make_table(i32 510, i8* getelementptr inbounds ([18432 x i8], [18432 x i8]* @outbuf, i64 0, i64 0), i32 12, i16* getelementptr inbounds ([32768 x i16], [32768 x i16]* @d_buf, i64 0, i64 0))
  br label %127

127:                                              ; preds = %126, %33
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @make_table(i32 %0, i8* %1, i32 %2, i16* %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16*, align 8
  %9 = alloca [17 x i16], align 16
  %10 = alloca [17 x i16], align 16
  %11 = alloca [18 x i16], align 16
  %12 = alloca i16*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i16* %3, i16** %8, align 8
  store i32 1, i32* %13, align 4
  br label %21

21:                                               ; preds = %28, %4
  %22 = load i32, i32* %13, align 4
  %23 = icmp ule i32 %22, 16
  br i1 %23, label %24, label %31

24:                                               ; preds = %21
  %25 = load i32, i32* %13, align 4
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds [17 x i16], [17 x i16]* %9, i64 0, i64 %26
  store i16 0, i16* %27, align 2
  br label %28

28:                                               ; preds = %24
  %29 = load i32, i32* %13, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %13, align 4
  br label %21, !llvm.loop !145

31:                                               ; preds = %21
  store i32 0, i32* %13, align 4
  br label %32

32:                                               ; preds = %46, %31
  %33 = load i32, i32* %13, align 4
  %34 = load i32, i32* %5, align 4
  %35 = icmp ult i32 %33, %34
  br i1 %35, label %36, label %49

36:                                               ; preds = %32
  %37 = load i8*, i8** %6, align 8
  %38 = load i32, i32* %13, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8* %37, i64 %39
  %41 = load i8, i8* %40, align 1
  %42 = zext i8 %41 to i64
  %43 = getelementptr inbounds [17 x i16], [17 x i16]* %9, i64 0, i64 %42
  %44 = load i16, i16* %43, align 2
  %45 = add i16 %44, 1
  store i16 %45, i16* %43, align 2
  br label %46

46:                                               ; preds = %36
  %47 = load i32, i32* %13, align 4
  %48 = add i32 %47, 1
  store i32 %48, i32* %13, align 4
  br label %32, !llvm.loop !146

49:                                               ; preds = %32
  %50 = getelementptr inbounds [18 x i16], [18 x i16]* %11, i64 0, i64 1
  store i16 0, i16* %50, align 2
  store i32 1, i32* %13, align 4
  br label %51

51:                                               ; preds = %74, %49
  %52 = load i32, i32* %13, align 4
  %53 = icmp ule i32 %52, 16
  br i1 %53, label %54, label %77

54:                                               ; preds = %51
  %55 = load i32, i32* %13, align 4
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds [18 x i16], [18 x i16]* %11, i64 0, i64 %56
  %58 = load i16, i16* %57, align 2
  %59 = zext i16 %58 to i32
  %60 = load i32, i32* %13, align 4
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds [17 x i16], [17 x i16]* %9, i64 0, i64 %61
  %63 = load i16, i16* %62, align 2
  %64 = zext i16 %63 to i32
  %65 = load i32, i32* %13, align 4
  %66 = sub i32 16, %65
  %67 = shl i32 %64, %66
  %68 = add nsw i32 %59, %67
  %69 = trunc i32 %68 to i16
  %70 = load i32, i32* %13, align 4
  %71 = add i32 %70, 1
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds [18 x i16], [18 x i16]* %11, i64 0, i64 %72
  store i16 %69, i16* %73, align 2
  br label %74

74:                                               ; preds = %54
  %75 = load i32, i32* %13, align 4
  %76 = add i32 %75, 1
  store i32 %76, i32* %13, align 4
  br label %51, !llvm.loop !147

77:                                               ; preds = %51
  %78 = getelementptr inbounds [18 x i16], [18 x i16]* %11, i64 0, i64 17
  %79 = load i16, i16* %78, align 2
  %80 = zext i16 %79 to i32
  %81 = and i32 %80, 65535
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %84

83:                                               ; preds = %77
  call void @gzip_error(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.158, i64 0, i64 0)) #13
  unreachable

84:                                               ; preds = %77
  %85 = load i32, i32* %7, align 4
  %86 = sub nsw i32 16, %85
  store i32 %86, i32* %17, align 4
  store i32 1, i32* %13, align 4
  br label %87

87:                                               ; preds = %108, %84
  %88 = load i32, i32* %13, align 4
  %89 = load i32, i32* %7, align 4
  %90 = icmp ule i32 %88, %89
  br i1 %90, label %91, label %111

91:                                               ; preds = %87
  %92 = load i32, i32* %17, align 4
  %93 = load i32, i32* %13, align 4
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds [18 x i16], [18 x i16]* %11, i64 0, i64 %94
  %96 = load i16, i16* %95, align 2
  %97 = zext i16 %96 to i32
  %98 = ashr i32 %97, %92
  %99 = trunc i32 %98 to i16
  store i16 %99, i16* %95, align 2
  %100 = load i32, i32* %7, align 4
  %101 = load i32, i32* %13, align 4
  %102 = sub i32 %100, %101
  %103 = shl i32 1, %102
  %104 = trunc i32 %103 to i16
  %105 = load i32, i32* %13, align 4
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds [17 x i16], [17 x i16]* %10, i64 0, i64 %106
  store i16 %104, i16* %107, align 2
  br label %108

108:                                              ; preds = %91
  %109 = load i32, i32* %13, align 4
  %110 = add i32 %109, 1
  store i32 %110, i32* %13, align 4
  br label %87, !llvm.loop !148

111:                                              ; preds = %87
  br label %112

112:                                              ; preds = %115, %111
  %113 = load i32, i32* %13, align 4
  %114 = icmp ule i32 %113, 16
  br i1 %114, label %115, label %125

115:                                              ; preds = %112
  %116 = load i32, i32* %13, align 4
  %117 = sub i32 16, %116
  %118 = shl i32 1, %117
  %119 = trunc i32 %118 to i16
  %120 = load i32, i32* %13, align 4
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds [17 x i16], [17 x i16]* %10, i64 0, i64 %121
  store i16 %119, i16* %122, align 2
  %123 = load i32, i32* %13, align 4
  %124 = add i32 %123, 1
  store i32 %124, i32* %13, align 4
  br label %112, !llvm.loop !149

125:                                              ; preds = %112
  %126 = load i32, i32* %7, align 4
  %127 = add nsw i32 %126, 1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [18 x i16], [18 x i16]* %11, i64 0, i64 %128
  %130 = load i16, i16* %129, align 2
  %131 = zext i16 %130 to i32
  %132 = load i32, i32* %17, align 4
  %133 = ashr i32 %131, %132
  store i32 %133, i32* %13, align 4
  %134 = load i32, i32* %13, align 4
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %136, label %150

136:                                              ; preds = %125
  %137 = load i32, i32* %7, align 4
  %138 = shl i32 1, %137
  store i32 %138, i32* %14, align 4
  br label %139

139:                                              ; preds = %143, %136
  %140 = load i32, i32* %13, align 4
  %141 = load i32, i32* %14, align 4
  %142 = icmp ne i32 %140, %141
  br i1 %142, label %143, label %149

143:                                              ; preds = %139
  %144 = load i16*, i16** %8, align 8
  %145 = load i32, i32* %13, align 4
  %146 = add i32 %145, 1
  store i32 %146, i32* %13, align 4
  %147 = zext i32 %145 to i64
  %148 = getelementptr inbounds i16, i16* %144, i64 %147
  store i16 0, i16* %148, align 2
  br label %139, !llvm.loop !150

149:                                              ; preds = %139
  br label %150

150:                                              ; preds = %149, %125
  %151 = load i32, i32* %5, align 4
  store i32 %151, i32* %18, align 4
  %152 = load i32, i32* %7, align 4
  %153 = sub nsw i32 15, %152
  %154 = shl i32 1, %153
  store i32 %154, i32* %20, align 4
  store i32 0, i32* %16, align 4
  br label %155

155:                                              ; preds = %274, %150
  %156 = load i32, i32* %16, align 4
  %157 = load i32, i32* %5, align 4
  %158 = icmp ult i32 %156, %157
  br i1 %158, label %159, label %277

159:                                              ; preds = %155
  %160 = load i8*, i8** %6, align 8
  %161 = load i32, i32* %16, align 4
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds i8, i8* %160, i64 %162
  %164 = load i8, i8* %163, align 1
  %165 = zext i8 %164 to i32
  store i32 %165, i32* %15, align 4
  %166 = icmp eq i32 %165, 0
  br i1 %166, label %167, label %168

167:                                              ; preds = %159
  br label %274

168:                                              ; preds = %159
  %169 = load i32, i32* %15, align 4
  %170 = zext i32 %169 to i64
  %171 = getelementptr inbounds [18 x i16], [18 x i16]* %11, i64 0, i64 %170
  %172 = load i16, i16* %171, align 2
  %173 = zext i16 %172 to i32
  %174 = load i32, i32* %15, align 4
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds [17 x i16], [17 x i16]* %10, i64 0, i64 %175
  %177 = load i16, i16* %176, align 2
  %178 = zext i16 %177 to i32
  %179 = add nsw i32 %173, %178
  store i32 %179, i32* %19, align 4
  %180 = load i32, i32* %15, align 4
  %181 = load i32, i32* %7, align 4
  %182 = icmp ule i32 %180, %181
  br i1 %182, label %183, label %210

183:                                              ; preds = %168
  %184 = load i32, i32* %7, align 4
  %185 = shl i32 1, %184
  %186 = load i32, i32* %19, align 4
  %187 = icmp ult i32 %185, %186
  br i1 %187, label %188, label %189

188:                                              ; preds = %183
  call void @gzip_error(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.158, i64 0, i64 0)) #13
  unreachable

189:                                              ; preds = %183
  %190 = load i32, i32* %15, align 4
  %191 = zext i32 %190 to i64
  %192 = getelementptr inbounds [18 x i16], [18 x i16]* %11, i64 0, i64 %191
  %193 = load i16, i16* %192, align 2
  %194 = zext i16 %193 to i32
  store i32 %194, i32* %13, align 4
  br label %195

195:                                              ; preds = %206, %189
  %196 = load i32, i32* %13, align 4
  %197 = load i32, i32* %19, align 4
  %198 = icmp ult i32 %196, %197
  br i1 %198, label %199, label %209

199:                                              ; preds = %195
  %200 = load i32, i32* %16, align 4
  %201 = trunc i32 %200 to i16
  %202 = load i16*, i16** %8, align 8
  %203 = load i32, i32* %13, align 4
  %204 = zext i32 %203 to i64
  %205 = getelementptr inbounds i16, i16* %202, i64 %204
  store i16 %201, i16* %205, align 2
  br label %206

206:                                              ; preds = %199
  %207 = load i32, i32* %13, align 4
  %208 = add i32 %207, 1
  store i32 %208, i32* %13, align 4
  br label %195, !llvm.loop !151

209:                                              ; preds = %195
  br label %268

210:                                              ; preds = %168
  %211 = load i32, i32* %15, align 4
  %212 = zext i32 %211 to i64
  %213 = getelementptr inbounds [18 x i16], [18 x i16]* %11, i64 0, i64 %212
  %214 = load i16, i16* %213, align 2
  %215 = zext i16 %214 to i32
  store i32 %215, i32* %14, align 4
  %216 = load i16*, i16** %8, align 8
  %217 = load i32, i32* %14, align 4
  %218 = load i32, i32* %17, align 4
  %219 = lshr i32 %217, %218
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds i16, i16* %216, i64 %220
  store i16* %221, i16** %12, align 8
  %222 = load i32, i32* %15, align 4
  %223 = load i32, i32* %7, align 4
  %224 = sub i32 %222, %223
  store i32 %224, i32* %13, align 4
  br label %225

225:                                              ; preds = %259, %210
  %226 = load i32, i32* %13, align 4
  %227 = icmp ne i32 %226, 0
  br i1 %227, label %228, label %264

228:                                              ; preds = %225
  %229 = load i16*, i16** %12, align 8
  %230 = load i16, i16* %229, align 2
  %231 = zext i16 %230 to i32
  %232 = icmp eq i32 %231, 0
  br i1 %232, label %233, label %244

233:                                              ; preds = %228
  %234 = load i32, i32* %18, align 4
  %235 = zext i32 %234 to i64
  %236 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %235
  store i16 0, i16* %236, align 2
  %237 = load i32, i32* %18, align 4
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %238
  store i16 0, i16* %239, align 2
  %240 = load i32, i32* %18, align 4
  %241 = add i32 %240, 1
  store i32 %241, i32* %18, align 4
  %242 = trunc i32 %240 to i16
  %243 = load i16*, i16** %12, align 8
  store i16 %242, i16* %243, align 2
  br label %244

244:                                              ; preds = %233, %228
  %245 = load i32, i32* %14, align 4
  %246 = load i32, i32* %20, align 4
  %247 = and i32 %245, %246
  %248 = icmp ne i32 %247, 0
  br i1 %248, label %249, label %254

249:                                              ; preds = %244
  %250 = load i16*, i16** %12, align 8
  %251 = load i16, i16* %250, align 2
  %252 = zext i16 %251 to i64
  %253 = getelementptr inbounds i16, i16* getelementptr inbounds ([65536 x i16], [65536 x i16]* @prev, i64 0, i64 32768), i64 %252
  store i16* %253, i16** %12, align 8
  br label %259

254:                                              ; preds = %244
  %255 = load i16*, i16** %12, align 8
  %256 = load i16, i16* %255, align 2
  %257 = zext i16 %256 to i64
  %258 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %257
  store i16* %258, i16** %12, align 8
  br label %259

259:                                              ; preds = %254, %249
  %260 = load i32, i32* %14, align 4
  %261 = shl i32 %260, 1
  store i32 %261, i32* %14, align 4
  %262 = load i32, i32* %13, align 4
  %263 = add i32 %262, -1
  store i32 %263, i32* %13, align 4
  br label %225, !llvm.loop !152

264:                                              ; preds = %225
  %265 = load i32, i32* %16, align 4
  %266 = trunc i32 %265 to i16
  %267 = load i16*, i16** %12, align 8
  store i16 %266, i16* %267, align 2
  br label %268

268:                                              ; preds = %264, %209
  %269 = load i32, i32* %19, align 4
  %270 = trunc i32 %269 to i16
  %271 = load i32, i32* %15, align 4
  %272 = zext i32 %271 to i64
  %273 = getelementptr inbounds [18 x i16], [18 x i16]* %11, i64 0, i64 %272
  store i16 %270, i16* %273, align 2
  br label %274

274:                                              ; preds = %268, %167
  %275 = load i32, i32* %16, align 4
  %276 = add i32 %275, 1
  store i32 %276, i32* %16, align 4
  br label %155, !llvm.loop !153

277:                                              ; preds = %155
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @huf_decode_start() #0 {
  call void @init_getbits()
  store i32 0, i32* @blocksize, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @init_getbits() #0 {
  store i16 0, i16* @bitbuf, align 2
  store i32 0, i32* @subbitbuf, align 4
  store i32 0, i32* @bitcount, align 4
  call void @fillbuf(i32 16)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @unlzw(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i8*, align 8
  %24 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  %25 = load i32, i32* @inptr, align 4
  %26 = load i32, i32* @insize, align 4
  %27 = icmp ult i32 %25, %26
  br i1 %27, label %28, label %35

28:                                               ; preds = %2
  %29 = load i32, i32* @inptr, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* @inptr, align 4
  %31 = zext i32 %29 to i64
  %32 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %31
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  br label %37

35:                                               ; preds = %2
  %36 = call i32 @fill_inbuf(i32 0)
  br label %37

37:                                               ; preds = %35, %28
  %38 = phi i32 [ %34, %28 ], [ %36, %35 ]
  store i32 %38, i32* @maxbits, align 4
  %39 = load i32, i32* @maxbits, align 4
  %40 = and i32 %39, 128
  store i32 %40, i32* @block_mode, align 4
  %41 = load i32, i32* @maxbits, align 4
  %42 = and i32 %41, 96
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %58

44:                                               ; preds = %37
  %45 = load i32, i32* @quiet, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %53, label %47

47:                                               ; preds = %44
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = load i8*, i8** @program_name, align 8
  %50 = load i32, i32* @maxbits, align 4
  %51 = and i32 %50, 96
  %52 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.161, i64 0, i64 0), i8* %49, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i32 %51)
  br label %53

53:                                               ; preds = %47, %44
  %54 = load i32, i32* @exit_code, align 4
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %57

56:                                               ; preds = %53
  store i32 2, i32* @exit_code, align 4
  br label %57

57:                                               ; preds = %56, %53
  br label %58

58:                                               ; preds = %57, %37
  %59 = load i32, i32* @maxbits, align 4
  %60 = and i32 %59, 31
  store i32 %60, i32* @maxbits, align 4
  %61 = load i32, i32* @maxbits, align 4
  %62 = zext i32 %61 to i64
  %63 = shl i64 1, %62
  store i64 %63, i64* %17, align 8
  %64 = load i32, i32* @maxbits, align 4
  %65 = icmp sgt i32 %64, 16
  br i1 %65, label %66, label %71

66:                                               ; preds = %58
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %68 = load i8*, i8** @program_name, align 8
  %69 = load i32, i32* @maxbits, align 4
  %70 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %67, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.1.162, i64 0, i64 0), i8* %68, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i32 %69, i32 16)
  store i32 1, i32* @exit_code, align 4
  store i32 1, i32* %3, align 4
  br label %439

71:                                               ; preds = %58
  %72 = load i32, i32* @insize, align 4
  store i32 %72, i32* %19, align 4
  store i32 9, i32* %18, align 4
  store i64 511, i64* %16, align 8
  %73 = load i32, i32* %18, align 4
  %74 = shl i32 1, %73
  %75 = sub nsw i32 %74, 1
  store i32 %75, i32* %14, align 4
  store i64 -1, i64* %9, align 8
  store i32 0, i32* %8, align 4
  store i32 0, i32* %13, align 4
  %76 = load i32, i32* @inptr, align 4
  %77 = shl i32 %76, 3
  %78 = zext i32 %77 to i64
  store i64 %78, i64* %12, align 8
  %79 = load i32, i32* @block_mode, align 4
  %80 = icmp ne i32 %79, 0
  %81 = zext i1 %80 to i64
  %82 = select i1 %80, i32 257, i32 256
  %83 = sext i32 %82 to i64
  store i64 %83, i64* %15, align 8
  call void @llvm.memset.p0i8.i64(i8* align 2 bitcast ([65536 x i16]* @prev to i8*), i8 0, i64 256, i1 false)
  store i64 255, i64* %7, align 8
  br label %84

84:                                               ; preds = %92, %71
  %85 = load i64, i64* %7, align 8
  %86 = icmp sge i64 %85, 0
  br i1 %86, label %87, label %95

87:                                               ; preds = %84
  %88 = load i64, i64* %7, align 8
  %89 = trunc i64 %88 to i8
  %90 = load i64, i64* %7, align 8
  %91 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %90
  store i8 %89, i8* %91, align 1
  br label %92

92:                                               ; preds = %87
  %93 = load i64, i64* %7, align 8
  %94 = add nsw i64 %93, -1
  store i64 %94, i64* %7, align 8
  br label %84, !llvm.loop !154

95:                                               ; preds = %84
  br label %96

96:                                               ; preds = %422, %95
  br label %97

97:                                               ; preds = %263, %209, %96
  %98 = load i64, i64* %12, align 8
  %99 = ashr i64 %98, 3
  %100 = trunc i64 %99 to i32
  store i32 %100, i32* %22, align 4
  %101 = load i32, i32* %22, align 4
  %102 = load i32, i32* @insize, align 4
  %103 = icmp ule i32 %101, %102
  br i1 %103, label %104, label %108

104:                                              ; preds = %97
  %105 = load i32, i32* @insize, align 4
  %106 = load i32, i32* %22, align 4
  %107 = sub i32 %105, %106
  br label %109

108:                                              ; preds = %97
  br label %109

109:                                              ; preds = %108, %104
  %110 = phi i32 [ %107, %104 ], [ 0, %108 ]
  store i32 %110, i32* %21, align 4
  store i32 0, i32* %20, align 4
  br label %111

111:                                              ; preds = %125, %109
  %112 = load i32, i32* %20, align 4
  %113 = load i32, i32* %21, align 4
  %114 = icmp slt i32 %112, %113
  br i1 %114, label %115, label %128

115:                                              ; preds = %111
  %116 = load i32, i32* %20, align 4
  %117 = load i32, i32* %22, align 4
  %118 = add nsw i32 %116, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %119
  %121 = load i8, i8* %120, align 1
  %122 = load i32, i32* %20, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %123
  store i8 %121, i8* %124, align 1
  br label %125

125:                                              ; preds = %115
  %126 = load i32, i32* %20, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %20, align 4
  br label %111, !llvm.loop !155

128:                                              ; preds = %111
  %129 = load i32, i32* %21, align 4
  store i32 %129, i32* @insize, align 4
  store i64 0, i64* %12, align 8
  %130 = load i32, i32* @insize, align 4
  %131 = icmp ult i32 %130, 64
  br i1 %131, label %132, label %149

132:                                              ; preds = %128
  %133 = load i32, i32* %4, align 4
  %134 = load i32, i32* @insize, align 4
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 0), i64 %135
  %137 = call i32 @read_buffer(i32 %133, i8* %136, i32 32768)
  store i32 %137, i32* %19, align 4
  %138 = load i32, i32* %19, align 4
  %139 = icmp eq i32 %138, -1
  br i1 %139, label %140, label %141

140:                                              ; preds = %132
  call void @read_error() #13
  unreachable

141:                                              ; preds = %132
  %142 = load i32, i32* %19, align 4
  %143 = load i32, i32* @insize, align 4
  %144 = add i32 %143, %142
  store i32 %144, i32* @insize, align 4
  %145 = load i32, i32* %19, align 4
  %146 = sext i32 %145 to i64
  %147 = load i64, i64* @bytes_in, align 8
  %148 = add nsw i64 %147, %146
  store i64 %148, i64* @bytes_in, align 8
  br label %149

149:                                              ; preds = %141, %128
  %150 = load i32, i32* %19, align 4
  %151 = icmp ne i32 %150, 0
  br i1 %151, label %152, label %161

152:                                              ; preds = %149
  %153 = load i32, i32* @insize, align 4
  %154 = zext i32 %153 to i64
  %155 = load i32, i32* @insize, align 4
  %156 = load i32, i32* %18, align 4
  %157 = urem i32 %155, %156
  %158 = zext i32 %157 to i64
  %159 = sub nsw i64 %154, %158
  %160 = shl i64 %159, 3
  br label %169

161:                                              ; preds = %149
  %162 = load i32, i32* @insize, align 4
  %163 = zext i32 %162 to i64
  %164 = shl i64 %163, 3
  %165 = load i32, i32* %18, align 4
  %166 = sub nsw i32 %165, 1
  %167 = sext i32 %166 to i64
  %168 = sub nsw i64 %164, %167
  br label %169

169:                                              ; preds = %161, %152
  %170 = phi i64 [ %160, %152 ], [ %168, %161 ]
  store i64 %170, i64* %11, align 8
  br label %171

171:                                              ; preds = %419, %249, %169
  %172 = load i64, i64* %11, align 8
  %173 = load i64, i64* %12, align 8
  %174 = icmp sgt i64 %172, %173
  br i1 %174, label %175, label %421

175:                                              ; preds = %171
  %176 = load i64, i64* %15, align 8
  %177 = load i64, i64* %16, align 8
  %178 = icmp sgt i64 %176, %177
  br i1 %178, label %179, label %213

179:                                              ; preds = %175
  %180 = load i64, i64* %12, align 8
  %181 = sub nsw i64 %180, 1
  %182 = load i32, i32* %18, align 4
  %183 = shl i32 %182, 3
  %184 = sext i32 %183 to i64
  %185 = load i64, i64* %12, align 8
  %186 = sub nsw i64 %185, 1
  %187 = load i32, i32* %18, align 4
  %188 = shl i32 %187, 3
  %189 = sext i32 %188 to i64
  %190 = add nsw i64 %186, %189
  %191 = load i32, i32* %18, align 4
  %192 = shl i32 %191, 3
  %193 = sext i32 %192 to i64
  %194 = srem i64 %190, %193
  %195 = sub nsw i64 %184, %194
  %196 = add nsw i64 %181, %195
  store i64 %196, i64* %12, align 8
  %197 = load i32, i32* %18, align 4
  %198 = add nsw i32 %197, 1
  store i32 %198, i32* %18, align 4
  %199 = load i32, i32* %18, align 4
  %200 = load i32, i32* @maxbits, align 4
  %201 = icmp eq i32 %199, %200
  br i1 %201, label %202, label %204

202:                                              ; preds = %179
  %203 = load i64, i64* %17, align 8
  store i64 %203, i64* %16, align 8
  br label %209

204:                                              ; preds = %179
  %205 = load i32, i32* %18, align 4
  %206 = zext i32 %205 to i64
  %207 = shl i64 1, %206
  %208 = sub nsw i64 %207, 1
  store i64 %208, i64* %16, align 8
  br label %209

209:                                              ; preds = %204, %202
  %210 = load i32, i32* %18, align 4
  %211 = shl i32 1, %210
  %212 = sub nsw i32 %211, 1
  store i32 %212, i32* %14, align 4
  br label %97

213:                                              ; preds = %175
  %214 = load i64, i64* %12, align 8
  %215 = ashr i64 %214, 3
  %216 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %215
  store i8* %216, i8** %23, align 8
  %217 = load i8*, i8** %23, align 8
  %218 = getelementptr inbounds i8, i8* %217, i64 0
  %219 = load i8, i8* %218, align 1
  %220 = zext i8 %219 to i64
  %221 = load i8*, i8** %23, align 8
  %222 = getelementptr inbounds i8, i8* %221, i64 1
  %223 = load i8, i8* %222, align 1
  %224 = zext i8 %223 to i64
  %225 = shl i64 %224, 8
  %226 = or i64 %220, %225
  %227 = load i8*, i8** %23, align 8
  %228 = getelementptr inbounds i8, i8* %227, i64 2
  %229 = load i8, i8* %228, align 1
  %230 = zext i8 %229 to i64
  %231 = shl i64 %230, 16
  %232 = or i64 %226, %231
  %233 = load i64, i64* %12, align 8
  %234 = and i64 %233, 7
  %235 = ashr i64 %232, %234
  %236 = load i32, i32* %14, align 4
  %237 = zext i32 %236 to i64
  %238 = and i64 %235, %237
  store i64 %238, i64* %7, align 8
  %239 = load i32, i32* %18, align 4
  %240 = sext i32 %239 to i64
  %241 = load i64, i64* %12, align 8
  %242 = add nsw i64 %241, %240
  store i64 %242, i64* %12, align 8
  %243 = load i64, i64* %9, align 8
  %244 = icmp eq i64 %243, -1
  br i1 %244, label %245, label %257

245:                                              ; preds = %213
  %246 = load i64, i64* %7, align 8
  %247 = icmp sle i64 256, %246
  br i1 %247, label %248, label %249

248:                                              ; preds = %245
  call void @gzip_error(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2.163, i64 0, i64 0)) #13
  unreachable

249:                                              ; preds = %245
  %250 = load i64, i64* %7, align 8
  store i64 %250, i64* %9, align 8
  %251 = trunc i64 %250 to i32
  store i32 %251, i32* %8, align 4
  %252 = trunc i32 %251 to i8
  %253 = load i32, i32* %13, align 4
  %254 = add nsw i32 %253, 1
  store i32 %254, i32* %13, align 4
  %255 = sext i32 %253 to i64
  %256 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %255
  store i8 %252, i8* %256, align 1
  br label %171, !llvm.loop !156

257:                                              ; preds = %213
  %258 = load i64, i64* %7, align 8
  %259 = icmp eq i64 %258, 256
  br i1 %259, label %260, label %284

260:                                              ; preds = %257
  %261 = load i32, i32* @block_mode, align 4
  %262 = icmp ne i32 %261, 0
  br i1 %262, label %263, label %284

263:                                              ; preds = %260
  call void @llvm.memset.p0i8.i64(i8* align 2 bitcast ([65536 x i16]* @prev to i8*), i8 0, i64 256, i1 false)
  store i64 256, i64* %15, align 8
  %264 = load i64, i64* %12, align 8
  %265 = sub nsw i64 %264, 1
  %266 = load i32, i32* %18, align 4
  %267 = shl i32 %266, 3
  %268 = sext i32 %267 to i64
  %269 = load i64, i64* %12, align 8
  %270 = sub nsw i64 %269, 1
  %271 = load i32, i32* %18, align 4
  %272 = shl i32 %271, 3
  %273 = sext i32 %272 to i64
  %274 = add nsw i64 %270, %273
  %275 = load i32, i32* %18, align 4
  %276 = shl i32 %275, 3
  %277 = sext i32 %276 to i64
  %278 = srem i64 %274, %277
  %279 = sub nsw i64 %268, %278
  %280 = add nsw i64 %265, %279
  store i64 %280, i64* %12, align 8
  store i32 9, i32* %18, align 4
  store i64 511, i64* %16, align 8
  %281 = load i32, i32* %18, align 4
  %282 = shl i32 1, %281
  %283 = sub nsw i32 %282, 1
  store i32 %283, i32* %14, align 4
  br label %97

284:                                              ; preds = %260, %257
  %285 = load i64, i64* %7, align 8
  store i64 %285, i64* %10, align 8
  store i8* bitcast (i16* getelementptr inbounds ([32768 x i16], [32768 x i16]* @d_buf, i64 0, i64 32767) to i8*), i8** %6, align 8
  %286 = load i64, i64* %7, align 8
  %287 = load i64, i64* %15, align 8
  %288 = icmp sge i64 %286, %287
  br i1 %288, label %289, label %317

289:                                              ; preds = %284
  %290 = load i64, i64* %7, align 8
  %291 = load i64, i64* %15, align 8
  %292 = icmp sgt i64 %290, %291
  br i1 %292, label %293, label %311

293:                                              ; preds = %289
  %294 = load i32, i32* @test, align 4
  %295 = icmp ne i32 %294, 0
  br i1 %295, label %306, label %296

296:                                              ; preds = %293
  %297 = load i32, i32* %13, align 4
  %298 = icmp sgt i32 %297, 0
  br i1 %298, label %299, label %306

299:                                              ; preds = %296
  %300 = load i32, i32* %5, align 4
  %301 = load i32, i32* %13, align 4
  call void @write_buf(i32 %300, i8* getelementptr inbounds ([18432 x i8], [18432 x i8]* @outbuf, i64 0, i64 0), i32 %301)
  %302 = load i32, i32* %13, align 4
  %303 = sext i32 %302 to i64
  %304 = load i64, i64* @bytes_out, align 8
  %305 = add nsw i64 %304, %303
  store i64 %305, i64* @bytes_out, align 8
  br label %306

306:                                              ; preds = %299, %296, %293
  %307 = load i32, i32* @to_stdout, align 4
  %308 = icmp ne i32 %307, 0
  %309 = zext i1 %308 to i64
  %310 = select i1 %308, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2.163, i64 0, i64 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.3.164, i64 0, i64 0)
  call void @gzip_error(i8* %310) #13
  unreachable

311:                                              ; preds = %289
  %312 = load i32, i32* %8, align 4
  %313 = trunc i32 %312 to i8
  %314 = load i8*, i8** %6, align 8
  %315 = getelementptr inbounds i8, i8* %314, i32 -1
  store i8* %315, i8** %6, align 8
  store i8 %313, i8* %315, align 1
  %316 = load i64, i64* %9, align 8
  store i64 %316, i64* %7, align 8
  br label %317

317:                                              ; preds = %311, %284
  br label %318

318:                                              ; preds = %321, %317
  %319 = load i64, i64* %7, align 8
  %320 = icmp uge i64 %319, 256
  br i1 %320, label %321, label %331

321:                                              ; preds = %318
  %322 = load i64, i64* %7, align 8
  %323 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %322
  %324 = load i8, i8* %323, align 1
  %325 = load i8*, i8** %6, align 8
  %326 = getelementptr inbounds i8, i8* %325, i32 -1
  store i8* %326, i8** %6, align 8
  store i8 %324, i8* %326, align 1
  %327 = load i64, i64* %7, align 8
  %328 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %327
  %329 = load i16, i16* %328, align 2
  %330 = zext i16 %329 to i64
  store i64 %330, i64* %7, align 8
  br label %318, !llvm.loop !157

331:                                              ; preds = %318
  %332 = load i64, i64* %7, align 8
  %333 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %332
  %334 = load i8, i8* %333, align 1
  %335 = zext i8 %334 to i32
  store i32 %335, i32* %8, align 4
  %336 = trunc i32 %335 to i8
  %337 = load i8*, i8** %6, align 8
  %338 = getelementptr inbounds i8, i8* %337, i32 -1
  store i8* %338, i8** %6, align 8
  store i8 %336, i8* %338, align 1
  %339 = load i32, i32* %13, align 4
  %340 = load i8*, i8** %6, align 8
  %341 = ptrtoint i8* %340 to i64
  %342 = sub i64 ptrtoint (i16* getelementptr inbounds ([32768 x i16], [32768 x i16]* @d_buf, i64 0, i64 32767) to i64), %341
  %343 = trunc i64 %342 to i32
  store i32 %343, i32* %24, align 4
  %344 = add nsw i32 %339, %343
  %345 = icmp sge i32 %344, 16384
  br i1 %345, label %346, label %394

346:                                              ; preds = %331
  br label %347

347:                                              ; preds = %387, %346
  %348 = load i32, i32* %24, align 4
  %349 = load i32, i32* %13, align 4
  %350 = sub nsw i32 16384, %349
  %351 = icmp sgt i32 %348, %350
  br i1 %351, label %352, label %355

352:                                              ; preds = %347
  %353 = load i32, i32* %13, align 4
  %354 = sub nsw i32 16384, %353
  store i32 %354, i32* %24, align 4
  br label %355

355:                                              ; preds = %352, %347
  %356 = load i32, i32* %24, align 4
  %357 = icmp sgt i32 %356, 0
  br i1 %357, label %358, label %368

358:                                              ; preds = %355
  %359 = load i32, i32* %13, align 4
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds i8, i8* getelementptr inbounds ([18432 x i8], [18432 x i8]* @outbuf, i64 0, i64 0), i64 %360
  %362 = load i8*, i8** %6, align 8
  %363 = load i32, i32* %24, align 4
  %364 = sext i32 %363 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %361, i8* align 1 %362, i64 %364, i1 false)
  %365 = load i32, i32* %24, align 4
  %366 = load i32, i32* %13, align 4
  %367 = add nsw i32 %366, %365
  store i32 %367, i32* %13, align 4
  br label %368

368:                                              ; preds = %358, %355
  %369 = load i32, i32* %13, align 4
  %370 = icmp sge i32 %369, 16384
  br i1 %370, label %371, label %382

371:                                              ; preds = %368
  %372 = load i32, i32* @test, align 4
  %373 = icmp ne i32 %372, 0
  br i1 %373, label %381, label %374

374:                                              ; preds = %371
  %375 = load i32, i32* %5, align 4
  %376 = load i32, i32* %13, align 4
  call void @write_buf(i32 %375, i8* getelementptr inbounds ([18432 x i8], [18432 x i8]* @outbuf, i64 0, i64 0), i32 %376)
  %377 = load i32, i32* %13, align 4
  %378 = sext i32 %377 to i64
  %379 = load i64, i64* @bytes_out, align 8
  %380 = add nsw i64 %379, %378
  store i64 %380, i64* @bytes_out, align 8
  br label %381

381:                                              ; preds = %374, %371
  store i32 0, i32* %13, align 4
  br label %382

382:                                              ; preds = %381, %368
  %383 = load i32, i32* %24, align 4
  %384 = load i8*, i8** %6, align 8
  %385 = sext i32 %383 to i64
  %386 = getelementptr inbounds i8, i8* %384, i64 %385
  store i8* %386, i8** %6, align 8
  br label %387

387:                                              ; preds = %382
  %388 = load i8*, i8** %6, align 8
  %389 = ptrtoint i8* %388 to i64
  %390 = sub i64 ptrtoint (i16* getelementptr inbounds ([32768 x i16], [32768 x i16]* @d_buf, i64 0, i64 32767) to i64), %389
  %391 = trunc i64 %390 to i32
  store i32 %391, i32* %24, align 4
  %392 = icmp sgt i32 %391, 0
  br i1 %392, label %347, label %393, !llvm.loop !158

393:                                              ; preds = %387
  br label %404

394:                                              ; preds = %331
  %395 = load i32, i32* %13, align 4
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds i8, i8* getelementptr inbounds ([18432 x i8], [18432 x i8]* @outbuf, i64 0, i64 0), i64 %396
  %398 = load i8*, i8** %6, align 8
  %399 = load i32, i32* %24, align 4
  %400 = sext i32 %399 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %397, i8* align 1 %398, i64 %400, i1 false)
  %401 = load i32, i32* %24, align 4
  %402 = load i32, i32* %13, align 4
  %403 = add nsw i32 %402, %401
  store i32 %403, i32* %13, align 4
  br label %404

404:                                              ; preds = %394, %393
  %405 = load i64, i64* %15, align 8
  store i64 %405, i64* %7, align 8
  %406 = load i64, i64* %17, align 8
  %407 = icmp slt i64 %405, %406
  br i1 %407, label %408, label %419

408:                                              ; preds = %404
  %409 = load i64, i64* %9, align 8
  %410 = trunc i64 %409 to i16
  %411 = load i64, i64* %7, align 8
  %412 = getelementptr inbounds [0 x i16], [0 x i16]* bitcast ([65536 x i16]* @prev to [0 x i16]*), i64 0, i64 %411
  store i16 %410, i16* %412, align 2
  %413 = load i32, i32* %8, align 4
  %414 = trunc i32 %413 to i8
  %415 = load i64, i64* %7, align 8
  %416 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %415
  store i8 %414, i8* %416, align 1
  %417 = load i64, i64* %7, align 8
  %418 = add nsw i64 %417, 1
  store i64 %418, i64* %15, align 8
  br label %419

419:                                              ; preds = %408, %404
  %420 = load i64, i64* %10, align 8
  store i64 %420, i64* %9, align 8
  br label %171, !llvm.loop !156

421:                                              ; preds = %171
  br label %422

422:                                              ; preds = %421
  %423 = load i32, i32* %19, align 4
  %424 = icmp ne i32 %423, 0
  br i1 %424, label %96, label %425, !llvm.loop !159

425:                                              ; preds = %422
  %426 = load i32, i32* @test, align 4
  %427 = icmp ne i32 %426, 0
  br i1 %427, label %438, label %428

428:                                              ; preds = %425
  %429 = load i32, i32* %13, align 4
  %430 = icmp sgt i32 %429, 0
  br i1 %430, label %431, label %438

431:                                              ; preds = %428
  %432 = load i32, i32* %5, align 4
  %433 = load i32, i32* %13, align 4
  call void @write_buf(i32 %432, i8* getelementptr inbounds ([18432 x i8], [18432 x i8]* @outbuf, i64 0, i64 0), i32 %433)
  %434 = load i32, i32* %13, align 4
  %435 = sext i32 %434 to i64
  %436 = load i64, i64* @bytes_out, align 8
  %437 = add nsw i64 %436, %435
  store i64 %437, i64* @bytes_out, align 8
  br label %438

438:                                              ; preds = %431, %428, %425
  store i32 0, i32* %3, align 4
  br label %439

439:                                              ; preds = %438, %66
  %440 = load i32, i32* %3, align 4
  ret i32 %440
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @unpack(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %10 = load i32, i32* %3, align 4
  store i32 %10, i32* @ifd, align 4
  %11 = load i32, i32* %4, align 4
  store i32 %11, i32* @ofd, align 4
  call void @read_tree()
  call void @build_tree.167()
  store i32 0, i32* @valid, align 4
  store i64 0, i64* @bitbuf.168, align 8
  %12 = load i32, i32* @peek_bits, align 4
  %13 = shl i32 1, %12
  %14 = sub nsw i32 %13, 1
  store i32 %14, i32* %8, align 4
  %15 = load i32, i32* @max_len, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [26 x i32], [26 x i32]* @leaves, i64 0, i64 %16
  %18 = load i32, i32* %17, align 4
  %19 = sub nsw i32 %18, 1
  store i32 %19, i32* %6, align 4
  br label %20

20:                                               ; preds = %123, %2
  br label %21

21:                                               ; preds = %25, %20
  %22 = load i32, i32* @valid, align 4
  %23 = load i32, i32* @peek_bits, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %33

25:                                               ; preds = %21
  %26 = load i64, i64* @bitbuf.168, align 8
  %27 = shl i64 %26, 8
  %28 = call zeroext i8 @read_byte()
  %29 = zext i8 %28 to i64
  %30 = or i64 %27, %29
  store i64 %30, i64* @bitbuf.168, align 8
  %31 = load i32, i32* @valid, align 4
  %32 = add nsw i32 %31, 8
  store i32 %32, i32* @valid, align 4
  br label %21, !llvm.loop !160

33:                                               ; preds = %21
  %34 = load i64, i64* @bitbuf.168, align 8
  %35 = load i32, i32* @valid, align 4
  %36 = load i32, i32* @peek_bits, align 4
  %37 = sub nsw i32 %35, %36
  %38 = zext i32 %37 to i64
  %39 = lshr i64 %34, %38
  %40 = load i32, i32* %8, align 4
  %41 = zext i32 %40 to i64
  %42 = and i64 %39, %41
  %43 = trunc i64 %42 to i32
  store i32 %43, i32* %7, align 4
  %44 = load i32, i32* %7, align 4
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  store i32 %48, i32* %5, align 4
  %49 = load i32, i32* %5, align 4
  %50 = icmp sgt i32 %49, 0
  br i1 %50, label %51, label %57

51:                                               ; preds = %33
  %52 = load i32, i32* @peek_bits, align 4
  %53 = load i32, i32* %5, align 4
  %54 = sub nsw i32 %52, %53
  %55 = load i32, i32* %7, align 4
  %56 = lshr i32 %55, %54
  store i32 %56, i32* %7, align 4
  br label %97

57:                                               ; preds = %33
  %58 = load i32, i32* %8, align 4
  %59 = zext i32 %58 to i64
  store i64 %59, i64* %9, align 8
  %60 = load i32, i32* @peek_bits, align 4
  store i32 %60, i32* %5, align 4
  br label %61

61:                                               ; preds = %86, %57
  %62 = load i32, i32* %7, align 4
  %63 = load i32, i32* %5, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [26 x i32], [26 x i32]* @parents, i64 0, i64 %64
  %66 = load i32, i32* %65, align 4
  %67 = icmp ult i32 %62, %66
  br i1 %67, label %68, label %96

68:                                               ; preds = %61
  %69 = load i32, i32* %5, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %5, align 4
  %71 = load i64, i64* %9, align 8
  %72 = shl i64 %71, 1
  %73 = add i64 %72, 1
  store i64 %73, i64* %9, align 8
  br label %74

74:                                               ; preds = %78, %68
  %75 = load i32, i32* @valid, align 4
  %76 = load i32, i32* %5, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %86

78:                                               ; preds = %74
  %79 = load i64, i64* @bitbuf.168, align 8
  %80 = shl i64 %79, 8
  %81 = call zeroext i8 @read_byte()
  %82 = zext i8 %81 to i64
  %83 = or i64 %80, %82
  store i64 %83, i64* @bitbuf.168, align 8
  %84 = load i32, i32* @valid, align 4
  %85 = add nsw i32 %84, 8
  store i32 %85, i32* @valid, align 4
  br label %74, !llvm.loop !161

86:                                               ; preds = %74
  %87 = load i64, i64* @bitbuf.168, align 8
  %88 = load i32, i32* @valid, align 4
  %89 = load i32, i32* %5, align 4
  %90 = sub nsw i32 %88, %89
  %91 = zext i32 %90 to i64
  %92 = lshr i64 %87, %91
  %93 = load i64, i64* %9, align 8
  %94 = and i64 %92, %93
  %95 = trunc i64 %94 to i32
  store i32 %95, i32* %7, align 4
  br label %61, !llvm.loop !162

96:                                               ; preds = %61
  br label %97

97:                                               ; preds = %96, %51
  %98 = load i32, i32* %7, align 4
  %99 = load i32, i32* %6, align 4
  %100 = icmp eq i32 %98, %99
  br i1 %100, label %101, label %106

101:                                              ; preds = %97
  %102 = load i32, i32* %5, align 4
  %103 = load i32, i32* @max_len, align 4
  %104 = icmp eq i32 %102, %103
  br i1 %104, label %105, label %106

105:                                              ; preds = %101
  br label %127

106:                                              ; preds = %101, %97
  %107 = load i32, i32* %7, align 4
  %108 = load i32, i32* %5, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [26 x i32], [26 x i32]* @lit_base, i64 0, i64 %109
  %111 = load i32, i32* %110, align 4
  %112 = add i32 %107, %111
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds [256 x i8], [256 x i8]* @literal, i64 0, i64 %113
  %115 = load i8, i8* %114, align 1
  %116 = load i32, i32* @outcnt, align 4
  %117 = add i32 %116, 1
  store i32 %117, i32* @outcnt, align 4
  %118 = zext i32 %116 to i64
  %119 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %118
  store i8 %115, i8* %119, align 1
  %120 = load i32, i32* @outcnt, align 4
  %121 = icmp eq i32 %120, 32768
  br i1 %121, label %122, label %123

122:                                              ; preds = %106
  call void @flush_window()
  br label %123

123:                                              ; preds = %122, %106
  %124 = load i32, i32* %5, align 4
  %125 = load i32, i32* @valid, align 4
  %126 = sub nsw i32 %125, %124
  store i32 %126, i32* @valid, align 4
  br label %20

127:                                              ; preds = %105
  call void @flush_window()
  %128 = load i64, i64* @orig_len, align 8
  %129 = load i64, i64* @bytes_out, align 8
  %130 = and i64 %129, 4294967295
  %131 = icmp ne i64 %128, %130
  br i1 %131, label %132, label %133

132:                                              ; preds = %127
  call void @gzip_error(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.169, i64 0, i64 0)) #13
  unreachable

133:                                              ; preds = %127
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @read_tree() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 1, i32* %4, align 4
  store i64 0, i64* @orig_len, align 8
  store i32 1, i32* %3, align 4
  br label %5

5:                                                ; preds = %14, %0
  %6 = load i32, i32* %3, align 4
  %7 = icmp sle i32 %6, 4
  br i1 %7, label %8, label %17

8:                                                ; preds = %5
  %9 = load i64, i64* @orig_len, align 8
  %10 = shl i64 %9, 8
  %11 = call zeroext i8 @read_byte()
  %12 = zext i8 %11 to i64
  %13 = or i64 %10, %12
  store i64 %13, i64* @orig_len, align 8
  br label %14

14:                                               ; preds = %8
  %15 = load i32, i32* %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %3, align 4
  br label %5, !llvm.loop !163

17:                                               ; preds = %5
  %18 = call zeroext i8 @read_byte()
  %19 = zext i8 %18 to i32
  store i32 %19, i32* @max_len, align 4
  %20 = load i32, i32* @max_len, align 4
  %21 = icmp slt i32 0, %20
  br i1 %21, label %22, label %25

22:                                               ; preds = %17
  %23 = load i32, i32* @max_len, align 4
  %24 = icmp sle i32 %23, 25
  br i1 %24, label %26, label %25

25:                                               ; preds = %22, %17
  call void @gzip_error(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.1.172, i64 0, i64 0)) #13
  unreachable

26:                                               ; preds = %22
  store i32 0, i32* %3, align 4
  store i32 1, i32* %1, align 4
  br label %27

27:                                               ; preds = %65, %26
  %28 = load i32, i32* %1, align 4
  %29 = load i32, i32* @max_len, align 4
  %30 = icmp sle i32 %28, %29
  br i1 %30, label %31, label %68

31:                                               ; preds = %27
  %32 = call zeroext i8 @read_byte()
  %33 = zext i8 %32 to i32
  %34 = load i32, i32* %1, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [26 x i32], [26 x i32]* @leaves, i64 0, i64 %35
  store i32 %33, i32* %36, align 4
  %37 = load i32, i32* %4, align 4
  %38 = load i32, i32* %1, align 4
  %39 = load i32, i32* @max_len, align 4
  %40 = icmp eq i32 %38, %39
  %41 = zext i1 %40 to i32
  %42 = sub nsw i32 %37, %41
  %43 = load i32, i32* %1, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [26 x i32], [26 x i32]* @leaves, i64 0, i64 %44
  %46 = load i32, i32* %45, align 4
  %47 = icmp slt i32 %42, %46
  br i1 %47, label %48, label %49

48:                                               ; preds = %31
  call void @gzip_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2.173, i64 0, i64 0)) #13
  unreachable

49:                                               ; preds = %31
  %50 = load i32, i32* %4, align 4
  %51 = load i32, i32* %1, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [26 x i32], [26 x i32]* @leaves, i64 0, i64 %52
  %54 = load i32, i32* %53, align 4
  %55 = sub nsw i32 %50, %54
  %56 = add nsw i32 %55, 1
  %57 = mul nsw i32 %56, 2
  %58 = sub nsw i32 %57, 1
  store i32 %58, i32* %4, align 4
  %59 = load i32, i32* %1, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [26 x i32], [26 x i32]* @leaves, i64 0, i64 %60
  %62 = load i32, i32* %61, align 4
  %63 = load i32, i32* %3, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, i32* %3, align 4
  br label %65

65:                                               ; preds = %49
  %66 = load i32, i32* %1, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %1, align 4
  br label %27, !llvm.loop !164

68:                                               ; preds = %27
  %69 = load i32, i32* %3, align 4
  %70 = icmp sle i32 256, %69
  br i1 %70, label %71, label %72

71:                                               ; preds = %68
  call void @gzip_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2.173, i64 0, i64 0)) #13
  unreachable

72:                                               ; preds = %68
  %73 = load i32, i32* @max_len, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [26 x i32], [26 x i32]* @leaves, i64 0, i64 %74
  %76 = load i32, i32* %75, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %75, align 4
  store i32 0, i32* %2, align 4
  store i32 1, i32* %1, align 4
  br label %78

78:                                               ; preds = %104, %72
  %79 = load i32, i32* %1, align 4
  %80 = load i32, i32* @max_len, align 4
  %81 = icmp sle i32 %79, %80
  br i1 %81, label %82, label %107

82:                                               ; preds = %78
  %83 = load i32, i32* %2, align 4
  %84 = load i32, i32* %1, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [26 x i32], [26 x i32]* @lit_base, i64 0, i64 %85
  store i32 %83, i32* %86, align 4
  %87 = load i32, i32* %1, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [26 x i32], [26 x i32]* @leaves, i64 0, i64 %88
  %90 = load i32, i32* %89, align 4
  store i32 %90, i32* %3, align 4
  br label %91

91:                                               ; preds = %100, %82
  %92 = load i32, i32* %3, align 4
  %93 = icmp sgt i32 %92, 0
  br i1 %93, label %94, label %103

94:                                               ; preds = %91
  %95 = call zeroext i8 @read_byte()
  %96 = load i32, i32* %2, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %2, align 4
  %98 = sext i32 %96 to i64
  %99 = getelementptr inbounds [256 x i8], [256 x i8]* @literal, i64 0, i64 %98
  store i8 %95, i8* %99, align 1
  br label %100

100:                                              ; preds = %94
  %101 = load i32, i32* %3, align 4
  %102 = add nsw i32 %101, -1
  store i32 %102, i32* %3, align 4
  br label %91, !llvm.loop !165

103:                                              ; preds = %91
  br label %104

104:                                              ; preds = %103
  %105 = load i32, i32* %1, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %1, align 4
  br label %78, !llvm.loop !166

107:                                              ; preds = %78
  %108 = load i32, i32* @max_len, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [26 x i32], [26 x i32]* @leaves, i64 0, i64 %109
  %111 = load i32, i32* %110, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %110, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @build_tree.167() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %5 = load i32, i32* @max_len, align 4
  store i32 %5, i32* %2, align 4
  br label %6

6:                                                ; preds = %28, %0
  %7 = load i32, i32* %2, align 4
  %8 = icmp sge i32 %7, 1
  br i1 %8, label %9, label %31

9:                                                ; preds = %6
  %10 = load i32, i32* %1, align 4
  %11 = ashr i32 %10, 1
  store i32 %11, i32* %1, align 4
  %12 = load i32, i32* %1, align 4
  %13 = load i32, i32* %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [26 x i32], [26 x i32]* @parents, i64 0, i64 %14
  store i32 %12, i32* %15, align 4
  %16 = load i32, i32* %1, align 4
  %17 = load i32, i32* %2, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [26 x i32], [26 x i32]* @lit_base, i64 0, i64 %18
  %20 = load i32, i32* %19, align 4
  %21 = sub nsw i32 %20, %16
  store i32 %21, i32* %19, align 4
  %22 = load i32, i32* %2, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [26 x i32], [26 x i32]* @leaves, i64 0, i64 %23
  %25 = load i32, i32* %24, align 4
  %26 = load i32, i32* %1, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, i32* %1, align 4
  br label %28

28:                                               ; preds = %9
  %29 = load i32, i32* %2, align 4
  %30 = add nsw i32 %29, -1
  store i32 %30, i32* %2, align 4
  br label %6, !llvm.loop !167

31:                                               ; preds = %6
  %32 = load i32, i32* %1, align 4
  %33 = ashr i32 %32, 1
  %34 = icmp ne i32 %33, 1
  br i1 %34, label %35, label %36

35:                                               ; preds = %31
  call void @gzip_error(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3.171, i64 0, i64 0)) #13
  unreachable

36:                                               ; preds = %31
  %37 = load i32, i32* @max_len, align 4
  %38 = icmp sle i32 %37, 12
  br i1 %38, label %39, label %41

39:                                               ; preds = %36
  %40 = load i32, i32* @max_len, align 4
  br label %42

41:                                               ; preds = %36
  br label %42

42:                                               ; preds = %41, %39
  %43 = phi i32 [ %40, %39 ], [ 12, %41 ]
  store i32 %43, i32* @peek_bits, align 4
  %44 = load i32, i32* @peek_bits, align 4
  %45 = shl i32 1, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %46
  store i8* %47, i8** %3, align 8
  store i32 1, i32* %2, align 4
  br label %48

48:                                               ; preds = %71, %42
  %49 = load i32, i32* %2, align 4
  %50 = load i32, i32* @peek_bits, align 4
  %51 = icmp sle i32 %49, %50
  br i1 %51, label %52, label %74

52:                                               ; preds = %48
  %53 = load i32, i32* %2, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [26 x i32], [26 x i32]* @leaves, i64 0, i64 %54
  %56 = load i32, i32* %55, align 4
  %57 = load i32, i32* @peek_bits, align 4
  %58 = load i32, i32* %2, align 4
  %59 = sub nsw i32 %57, %58
  %60 = shl i32 %56, %59
  store i32 %60, i32* %4, align 4
  br label %61

61:                                               ; preds = %65, %52
  %62 = load i32, i32* %4, align 4
  %63 = add nsw i32 %62, -1
  store i32 %63, i32* %4, align 4
  %64 = icmp ne i32 %62, 0
  br i1 %64, label %65, label %70

65:                                               ; preds = %61
  %66 = load i32, i32* %2, align 4
  %67 = trunc i32 %66 to i8
  %68 = load i8*, i8** %3, align 8
  %69 = getelementptr inbounds i8, i8* %68, i32 -1
  store i8* %69, i8** %3, align 8
  store i8 %67, i8* %69, align 1
  br label %61, !llvm.loop !168

70:                                               ; preds = %61
  br label %71

71:                                               ; preds = %70
  %72 = load i32, i32* %2, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %2, align 4
  br label %48, !llvm.loop !169

74:                                               ; preds = %48
  br label %75

75:                                               ; preds = %78, %74
  %76 = load i8*, i8** %3, align 8
  %77 = icmp ugt i8* %76, getelementptr inbounds ([18432 x i8], [18432 x i8]* @outbuf, i64 0, i64 0)
  br i1 %77, label %78, label %81

78:                                               ; preds = %75
  %79 = load i8*, i8** %3, align 8
  %80 = getelementptr inbounds i8, i8* %79, i32 -1
  store i8* %80, i8** %3, align 8
  store i8 0, i8* %80, align 1
  br label %75, !llvm.loop !170

81:                                               ; preds = %75
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @read_byte() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @inptr, align 4
  %3 = load i32, i32* @insize, align 4
  %4 = icmp ult i32 %2, %3
  br i1 %4, label %5, label %12

5:                                                ; preds = %0
  %6 = load i32, i32* @inptr, align 4
  %7 = add i32 %6, 1
  store i32 %7, i32* @inptr, align 4
  %8 = zext i32 %6 to i64
  %9 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %8
  %10 = load i8, i8* %9, align 1
  %11 = zext i8 %10 to i32
  br label %14

12:                                               ; preds = %0
  %13 = call i32 @fill_inbuf(i32 0)
  br label %14

14:                                               ; preds = %12, %5
  %15 = phi i32 [ %11, %5 ], [ %13, %12 ]
  store i32 %15, i32* %1, align 4
  %16 = load i32, i32* %1, align 4
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %14
  call void @gzip_error(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.4.170, i64 0, i64 0)) #13
  unreachable

19:                                               ; preds = %14
  %20 = load i32, i32* %1, align 4
  %21 = trunc i32 %20 to i8
  ret i8 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @check_zipfile(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  %5 = load i32, i32* @inptr, align 4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 0), i64 %6
  store i8* %7, i8** %4, align 8
  %8 = load i32, i32* %3, align 4
  store i32 %8, i32* @ifd, align 4
  %9 = load i8*, i8** %4, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 26
  %11 = getelementptr inbounds i8, i8* %10, i64 0
  %12 = load i8, i8* %11, align 1
  %13 = zext i8 %12 to i16
  %14 = zext i16 %13 to i32
  %15 = load i8*, i8** %4, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 26
  %17 = getelementptr inbounds i8, i8* %16, i64 1
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i16
  %20 = zext i16 %19 to i32
  %21 = shl i32 %20, 8
  %22 = or i32 %14, %21
  %23 = add nsw i32 30, %22
  %24 = load i8*, i8** %4, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 28
  %26 = getelementptr inbounds i8, i8* %25, i64 0
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i16
  %29 = zext i16 %28 to i32
  %30 = load i8*, i8** %4, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 28
  %32 = getelementptr inbounds i8, i8* %31, i64 1
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i16
  %35 = zext i16 %34 to i32
  %36 = shl i32 %35, 8
  %37 = or i32 %29, %36
  %38 = add nsw i32 %23, %37
  %39 = load i32, i32* @inptr, align 4
  %40 = add i32 %39, %38
  store i32 %40, i32* @inptr, align 4
  %41 = load i32, i32* @inptr, align 4
  %42 = load i32, i32* @insize, align 4
  %43 = icmp ugt i32 %41, %42
  br i1 %43, label %76, label %44

44:                                               ; preds = %1
  %45 = load i8*, i8** %4, align 8
  %46 = getelementptr inbounds i8, i8* %45, i64 0
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i16
  %49 = zext i16 %48 to i32
  %50 = load i8*, i8** %4, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 1
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i16
  %54 = zext i16 %53 to i32
  %55 = shl i32 %54, 8
  %56 = or i32 %49, %55
  %57 = sext i32 %56 to i64
  %58 = load i8*, i8** %4, align 8
  %59 = getelementptr inbounds i8, i8* %58, i64 2
  %60 = getelementptr inbounds i8, i8* %59, i64 0
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i16
  %63 = zext i16 %62 to i32
  %64 = load i8*, i8** %4, align 8
  %65 = getelementptr inbounds i8, i8* %64, i64 2
  %66 = getelementptr inbounds i8, i8* %65, i64 1
  %67 = load i8, i8* %66, align 1
  %68 = zext i8 %67 to i16
  %69 = zext i16 %68 to i32
  %70 = shl i32 %69, 8
  %71 = or i32 %63, %70
  %72 = sext i32 %71 to i64
  %73 = shl i64 %72, 16
  %74 = or i64 %57, %73
  %75 = icmp ne i64 %74, 67324752
  br i1 %75, label %76, label %80

76:                                               ; preds = %44, %1
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %78 = load i8*, i8** @program_name, align 8
  %79 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %77, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.176, i64 0, i64 0), i8* %78, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 1, i32* @exit_code, align 4
  store i32 1, i32* %2, align 4
  br label %113

80:                                               ; preds = %44
  %81 = load i8*, i8** %4, align 8
  %82 = getelementptr inbounds i8, i8* %81, i64 8
  %83 = load i8, i8* %82, align 1
  %84 = zext i8 %83 to i32
  store i32 %84, i32* @method, align 4
  %85 = load i32, i32* @method, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %94

87:                                               ; preds = %80
  %88 = load i32, i32* @method, align 4
  %89 = icmp ne i32 %88, 8
  br i1 %89, label %90, label %94

90:                                               ; preds = %87
  %91 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %92 = load i8*, i8** @program_name, align 8
  %93 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %91, i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.1.177, i64 0, i64 0), i8* %92, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 1, i32* @exit_code, align 4
  store i32 1, i32* %2, align 4
  br label %113

94:                                               ; preds = %87, %80
  %95 = load i8*, i8** %4, align 8
  %96 = getelementptr inbounds i8, i8* %95, i64 6
  %97 = load i8, i8* %96, align 1
  %98 = zext i8 %97 to i32
  %99 = and i32 %98, 1
  store i32 %99, i32* @decrypt, align 4
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %105

101:                                              ; preds = %94
  %102 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %103 = load i8*, i8** @program_name, align 8
  %104 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %102, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.2.178, i64 0, i64 0), i8* %103, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 1, i32* @exit_code, align 4
  store i32 1, i32* %2, align 4
  br label %113

105:                                              ; preds = %94
  %106 = load i8*, i8** %4, align 8
  %107 = getelementptr inbounds i8, i8* %106, i64 6
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  %110 = and i32 %109, 8
  %111 = icmp ne i32 %110, 0
  %112 = zext i1 %111 to i32
  store i32 %112, i32* @ext_header, align 4
  store i32 1, i32* @pkzip, align 4
  store i32 0, i32* %2, align 4
  br label %113

113:                                              ; preds = %105, %101, %90, %76
  %114 = load i32, i32* %2, align 4
  ret i32 %114
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @unzip(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca [16 x i8], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  %13 = alloca i8, align 1
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store i64 0, i64* %6, align 8
  store i64 0, i64* %7, align 8
  store i32 0, i32* %10, align 4
  %14 = load i32, i32* %4, align 4
  store i32 %14, i32* @ifd, align 4
  %15 = load i32, i32* %5, align 4
  store i32 %15, i32* @ofd, align 4
  %16 = call i64 @updcrc(i8* null, i32 0)
  %17 = load i32, i32* @pkzip, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %63

19:                                               ; preds = %2
  %20 = load i32, i32* @ext_header, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %63, label %22

22:                                               ; preds = %19
  %23 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 14), align 1
  %24 = zext i8 %23 to i16
  %25 = zext i16 %24 to i32
  %26 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 15), align 1
  %27 = zext i8 %26 to i16
  %28 = zext i16 %27 to i32
  %29 = shl i32 %28, 8
  %30 = or i32 %25, %29
  %31 = sext i32 %30 to i64
  %32 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 16), align 1
  %33 = zext i8 %32 to i16
  %34 = zext i16 %33 to i32
  %35 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 17), align 1
  %36 = zext i8 %35 to i16
  %37 = zext i16 %36 to i32
  %38 = shl i32 %37, 8
  %39 = or i32 %34, %38
  %40 = sext i32 %39 to i64
  %41 = shl i64 %40, 16
  %42 = or i64 %31, %41
  store i64 %42, i64* %6, align 8
  %43 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 22), align 1
  %44 = zext i8 %43 to i16
  %45 = zext i16 %44 to i32
  %46 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 23), align 1
  %47 = zext i8 %46 to i16
  %48 = zext i16 %47 to i32
  %49 = shl i32 %48, 8
  %50 = or i32 %45, %49
  %51 = sext i32 %50 to i64
  %52 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 24), align 1
  %53 = zext i8 %52 to i16
  %54 = zext i16 %53 to i32
  %55 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 25), align 1
  %56 = zext i8 %55 to i16
  %57 = zext i16 %56 to i32
  %58 = shl i32 %57, 8
  %59 = or i32 %54, %58
  %60 = sext i32 %59 to i64
  %61 = shl i64 %60, 16
  %62 = or i64 %51, %61
  store i64 %62, i64* %7, align 8
  br label %63

63:                                               ; preds = %22, %19, %2
  %64 = load i32, i32* @method, align 4
  %65 = icmp eq i32 %64, 8
  br i1 %65, label %66, label %77

66:                                               ; preds = %63
  %67 = call i32 @inflate()
  store i32 %67, i32* %11, align 4
  %68 = load i32, i32* %11, align 4
  %69 = icmp eq i32 %68, 3
  br i1 %69, label %70, label %71

70:                                               ; preds = %66
  call void @xalloc_die() #13
  unreachable

71:                                               ; preds = %66
  %72 = load i32, i32* %11, align 4
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %75

74:                                               ; preds = %71
  call void @gzip_error(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.3.181, i64 0, i64 0)) #13
  unreachable

75:                                               ; preds = %71
  br label %76

76:                                               ; preds = %75
  br label %189

77:                                               ; preds = %63
  %78 = load i32, i32* @pkzip, align 4
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %187

80:                                               ; preds = %77
  %81 = load i32, i32* @method, align 4
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %187

83:                                               ; preds = %80
  %84 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 22), align 1
  %85 = zext i8 %84 to i16
  %86 = zext i16 %85 to i32
  %87 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 23), align 1
  %88 = zext i8 %87 to i16
  %89 = zext i16 %88 to i32
  %90 = shl i32 %89, 8
  %91 = or i32 %86, %90
  %92 = sext i32 %91 to i64
  %93 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 24), align 1
  %94 = zext i8 %93 to i16
  %95 = zext i16 %94 to i32
  %96 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 25), align 1
  %97 = zext i8 %96 to i16
  %98 = zext i16 %97 to i32
  %99 = shl i32 %98, 8
  %100 = or i32 %95, %99
  %101 = sext i32 %100 to i64
  %102 = shl i64 %101, 16
  %103 = or i64 %92, %102
  store i64 %103, i64* %12, align 8
  %104 = load i64, i64* %12, align 8
  %105 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 18), align 1
  %106 = zext i8 %105 to i16
  %107 = zext i16 %106 to i32
  %108 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 19), align 1
  %109 = zext i8 %108 to i16
  %110 = zext i16 %109 to i32
  %111 = shl i32 %110, 8
  %112 = or i32 %107, %111
  %113 = sext i32 %112 to i64
  %114 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 20), align 1
  %115 = zext i8 %114 to i16
  %116 = zext i16 %115 to i32
  %117 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 21), align 1
  %118 = zext i8 %117 to i16
  %119 = zext i16 %118 to i32
  %120 = shl i32 %119, 8
  %121 = or i32 %116, %120
  %122 = sext i32 %121 to i64
  %123 = shl i64 %122, 16
  %124 = or i64 %113, %123
  %125 = load i32, i32* @decrypt, align 4
  %126 = icmp ne i32 %125, 0
  %127 = zext i1 %126 to i64
  %128 = select i1 %126, i32 12, i32 0
  %129 = sext i32 %128 to i64
  %130 = sub i64 %124, %129
  %131 = icmp ne i64 %104, %130
  br i1 %131, label %132, label %156

132:                                              ; preds = %83
  %133 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %134 = load i64, i64* %12, align 8
  %135 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 18), align 1
  %136 = zext i8 %135 to i16
  %137 = zext i16 %136 to i32
  %138 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 19), align 1
  %139 = zext i8 %138 to i16
  %140 = zext i16 %139 to i32
  %141 = shl i32 %140, 8
  %142 = or i32 %137, %141
  %143 = sext i32 %142 to i64
  %144 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 20), align 1
  %145 = zext i8 %144 to i16
  %146 = zext i16 %145 to i32
  %147 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 21), align 1
  %148 = zext i8 %147 to i16
  %149 = zext i16 %148 to i32
  %150 = shl i32 %149, 8
  %151 = or i32 %146, %150
  %152 = sext i32 %151 to i64
  %153 = shl i64 %152, 16
  %154 = or i64 %143, %153
  %155 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %133, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4.182, i64 0, i64 0), i64 %134, i64 %154)
  call void @gzip_error(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.5.183, i64 0, i64 0)) #13
  unreachable

156:                                              ; preds = %83
  br label %157

157:                                              ; preds = %185, %156
  %158 = load i64, i64* %12, align 8
  %159 = add i64 %158, -1
  store i64 %159, i64* %12, align 8
  %160 = icmp ne i64 %158, 0
  br i1 %160, label %161, label %186

161:                                              ; preds = %157
  %162 = load i32, i32* @inptr, align 4
  %163 = load i32, i32* @insize, align 4
  %164 = icmp ult i32 %162, %163
  br i1 %164, label %165, label %172

165:                                              ; preds = %161
  %166 = load i32, i32* @inptr, align 4
  %167 = add i32 %166, 1
  store i32 %167, i32* @inptr, align 4
  %168 = zext i32 %166 to i64
  %169 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %168
  %170 = load i8, i8* %169, align 1
  %171 = zext i8 %170 to i32
  br label %174

172:                                              ; preds = %161
  %173 = call i32 @fill_inbuf(i32 0)
  br label %174

174:                                              ; preds = %172, %165
  %175 = phi i32 [ %171, %165 ], [ %173, %172 ]
  %176 = trunc i32 %175 to i8
  store i8 %176, i8* %13, align 1
  %177 = load i8, i8* %13, align 1
  %178 = load i32, i32* @outcnt, align 4
  %179 = add i32 %178, 1
  store i32 %179, i32* @outcnt, align 4
  %180 = zext i32 %178 to i64
  %181 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([65536 x i8]* @window to [0 x i8]*), i64 0, i64 %180
  store i8 %177, i8* %181, align 1
  %182 = load i32, i32* @outcnt, align 4
  %183 = icmp eq i32 %182, 32768
  br i1 %183, label %184, label %185

184:                                              ; preds = %174
  call void @flush_window()
  br label %185

185:                                              ; preds = %184, %174
  br label %157, !llvm.loop !171

186:                                              ; preds = %157
  call void @flush_window()
  br label %188

187:                                              ; preds = %80, %77
  call void @gzip_error(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.6.184, i64 0, i64 0)) #13
  unreachable

188:                                              ; preds = %186
  br label %189

189:                                              ; preds = %188, %76
  %190 = load i32, i32* @pkzip, align 4
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %281, label %192

192:                                              ; preds = %189
  store i32 0, i32* %8, align 4
  br label %193

193:                                              ; preds = %215, %192
  %194 = load i32, i32* %8, align 4
  %195 = icmp slt i32 %194, 8
  br i1 %195, label %196, label %218

196:                                              ; preds = %193
  %197 = load i32, i32* @inptr, align 4
  %198 = load i32, i32* @insize, align 4
  %199 = icmp ult i32 %197, %198
  br i1 %199, label %200, label %207

200:                                              ; preds = %196
  %201 = load i32, i32* @inptr, align 4
  %202 = add i32 %201, 1
  store i32 %202, i32* @inptr, align 4
  %203 = zext i32 %201 to i64
  %204 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %203
  %205 = load i8, i8* %204, align 1
  %206 = zext i8 %205 to i32
  br label %209

207:                                              ; preds = %196
  %208 = call i32 @fill_inbuf(i32 0)
  br label %209

209:                                              ; preds = %207, %200
  %210 = phi i32 [ %206, %200 ], [ %208, %207 ]
  %211 = trunc i32 %210 to i8
  %212 = load i32, i32* %8, align 4
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 %213
  store i8 %211, i8* %214, align 1
  br label %215

215:                                              ; preds = %209
  %216 = load i32, i32* %8, align 4
  %217 = add nsw i32 %216, 1
  store i32 %217, i32* %8, align 4
  br label %193, !llvm.loop !172

218:                                              ; preds = %193
  %219 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %220 = load i8, i8* %219, align 16
  %221 = zext i8 %220 to i16
  %222 = zext i16 %221 to i32
  %223 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 1
  %224 = load i8, i8* %223, align 1
  %225 = zext i8 %224 to i16
  %226 = zext i16 %225 to i32
  %227 = shl i32 %226, 8
  %228 = or i32 %222, %227
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %231 = getelementptr inbounds i8, i8* %230, i64 2
  %232 = getelementptr inbounds i8, i8* %231, i64 0
  %233 = load i8, i8* %232, align 1
  %234 = zext i8 %233 to i16
  %235 = zext i16 %234 to i32
  %236 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %237 = getelementptr inbounds i8, i8* %236, i64 2
  %238 = getelementptr inbounds i8, i8* %237, i64 1
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i16
  %241 = zext i16 %240 to i32
  %242 = shl i32 %241, 8
  %243 = or i32 %235, %242
  %244 = sext i32 %243 to i64
  %245 = shl i64 %244, 16
  %246 = or i64 %229, %245
  store i64 %246, i64* %6, align 8
  %247 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %248 = getelementptr inbounds i8, i8* %247, i64 4
  %249 = getelementptr inbounds i8, i8* %248, i64 0
  %250 = load i8, i8* %249, align 1
  %251 = zext i8 %250 to i16
  %252 = zext i16 %251 to i32
  %253 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %254 = getelementptr inbounds i8, i8* %253, i64 4
  %255 = getelementptr inbounds i8, i8* %254, i64 1
  %256 = load i8, i8* %255, align 1
  %257 = zext i8 %256 to i16
  %258 = zext i16 %257 to i32
  %259 = shl i32 %258, 8
  %260 = or i32 %252, %259
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %263 = getelementptr inbounds i8, i8* %262, i64 4
  %264 = getelementptr inbounds i8, i8* %263, i64 2
  %265 = getelementptr inbounds i8, i8* %264, i64 0
  %266 = load i8, i8* %265, align 1
  %267 = zext i8 %266 to i16
  %268 = zext i16 %267 to i32
  %269 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %270 = getelementptr inbounds i8, i8* %269, i64 4
  %271 = getelementptr inbounds i8, i8* %270, i64 2
  %272 = getelementptr inbounds i8, i8* %271, i64 1
  %273 = load i8, i8* %272, align 1
  %274 = zext i8 %273 to i16
  %275 = zext i16 %274 to i32
  %276 = shl i32 %275, 8
  %277 = or i32 %268, %276
  %278 = sext i32 %277 to i64
  %279 = shl i64 %278, 16
  %280 = or i64 %261, %279
  store i64 %280, i64* %7, align 8
  br label %380

281:                                              ; preds = %189
  %282 = load i32, i32* @ext_header, align 4
  %283 = icmp ne i32 %282, 0
  br i1 %283, label %284, label %379

284:                                              ; preds = %281
  store i32 0, i32* %8, align 4
  br label %285

285:                                              ; preds = %307, %284
  %286 = load i32, i32* %8, align 4
  %287 = icmp slt i32 %286, 16
  br i1 %287, label %288, label %310

288:                                              ; preds = %285
  %289 = load i32, i32* @inptr, align 4
  %290 = load i32, i32* @insize, align 4
  %291 = icmp ult i32 %289, %290
  br i1 %291, label %292, label %299

292:                                              ; preds = %288
  %293 = load i32, i32* @inptr, align 4
  %294 = add i32 %293, 1
  store i32 %294, i32* @inptr, align 4
  %295 = zext i32 %293 to i64
  %296 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([32832 x i8]* @inbuf to [0 x i8]*), i64 0, i64 %295
  %297 = load i8, i8* %296, align 1
  %298 = zext i8 %297 to i32
  br label %301

299:                                              ; preds = %288
  %300 = call i32 @fill_inbuf(i32 0)
  br label %301

301:                                              ; preds = %299, %292
  %302 = phi i32 [ %298, %292 ], [ %300, %299 ]
  %303 = trunc i32 %302 to i8
  %304 = load i32, i32* %8, align 4
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 %305
  store i8 %303, i8* %306, align 1
  br label %307

307:                                              ; preds = %301
  %308 = load i32, i32* %8, align 4
  %309 = add nsw i32 %308, 1
  store i32 %309, i32* %8, align 4
  br label %285, !llvm.loop !173

310:                                              ; preds = %285
  %311 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %312 = getelementptr inbounds i8, i8* %311, i64 4
  %313 = getelementptr inbounds i8, i8* %312, i64 0
  %314 = load i8, i8* %313, align 1
  %315 = zext i8 %314 to i16
  %316 = zext i16 %315 to i32
  %317 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %318 = getelementptr inbounds i8, i8* %317, i64 4
  %319 = getelementptr inbounds i8, i8* %318, i64 1
  %320 = load i8, i8* %319, align 1
  %321 = zext i8 %320 to i16
  %322 = zext i16 %321 to i32
  %323 = shl i32 %322, 8
  %324 = or i32 %316, %323
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %327 = getelementptr inbounds i8, i8* %326, i64 4
  %328 = getelementptr inbounds i8, i8* %327, i64 2
  %329 = getelementptr inbounds i8, i8* %328, i64 0
  %330 = load i8, i8* %329, align 1
  %331 = zext i8 %330 to i16
  %332 = zext i16 %331 to i32
  %333 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %334 = getelementptr inbounds i8, i8* %333, i64 4
  %335 = getelementptr inbounds i8, i8* %334, i64 2
  %336 = getelementptr inbounds i8, i8* %335, i64 1
  %337 = load i8, i8* %336, align 1
  %338 = zext i8 %337 to i16
  %339 = zext i16 %338 to i32
  %340 = shl i32 %339, 8
  %341 = or i32 %332, %340
  %342 = sext i32 %341 to i64
  %343 = shl i64 %342, 16
  %344 = or i64 %325, %343
  store i64 %344, i64* %6, align 8
  %345 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %346 = getelementptr inbounds i8, i8* %345, i64 12
  %347 = getelementptr inbounds i8, i8* %346, i64 0
  %348 = load i8, i8* %347, align 1
  %349 = zext i8 %348 to i16
  %350 = zext i16 %349 to i32
  %351 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %352 = getelementptr inbounds i8, i8* %351, i64 12
  %353 = getelementptr inbounds i8, i8* %352, i64 1
  %354 = load i8, i8* %353, align 1
  %355 = zext i8 %354 to i16
  %356 = zext i16 %355 to i32
  %357 = shl i32 %356, 8
  %358 = or i32 %350, %357
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %361 = getelementptr inbounds i8, i8* %360, i64 12
  %362 = getelementptr inbounds i8, i8* %361, i64 2
  %363 = getelementptr inbounds i8, i8* %362, i64 0
  %364 = load i8, i8* %363, align 1
  %365 = zext i8 %364 to i16
  %366 = zext i16 %365 to i32
  %367 = getelementptr inbounds [16 x i8], [16 x i8]* %9, i64 0, i64 0
  %368 = getelementptr inbounds i8, i8* %367, i64 12
  %369 = getelementptr inbounds i8, i8* %368, i64 2
  %370 = getelementptr inbounds i8, i8* %369, i64 1
  %371 = load i8, i8* %370, align 1
  %372 = zext i8 %371 to i16
  %373 = zext i16 %372 to i32
  %374 = shl i32 %373, 8
  %375 = or i32 %366, %374
  %376 = sext i32 %375 to i64
  %377 = shl i64 %376, 16
  %378 = or i64 %359, %377
  store i64 %378, i64* %7, align 8
  br label %379

379:                                              ; preds = %310, %281
  br label %380

380:                                              ; preds = %379, %218
  %381 = load i64, i64* %6, align 8
  %382 = call i64 @updcrc(i8* getelementptr inbounds ([18432 x i8], [18432 x i8]* @outbuf, i64 0, i64 0), i32 0)
  %383 = icmp ne i64 %381, %382
  br i1 %383, label %384, label %388

384:                                              ; preds = %380
  %385 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %386 = load i8*, i8** @program_name, align 8
  %387 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %385, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.7.185, i64 0, i64 0), i8* %386, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 1, i32* %10, align 4
  br label %388

388:                                              ; preds = %384, %380
  %389 = load i64, i64* %7, align 8
  %390 = load i64, i64* @bytes_out, align 8
  %391 = and i64 %390, 4294967295
  %392 = icmp ne i64 %389, %391
  br i1 %392, label %393, label %397

393:                                              ; preds = %388
  %394 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %395 = load i8*, i8** @program_name, align 8
  %396 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %394, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.8.186, i64 0, i64 0), i8* %395, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 1, i32* %10, align 4
  br label %397

397:                                              ; preds = %393, %388
  %398 = load i32, i32* @pkzip, align 4
  %399 = icmp ne i32 %398, 0
  br i1 %399, label %400, label %465

400:                                              ; preds = %397
  %401 = load i32, i32* @inptr, align 4
  %402 = add i32 %401, 4
  %403 = load i32, i32* @insize, align 4
  %404 = icmp ult i32 %402, %403
  br i1 %404, label %405, label %465

405:                                              ; preds = %400
  %406 = load i32, i32* @inptr, align 4
  %407 = zext i32 %406 to i64
  %408 = getelementptr inbounds i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 0), i64 %407
  %409 = getelementptr inbounds i8, i8* %408, i64 0
  %410 = load i8, i8* %409, align 1
  %411 = zext i8 %410 to i16
  %412 = zext i16 %411 to i32
  %413 = load i32, i32* @inptr, align 4
  %414 = zext i32 %413 to i64
  %415 = getelementptr inbounds i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 0), i64 %414
  %416 = getelementptr inbounds i8, i8* %415, i64 1
  %417 = load i8, i8* %416, align 1
  %418 = zext i8 %417 to i16
  %419 = zext i16 %418 to i32
  %420 = shl i32 %419, 8
  %421 = or i32 %412, %420
  %422 = sext i32 %421 to i64
  %423 = load i32, i32* @inptr, align 4
  %424 = zext i32 %423 to i64
  %425 = getelementptr inbounds i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 0), i64 %424
  %426 = getelementptr inbounds i8, i8* %425, i64 2
  %427 = getelementptr inbounds i8, i8* %426, i64 0
  %428 = load i8, i8* %427, align 1
  %429 = zext i8 %428 to i16
  %430 = zext i16 %429 to i32
  %431 = load i32, i32* @inptr, align 4
  %432 = zext i32 %431 to i64
  %433 = getelementptr inbounds i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 0), i64 %432
  %434 = getelementptr inbounds i8, i8* %433, i64 2
  %435 = getelementptr inbounds i8, i8* %434, i64 1
  %436 = load i8, i8* %435, align 1
  %437 = zext i8 %436 to i16
  %438 = zext i16 %437 to i32
  %439 = shl i32 %438, 8
  %440 = or i32 %430, %439
  %441 = sext i32 %440 to i64
  %442 = shl i64 %441, 16
  %443 = or i64 %422, %442
  %444 = icmp eq i64 %443, 67324752
  br i1 %444, label %445, label %465

445:                                              ; preds = %405
  %446 = load i32, i32* @to_stdout, align 4
  %447 = icmp ne i32 %446, 0
  br i1 %447, label %448, label %460

448:                                              ; preds = %445
  %449 = load i32, i32* @quiet, align 4
  %450 = icmp ne i32 %449, 0
  br i1 %450, label %455, label %451

451:                                              ; preds = %448
  %452 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %453 = load i8*, i8** @program_name, align 8
  %454 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %452, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.9.187, i64 0, i64 0), i8* %453, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %455

455:                                              ; preds = %451, %448
  %456 = load i32, i32* @exit_code, align 4
  %457 = icmp eq i32 %456, 0
  br i1 %457, label %458, label %459

458:                                              ; preds = %455
  store i32 2, i32* @exit_code, align 4
  br label %459

459:                                              ; preds = %458, %455
  br label %464

460:                                              ; preds = %445
  %461 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %462 = load i8*, i8** @program_name, align 8
  %463 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %461, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.10.188, i64 0, i64 0), i8* %462, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  store i32 1, i32* %10, align 4
  br label %464

464:                                              ; preds = %460, %459
  br label %465

465:                                              ; preds = %464, %405, %400, %397
  store i32 0, i32* @pkzip, align 4
  store i32 0, i32* @ext_header, align 4
  %466 = load i32, i32* %10, align 4
  %467 = icmp eq i32 %466, 0
  br i1 %467, label %468, label %469

468:                                              ; preds = %465
  store i32 0, i32* %3, align 4
  br label %475

469:                                              ; preds = %465
  store i32 1, i32* @exit_code, align 4
  %470 = load i32, i32* @test, align 4
  %471 = icmp ne i32 %470, 0
  br i1 %471, label %473, label %472

472:                                              ; preds = %469
  call void @abort_gzip() #13
  unreachable

473:                                              ; preds = %469
  %474 = load i32, i32* %10, align 4
  store i32 %474, i32* %3, align 4
  br label %475

475:                                              ; preds = %473, %468
  %476 = load i32, i32* %3, align 4
  ret i32 %476
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @copy(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %6 = call i32* @__errno_location() #16
  store i32 0, i32* %6, align 4
  br label %7

7:                                                ; preds = %30, %2
  %8 = load i32, i32* @insize, align 4
  %9 = load i32, i32* @inptr, align 4
  %10 = icmp ugt i32 %8, %9
  br i1 %10, label %11, label %36

11:                                               ; preds = %7
  %12 = load i32, i32* %4, align 4
  %13 = load i32, i32* @inptr, align 4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 0), i64 %14
  %16 = load i32, i32* @insize, align 4
  %17 = load i32, i32* @inptr, align 4
  %18 = sub i32 %16, %17
  call void @write_buf(i32 %12, i8* %15, i32 %18)
  %19 = load i32, i32* @insize, align 4
  %20 = load i32, i32* @inptr, align 4
  %21 = sub i32 %19, %20
  %22 = zext i32 %21 to i64
  %23 = load i64, i64* @bytes_out, align 8
  %24 = add nsw i64 %23, %22
  store i64 %24, i64* @bytes_out, align 8
  %25 = load i32, i32* %3, align 4
  %26 = call i32 @read_buffer(i32 %25, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 0), i32 32768)
  store i32 %26, i32* %5, align 4
  %27 = load i32, i32* %5, align 4
  %28 = icmp eq i32 %27, -1
  br i1 %28, label %29, label %30

29:                                               ; preds = %11
  call void @read_error() #13
  unreachable

30:                                               ; preds = %11
  %31 = load i32, i32* %5, align 4
  %32 = sext i32 %31 to i64
  %33 = load i64, i64* @bytes_in, align 8
  %34 = add nsw i64 %33, %32
  store i64 %34, i64* @bytes_in, align 8
  %35 = load i32, i32* %5, align 4
  store i32 %35, i32* @insize, align 4
  store i32 0, i32* @inptr, align 4
  br label %7, !llvm.loop !174

36:                                               ; preds = %7
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @write_buf(i32 %0, i8* %1, i32 %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  br label %8

8:                                                ; preds = %19, %3
  %9 = load i32, i32* %4, align 4
  %10 = load i8*, i8** %5, align 8
  %11 = load i32, i32* %6, align 4
  %12 = call i32 @write_buffer(i32 %9, i8* %10, i32 %11)
  store i32 %12, i32* %7, align 4
  %13 = load i32, i32* %6, align 4
  %14 = icmp ne i32 %12, %13
  br i1 %14, label %15, label %27

15:                                               ; preds = %8
  %16 = load i32, i32* %7, align 4
  %17 = icmp eq i32 %16, -1
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  call void @write_error() #13
  unreachable

19:                                               ; preds = %15
  %20 = load i32, i32* %7, align 4
  %21 = load i32, i32* %6, align 4
  %22 = sub i32 %21, %20
  store i32 %22, i32* %6, align 4
  %23 = load i8*, i8** %5, align 8
  %24 = load i32, i32* %7, align 4
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds i8, i8* %23, i64 %25
  store i8* %26, i8** %5, align 8
  br label %8, !llvm.loop !175

27:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @read_buffer(i32 %0, i8* %1, i32 %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load i32, i32* %6, align 4
  %10 = icmp ult i32 2147483647, %9
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  store i32 2147483647, i32* %6, align 4
  br label %12

12:                                               ; preds = %11, %3
  %13 = load i32, i32* %4, align 4
  %14 = load i8*, i8** %5, align 8
  %15 = load i32, i32* %6, align 4
  %16 = zext i32 %15 to i64
  %17 = call i64 @read(i32 %13, i8* %14, i64 %16)
  %18 = trunc i64 %17 to i32
  store i32 %18, i32* %7, align 4
  %19 = load i32, i32* %7, align 4
  %20 = icmp slt i32 %19, 0
  br i1 %20, label %21, label %52

21:                                               ; preds = %12
  %22 = call i32* @__errno_location() #16
  %23 = load i32, i32* %22, align 4
  %24 = icmp eq i32 %23, 11
  br i1 %24, label %25, label %52

25:                                               ; preds = %21
  %26 = load i32, i32* %4, align 4
  %27 = call i32 (i32, i32, ...) @rpl_fcntl(i32 %26, i32 3)
  store i32 %27, i32* %8, align 4
  %28 = load i32, i32* %8, align 4
  %29 = icmp sle i32 0, %28
  br i1 %29, label %30, label %51

30:                                               ; preds = %25
  %31 = load i32, i32* %8, align 4
  %32 = and i32 %31, 2048
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %36, label %34

34:                                               ; preds = %30
  %35 = call i32* @__errno_location() #16
  store i32 11, i32* %35, align 4
  br label %50

36:                                               ; preds = %30
  %37 = load i32, i32* %4, align 4
  %38 = load i32, i32* %8, align 4
  %39 = and i32 %38, -2049
  %40 = call i32 (i32, i32, ...) @rpl_fcntl(i32 %37, i32 4, i32 %39)
  %41 = icmp ne i32 %40, -1
  br i1 %41, label %42, label %49

42:                                               ; preds = %36
  %43 = load i32, i32* %4, align 4
  %44 = load i8*, i8** %5, align 8
  %45 = load i32, i32* %6, align 4
  %46 = zext i32 %45 to i64
  %47 = call i64 @read(i32 %43, i8* %44, i64 %46)
  %48 = trunc i64 %47 to i32
  store i32 %48, i32* %7, align 4
  br label %49

49:                                               ; preds = %42, %36
  br label %50

50:                                               ; preds = %49, %34
  br label %51

51:                                               ; preds = %50, %25
  br label %52

52:                                               ; preds = %51, %21, %12
  %53 = load i32, i32* %7, align 4
  ret i32 %53
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal void @read_error() #7 {
  %1 = alloca i32, align 4
  %2 = call i32* @__errno_location() #16
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* %1, align 4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = load i8*, i8** @program_name, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4.197, i64 0, i64 0), i8* %5)
  %7 = load i32, i32* %1, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %12

9:                                                ; preds = %0
  %10 = load i32, i32* %1, align 4
  %11 = call i32* @__errno_location() #16
  store i32 %10, i32* %11, align 4
  call void @perror(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %15

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.5.198, i64 0, i64 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %15

15:                                               ; preds = %12, %9
  call void @abort_gzip() #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @write_buffer(i32 %0, i8* %1, i32 %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  %8 = icmp ult i32 2147483647, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %3
  store i32 2147483647, i32* %6, align 4
  br label %10

10:                                               ; preds = %9, %3
  %11 = load i32, i32* %4, align 4
  %12 = load i8*, i8** %5, align 8
  %13 = load i32, i32* %6, align 4
  %14 = zext i32 %13 to i64
  %15 = call i64 @write(i32 %11, i8* %12, i64 %14)
  %16 = trunc i64 %15 to i32
  ret i32 %16
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal void @write_error() #7 {
  %1 = alloca i32, align 4
  %2 = call i32* @__errno_location() #16
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* %1, align 4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = load i8*, i8** @program_name, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4.197, i64 0, i64 0), i8* %5)
  %7 = load i32, i32* %1, align 4
  %8 = call i32* @__errno_location() #16
  store i32 %7, i32* %8, align 4
  call void @perror(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ofname, i64 0, i64 0))
  call void @abort_gzip() #13
  unreachable
}

declare dso_local i64 @write(i32, i8*, i64) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @updcrc(i8* %0, i32 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load i8*, i8** %3, align 8
  %7 = icmp eq i8* %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i64 4294967295, i64* %5, align 8
  br label %35

9:                                                ; preds = %2
  %10 = load i64, i64* @updcrc.crc, align 8
  store i64 %10, i64* %5, align 8
  %11 = load i32, i32* %4, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %34

13:                                               ; preds = %9
  br label %14

14:                                               ; preds = %29, %13
  %15 = load i64, i64* %5, align 8
  %16 = trunc i64 %15 to i32
  %17 = load i8*, i8** %3, align 8
  %18 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %18, i8** %3, align 8
  %19 = load i8, i8* %17, align 1
  %20 = zext i8 %19 to i32
  %21 = xor i32 %16, %20
  %22 = and i32 %21, 255
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [256 x i64], [256 x i64]* @crc_32_tab, i64 0, i64 %23
  %25 = load i64, i64* %24, align 8
  %26 = load i64, i64* %5, align 8
  %27 = lshr i64 %26, 8
  %28 = xor i64 %25, %27
  store i64 %28, i64* %5, align 8
  br label %29

29:                                               ; preds = %14
  %30 = load i32, i32* %4, align 4
  %31 = add i32 %30, -1
  store i32 %31, i32* %4, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %14, label %33, !llvm.loop !176

33:                                               ; preds = %29
  br label %34

34:                                               ; preds = %33, %9
  br label %35

35:                                               ; preds = %34, %8
  %36 = load i64, i64* %5, align 8
  store i64 %36, i64* @updcrc.crc, align 8
  %37 = load i64, i64* %5, align 8
  %38 = xor i64 %37, 4294967295
  ret i64 %38
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @clear_bufs() #0 {
  store i32 0, i32* @outcnt, align 4
  store i32 0, i32* @inptr, align 4
  store i32 0, i32* @insize, align 4
  store i64 0, i64* @bytes_out, align 8
  store i64 0, i64* @bytes_in, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @fill_inbuf(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 0, i32* @insize, align 4
  br label %5

5:                                                ; preds = %24, %1
  %6 = load i32, i32* @ifd, align 4
  %7 = load i32, i32* @insize, align 4
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 0), i64 %8
  %10 = load i32, i32* @insize, align 4
  %11 = sub i32 32768, %10
  %12 = call i32 @read_buffer(i32 %6, i8* %9, i32 %11)
  store i32 %12, i32* %4, align 4
  %13 = load i32, i32* %4, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %5
  br label %27

16:                                               ; preds = %5
  %17 = load i32, i32* %4, align 4
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  call void @read_error() #13
  unreachable

20:                                               ; preds = %16
  %21 = load i32, i32* %4, align 4
  %22 = load i32, i32* @insize, align 4
  %23 = add i32 %22, %21
  store i32 %23, i32* @insize, align 4
  br label %24

24:                                               ; preds = %20
  %25 = load i32, i32* @insize, align 4
  %26 = icmp ult i32 %25, 32768
  br i1 %26, label %5, label %27, !llvm.loop !177

27:                                               ; preds = %24, %15
  %28 = load i32, i32* @insize, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %36

30:                                               ; preds = %27
  %31 = load i32, i32* %3, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %34

33:                                               ; preds = %30
  store i32 -1, i32* %2, align 4
  br label %43

34:                                               ; preds = %30
  call void @flush_window()
  %35 = call i32* @__errno_location() #16
  store i32 0, i32* %35, align 4
  call void @read_error() #13
  unreachable

36:                                               ; preds = %27
  %37 = load i32, i32* @insize, align 4
  %38 = zext i32 %37 to i64
  %39 = load i64, i64* @bytes_in, align 8
  %40 = add nsw i64 %39, %38
  store i64 %40, i64* @bytes_in, align 8
  store i32 1, i32* @inptr, align 4
  %41 = load i8, i8* getelementptr inbounds ([32832 x i8], [32832 x i8]* @inbuf, i64 0, i64 0), align 1
  %42 = zext i8 %41 to i32
  store i32 %42, i32* %2, align 4
  br label %43

43:                                               ; preds = %36, %33
  %44 = load i32, i32* %2, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @flush_window() #0 {
  %1 = load i32, i32* @outcnt, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %0
  br label %17

4:                                                ; preds = %0
  %5 = load i32, i32* @outcnt, align 4
  %6 = call i64 @updcrc(i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i32 %5)
  %7 = load i32, i32* @test, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %4
  %10 = load i32, i32* @ofd, align 4
  %11 = load i32, i32* @outcnt, align 4
  call void @write_buf(i32 %10, i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @window, i64 0, i64 0), i32 %11)
  br label %12

12:                                               ; preds = %9, %4
  %13 = load i32, i32* @outcnt, align 4
  %14 = zext i32 %13 to i64
  %15 = load i64, i64* @bytes_out, align 8
  %16 = add nsw i64 %15, %14
  store i64 %16, i64* @bytes_out, align 8
  store i32 0, i32* @outcnt, align 4
  br label %17

17:                                               ; preds = %12, %3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @flush_outbuf() #0 {
  %1 = load i32, i32* @outcnt, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %0
  br label %11

4:                                                ; preds = %0
  %5 = load i32, i32* @ofd, align 4
  %6 = load i32, i32* @outcnt, align 4
  call void @write_buf(i32 %5, i8* getelementptr inbounds ([18432 x i8], [18432 x i8]* @outbuf, i64 0, i64 0), i32 %6)
  %7 = load i32, i32* @outcnt, align 4
  %8 = zext i32 %7 to i64
  %9 = load i64, i64* @bytes_out, align 8
  %10 = add nsw i64 %9, %8
  store i64 %10, i64* @bytes_out, align 8
  store i32 0, i32* @outcnt, align 4
  br label %11

11:                                               ; preds = %4, %3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @strlwr(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  store i8* %4, i8** %3, align 8
  br label %5

5:                                                ; preds = %34, %1
  %6 = load i8*, i8** %3, align 8
  %7 = load i8, i8* %6, align 1
  %8 = icmp ne i8 %7, 0
  br i1 %8, label %9, label %37

9:                                                ; preds = %5
  %10 = call i16** @__ctype_b_loc() #16
  %11 = load i16*, i16** %10, align 8
  %12 = load i8*, i8** %3, align 8
  %13 = load i8, i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i16, i16* %11, i64 %15
  %17 = load i16, i16* %16, align 2
  %18 = zext i16 %17 to i32
  %19 = and i32 %18, 256
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %26

21:                                               ; preds = %9
  %22 = load i8*, i8** %3, align 8
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = call i32 @tolower(i32 %24) #14
  br label %30

26:                                               ; preds = %9
  %27 = load i8*, i8** %3, align 8
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i32
  br label %30

30:                                               ; preds = %26, %21
  %31 = phi i32 [ %25, %21 ], [ %29, %26 ]
  %32 = trunc i32 %31 to i8
  %33 = load i8*, i8** %3, align 8
  store i8 %32, i8* %33, align 1
  br label %34

34:                                               ; preds = %30
  %35 = load i8*, i8** %3, align 8
  %36 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %36, i8** %3, align 8
  br label %5, !llvm.loop !178

37:                                               ; preds = %5
  %38 = load i8*, i8** %2, align 8
  ret i8* %38
}

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #8

; Function Attrs: nounwind readonly
declare dso_local i32 @tolower(i32) #4

; Function Attrs: noinline nounwind optnone readonly uwtable
define internal i8* @gzip_base_name(i8* %0) #11 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i8* @last_component(i8* %3) #14
  store i8* %4, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  ret i8* %5
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @xunlink(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i32 @unlink(i8* %4) #15
  store i32 %5, i32* %3, align 4
  %6 = load i32, i32* %3, align 4
  ret i32 %6
}

; Function Attrs: nounwind
declare dso_local i32 @unlink(i8*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @add_envopt(i32* %0, i8*** %1, i8* %2) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i8***, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i8**, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  store i32* %0, i32** %5, align 8
  store i8*** %1, i8**** %6, align 8
  store i8* %2, i8** %7, align 8
  store i32 0, i32* %11, align 4
  %13 = load i8*, i8** %7, align 8
  %14 = call i8* @getenv(i8* %13) #15
  store i8* %14, i8** %12, align 8
  %15 = load i8*, i8** %12, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %3
  store i8* null, i8** %4, align 8
  br label %99

18:                                               ; preds = %3
  %19 = load i8*, i8** %12, align 8
  %20 = call noalias i8* @xstrdup(i8* %19)
  store i8* %20, i8** %12, align 8
  %21 = load i8*, i8** %12, align 8
  store i8* %21, i8** %8, align 8
  br label %22

22:                                               ; preds = %48, %18
  %23 = load i8*, i8** %8, align 8
  %24 = load i8, i8* %23, align 1
  %25 = icmp ne i8 %24, 0
  br i1 %25, label %26, label %51

26:                                               ; preds = %22
  %27 = load i8*, i8** %8, align 8
  %28 = call i64 @strspn(i8* %27, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.219, i64 0, i64 0)) #14
  %29 = load i8*, i8** %8, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 %28
  store i8* %30, i8** %8, align 8
  %31 = load i8*, i8** %8, align 8
  %32 = load i8, i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %26
  br label %51

36:                                               ; preds = %26
  %37 = load i8*, i8** %8, align 8
  %38 = call i64 @strcspn(i8* %37, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.219, i64 0, i64 0)) #14
  %39 = load i8*, i8** %8, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 %38
  store i8* %40, i8** %8, align 8
  %41 = load i8*, i8** %8, align 8
  %42 = load i8, i8* %41, align 1
  %43 = icmp ne i8 %42, 0
  br i1 %43, label %44, label %47

44:                                               ; preds = %36
  %45 = load i8*, i8** %8, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %8, align 8
  store i8 0, i8* %45, align 1
  br label %47

47:                                               ; preds = %44, %36
  br label %48

48:                                               ; preds = %47
  %49 = load i32, i32* %11, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %11, align 4
  br label %22, !llvm.loop !179

51:                                               ; preds = %35, %22
  %52 = load i32, i32* %11, align 4
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %56

54:                                               ; preds = %51
  %55 = load i8*, i8** %12, align 8
  call void @free(i8* %55) #15
  store i8* null, i8** %4, align 8
  br label %99

56:                                               ; preds = %51
  %57 = load i32, i32* %11, align 4
  %58 = add nsw i32 %57, 1
  %59 = load i32*, i32** %5, align 8
  store i32 %58, i32* %59, align 4
  %60 = load i32*, i32** %5, align 8
  %61 = load i32, i32* %60, align 4
  %62 = add nsw i32 %61, 1
  %63 = sext i32 %62 to i64
  %64 = call noalias i8* @xcalloc(i64 %63, i64 8)
  %65 = bitcast i8* %64 to i8**
  store i8** %65, i8*** %10, align 8
  %66 = load i8***, i8**** %6, align 8
  %67 = load i8**, i8*** %66, align 8
  store i8** %67, i8*** %9, align 8
  %68 = load i8**, i8*** %10, align 8
  %69 = load i8***, i8**** %6, align 8
  store i8** %68, i8*** %69, align 8
  %70 = load i8**, i8*** %9, align 8
  %71 = load i8*, i8** %70, align 8
  %72 = load i8**, i8*** %10, align 8
  %73 = getelementptr inbounds i8*, i8** %72, i32 1
  store i8** %73, i8*** %10, align 8
  store i8* %71, i8** %72, align 8
  %74 = load i8*, i8** %12, align 8
  store i8* %74, i8** %8, align 8
  br label %75

75:                                               ; preds = %93, %56
  %76 = load i32, i32* %11, align 4
  %77 = icmp sgt i32 %76, 0
  br i1 %77, label %78, label %96

78:                                               ; preds = %75
  %79 = load i8*, i8** %8, align 8
  %80 = call i64 @strspn(i8* %79, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.219, i64 0, i64 0)) #14
  %81 = load i8*, i8** %8, align 8
  %82 = getelementptr inbounds i8, i8* %81, i64 %80
  store i8* %82, i8** %8, align 8
  %83 = load i8*, i8** %8, align 8
  %84 = load i8**, i8*** %10, align 8
  %85 = getelementptr inbounds i8*, i8** %84, i32 1
  store i8** %85, i8*** %10, align 8
  store i8* %83, i8** %84, align 8
  br label %86

86:                                               ; preds = %91, %78
  %87 = load i8*, i8** %8, align 8
  %88 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %88, i8** %8, align 8
  %89 = load i8, i8* %87, align 1
  %90 = icmp ne i8 %89, 0
  br i1 %90, label %91, label %92

91:                                               ; preds = %86
  br label %86, !llvm.loop !180

92:                                               ; preds = %86
  br label %93

93:                                               ; preds = %92
  %94 = load i32, i32* %11, align 4
  %95 = add nsw i32 %94, -1
  store i32 %95, i32* %11, align 4
  br label %75, !llvm.loop !181

96:                                               ; preds = %75
  %97 = load i8**, i8*** %10, align 8
  store i8* null, i8** %97, align 8
  %98 = load i8*, i8** %12, align 8
  store i8* %98, i8** %4, align 8
  br label %99

99:                                               ; preds = %96, %54, %17
  %100 = load i8*, i8** %4, align 8
  ret i8* %100
}

; Function Attrs: nounwind
declare dso_local i8* @getenv(i8*) #5

; Function Attrs: nounwind readonly
declare dso_local i64 @strspn(i8*, i8*) #4

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal void @gzip_error(i8* %0) #7 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = load i8*, i8** @program_name, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1.222, i64 0, i64 0), i8* %4, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i8* %5)
  call void @abort_gzip() #13
  unreachable
}

; Function Attrs: noinline noreturn nounwind optnone uwtable
define internal void @xalloc_die() #7 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = load i8*, i8** @program_name, align 8
  %3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2.225, i64 0, i64 0), i8* %2)
  call void @abort_gzip() #13
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @warning(i8* %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i32, i32* @quiet, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %10, label %5

5:                                                ; preds = %1
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = load i8*, i8** @program_name, align 8
  %8 = load i8*, i8** %2, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3.228, i64 0, i64 0), i8* %7, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0), i8* %8)
  br label %10

10:                                               ; preds = %5, %1
  %11 = load i32, i32* @exit_code, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  store i32 2, i32* @exit_code, align 4
  br label %14

14:                                               ; preds = %13, %10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @display_ratio(i64 %0, i64 %1, %struct._IO_FILE* %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  store %struct._IO_FILE* %2, %struct._IO_FILE** %6, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %8 = load i64, i64* %5, align 8
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %3
  br label %18

11:                                               ; preds = %3
  %12 = load i64, i64* %4, align 8
  %13 = sitofp i64 %12 to double
  %14 = fmul double 1.000000e+02, %13
  %15 = load i64, i64* %5, align 8
  %16 = sitofp i64 %15 to double
  %17 = fdiv double %14, %16
  br label %18

18:                                               ; preds = %11, %10
  %19 = phi double [ 0.000000e+00, %10 ], [ %17, %11 ]
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6.231, i64 0, i64 0), double %19)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @fprint_off(%struct._IO_FILE* %0, i64 %1, i32 %2) #0 {
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca [64 x i8], align 16
  %8 = alloca i8*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store i64 %1, i64* %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 0
  %10 = getelementptr inbounds i8, i8* %9, i64 64
  store i8* %10, i8** %8, align 8
  %11 = load i64, i64* %5, align 8
  %12 = icmp slt i64 %11, 0
  br i1 %12, label %13, label %28

13:                                               ; preds = %3
  br label %14

14:                                               ; preds = %21, %13
  %15 = load i64, i64* %5, align 8
  %16 = srem i64 %15, 10
  %17 = sub nsw i64 48, %16
  %18 = trunc i64 %17 to i8
  %19 = load i8*, i8** %8, align 8
  %20 = getelementptr inbounds i8, i8* %19, i32 -1
  store i8* %20, i8** %8, align 8
  store i8 %18, i8* %20, align 1
  br label %21

21:                                               ; preds = %14
  %22 = load i64, i64* %5, align 8
  %23 = sdiv i64 %22, 10
  store i64 %23, i64* %5, align 8
  %24 = icmp ne i64 %23, 0
  br i1 %24, label %14, label %25, !llvm.loop !182

25:                                               ; preds = %21
  %26 = load i8*, i8** %8, align 8
  %27 = getelementptr inbounds i8, i8* %26, i32 -1
  store i8* %27, i8** %8, align 8
  store i8 45, i8* %27, align 1
  br label %41

28:                                               ; preds = %3
  br label %29

29:                                               ; preds = %36, %28
  %30 = load i64, i64* %5, align 8
  %31 = srem i64 %30, 10
  %32 = add nsw i64 48, %31
  %33 = trunc i64 %32 to i8
  %34 = load i8*, i8** %8, align 8
  %35 = getelementptr inbounds i8, i8* %34, i32 -1
  store i8* %35, i8** %8, align 8
  store i8 %33, i8* %35, align 1
  br label %36

36:                                               ; preds = %29
  %37 = load i64, i64* %5, align 8
  %38 = sdiv i64 %37, 10
  store i64 %38, i64* %5, align 8
  %39 = icmp ne i64 %38, 0
  br i1 %39, label %29, label %40, !llvm.loop !183

40:                                               ; preds = %36
  br label %41

41:                                               ; preds = %40, %25
  %42 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 0
  %43 = getelementptr inbounds i8, i8* %42, i64 64
  %44 = load i8*, i8** %8, align 8
  %45 = ptrtoint i8* %43 to i64
  %46 = ptrtoint i8* %44 to i64
  %47 = sub i64 %45, %46
  %48 = load i32, i32* %6, align 4
  %49 = sext i32 %48 to i64
  %50 = sub nsw i64 %49, %47
  %51 = trunc i64 %50 to i32
  store i32 %51, i32* %6, align 4
  br label %52

52:                                               ; preds = %56, %41
  %53 = load i32, i32* %6, align 4
  %54 = add nsw i32 %53, -1
  store i32 %54, i32* %6, align 4
  %55 = icmp slt i32 0, %53
  br i1 %55, label %56, label %59

56:                                               ; preds = %52
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %58 = call i32 @putc(i32 32, %struct._IO_FILE* %57)
  br label %52, !llvm.loop !184

59:                                               ; preds = %52
  br label %60

60:                                               ; preds = %71, %59
  %61 = load i8*, i8** %8, align 8
  %62 = getelementptr inbounds [64 x i8], [64 x i8]* %7, i64 0, i64 0
  %63 = getelementptr inbounds i8, i8* %62, i64 64
  %64 = icmp ult i8* %61, %63
  br i1 %64, label %65, label %74

65:                                               ; preds = %60
  %66 = load i8*, i8** %8, align 8
  %67 = load i8, i8* %66, align 1
  %68 = sext i8 %67 to i32
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %70 = call i32 @putc(i32 %68, %struct._IO_FILE* %69)
  br label %71

71:                                               ; preds = %65
  %72 = load i8*, i8** %8, align 8
  %73 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %73, i8** %8, align 8
  br label %60, !llvm.loop !185

74:                                               ; preds = %60
  ret void
}

declare dso_local i32 @putc(i32, %struct._IO_FILE*) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @zip(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  store i8 0, i8* %5, align 1
  store i16 0, i16* %6, align 2
  store i16 0, i16* %7, align 2
  %10 = load i32, i32* %3, align 4
  store i32 %10, i32* @ifd, align 4
  %11 = load i32, i32* %4, align 4
  store i32 %11, i32* @ofd, align 4
  store i32 0, i32* @outcnt, align 4
  store i32 8, i32* @method, align 4
  %12 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.236, i64 0, i64 0), align 1
  %13 = load i32, i32* @outcnt, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* @outcnt, align 4
  %15 = zext i32 %13 to i64
  %16 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %15
  store i8 %12, i8* %16, align 1
  %17 = load i32, i32* @outcnt, align 4
  %18 = icmp eq i32 %17, 16384
  br i1 %18, label %19, label %20

19:                                               ; preds = %2
  call void @flush_outbuf()
  br label %20

20:                                               ; preds = %19, %2
  %21 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.236, i64 0, i64 1), align 1
  %22 = load i32, i32* @outcnt, align 4
  %23 = add i32 %22, 1
  store i32 %23, i32* @outcnt, align 4
  %24 = zext i32 %22 to i64
  %25 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %24
  store i8 %21, i8* %25, align 1
  %26 = load i32, i32* @outcnt, align 4
  %27 = icmp eq i32 %26, 16384
  br i1 %27, label %28, label %29

28:                                               ; preds = %20
  call void @flush_outbuf()
  br label %29

29:                                               ; preds = %28, %20
  %30 = load i32, i32* @outcnt, align 4
  %31 = add i32 %30, 1
  store i32 %31, i32* @outcnt, align 4
  %32 = zext i32 %30 to i64
  %33 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %32
  store i8 8, i8* %33, align 1
  %34 = load i32, i32* @outcnt, align 4
  %35 = icmp eq i32 %34, 16384
  br i1 %35, label %36, label %37

36:                                               ; preds = %29
  call void @flush_outbuf()
  br label %37

37:                                               ; preds = %36, %29
  %38 = load i32, i32* @save_orig_name, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %45

40:                                               ; preds = %37
  %41 = load i8, i8* %5, align 1
  %42 = zext i8 %41 to i32
  %43 = or i32 %42, 8
  %44 = trunc i32 %43 to i8
  store i8 %44, i8* %5, align 1
  br label %45

45:                                               ; preds = %40, %37
  %46 = load i8, i8* %5, align 1
  %47 = load i32, i32* @outcnt, align 4
  %48 = add i32 %47, 1
  store i32 %48, i32* @outcnt, align 4
  %49 = zext i32 %47 to i64
  %50 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %49
  store i8 %46, i8* %50, align 1
  %51 = load i32, i32* @outcnt, align 4
  %52 = icmp eq i32 %51, 16384
  br i1 %52, label %53, label %54

53:                                               ; preds = %45
  call void @flush_outbuf()
  br label %54

54:                                               ; preds = %53, %45
  %55 = load i64, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 1), align 8
  %56 = icmp slt i64 %55, 0
  br i1 %56, label %57, label %58

57:                                               ; preds = %54
  store i64 0, i64* %8, align 8
  br label %68

58:                                               ; preds = %54
  %59 = load i64, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 0), align 8
  %60 = icmp slt i64 0, %59
  br i1 %60, label %61, label %66

61:                                               ; preds = %58
  %62 = load i64, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 0), align 8
  %63 = icmp sle i64 %62, 4294967295
  br i1 %63, label %64, label %66

64:                                               ; preds = %61
  %65 = load i64, i64* getelementptr inbounds (%struct.timespec, %struct.timespec* @time_stamp, i32 0, i32 0), align 8
  store i64 %65, i64* %8, align 8
  br label %67

66:                                               ; preds = %61, %58
  call void @warning(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1.237, i64 0, i64 0))
  store i64 0, i64* %8, align 8
  br label %67

67:                                               ; preds = %66, %64
  br label %68

68:                                               ; preds = %67, %57
  %69 = load i32, i32* @outcnt, align 4
  %70 = icmp ult i32 %69, 16382
  br i1 %70, label %71, label %90

71:                                               ; preds = %68
  %72 = load i64, i64* %8, align 8
  %73 = and i64 %72, 65535
  %74 = and i64 %73, 255
  %75 = trunc i64 %74 to i8
  %76 = load i32, i32* @outcnt, align 4
  %77 = add i32 %76, 1
  store i32 %77, i32* @outcnt, align 4
  %78 = zext i32 %76 to i64
  %79 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %78
  store i8 %75, i8* %79, align 1
  %80 = load i64, i64* %8, align 8
  %81 = and i64 %80, 65535
  %82 = trunc i64 %81 to i16
  %83 = zext i16 %82 to i32
  %84 = ashr i32 %83, 8
  %85 = trunc i32 %84 to i8
  %86 = load i32, i32* @outcnt, align 4
  %87 = add i32 %86, 1
  store i32 %87, i32* @outcnt, align 4
  %88 = zext i32 %86 to i64
  %89 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %88
  store i8 %85, i8* %89, align 1
  br label %117

90:                                               ; preds = %68
  %91 = load i64, i64* %8, align 8
  %92 = and i64 %91, 65535
  %93 = and i64 %92, 255
  %94 = trunc i64 %93 to i8
  %95 = load i32, i32* @outcnt, align 4
  %96 = add i32 %95, 1
  store i32 %96, i32* @outcnt, align 4
  %97 = zext i32 %95 to i64
  %98 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %97
  store i8 %94, i8* %98, align 1
  %99 = load i32, i32* @outcnt, align 4
  %100 = icmp eq i32 %99, 16384
  br i1 %100, label %101, label %102

101:                                              ; preds = %90
  call void @flush_outbuf()
  br label %102

102:                                              ; preds = %101, %90
  %103 = load i64, i64* %8, align 8
  %104 = and i64 %103, 65535
  %105 = trunc i64 %104 to i16
  %106 = zext i16 %105 to i32
  %107 = ashr i32 %106, 8
  %108 = trunc i32 %107 to i8
  %109 = load i32, i32* @outcnt, align 4
  %110 = add i32 %109, 1
  store i32 %110, i32* @outcnt, align 4
  %111 = zext i32 %109 to i64
  %112 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %111
  store i8 %108, i8* %112, align 1
  %113 = load i32, i32* @outcnt, align 4
  %114 = icmp eq i32 %113, 16384
  br i1 %114, label %115, label %116

115:                                              ; preds = %102
  call void @flush_outbuf()
  br label %116

116:                                              ; preds = %115, %102
  br label %117

117:                                              ; preds = %116, %71
  %118 = load i32, i32* @outcnt, align 4
  %119 = icmp ult i32 %118, 16382
  br i1 %119, label %120, label %139

120:                                              ; preds = %117
  %121 = load i64, i64* %8, align 8
  %122 = lshr i64 %121, 16
  %123 = and i64 %122, 255
  %124 = trunc i64 %123 to i8
  %125 = load i32, i32* @outcnt, align 4
  %126 = add i32 %125, 1
  store i32 %126, i32* @outcnt, align 4
  %127 = zext i32 %125 to i64
  %128 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %127
  store i8 %124, i8* %128, align 1
  %129 = load i64, i64* %8, align 8
  %130 = lshr i64 %129, 16
  %131 = trunc i64 %130 to i16
  %132 = zext i16 %131 to i32
  %133 = ashr i32 %132, 8
  %134 = trunc i32 %133 to i8
  %135 = load i32, i32* @outcnt, align 4
  %136 = add i32 %135, 1
  store i32 %136, i32* @outcnt, align 4
  %137 = zext i32 %135 to i64
  %138 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %137
  store i8 %134, i8* %138, align 1
  br label %166

139:                                              ; preds = %117
  %140 = load i64, i64* %8, align 8
  %141 = lshr i64 %140, 16
  %142 = and i64 %141, 255
  %143 = trunc i64 %142 to i8
  %144 = load i32, i32* @outcnt, align 4
  %145 = add i32 %144, 1
  store i32 %145, i32* @outcnt, align 4
  %146 = zext i32 %144 to i64
  %147 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %146
  store i8 %143, i8* %147, align 1
  %148 = load i32, i32* @outcnt, align 4
  %149 = icmp eq i32 %148, 16384
  br i1 %149, label %150, label %151

150:                                              ; preds = %139
  call void @flush_outbuf()
  br label %151

151:                                              ; preds = %150, %139
  %152 = load i64, i64* %8, align 8
  %153 = lshr i64 %152, 16
  %154 = trunc i64 %153 to i16
  %155 = zext i16 %154 to i32
  %156 = ashr i32 %155, 8
  %157 = trunc i32 %156 to i8
  %158 = load i32, i32* @outcnt, align 4
  %159 = add i32 %158, 1
  store i32 %159, i32* @outcnt, align 4
  %160 = zext i32 %158 to i64
  %161 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %160
  store i8 %157, i8* %161, align 1
  %162 = load i32, i32* @outcnt, align 4
  %163 = icmp eq i32 %162, 16384
  br i1 %163, label %164, label %165

164:                                              ; preds = %151
  call void @flush_outbuf()
  br label %165

165:                                              ; preds = %164, %151
  br label %166

166:                                              ; preds = %165, %120
  %167 = call i64 @updcrc(i8* null, i32 0)
  store i64 %167, i64* @crc, align 8
  %168 = load i32, i32* %4, align 4
  call void @bi_init(i32 %168)
  call void @ct_init(i16* %6, i32* @method)
  %169 = load i32, i32* @level, align 4
  call void @lm_init(i32 %169, i16* %7)
  %170 = load i16, i16* %7, align 2
  %171 = trunc i16 %170 to i8
  %172 = load i32, i32* @outcnt, align 4
  %173 = add i32 %172, 1
  store i32 %173, i32* @outcnt, align 4
  %174 = zext i32 %172 to i64
  %175 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %174
  store i8 %171, i8* %175, align 1
  %176 = load i32, i32* @outcnt, align 4
  %177 = icmp eq i32 %176, 16384
  br i1 %177, label %178, label %179

178:                                              ; preds = %166
  call void @flush_outbuf()
  br label %179

179:                                              ; preds = %178, %166
  %180 = load i32, i32* @outcnt, align 4
  %181 = add i32 %180, 1
  store i32 %181, i32* @outcnt, align 4
  %182 = zext i32 %180 to i64
  %183 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %182
  store i8 3, i8* %183, align 1
  %184 = load i32, i32* @outcnt, align 4
  %185 = icmp eq i32 %184, 16384
  br i1 %185, label %186, label %187

186:                                              ; preds = %179
  call void @flush_outbuf()
  br label %187

187:                                              ; preds = %186, %179
  %188 = load i32, i32* @save_orig_name, align 4
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %190, label %209

190:                                              ; preds = %187
  %191 = call i8* @gzip_base_name(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0)) #14
  store i8* %191, i8** %9, align 8
  br label %192

192:                                              ; preds = %203, %190
  %193 = load i8*, i8** %9, align 8
  %194 = load i8, i8* %193, align 1
  %195 = load i32, i32* @outcnt, align 4
  %196 = add i32 %195, 1
  store i32 %196, i32* @outcnt, align 4
  %197 = zext i32 %195 to i64
  %198 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %197
  store i8 %194, i8* %198, align 1
  %199 = load i32, i32* @outcnt, align 4
  %200 = icmp eq i32 %199, 16384
  br i1 %200, label %201, label %202

201:                                              ; preds = %192
  call void @flush_outbuf()
  br label %202

202:                                              ; preds = %201, %192
  br label %203

203:                                              ; preds = %202
  %204 = load i8*, i8** %9, align 8
  %205 = getelementptr inbounds i8, i8* %204, i32 1
  store i8* %205, i8** %9, align 8
  %206 = load i8, i8* %204, align 1
  %207 = icmp ne i8 %206, 0
  br i1 %207, label %192, label %208, !llvm.loop !186

208:                                              ; preds = %203
  br label %209

209:                                              ; preds = %208, %187
  %210 = load i32, i32* @outcnt, align 4
  %211 = zext i32 %210 to i64
  store i64 %211, i64* @header_bytes, align 8
  %212 = call i64 @deflate()
  %213 = load i64, i64* @ifile_size, align 8
  %214 = icmp ne i64 %213, -1
  br i1 %214, label %215, label %223

215:                                              ; preds = %209
  %216 = load i64, i64* @bytes_in, align 8
  %217 = load i64, i64* @ifile_size, align 8
  %218 = icmp ne i64 %216, %217
  br i1 %218, label %219, label %223

219:                                              ; preds = %215
  %220 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %221 = load i8*, i8** @program_name, align 8
  %222 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %220, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.2.240, i64 0, i64 0), i8* %221, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @ifname, i64 0, i64 0))
  br label %223

223:                                              ; preds = %219, %215, %209
  %224 = load i32, i32* @outcnt, align 4
  %225 = icmp ult i32 %224, 16382
  br i1 %225, label %226, label %245

226:                                              ; preds = %223
  %227 = load i64, i64* @crc, align 8
  %228 = and i64 %227, 65535
  %229 = and i64 %228, 255
  %230 = trunc i64 %229 to i8
  %231 = load i32, i32* @outcnt, align 4
  %232 = add i32 %231, 1
  store i32 %232, i32* @outcnt, align 4
  %233 = zext i32 %231 to i64
  %234 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %233
  store i8 %230, i8* %234, align 1
  %235 = load i64, i64* @crc, align 8
  %236 = and i64 %235, 65535
  %237 = trunc i64 %236 to i16
  %238 = zext i16 %237 to i32
  %239 = ashr i32 %238, 8
  %240 = trunc i32 %239 to i8
  %241 = load i32, i32* @outcnt, align 4
  %242 = add i32 %241, 1
  store i32 %242, i32* @outcnt, align 4
  %243 = zext i32 %241 to i64
  %244 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %243
  store i8 %240, i8* %244, align 1
  br label %272

245:                                              ; preds = %223
  %246 = load i64, i64* @crc, align 8
  %247 = and i64 %246, 65535
  %248 = and i64 %247, 255
  %249 = trunc i64 %248 to i8
  %250 = load i32, i32* @outcnt, align 4
  %251 = add i32 %250, 1
  store i32 %251, i32* @outcnt, align 4
  %252 = zext i32 %250 to i64
  %253 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %252
  store i8 %249, i8* %253, align 1
  %254 = load i32, i32* @outcnt, align 4
  %255 = icmp eq i32 %254, 16384
  br i1 %255, label %256, label %257

256:                                              ; preds = %245
  call void @flush_outbuf()
  br label %257

257:                                              ; preds = %256, %245
  %258 = load i64, i64* @crc, align 8
  %259 = and i64 %258, 65535
  %260 = trunc i64 %259 to i16
  %261 = zext i16 %260 to i32
  %262 = ashr i32 %261, 8
  %263 = trunc i32 %262 to i8
  %264 = load i32, i32* @outcnt, align 4
  %265 = add i32 %264, 1
  store i32 %265, i32* @outcnt, align 4
  %266 = zext i32 %264 to i64
  %267 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %266
  store i8 %263, i8* %267, align 1
  %268 = load i32, i32* @outcnt, align 4
  %269 = icmp eq i32 %268, 16384
  br i1 %269, label %270, label %271

270:                                              ; preds = %257
  call void @flush_outbuf()
  br label %271

271:                                              ; preds = %270, %257
  br label %272

272:                                              ; preds = %271, %226
  %273 = load i32, i32* @outcnt, align 4
  %274 = icmp ult i32 %273, 16382
  br i1 %274, label %275, label %294

275:                                              ; preds = %272
  %276 = load i64, i64* @crc, align 8
  %277 = lshr i64 %276, 16
  %278 = and i64 %277, 255
  %279 = trunc i64 %278 to i8
  %280 = load i32, i32* @outcnt, align 4
  %281 = add i32 %280, 1
  store i32 %281, i32* @outcnt, align 4
  %282 = zext i32 %280 to i64
  %283 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %282
  store i8 %279, i8* %283, align 1
  %284 = load i64, i64* @crc, align 8
  %285 = lshr i64 %284, 16
  %286 = trunc i64 %285 to i16
  %287 = zext i16 %286 to i32
  %288 = ashr i32 %287, 8
  %289 = trunc i32 %288 to i8
  %290 = load i32, i32* @outcnt, align 4
  %291 = add i32 %290, 1
  store i32 %291, i32* @outcnt, align 4
  %292 = zext i32 %290 to i64
  %293 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %292
  store i8 %289, i8* %293, align 1
  br label %321

294:                                              ; preds = %272
  %295 = load i64, i64* @crc, align 8
  %296 = lshr i64 %295, 16
  %297 = and i64 %296, 255
  %298 = trunc i64 %297 to i8
  %299 = load i32, i32* @outcnt, align 4
  %300 = add i32 %299, 1
  store i32 %300, i32* @outcnt, align 4
  %301 = zext i32 %299 to i64
  %302 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %301
  store i8 %298, i8* %302, align 1
  %303 = load i32, i32* @outcnt, align 4
  %304 = icmp eq i32 %303, 16384
  br i1 %304, label %305, label %306

305:                                              ; preds = %294
  call void @flush_outbuf()
  br label %306

306:                                              ; preds = %305, %294
  %307 = load i64, i64* @crc, align 8
  %308 = lshr i64 %307, 16
  %309 = trunc i64 %308 to i16
  %310 = zext i16 %309 to i32
  %311 = ashr i32 %310, 8
  %312 = trunc i32 %311 to i8
  %313 = load i32, i32* @outcnt, align 4
  %314 = add i32 %313, 1
  store i32 %314, i32* @outcnt, align 4
  %315 = zext i32 %313 to i64
  %316 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %315
  store i8 %312, i8* %316, align 1
  %317 = load i32, i32* @outcnt, align 4
  %318 = icmp eq i32 %317, 16384
  br i1 %318, label %319, label %320

319:                                              ; preds = %306
  call void @flush_outbuf()
  br label %320

320:                                              ; preds = %319, %306
  br label %321

321:                                              ; preds = %320, %275
  %322 = load i32, i32* @outcnt, align 4
  %323 = icmp ult i32 %322, 16382
  br i1 %323, label %324, label %343

324:                                              ; preds = %321
  %325 = load i64, i64* @bytes_in, align 8
  %326 = and i64 %325, 65535
  %327 = and i64 %326, 255
  %328 = trunc i64 %327 to i8
  %329 = load i32, i32* @outcnt, align 4
  %330 = add i32 %329, 1
  store i32 %330, i32* @outcnt, align 4
  %331 = zext i32 %329 to i64
  %332 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %331
  store i8 %328, i8* %332, align 1
  %333 = load i64, i64* @bytes_in, align 8
  %334 = and i64 %333, 65535
  %335 = trunc i64 %334 to i16
  %336 = zext i16 %335 to i32
  %337 = ashr i32 %336, 8
  %338 = trunc i32 %337 to i8
  %339 = load i32, i32* @outcnt, align 4
  %340 = add i32 %339, 1
  store i32 %340, i32* @outcnt, align 4
  %341 = zext i32 %339 to i64
  %342 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %341
  store i8 %338, i8* %342, align 1
  br label %370

343:                                              ; preds = %321
  %344 = load i64, i64* @bytes_in, align 8
  %345 = and i64 %344, 65535
  %346 = and i64 %345, 255
  %347 = trunc i64 %346 to i8
  %348 = load i32, i32* @outcnt, align 4
  %349 = add i32 %348, 1
  store i32 %349, i32* @outcnt, align 4
  %350 = zext i32 %348 to i64
  %351 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %350
  store i8 %347, i8* %351, align 1
  %352 = load i32, i32* @outcnt, align 4
  %353 = icmp eq i32 %352, 16384
  br i1 %353, label %354, label %355

354:                                              ; preds = %343
  call void @flush_outbuf()
  br label %355

355:                                              ; preds = %354, %343
  %356 = load i64, i64* @bytes_in, align 8
  %357 = and i64 %356, 65535
  %358 = trunc i64 %357 to i16
  %359 = zext i16 %358 to i32
  %360 = ashr i32 %359, 8
  %361 = trunc i32 %360 to i8
  %362 = load i32, i32* @outcnt, align 4
  %363 = add i32 %362, 1
  store i32 %363, i32* @outcnt, align 4
  %364 = zext i32 %362 to i64
  %365 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %364
  store i8 %361, i8* %365, align 1
  %366 = load i32, i32* @outcnt, align 4
  %367 = icmp eq i32 %366, 16384
  br i1 %367, label %368, label %369

368:                                              ; preds = %355
  call void @flush_outbuf()
  br label %369

369:                                              ; preds = %368, %355
  br label %370

370:                                              ; preds = %369, %324
  %371 = load i32, i32* @outcnt, align 4
  %372 = icmp ult i32 %371, 16382
  br i1 %372, label %373, label %392

373:                                              ; preds = %370
  %374 = load i64, i64* @bytes_in, align 8
  %375 = lshr i64 %374, 16
  %376 = and i64 %375, 255
  %377 = trunc i64 %376 to i8
  %378 = load i32, i32* @outcnt, align 4
  %379 = add i32 %378, 1
  store i32 %379, i32* @outcnt, align 4
  %380 = zext i32 %378 to i64
  %381 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %380
  store i8 %377, i8* %381, align 1
  %382 = load i64, i64* @bytes_in, align 8
  %383 = lshr i64 %382, 16
  %384 = trunc i64 %383 to i16
  %385 = zext i16 %384 to i32
  %386 = ashr i32 %385, 8
  %387 = trunc i32 %386 to i8
  %388 = load i32, i32* @outcnt, align 4
  %389 = add i32 %388, 1
  store i32 %389, i32* @outcnt, align 4
  %390 = zext i32 %388 to i64
  %391 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %390
  store i8 %387, i8* %391, align 1
  br label %419

392:                                              ; preds = %370
  %393 = load i64, i64* @bytes_in, align 8
  %394 = lshr i64 %393, 16
  %395 = and i64 %394, 255
  %396 = trunc i64 %395 to i8
  %397 = load i32, i32* @outcnt, align 4
  %398 = add i32 %397, 1
  store i32 %398, i32* @outcnt, align 4
  %399 = zext i32 %397 to i64
  %400 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %399
  store i8 %396, i8* %400, align 1
  %401 = load i32, i32* @outcnt, align 4
  %402 = icmp eq i32 %401, 16384
  br i1 %402, label %403, label %404

403:                                              ; preds = %392
  call void @flush_outbuf()
  br label %404

404:                                              ; preds = %403, %392
  %405 = load i64, i64* @bytes_in, align 8
  %406 = lshr i64 %405, 16
  %407 = trunc i64 %406 to i16
  %408 = zext i16 %407 to i32
  %409 = ashr i32 %408, 8
  %410 = trunc i32 %409 to i8
  %411 = load i32, i32* @outcnt, align 4
  %412 = add i32 %411, 1
  store i32 %412, i32* @outcnt, align 4
  %413 = zext i32 %411 to i64
  %414 = getelementptr inbounds [0 x i8], [0 x i8]* bitcast ([18432 x i8]* @outbuf to [0 x i8]*), i64 0, i64 %413
  store i8 %410, i8* %414, align 1
  %415 = load i32, i32* @outcnt, align 4
  %416 = icmp eq i32 %415, 16384
  br i1 %416, label %417, label %418

417:                                              ; preds = %404
  call void @flush_outbuf()
  br label %418

418:                                              ; preds = %417, %404
  br label %419

419:                                              ; preds = %418, %373
  %420 = load i64, i64* @header_bytes, align 8
  %421 = add nsw i64 %420, 8
  store i64 %421, i64* @header_bytes, align 8
  call void @flush_outbuf()
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @file_read(i8* %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load i32, i32* @ifd, align 4
  %8 = load i8*, i8** %4, align 8
  %9 = load i32, i32* %5, align 4
  %10 = call i32 @read_buffer(i32 %7, i8* %8, i32 %9)
  store i32 %10, i32* %6, align 4
  %11 = load i32, i32* %6, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %2
  %14 = load i32, i32* %6, align 4
  store i32 %14, i32* %3, align 4
  br label %28

15:                                               ; preds = %2
  %16 = load i32, i32* %6, align 4
  %17 = icmp eq i32 %16, -1
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  call void @read_error() #13
  unreachable

19:                                               ; preds = %15
  %20 = load i8*, i8** %4, align 8
  %21 = load i32, i32* %6, align 4
  %22 = call i64 @updcrc(i8* %20, i32 %21)
  store i64 %22, i64* @crc, align 8
  %23 = load i32, i32* %6, align 4
  %24 = zext i32 %23 to i64
  %25 = load i64, i64* @bytes_in, align 8
  %26 = add nsw i64 %25, %24
  store i64 %26, i64* @bytes_in, align 8
  %27 = load i32, i32* %6, align 4
  store i32 %27, i32* %3, align 4
  br label %28

28:                                               ; preds = %19, %13
  %29 = load i32, i32* %3, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind optnone readonly uwtable
define internal i8* @last_component(i8* %0) #11 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8, align 1
  store i8* %0, i8** %2, align 8
  %6 = load i8*, i8** %2, align 8
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  store i8* %7, i8** %3, align 8
  store i8 0, i8* %5, align 1
  br label %8

8:                                                ; preds = %13, %1
  %9 = load i8*, i8** %3, align 8
  %10 = load i8, i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp eq i32 %11, 47
  br i1 %12, label %13, label %16

13:                                               ; preds = %8
  %14 = load i8*, i8** %3, align 8
  %15 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %15, i8** %3, align 8
  br label %8, !llvm.loop !187

16:                                               ; preds = %8
  %17 = load i8*, i8** %3, align 8
  store i8* %17, i8** %4, align 8
  br label %18

18:                                               ; preds = %35, %16
  %19 = load i8*, i8** %4, align 8
  %20 = load i8, i8* %19, align 1
  %21 = icmp ne i8 %20, 0
  br i1 %21, label %22, label %38

22:                                               ; preds = %18
  %23 = load i8*, i8** %4, align 8
  %24 = load i8, i8* %23, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %25, 47
  br i1 %26, label %27, label %28

27:                                               ; preds = %22
  store i8 1, i8* %5, align 1
  br label %34

28:                                               ; preds = %22
  %29 = load i8, i8* %5, align 1
  %30 = trunc i8 %29 to i1
  br i1 %30, label %31, label %33

31:                                               ; preds = %28
  %32 = load i8*, i8** %4, align 8
  store i8* %32, i8** %3, align 8
  store i8 0, i8* %5, align 1
  br label %33

33:                                               ; preds = %31, %28
  br label %34

34:                                               ; preds = %33, %27
  br label %35

35:                                               ; preds = %34
  %36 = load i8*, i8** %4, align 8
  %37 = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %37, i8** %4, align 8
  br label %18, !llvm.loop !188

38:                                               ; preds = %18
  %39 = load i8*, i8** %3, align 8
  ret i8* %39
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @open_safer(i8* %0, i32 %1, ...) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  %7 = load i32, i32* %4, align 4
  %8 = and i32 %7, 64
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %33

10:                                               ; preds = %2
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i64 0, i64 0
  %12 = bitcast %struct.__va_list_tag* %11 to i8*
  call void @llvm.va_start(i8* %12)
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i64 0, i64 0
  %14 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 0
  %15 = load i32, i32* %14, align 16
  %16 = icmp ule i32 %15, 40
  br i1 %16, label %17, label %23

17:                                               ; preds = %10
  %18 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 3
  %19 = load i8*, i8** %18, align 16
  %20 = getelementptr i8, i8* %19, i32 %15
  %21 = bitcast i8* %20 to i32*
  %22 = add i32 %15, 8
  store i32 %22, i32* %14, align 16
  br label %28

23:                                               ; preds = %10
  %24 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 2
  %25 = load i8*, i8** %24, align 8
  %26 = bitcast i8* %25 to i32*
  %27 = getelementptr i8, i8* %25, i32 8
  store i8* %27, i8** %24, align 8
  br label %28

28:                                               ; preds = %23, %17
  %29 = phi i32* [ %21, %17 ], [ %26, %23 ]
  %30 = load i32, i32* %29, align 4
  store i32 %30, i32* %5, align 4
  %31 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %6, i64 0, i64 0
  %32 = bitcast %struct.__va_list_tag* %31 to i8*
  call void @llvm.va_end(i8* %32)
  br label %33

33:                                               ; preds = %28, %2
  %34 = load i8*, i8** %3, align 8
  %35 = load i32, i32* %4, align 4
  %36 = load i32, i32* %5, align 4
  %37 = call i32 (i8*, i32, ...) @open(i8* %34, i32 %35, i32 %36)
  %38 = call i32 @fd_safer(i32 %37)
  ret i32 %38
}

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #12

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #12

declare dso_local i32 @open(i8*, i32, ...) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal void @gettime(%struct.timespec* %0) #0 {
  %2 = alloca %struct.timespec*, align 8
  %3 = alloca %struct.timespec, align 8
  store %struct.timespec* %0, %struct.timespec** %2, align 8
  %4 = load %struct.timespec*, %struct.timespec** %2, align 8
  %5 = call i32 @clock_gettime(i32 0, %struct.timespec* %4) #15
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %19

8:                                                ; preds = %1
  %9 = call i32 @gettimeofday(%struct.timespec* %3, i8* null) #15
  %10 = getelementptr inbounds %struct.timespec, %struct.timespec* %3, i32 0, i32 0
  %11 = load i64, i64* %10, align 8
  %12 = load %struct.timespec*, %struct.timespec** %2, align 8
  %13 = getelementptr inbounds %struct.timespec, %struct.timespec* %12, i32 0, i32 0
  store i64 %11, i64* %13, align 8
  %14 = getelementptr inbounds %struct.timespec, %struct.timespec* %3, i32 0, i32 1
  %15 = load i64, i64* %14, align 8
  %16 = mul nsw i64 %15, 1000
  %17 = load %struct.timespec*, %struct.timespec** %2, align 8
  %18 = getelementptr inbounds %struct.timespec, %struct.timespec* %17, i32 0, i32 1
  store i64 %16, i64* %18, align 8
  br label %19

19:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @clock_gettime(i32, %struct.timespec*) #5

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timespec*, i8*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @openat_safer(i32 %0, i8* %1, i32 %2, ...) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %0, i32* %4, align 4
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  store i32 0, i32* %7, align 4
  %9 = load i32, i32* %6, align 4
  %10 = and i32 %9, 64
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %35

12:                                               ; preds = %3
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %8, i64 0, i64 0
  %14 = bitcast %struct.__va_list_tag* %13 to i8*
  call void @llvm.va_start(i8* %14)
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %8, i64 0, i64 0
  %16 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %15, i32 0, i32 0
  %17 = load i32, i32* %16, align 16
  %18 = icmp ule i32 %17, 40
  br i1 %18, label %19, label %25

19:                                               ; preds = %12
  %20 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %15, i32 0, i32 3
  %21 = load i8*, i8** %20, align 16
  %22 = getelementptr i8, i8* %21, i32 %17
  %23 = bitcast i8* %22 to i32*
  %24 = add i32 %17, 8
  store i32 %24, i32* %16, align 16
  br label %30

25:                                               ; preds = %12
  %26 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %15, i32 0, i32 2
  %27 = load i8*, i8** %26, align 8
  %28 = bitcast i8* %27 to i32*
  %29 = getelementptr i8, i8* %27, i32 8
  store i8* %29, i8** %26, align 8
  br label %30

30:                                               ; preds = %25, %19
  %31 = phi i32* [ %23, %19 ], [ %28, %25 ]
  %32 = load i32, i32* %31, align 4
  store i32 %32, i32* %7, align 4
  %33 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %8, i64 0, i64 0
  %34 = bitcast %struct.__va_list_tag* %33 to i8*
  call void @llvm.va_end(i8* %34)
  br label %35

35:                                               ; preds = %30, %3
  %36 = load i32, i32* %4, align 4
  %37 = load i8*, i8** %5, align 8
  %38 = load i32, i32* %6, align 4
  %39 = load i32, i32* %7, align 4
  %40 = call i32 (i32, i8*, i32, ...) @openat(i32 %36, i8* %37, i32 %38, i32 %39)
  %41 = call i32 @fd_safer(i32 %40)
  ret i32 %41
}

declare dso_local i32 @openat(i32, i8*, i32, ...) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @streamsavedir(%struct.__dirstream* %0, i32 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.__dirstream*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca %struct.direntry_t*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32 (i8*, i8*)*, align 8
  %14 = alloca %struct.dirent*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i8*, align 8
  store %struct.__dirstream* %0, %struct.__dirstream** %4, align 8
  store i32 %1, i32* %5, align 4
  store i8* null, i8** %6, align 8
  store i64 0, i64* %7, align 8
  store %struct.direntry_t* null, %struct.direntry_t** %8, align 8
  store i64 0, i64* %9, align 8
  store i64 0, i64* %10, align 8
  store i64 0, i64* %11, align 8
  %21 = load i32, i32* %5, align 4
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds [2 x i32 (i8*, i8*)*], [2 x i32 (i8*, i8*)*]* @comparison_function_table, i64 0, i64 %22
  %24 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %23, align 8
  store i32 (i8*, i8*)* %24, i32 (i8*, i8*)** %13, align 8
  %25 = load %struct.__dirstream*, %struct.__dirstream** %4, align 8
  %26 = icmp eq %struct.__dirstream* %25, null
  br i1 %26, label %27, label %28

27:                                               ; preds = %2
  store i8* null, i8** %3, align 8
  br label %193

28:                                               ; preds = %2
  br label %29

29:                                               ; preds = %118, %28
  %30 = call i32* @__errno_location() #16
  store i32 0, i32* %30, align 4
  %31 = load %struct.__dirstream*, %struct.__dirstream** %4, align 8
  %32 = call %struct.dirent* @readdir(%struct.__dirstream* %31)
  store %struct.dirent* %32, %struct.dirent** %14, align 8
  %33 = load %struct.dirent*, %struct.dirent** %14, align 8
  %34 = icmp ne %struct.dirent* %33, null
  br i1 %34, label %36, label %35

35:                                               ; preds = %29
  br label %119

36:                                               ; preds = %29
  %37 = load %struct.dirent*, %struct.dirent** %14, align 8
  %38 = getelementptr inbounds %struct.dirent, %struct.dirent* %37, i32 0, i32 4
  %39 = getelementptr inbounds [256 x i8], [256 x i8]* %38, i64 0, i64 0
  store i8* %39, i8** %15, align 8
  %40 = load i8*, i8** %15, align 8
  %41 = load i8*, i8** %15, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 0
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp ne i32 %44, 46
  br i1 %45, label %46, label %47

46:                                               ; preds = %36
  br label %55

47:                                               ; preds = %36
  %48 = load i8*, i8** %15, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 1
  %50 = load i8, i8* %49, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp ne i32 %51, 46
  %53 = zext i1 %52 to i64
  %54 = select i1 %52, i32 1, i32 2
  br label %55

55:                                               ; preds = %47, %46
  %56 = phi i32 [ 0, %46 ], [ %54, %47 ]
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8* %40, i64 %57
  %59 = load i8, i8* %58, align 1
  %60 = sext i8 %59 to i32
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %118

62:                                               ; preds = %55
  %63 = load %struct.dirent*, %struct.dirent** %14, align 8
  %64 = getelementptr inbounds %struct.dirent, %struct.dirent* %63, i32 0, i32 4
  %65 = getelementptr inbounds [256 x i8], [256 x i8]* %64, i64 0, i64 0
  %66 = call i64 @strlen(i8* %65) #14
  %67 = add i64 %66, 1
  store i64 %67, i64* %16, align 8
  %68 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %13, align 8
  %69 = icmp ne i32 (i8*, i8*)* %68, null
  br i1 %69, label %70, label %90

70:                                               ; preds = %62
  %71 = load i64, i64* %9, align 8
  %72 = load i64, i64* %10, align 8
  %73 = icmp eq i64 %71, %72
  br i1 %73, label %74, label %81

74:                                               ; preds = %70
  %75 = load i64, i64* %9, align 8
  store i64 %75, i64* %17, align 8
  %76 = load %struct.direntry_t*, %struct.direntry_t** %8, align 8
  %77 = bitcast %struct.direntry_t* %76 to i8*
  %78 = call i8* @x2nrealloc(i8* %77, i64* %17, i64 8)
  %79 = bitcast i8* %78 to %struct.direntry_t*
  store %struct.direntry_t* %79, %struct.direntry_t** %8, align 8
  %80 = load i64, i64* %17, align 8
  store i64 %80, i64* %9, align 8
  br label %81

81:                                               ; preds = %74, %70
  %82 = load i8*, i8** %15, align 8
  %83 = call noalias i8* @xstrdup(i8* %82)
  %84 = load %struct.direntry_t*, %struct.direntry_t** %8, align 8
  %85 = load i64, i64* %10, align 8
  %86 = getelementptr inbounds %struct.direntry_t, %struct.direntry_t* %84, i64 %85
  %87 = getelementptr inbounds %struct.direntry_t, %struct.direntry_t* %86, i32 0, i32 0
  store i8* %83, i8** %87, align 8
  %88 = load i64, i64* %10, align 8
  %89 = add i64 %88, 1
  store i64 %89, i64* %10, align 8
  br label %114

90:                                               ; preds = %62
  %91 = load i64, i64* %7, align 8
  %92 = load i64, i64* %11, align 8
  %93 = sub i64 %91, %92
  %94 = load i64, i64* %16, align 8
  %95 = icmp ule i64 %93, %94
  br i1 %95, label %96, label %108

96:                                               ; preds = %90
  %97 = load i64, i64* %11, align 8
  %98 = load i64, i64* %16, align 8
  %99 = add i64 %97, %98
  store i64 %99, i64* %18, align 8
  %100 = load i64, i64* %18, align 8
  %101 = load i64, i64* %11, align 8
  %102 = icmp ult i64 %100, %101
  br i1 %102, label %103, label %104

103:                                              ; preds = %96
  call void @xalloc_die() #13
  unreachable

104:                                              ; preds = %96
  %105 = load i8*, i8** %6, align 8
  %106 = call i8* @x2nrealloc(i8* %105, i64* %18, i64 1)
  store i8* %106, i8** %6, align 8
  %107 = load i64, i64* %18, align 8
  store i64 %107, i64* %7, align 8
  br label %108

108:                                              ; preds = %104, %90
  %109 = load i8*, i8** %6, align 8
  %110 = load i64, i64* %11, align 8
  %111 = getelementptr inbounds i8, i8* %109, i64 %110
  %112 = load i8*, i8** %15, align 8
  %113 = load i64, i64* %16, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %111, i8* align 1 %112, i64 %113, i1 false)
  br label %114

114:                                              ; preds = %108, %81
  %115 = load i64, i64* %16, align 8
  %116 = load i64, i64* %11, align 8
  %117 = add i64 %116, %115
  store i64 %117, i64* %11, align 8
  br label %118

118:                                              ; preds = %114, %55
  br label %29

119:                                              ; preds = %35
  %120 = call i32* @__errno_location() #16
  %121 = load i32, i32* %120, align 4
  store i32 %121, i32* %12, align 4
  %122 = load i32, i32* %12, align 4
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %130

124:                                              ; preds = %119
  %125 = load %struct.direntry_t*, %struct.direntry_t** %8, align 8
  %126 = bitcast %struct.direntry_t* %125 to i8*
  call void @free(i8* %126) #15
  %127 = load i8*, i8** %6, align 8
  call void @free(i8* %127) #15
  %128 = load i32, i32* %12, align 4
  %129 = call i32* @__errno_location() #16
  store i32 %128, i32* %129, align 4
  store i8* null, i8** %3, align 8
  br label %193

130:                                              ; preds = %119
  %131 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %13, align 8
  %132 = icmp ne i32 (i8*, i8*)* %131, null
  br i1 %132, label %133, label %178

133:                                              ; preds = %130
  %134 = load i64, i64* %10, align 8
  %135 = icmp ne i64 %134, 0
  br i1 %135, label %136, label %141

136:                                              ; preds = %133
  %137 = load %struct.direntry_t*, %struct.direntry_t** %8, align 8
  %138 = bitcast %struct.direntry_t* %137 to i8*
  %139 = load i64, i64* %10, align 8
  %140 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %13, align 8
  call void @qsort(i8* %138, i64 %139, i64 8, i32 (i8*, i8*)* %140)
  br label %141

141:                                              ; preds = %136, %133
  %142 = load i64, i64* %11, align 8
  %143 = add i64 %142, 1
  %144 = call noalias i8* @xmalloc(i64 %143)
  store i8* %144, i8** %6, align 8
  store i64 0, i64* %11, align 8
  store i64 0, i64* %19, align 8
  br label %145

145:                                              ; preds = %172, %141
  %146 = load i64, i64* %19, align 8
  %147 = load i64, i64* %10, align 8
  %148 = icmp ult i64 %146, %147
  br i1 %148, label %149, label %175

149:                                              ; preds = %145
  %150 = load i8*, i8** %6, align 8
  %151 = load i64, i64* %11, align 8
  %152 = getelementptr inbounds i8, i8* %150, i64 %151
  store i8* %152, i8** %20, align 8
  %153 = load i8*, i8** %20, align 8
  %154 = load %struct.direntry_t*, %struct.direntry_t** %8, align 8
  %155 = load i64, i64* %19, align 8
  %156 = getelementptr inbounds %struct.direntry_t, %struct.direntry_t* %154, i64 %155
  %157 = getelementptr inbounds %struct.direntry_t, %struct.direntry_t* %156, i32 0, i32 0
  %158 = load i8*, i8** %157, align 8
  %159 = call i8* @stpcpy(i8* %153, i8* %158) #15
  %160 = load i8*, i8** %20, align 8
  %161 = ptrtoint i8* %159 to i64
  %162 = ptrtoint i8* %160 to i64
  %163 = sub i64 %161, %162
  %164 = add nsw i64 %163, 1
  %165 = load i64, i64* %11, align 8
  %166 = add i64 %165, %164
  store i64 %166, i64* %11, align 8
  %167 = load %struct.direntry_t*, %struct.direntry_t** %8, align 8
  %168 = load i64, i64* %19, align 8
  %169 = getelementptr inbounds %struct.direntry_t, %struct.direntry_t* %167, i64 %168
  %170 = getelementptr inbounds %struct.direntry_t, %struct.direntry_t* %169, i32 0, i32 0
  %171 = load i8*, i8** %170, align 8
  call void @free(i8* %171) #15
  br label %172

172:                                              ; preds = %149
  %173 = load i64, i64* %19, align 8
  %174 = add i64 %173, 1
  store i64 %174, i64* %19, align 8
  br label %145, !llvm.loop !189

175:                                              ; preds = %145
  %176 = load %struct.direntry_t*, %struct.direntry_t** %8, align 8
  %177 = bitcast %struct.direntry_t* %176 to i8*
  call void @free(i8* %177) #15
  br label %188

178:                                              ; preds = %130
  %179 = load i64, i64* %11, align 8
  %180 = load i64, i64* %7, align 8
  %181 = icmp eq i64 %179, %180
  br i1 %181, label %182, label %187

182:                                              ; preds = %178
  %183 = load i8*, i8** %6, align 8
  %184 = load i64, i64* %11, align 8
  %185 = add i64 %184, 1
  %186 = call i8* @xrealloc(i8* %183, i64 %185)
  store i8* %186, i8** %6, align 8
  br label %187

187:                                              ; preds = %182, %178
  br label %188

188:                                              ; preds = %187, %175
  %189 = load i8*, i8** %6, align 8
  %190 = load i64, i64* %11, align 8
  %191 = getelementptr inbounds i8, i8* %189, i64 %190
  store i8 0, i8* %191, align 1
  %192 = load i8*, i8** %6, align 8
  store i8* %192, i8** %3, align 8
  br label %193

193:                                              ; preds = %188, %124, %27
  %194 = load i8*, i8** %3, align 8
  ret i8* %194
}

declare dso_local %struct.dirent* @readdir(%struct.__dirstream*) #6

declare dso_local void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #6

; Function Attrs: nounwind
declare dso_local i8* @stpcpy(i8*, i8*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @direntry_cmp_name(i8* %0, i8* %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.direntry_t*, align 8
  %6 = alloca %struct.direntry_t*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = bitcast i8* %7 to %struct.direntry_t*
  store %struct.direntry_t* %8, %struct.direntry_t** %5, align 8
  %9 = load i8*, i8** %4, align 8
  %10 = bitcast i8* %9 to %struct.direntry_t*
  store %struct.direntry_t* %10, %struct.direntry_t** %6, align 8
  %11 = load %struct.direntry_t*, %struct.direntry_t** %5, align 8
  %12 = getelementptr inbounds %struct.direntry_t, %struct.direntry_t* %11, i32 0, i32 0
  %13 = load i8*, i8** %12, align 8
  %14 = load %struct.direntry_t*, %struct.direntry_t** %6, align 8
  %15 = getelementptr inbounds %struct.direntry_t, %struct.direntry_t* %14, i32 0, i32 0
  %16 = load i8*, i8** %15, align 8
  %17 = call i32 @strcmp(i8* %13, i8* %16) #14
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone readonly uwtable
define internal i64 @get_stat_atime_ns(%struct.stat* %0) #11 {
  %2 = alloca %struct.stat*, align 8
  store %struct.stat* %0, %struct.stat** %2, align 8
  %3 = load %struct.stat*, %struct.stat** %2, align 8
  %4 = getelementptr inbounds %struct.stat, %struct.stat* %3, i32 0, i32 11
  %5 = getelementptr inbounds %struct.timespec, %struct.timespec* %4, i32 0, i32 1
  %6 = load i64, i64* %5, align 8
  ret i64 %6
}

; Function Attrs: noinline nounwind optnone readonly uwtable
define internal i64 @get_stat_mtime_ns(%struct.stat* %0) #11 {
  %2 = alloca %struct.stat*, align 8
  store %struct.stat* %0, %struct.stat** %2, align 8
  %3 = load %struct.stat*, %struct.stat** %2, align 8
  %4 = getelementptr inbounds %struct.stat, %struct.stat* %3, i32 0, i32 12
  %5 = getelementptr inbounds %struct.timespec, %struct.timespec* %4, i32 0, i32 1
  %6 = load i64, i64* %5, align 8
  ret i64 %6
}

; Function Attrs: noinline nounwind optnone readonly uwtable
define internal { i64, i64 } @get_stat_atime(%struct.stat* %0) #11 {
  %2 = alloca %struct.timespec, align 8
  %3 = alloca %struct.stat*, align 8
  store %struct.stat* %0, %struct.stat** %3, align 8
  %4 = load %struct.stat*, %struct.stat** %3, align 8
  %5 = getelementptr inbounds %struct.stat, %struct.stat* %4, i32 0, i32 11
  %6 = bitcast %struct.timespec* %2 to i8*
  %7 = bitcast %struct.timespec* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 8 %7, i64 16, i1 false)
  %8 = bitcast %struct.timespec* %2 to { i64, i64 }*
  %9 = load { i64, i64 }, { i64, i64 }* %8, align 8
  ret { i64, i64 } %9
}

; Function Attrs: noinline nounwind optnone readonly uwtable
define internal { i64, i64 } @get_stat_mtime(%struct.stat* %0) #11 {
  %2 = alloca %struct.timespec, align 8
  %3 = alloca %struct.stat*, align 8
  store %struct.stat* %0, %struct.stat** %3, align 8
  %4 = load %struct.stat*, %struct.stat** %3, align 8
  %5 = getelementptr inbounds %struct.stat, %struct.stat* %4, i32 0, i32 12
  %6 = bitcast %struct.timespec* %2 to i8*
  %7 = bitcast %struct.timespec* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 8 %7, i64 16, i1 false)
  %8 = bitcast %struct.timespec* %2 to { i64, i64 }*
  %9 = load { i64, i64 }, { i64, i64 }* %8, align 8
  ret { i64, i64 } %9
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @fd_safer(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp sle i32 0, %5
  br i1 %6, label %7, label %20

7:                                                ; preds = %1
  %8 = load i32, i32* %2, align 4
  %9 = icmp sle i32 %8, 2
  br i1 %9, label %10, label %20

10:                                               ; preds = %7
  %11 = load i32, i32* %2, align 4
  %12 = call i32 @dup_safer(i32 %11)
  store i32 %12, i32* %3, align 4
  %13 = call i32* @__errno_location() #16
  %14 = load i32, i32* %13, align 4
  store i32 %14, i32* %4, align 4
  %15 = load i32, i32* %2, align 4
  %16 = call i32 @close(i32 %15)
  %17 = load i32, i32* %4, align 4
  %18 = call i32* @__errno_location() #16
  store i32 %17, i32* %18, align 4
  %19 = load i32, i32* %3, align 4
  store i32 %19, i32* %2, align 4
  br label %20

20:                                               ; preds = %10, %7, %1
  %21 = load i32, i32* %2, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @fdutimens(i32 %0, i8* %1, %struct.timespec* %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca %struct.timespec*, align 8
  %8 = alloca [2 x %struct.timespec], align 16
  %9 = alloca %struct.timespec*, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct.stat, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.timespec, align 8
  %14 = alloca %struct.timespec, align 8
  %15 = alloca [2 x %struct.timespec], align 16
  %16 = alloca %struct.timespec*, align 8
  %17 = alloca i8, align 1
  %18 = alloca i8, align 1
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca %struct.timespec*, align 8
  %22 = alloca [2 x %struct.timespec], align 16
  store i32 %0, i32* %5, align 4
  store i8* %1, i8** %6, align 8
  store %struct.timespec* %2, %struct.timespec** %7, align 8
  %23 = load %struct.timespec*, %struct.timespec** %7, align 8
  %24 = icmp ne %struct.timespec* %23, null
  br i1 %24, label %25, label %27

25:                                               ; preds = %3
  %26 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %8, i64 0, i64 0
  br label %28

27:                                               ; preds = %3
  br label %28

28:                                               ; preds = %27, %25
  %29 = phi %struct.timespec* [ %26, %25 ], [ null, %27 ]
  store %struct.timespec* %29, %struct.timespec** %9, align 8
  store i32 0, i32* %10, align 4
  %30 = load %struct.timespec*, %struct.timespec** %9, align 8
  %31 = icmp ne %struct.timespec* %30, null
  br i1 %31, label %32, label %45

32:                                               ; preds = %28
  %33 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %8, i64 0, i64 0
  %34 = load %struct.timespec*, %struct.timespec** %7, align 8
  %35 = getelementptr inbounds %struct.timespec, %struct.timespec* %34, i64 0
  %36 = bitcast %struct.timespec* %33 to i8*
  %37 = bitcast %struct.timespec* %35 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %36, i8* align 8 %37, i64 16, i1 false)
  %38 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %8, i64 0, i64 1
  %39 = load %struct.timespec*, %struct.timespec** %7, align 8
  %40 = getelementptr inbounds %struct.timespec, %struct.timespec* %39, i64 1
  %41 = bitcast %struct.timespec* %38 to i8*
  %42 = bitcast %struct.timespec* %40 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %41, i8* align 8 %42, i64 16, i1 false)
  %43 = load %struct.timespec*, %struct.timespec** %9, align 8
  %44 = call i32 @validate_timespec(%struct.timespec* %43)
  store i32 %44, i32* %10, align 4
  br label %45

45:                                               ; preds = %32, %28
  %46 = load i32, i32* %10, align 4
  %47 = icmp slt i32 %46, 0
  br i1 %47, label %48, label %49

48:                                               ; preds = %45
  store i32 -1, i32* %4, align 4
  br label %326

49:                                               ; preds = %45
  %50 = load i32, i32* %5, align 4
  %51 = icmp slt i32 %50, 0
  br i1 %51, label %52, label %57

52:                                               ; preds = %49
  %53 = load i8*, i8** %6, align 8
  %54 = icmp ne i8* %53, null
  br i1 %54, label %57, label %55

55:                                               ; preds = %52
  %56 = call i32* @__errno_location() #16
  store i32 9, i32* %56, align 4
  store i32 -1, i32* %4, align 4
  br label %326

57:                                               ; preds = %52, %49
  %58 = load i32, i32* @utimensat_works_really, align 4
  %59 = icmp sle i32 0, %58
  br i1 %59, label %60, label %156

60:                                               ; preds = %57
  %61 = load i32, i32* %10, align 4
  %62 = icmp eq i32 %61, 2
  br i1 %62, label %63, label %113

63:                                               ; preds = %60
  %64 = load i32, i32* %5, align 4
  %65 = icmp slt i32 %64, 0
  br i1 %65, label %66, label %70

66:                                               ; preds = %63
  %67 = load i8*, i8** %6, align 8
  %68 = call i32 @stat(i8* %67, %struct.stat* %11) #15
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %74, label %75

70:                                               ; preds = %63
  %71 = load i32, i32* %5, align 4
  %72 = call i32 @fstat(i32 %71, %struct.stat* %11) #15
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %75

74:                                               ; preds = %70, %66
  store i32 -1, i32* %4, align 4
  br label %326

75:                                               ; preds = %70, %66
  %76 = load %struct.timespec*, %struct.timespec** %9, align 8
  %77 = getelementptr inbounds %struct.timespec, %struct.timespec* %76, i64 0
  %78 = getelementptr inbounds %struct.timespec, %struct.timespec* %77, i32 0, i32 1
  %79 = load i64, i64* %78, align 8
  %80 = icmp eq i64 %79, 1073741822
  br i1 %80, label %81, label %92

81:                                               ; preds = %75
  %82 = load %struct.timespec*, %struct.timespec** %9, align 8
  %83 = getelementptr inbounds %struct.timespec, %struct.timespec* %82, i64 0
  %84 = call { i64, i64 } @get_stat_atime(%struct.stat* %11) #14
  %85 = bitcast %struct.timespec* %13 to { i64, i64 }*
  %86 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %85, i32 0, i32 0
  %87 = extractvalue { i64, i64 } %84, 0
  store i64 %87, i64* %86, align 8
  %88 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %85, i32 0, i32 1
  %89 = extractvalue { i64, i64 } %84, 1
  store i64 %89, i64* %88, align 8
  %90 = bitcast %struct.timespec* %83 to i8*
  %91 = bitcast %struct.timespec* %13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %90, i8* align 8 %91, i64 16, i1 false)
  br label %110

92:                                               ; preds = %75
  %93 = load %struct.timespec*, %struct.timespec** %9, align 8
  %94 = getelementptr inbounds %struct.timespec, %struct.timespec* %93, i64 1
  %95 = getelementptr inbounds %struct.timespec, %struct.timespec* %94, i32 0, i32 1
  %96 = load i64, i64* %95, align 8
  %97 = icmp eq i64 %96, 1073741822
  br i1 %97, label %98, label %109

98:                                               ; preds = %92
  %99 = load %struct.timespec*, %struct.timespec** %9, align 8
  %100 = getelementptr inbounds %struct.timespec, %struct.timespec* %99, i64 1
  %101 = call { i64, i64 } @get_stat_mtime(%struct.stat* %11) #14
  %102 = bitcast %struct.timespec* %14 to { i64, i64 }*
  %103 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %102, i32 0, i32 0
  %104 = extractvalue { i64, i64 } %101, 0
  store i64 %104, i64* %103, align 8
  %105 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %102, i32 0, i32 1
  %106 = extractvalue { i64, i64 } %101, 1
  store i64 %106, i64* %105, align 8
  %107 = bitcast %struct.timespec* %100 to i8*
  %108 = bitcast %struct.timespec* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %107, i8* align 8 %108, i64 16, i1 false)
  br label %109

109:                                              ; preds = %98, %92
  br label %110

110:                                              ; preds = %109, %81
  %111 = load i32, i32* %10, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %10, align 4
  br label %113

113:                                              ; preds = %110, %60
  %114 = load i32, i32* %5, align 4
  %115 = icmp slt i32 %114, 0
  br i1 %115, label %116, label %134

116:                                              ; preds = %113
  %117 = load i8*, i8** %6, align 8
  %118 = load %struct.timespec*, %struct.timespec** %9, align 8
  %119 = call i32 @utimensat(i32 -100, i8* %117, %struct.timespec* %118, i32 0) #15
  store i32 %119, i32* %12, align 4
  %120 = load i32, i32* %12, align 4
  %121 = icmp slt i32 0, %120
  br i1 %121, label %122, label %124

122:                                              ; preds = %116
  %123 = call i32* @__errno_location() #16
  store i32 38, i32* %123, align 4
  br label %124

124:                                              ; preds = %122, %116
  %125 = load i32, i32* %12, align 4
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %131, label %127

127:                                              ; preds = %124
  %128 = call i32* @__errno_location() #16
  %129 = load i32, i32* %128, align 4
  %130 = icmp ne i32 %129, 38
  br i1 %130, label %131, label %133

131:                                              ; preds = %127, %124
  store i32 1, i32* @utimensat_works_really, align 4
  %132 = load i32, i32* %12, align 4
  store i32 %132, i32* %4, align 4
  br label %326

133:                                              ; preds = %127
  br label %134

134:                                              ; preds = %133, %113
  %135 = load i32, i32* %5, align 4
  %136 = icmp sle i32 0, %135
  br i1 %136, label %137, label %155

137:                                              ; preds = %134
  %138 = load i32, i32* %5, align 4
  %139 = load %struct.timespec*, %struct.timespec** %9, align 8
  %140 = call i32 @futimens(i32 %138, %struct.timespec* %139) #15
  store i32 %140, i32* %12, align 4
  %141 = load i32, i32* %12, align 4
  %142 = icmp slt i32 0, %141
  br i1 %142, label %143, label %145

143:                                              ; preds = %137
  %144 = call i32* @__errno_location() #16
  store i32 38, i32* %144, align 4
  br label %145

145:                                              ; preds = %143, %137
  %146 = load i32, i32* %12, align 4
  %147 = icmp eq i32 %146, 0
  br i1 %147, label %152, label %148

148:                                              ; preds = %145
  %149 = call i32* @__errno_location() #16
  %150 = load i32, i32* %149, align 4
  %151 = icmp ne i32 %150, 38
  br i1 %151, label %152, label %154

152:                                              ; preds = %148, %145
  store i32 1, i32* @utimensat_works_really, align 4
  %153 = load i32, i32* %12, align 4
  store i32 %153, i32* %4, align 4
  br label %326

154:                                              ; preds = %148
  br label %155

155:                                              ; preds = %154, %134
  br label %156

156:                                              ; preds = %155, %57
  store i32 -1, i32* @utimensat_works_really, align 4
  store i32 -1, i32* @lutimensat_works_really, align 4
  %157 = load i32, i32* %10, align 4
  %158 = icmp ne i32 %157, 0
  br i1 %158, label %159, label %181

159:                                              ; preds = %156
  %160 = load i32, i32* %10, align 4
  %161 = icmp ne i32 %160, 3
  br i1 %161, label %162, label %174

162:                                              ; preds = %159
  %163 = load i32, i32* %5, align 4
  %164 = icmp slt i32 %163, 0
  br i1 %164, label %165, label %169

165:                                              ; preds = %162
  %166 = load i8*, i8** %6, align 8
  %167 = call i32 @stat(i8* %166, %struct.stat* %11) #15
  %168 = icmp ne i32 %167, 0
  br i1 %168, label %173, label %174

169:                                              ; preds = %162
  %170 = load i32, i32* %5, align 4
  %171 = call i32 @fstat(i32 %170, %struct.stat* %11) #15
  %172 = icmp ne i32 %171, 0
  br i1 %172, label %173, label %174

173:                                              ; preds = %169, %165
  store i32 -1, i32* %4, align 4
  br label %326

174:                                              ; preds = %169, %165, %159
  %175 = load %struct.timespec*, %struct.timespec** %9, align 8
  %176 = icmp ne %struct.timespec* %175, null
  br i1 %176, label %177, label %180

177:                                              ; preds = %174
  %178 = call zeroext i1 @update_timespec(%struct.stat* %11, %struct.timespec** %9)
  br i1 %178, label %179, label %180

179:                                              ; preds = %177
  store i32 0, i32* %4, align 4
  br label %326

180:                                              ; preds = %177, %174
  br label %181

181:                                              ; preds = %180, %156
  %182 = load %struct.timespec*, %struct.timespec** %9, align 8
  %183 = icmp ne %struct.timespec* %182, null
  br i1 %183, label %184, label %212

184:                                              ; preds = %181
  %185 = load %struct.timespec*, %struct.timespec** %9, align 8
  %186 = getelementptr inbounds %struct.timespec, %struct.timespec* %185, i64 0
  %187 = getelementptr inbounds %struct.timespec, %struct.timespec* %186, i32 0, i32 0
  %188 = load i64, i64* %187, align 8
  %189 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %15, i64 0, i64 0
  %190 = getelementptr inbounds %struct.timespec, %struct.timespec* %189, i32 0, i32 0
  store i64 %188, i64* %190, align 16
  %191 = load %struct.timespec*, %struct.timespec** %9, align 8
  %192 = getelementptr inbounds %struct.timespec, %struct.timespec* %191, i64 0
  %193 = getelementptr inbounds %struct.timespec, %struct.timespec* %192, i32 0, i32 1
  %194 = load i64, i64* %193, align 8
  %195 = sdiv i64 %194, 1000
  %196 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %15, i64 0, i64 0
  %197 = getelementptr inbounds %struct.timespec, %struct.timespec* %196, i32 0, i32 1
  store i64 %195, i64* %197, align 8
  %198 = load %struct.timespec*, %struct.timespec** %9, align 8
  %199 = getelementptr inbounds %struct.timespec, %struct.timespec* %198, i64 1
  %200 = getelementptr inbounds %struct.timespec, %struct.timespec* %199, i32 0, i32 0
  %201 = load i64, i64* %200, align 8
  %202 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %15, i64 0, i64 1
  %203 = getelementptr inbounds %struct.timespec, %struct.timespec* %202, i32 0, i32 0
  store i64 %201, i64* %203, align 16
  %204 = load %struct.timespec*, %struct.timespec** %9, align 8
  %205 = getelementptr inbounds %struct.timespec, %struct.timespec* %204, i64 1
  %206 = getelementptr inbounds %struct.timespec, %struct.timespec* %205, i32 0, i32 1
  %207 = load i64, i64* %206, align 8
  %208 = sdiv i64 %207, 1000
  %209 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %15, i64 0, i64 1
  %210 = getelementptr inbounds %struct.timespec, %struct.timespec* %209, i32 0, i32 1
  store i64 %208, i64* %210, align 8
  %211 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %15, i64 0, i64 0
  store %struct.timespec* %211, %struct.timespec** %16, align 8
  br label %213

212:                                              ; preds = %181
  store %struct.timespec* null, %struct.timespec** %16, align 8
  br label %213

213:                                              ; preds = %212, %184
  %214 = load i32, i32* %5, align 4
  %215 = icmp slt i32 %214, 0
  br i1 %215, label %216, label %220

216:                                              ; preds = %213
  %217 = load i8*, i8** %6, align 8
  %218 = load %struct.timespec*, %struct.timespec** %16, align 8
  %219 = call i32 @futimesat(i32 -100, i8* %217, %struct.timespec* %218) #15
  store i32 %219, i32* %4, align 4
  br label %326

220:                                              ; preds = %213
  %221 = load i32, i32* %5, align 4
  %222 = load %struct.timespec*, %struct.timespec** %16, align 8
  %223 = call i32 @futimesat(i32 %221, i8* null, %struct.timespec* %222) #15
  %224 = icmp eq i32 %223, 0
  br i1 %224, label %225, label %317

225:                                              ; preds = %220
  %226 = load %struct.timespec*, %struct.timespec** %16, align 8
  %227 = icmp ne %struct.timespec* %226, null
  br i1 %227, label %228, label %316

228:                                              ; preds = %225
  %229 = load %struct.timespec*, %struct.timespec** %16, align 8
  %230 = getelementptr inbounds %struct.timespec, %struct.timespec* %229, i64 0
  %231 = getelementptr inbounds %struct.timespec, %struct.timespec* %230, i32 0, i32 1
  %232 = load i64, i64* %231, align 8
  %233 = icmp sle i64 500000, %232
  %234 = zext i1 %233 to i8
  store i8 %234, i8* %17, align 1
  %235 = load %struct.timespec*, %struct.timespec** %16, align 8
  %236 = getelementptr inbounds %struct.timespec, %struct.timespec* %235, i64 1
  %237 = getelementptr inbounds %struct.timespec, %struct.timespec* %236, i32 0, i32 1
  %238 = load i64, i64* %237, align 8
  %239 = icmp sle i64 500000, %238
  %240 = zext i1 %239 to i8
  store i8 %240, i8* %18, align 1
  %241 = load i8, i8* %17, align 1
  %242 = trunc i8 %241 to i1
  %243 = zext i1 %242 to i32
  %244 = load i8, i8* %18, align 1
  %245 = trunc i8 %244 to i1
  %246 = zext i1 %245 to i32
  %247 = or i32 %243, %246
  %248 = icmp ne i32 %247, 0
  br i1 %248, label %249, label %315

249:                                              ; preds = %228
  %250 = load i32, i32* %5, align 4
  %251 = call i32 @fstat(i32 %250, %struct.stat* %11) #15
  %252 = icmp eq i32 %251, 0
  br i1 %252, label %253, label %315

253:                                              ; preds = %249
  %254 = getelementptr inbounds %struct.stat, %struct.stat* %11, i32 0, i32 11
  %255 = getelementptr inbounds %struct.timespec, %struct.timespec* %254, i32 0, i32 0
  %256 = load i64, i64* %255, align 8
  %257 = load %struct.timespec*, %struct.timespec** %16, align 8
  %258 = getelementptr inbounds %struct.timespec, %struct.timespec* %257, i64 0
  %259 = getelementptr inbounds %struct.timespec, %struct.timespec* %258, i32 0, i32 0
  %260 = load i64, i64* %259, align 8
  %261 = sub nsw i64 %256, %260
  store i64 %261, i64* %19, align 8
  %262 = getelementptr inbounds %struct.stat, %struct.stat* %11, i32 0, i32 12
  %263 = getelementptr inbounds %struct.timespec, %struct.timespec* %262, i32 0, i32 0
  %264 = load i64, i64* %263, align 8
  %265 = load %struct.timespec*, %struct.timespec** %16, align 8
  %266 = getelementptr inbounds %struct.timespec, %struct.timespec* %265, i64 1
  %267 = getelementptr inbounds %struct.timespec, %struct.timespec* %266, i32 0, i32 0
  %268 = load i64, i64* %267, align 8
  %269 = sub nsw i64 %264, %268
  store i64 %269, i64* %20, align 8
  store %struct.timespec* null, %struct.timespec** %21, align 8
  %270 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %22, i64 0, i64 0
  %271 = load %struct.timespec*, %struct.timespec** %16, align 8
  %272 = getelementptr inbounds %struct.timespec, %struct.timespec* %271, i64 0
  %273 = bitcast %struct.timespec* %270 to i8*
  %274 = bitcast %struct.timespec* %272 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %273, i8* align 8 %274, i64 16, i1 false)
  %275 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %22, i64 0, i64 1
  %276 = load %struct.timespec*, %struct.timespec** %16, align 8
  %277 = getelementptr inbounds %struct.timespec, %struct.timespec* %276, i64 1
  %278 = bitcast %struct.timespec* %275 to i8*
  %279 = bitcast %struct.timespec* %277 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %278, i8* align 8 %279, i64 16, i1 false)
  %280 = load i8, i8* %17, align 1
  %281 = trunc i8 %280 to i1
  br i1 %281, label %282, label %293

282:                                              ; preds = %253
  %283 = load i64, i64* %19, align 8
  %284 = icmp eq i64 %283, 1
  br i1 %284, label %285, label %293

285:                                              ; preds = %282
  %286 = call i64 @get_stat_atime_ns(%struct.stat* %11) #14
  %287 = icmp eq i64 %286, 0
  br i1 %287, label %288, label %293

288:                                              ; preds = %285
  %289 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %22, i64 0, i64 0
  store %struct.timespec* %289, %struct.timespec** %21, align 8
  %290 = load %struct.timespec*, %struct.timespec** %21, align 8
  %291 = getelementptr inbounds %struct.timespec, %struct.timespec* %290, i64 0
  %292 = getelementptr inbounds %struct.timespec, %struct.timespec* %291, i32 0, i32 1
  store i64 0, i64* %292, align 8
  br label %293

293:                                              ; preds = %288, %285, %282, %253
  %294 = load i8, i8* %18, align 1
  %295 = trunc i8 %294 to i1
  br i1 %295, label %296, label %307

296:                                              ; preds = %293
  %297 = load i64, i64* %20, align 8
  %298 = icmp eq i64 %297, 1
  br i1 %298, label %299, label %307

299:                                              ; preds = %296
  %300 = call i64 @get_stat_mtime_ns(%struct.stat* %11) #14
  %301 = icmp eq i64 %300, 0
  br i1 %301, label %302, label %307

302:                                              ; preds = %299
  %303 = getelementptr inbounds [2 x %struct.timespec], [2 x %struct.timespec]* %22, i64 0, i64 0
  store %struct.timespec* %303, %struct.timespec** %21, align 8
  %304 = load %struct.timespec*, %struct.timespec** %21, align 8
  %305 = getelementptr inbounds %struct.timespec, %struct.timespec* %304, i64 1
  %306 = getelementptr inbounds %struct.timespec, %struct.timespec* %305, i32 0, i32 1
  store i64 0, i64* %306, align 8
  br label %307

307:                                              ; preds = %302, %299, %296, %293
  %308 = load %struct.timespec*, %struct.timespec** %21, align 8
  %309 = icmp ne %struct.timespec* %308, null
  br i1 %309, label %310, label %314

310:                                              ; preds = %307
  %311 = load i32, i32* %5, align 4
  %312 = load %struct.timespec*, %struct.timespec** %21, align 8
  %313 = call i32 @futimesat(i32 %311, i8* null, %struct.timespec* %312) #15
  br label %314

314:                                              ; preds = %310, %307
  br label %315

315:                                              ; preds = %314, %249, %228
  br label %316

316:                                              ; preds = %315, %225
  store i32 0, i32* %4, align 4
  br label %326

317:                                              ; preds = %220
  br label %318

318:                                              ; preds = %317
  %319 = load i8*, i8** %6, align 8
  %320 = icmp ne i8* %319, null
  br i1 %320, label %322, label %321

321:                                              ; preds = %318
  store i32 -1, i32* %4, align 4
  br label %326

322:                                              ; preds = %318
  %323 = load i8*, i8** %6, align 8
  %324 = load %struct.timespec*, %struct.timespec** %16, align 8
  %325 = call i32 @utimes(i8* %323, %struct.timespec* %324) #15
  store i32 %325, i32* %4, align 4
  br label %326

326:                                              ; preds = %322, %321, %316, %216, %179, %173, %152, %131, %74, %55, %48
  %327 = load i32, i32* %4, align 4
  ret i32 %327
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @validate_timespec(%struct.timespec* %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.timespec*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.timespec* %0, %struct.timespec** %3, align 8
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  %6 = load %struct.timespec*, %struct.timespec** %3, align 8
  %7 = getelementptr inbounds %struct.timespec, %struct.timespec* %6, i64 0
  %8 = getelementptr inbounds %struct.timespec, %struct.timespec* %7, i32 0, i32 1
  %9 = load i64, i64* %8, align 8
  %10 = icmp ne i64 %9, 1073741823
  br i1 %10, label %11, label %29

11:                                               ; preds = %1
  %12 = load %struct.timespec*, %struct.timespec** %3, align 8
  %13 = getelementptr inbounds %struct.timespec, %struct.timespec* %12, i64 0
  %14 = getelementptr inbounds %struct.timespec, %struct.timespec* %13, i32 0, i32 1
  %15 = load i64, i64* %14, align 8
  %16 = icmp ne i64 %15, 1073741822
  br i1 %16, label %17, label %29

17:                                               ; preds = %11
  %18 = load %struct.timespec*, %struct.timespec** %3, align 8
  %19 = getelementptr inbounds %struct.timespec, %struct.timespec* %18, i64 0
  %20 = getelementptr inbounds %struct.timespec, %struct.timespec* %19, i32 0, i32 1
  %21 = load i64, i64* %20, align 8
  %22 = icmp sle i64 0, %21
  br i1 %22, label %23, label %53

23:                                               ; preds = %17
  %24 = load %struct.timespec*, %struct.timespec** %3, align 8
  %25 = getelementptr inbounds %struct.timespec, %struct.timespec* %24, i64 0
  %26 = getelementptr inbounds %struct.timespec, %struct.timespec* %25, i32 0, i32 1
  %27 = load i64, i64* %26, align 8
  %28 = icmp slt i64 %27, 1000000000
  br i1 %28, label %29, label %53

29:                                               ; preds = %23, %11, %1
  %30 = load %struct.timespec*, %struct.timespec** %3, align 8
  %31 = getelementptr inbounds %struct.timespec, %struct.timespec* %30, i64 1
  %32 = getelementptr inbounds %struct.timespec, %struct.timespec* %31, i32 0, i32 1
  %33 = load i64, i64* %32, align 8
  %34 = icmp ne i64 %33, 1073741823
  br i1 %34, label %35, label %55

35:                                               ; preds = %29
  %36 = load %struct.timespec*, %struct.timespec** %3, align 8
  %37 = getelementptr inbounds %struct.timespec, %struct.timespec* %36, i64 1
  %38 = getelementptr inbounds %struct.timespec, %struct.timespec* %37, i32 0, i32 1
  %39 = load i64, i64* %38, align 8
  %40 = icmp ne i64 %39, 1073741822
  br i1 %40, label %41, label %55

41:                                               ; preds = %35
  %42 = load %struct.timespec*, %struct.timespec** %3, align 8
  %43 = getelementptr inbounds %struct.timespec, %struct.timespec* %42, i64 1
  %44 = getelementptr inbounds %struct.timespec, %struct.timespec* %43, i32 0, i32 1
  %45 = load i64, i64* %44, align 8
  %46 = icmp sle i64 0, %45
  br i1 %46, label %47, label %53

47:                                               ; preds = %41
  %48 = load %struct.timespec*, %struct.timespec** %3, align 8
  %49 = getelementptr inbounds %struct.timespec, %struct.timespec* %48, i64 1
  %50 = getelementptr inbounds %struct.timespec, %struct.timespec* %49, i32 0, i32 1
  %51 = load i64, i64* %50, align 8
  %52 = icmp slt i64 %51, 1000000000
  br i1 %52, label %55, label %53

53:                                               ; preds = %47, %41, %23, %17
  %54 = call i32* @__errno_location() #16
  store i32 22, i32* %54, align 4
  store i32 -1, i32* %2, align 4
  br label %111

55:                                               ; preds = %47, %35, %29
  %56 = load %struct.timespec*, %struct.timespec** %3, align 8
  %57 = getelementptr inbounds %struct.timespec, %struct.timespec* %56, i64 0
  %58 = getelementptr inbounds %struct.timespec, %struct.timespec* %57, i32 0, i32 1
  %59 = load i64, i64* %58, align 8
  %60 = icmp eq i64 %59, 1073741823
  br i1 %60, label %67, label %61

61:                                               ; preds = %55
  %62 = load %struct.timespec*, %struct.timespec** %3, align 8
  %63 = getelementptr inbounds %struct.timespec, %struct.timespec* %62, i64 0
  %64 = getelementptr inbounds %struct.timespec, %struct.timespec* %63, i32 0, i32 1
  %65 = load i64, i64* %64, align 8
  %66 = icmp eq i64 %65, 1073741822
  br i1 %66, label %67, label %80

67:                                               ; preds = %61, %55
  %68 = load %struct.timespec*, %struct.timespec** %3, align 8
  %69 = getelementptr inbounds %struct.timespec, %struct.timespec* %68, i64 0
  %70 = getelementptr inbounds %struct.timespec, %struct.timespec* %69, i32 0, i32 0
  store i64 0, i64* %70, align 8
  store i32 1, i32* %4, align 4
  %71 = load %struct.timespec*, %struct.timespec** %3, align 8
  %72 = getelementptr inbounds %struct.timespec, %struct.timespec* %71, i64 0
  %73 = getelementptr inbounds %struct.timespec, %struct.timespec* %72, i32 0, i32 1
  %74 = load i64, i64* %73, align 8
  %75 = icmp eq i64 %74, 1073741822
  br i1 %75, label %76, label %79

76:                                               ; preds = %67
  %77 = load i32, i32* %5, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %5, align 4
  br label %79

79:                                               ; preds = %76, %67
  br label %80

80:                                               ; preds = %79, %61
  %81 = load %struct.timespec*, %struct.timespec** %3, align 8
  %82 = getelementptr inbounds %struct.timespec, %struct.timespec* %81, i64 1
  %83 = getelementptr inbounds %struct.timespec, %struct.timespec* %82, i32 0, i32 1
  %84 = load i64, i64* %83, align 8
  %85 = icmp eq i64 %84, 1073741823
  br i1 %85, label %92, label %86

86:                                               ; preds = %80
  %87 = load %struct.timespec*, %struct.timespec** %3, align 8
  %88 = getelementptr inbounds %struct.timespec, %struct.timespec* %87, i64 1
  %89 = getelementptr inbounds %struct.timespec, %struct.timespec* %88, i32 0, i32 1
  %90 = load i64, i64* %89, align 8
  %91 = icmp eq i64 %90, 1073741822
  br i1 %91, label %92, label %105

92:                                               ; preds = %86, %80
  %93 = load %struct.timespec*, %struct.timespec** %3, align 8
  %94 = getelementptr inbounds %struct.timespec, %struct.timespec* %93, i64 1
  %95 = getelementptr inbounds %struct.timespec, %struct.timespec* %94, i32 0, i32 0
  store i64 0, i64* %95, align 8
  store i32 1, i32* %4, align 4
  %96 = load %struct.timespec*, %struct.timespec** %3, align 8
  %97 = getelementptr inbounds %struct.timespec, %struct.timespec* %96, i64 1
  %98 = getelementptr inbounds %struct.timespec, %struct.timespec* %97, i32 0, i32 1
  %99 = load i64, i64* %98, align 8
  %100 = icmp eq i64 %99, 1073741822
  br i1 %100, label %101, label %104

101:                                              ; preds = %92
  %102 = load i32, i32* %5, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %5, align 4
  br label %104

104:                                              ; preds = %101, %92
  br label %105

105:                                              ; preds = %104, %86
  %106 = load i32, i32* %4, align 4
  %107 = load i32, i32* %5, align 4
  %108 = icmp eq i32 %107, 1
  %109 = zext i1 %108 to i32
  %110 = add nsw i32 %106, %109
  store i32 %110, i32* %2, align 4
  br label %111

111:                                              ; preds = %105, %53
  %112 = load i32, i32* %2, align 4
  ret i32 %112
}

; Function Attrs: nounwind
declare dso_local i32 @stat(i8*, %struct.stat*) #5

; Function Attrs: nounwind
declare dso_local i32 @utimensat(i32, i8*, %struct.timespec*, i32) #5

; Function Attrs: nounwind
declare dso_local i32 @futimens(i32, %struct.timespec*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i1 @update_timespec(%struct.stat* %0, %struct.timespec** %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca %struct.stat*, align 8
  %5 = alloca %struct.timespec**, align 8
  %6 = alloca %struct.timespec*, align 8
  %7 = alloca %struct.timespec, align 8
  %8 = alloca %struct.timespec, align 8
  store %struct.stat* %0, %struct.stat** %4, align 8
  store %struct.timespec** %1, %struct.timespec*** %5, align 8
  %9 = load %struct.timespec**, %struct.timespec*** %5, align 8
  %10 = load %struct.timespec*, %struct.timespec** %9, align 8
  store %struct.timespec* %10, %struct.timespec** %6, align 8
  %11 = load %struct.timespec*, %struct.timespec** %6, align 8
  %12 = getelementptr inbounds %struct.timespec, %struct.timespec* %11, i64 0
  %13 = getelementptr inbounds %struct.timespec, %struct.timespec* %12, i32 0, i32 1
  %14 = load i64, i64* %13, align 8
  %15 = icmp eq i64 %14, 1073741822
  br i1 %15, label %16, label %23

16:                                               ; preds = %2
  %17 = load %struct.timespec*, %struct.timespec** %6, align 8
  %18 = getelementptr inbounds %struct.timespec, %struct.timespec* %17, i64 1
  %19 = getelementptr inbounds %struct.timespec, %struct.timespec* %18, i32 0, i32 1
  %20 = load i64, i64* %19, align 8
  %21 = icmp eq i64 %20, 1073741822
  br i1 %21, label %22, label %23

22:                                               ; preds = %16
  store i1 true, i1* %3, align 1
  br label %94

23:                                               ; preds = %16, %2
  %24 = load %struct.timespec*, %struct.timespec** %6, align 8
  %25 = getelementptr inbounds %struct.timespec, %struct.timespec* %24, i64 0
  %26 = getelementptr inbounds %struct.timespec, %struct.timespec* %25, i32 0, i32 1
  %27 = load i64, i64* %26, align 8
  %28 = icmp eq i64 %27, 1073741823
  br i1 %28, label %29, label %37

29:                                               ; preds = %23
  %30 = load %struct.timespec*, %struct.timespec** %6, align 8
  %31 = getelementptr inbounds %struct.timespec, %struct.timespec* %30, i64 1
  %32 = getelementptr inbounds %struct.timespec, %struct.timespec* %31, i32 0, i32 1
  %33 = load i64, i64* %32, align 8
  %34 = icmp eq i64 %33, 1073741823
  br i1 %34, label %35, label %37

35:                                               ; preds = %29
  %36 = load %struct.timespec**, %struct.timespec*** %5, align 8
  store %struct.timespec* null, %struct.timespec** %36, align 8
  store i1 false, i1* %3, align 1
  br label %94

37:                                               ; preds = %29, %23
  %38 = load %struct.timespec*, %struct.timespec** %6, align 8
  %39 = getelementptr inbounds %struct.timespec, %struct.timespec* %38, i64 0
  %40 = getelementptr inbounds %struct.timespec, %struct.timespec* %39, i32 0, i32 1
  %41 = load i64, i64* %40, align 8
  %42 = icmp eq i64 %41, 1073741822
  br i1 %42, label %43, label %55

43:                                               ; preds = %37
  %44 = load %struct.timespec*, %struct.timespec** %6, align 8
  %45 = getelementptr inbounds %struct.timespec, %struct.timespec* %44, i64 0
  %46 = load %struct.stat*, %struct.stat** %4, align 8
  %47 = call { i64, i64 } @get_stat_atime(%struct.stat* %46) #14
  %48 = bitcast %struct.timespec* %7 to { i64, i64 }*
  %49 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %48, i32 0, i32 0
  %50 = extractvalue { i64, i64 } %47, 0
  store i64 %50, i64* %49, align 8
  %51 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %48, i32 0, i32 1
  %52 = extractvalue { i64, i64 } %47, 1
  store i64 %52, i64* %51, align 8
  %53 = bitcast %struct.timespec* %45 to i8*
  %54 = bitcast %struct.timespec* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %53, i8* align 8 %54, i64 16, i1 false)
  br label %65

55:                                               ; preds = %37
  %56 = load %struct.timespec*, %struct.timespec** %6, align 8
  %57 = getelementptr inbounds %struct.timespec, %struct.timespec* %56, i64 0
  %58 = getelementptr inbounds %struct.timespec, %struct.timespec* %57, i32 0, i32 1
  %59 = load i64, i64* %58, align 8
  %60 = icmp eq i64 %59, 1073741823
  br i1 %60, label %61, label %64

61:                                               ; preds = %55
  %62 = load %struct.timespec*, %struct.timespec** %6, align 8
  %63 = getelementptr inbounds %struct.timespec, %struct.timespec* %62, i64 0
  call void @gettime(%struct.timespec* %63)
  br label %64

64:                                               ; preds = %61, %55
  br label %65

65:                                               ; preds = %64, %43
  %66 = load %struct.timespec*, %struct.timespec** %6, align 8
  %67 = getelementptr inbounds %struct.timespec, %struct.timespec* %66, i64 1
  %68 = getelementptr inbounds %struct.timespec, %struct.timespec* %67, i32 0, i32 1
  %69 = load i64, i64* %68, align 8
  %70 = icmp eq i64 %69, 1073741822
  br i1 %70, label %71, label %83

71:                                               ; preds = %65
  %72 = load %struct.timespec*, %struct.timespec** %6, align 8
  %73 = getelementptr inbounds %struct.timespec, %struct.timespec* %72, i64 1
  %74 = load %struct.stat*, %struct.stat** %4, align 8
  %75 = call { i64, i64 } @get_stat_mtime(%struct.stat* %74) #14
  %76 = bitcast %struct.timespec* %8 to { i64, i64 }*
  %77 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %76, i32 0, i32 0
  %78 = extractvalue { i64, i64 } %75, 0
  store i64 %78, i64* %77, align 8
  %79 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %76, i32 0, i32 1
  %80 = extractvalue { i64, i64 } %75, 1
  store i64 %80, i64* %79, align 8
  %81 = bitcast %struct.timespec* %73 to i8*
  %82 = bitcast %struct.timespec* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %81, i8* align 8 %82, i64 16, i1 false)
  br label %93

83:                                               ; preds = %65
  %84 = load %struct.timespec*, %struct.timespec** %6, align 8
  %85 = getelementptr inbounds %struct.timespec, %struct.timespec* %84, i64 1
  %86 = getelementptr inbounds %struct.timespec, %struct.timespec* %85, i32 0, i32 1
  %87 = load i64, i64* %86, align 8
  %88 = icmp eq i64 %87, 1073741823
  br i1 %88, label %89, label %92

89:                                               ; preds = %83
  %90 = load %struct.timespec*, %struct.timespec** %6, align 8
  %91 = getelementptr inbounds %struct.timespec, %struct.timespec* %90, i64 1
  call void @gettime(%struct.timespec* %91)
  br label %92

92:                                               ; preds = %89, %83
  br label %93

93:                                               ; preds = %92, %71
  store i1 false, i1* %3, align 1
  br label %94

94:                                               ; preds = %93, %35, %22
  %95 = load i1, i1* %3, align 1
  ret i1 %95
}

; Function Attrs: nounwind
declare dso_local i32 @futimesat(i32, i8*, %struct.timespec*) #5

; Function Attrs: nounwind
declare dso_local i32 @utimes(i8*, %struct.timespec*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal noalias i8* @xmalloc(i64 %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  store i64 %0, i64* %2, align 8
  %4 = load i64, i64* %2, align 8
  %5 = call noalias i8* @malloc(i64 %4) #15
  store i8* %5, i8** %3, align 8
  %6 = load i8*, i8** %3, align 8
  %7 = icmp ne i8* %6, null
  br i1 %7, label %12, label %8

8:                                                ; preds = %1
  %9 = load i64, i64* %2, align 8
  %10 = icmp ne i64 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  call void @xalloc_die() #13
  unreachable

12:                                               ; preds = %8, %1
  %13 = load i8*, i8** %3, align 8
  ret i8* %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @xrealloc(i8* %0, i64 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %13, label %8

8:                                                ; preds = %2
  %9 = load i8*, i8** %4, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = load i8*, i8** %4, align 8
  call void @free(i8* %12) #15
  store i8* null, i8** %3, align 8
  br label %25

13:                                               ; preds = %8, %2
  %14 = load i8*, i8** %4, align 8
  %15 = load i64, i64* %5, align 8
  %16 = call i8* @realloc(i8* %14, i64 %15) #15
  store i8* %16, i8** %4, align 8
  %17 = load i8*, i8** %4, align 8
  %18 = icmp ne i8* %17, null
  br i1 %18, label %23, label %19

19:                                               ; preds = %13
  %20 = load i64, i64* %5, align 8
  %21 = icmp ne i64 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  call void @xalloc_die() #13
  unreachable

23:                                               ; preds = %19, %13
  %24 = load i8*, i8** %4, align 8
  store i8* %24, i8** %3, align 8
  br label %25

25:                                               ; preds = %23, %11
  %26 = load i8*, i8** %3, align 8
  ret i8* %26
}

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @x2nrealloc(i8* %0, i64* %1, i64 %2) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64* %1, i64** %5, align 8
  store i64 %2, i64* %6, align 8
  %8 = load i64*, i64** %5, align 8
  %9 = load i64, i64* %8, align 8
  store i64 %9, i64* %7, align 8
  %10 = load i8*, i8** %4, align 8
  %11 = icmp ne i8* %10, null
  br i1 %11, label %32, label %12

12:                                               ; preds = %3
  %13 = load i64, i64* %7, align 8
  %14 = icmp ne i64 %13, 0
  br i1 %14, label %25, label %15

15:                                               ; preds = %12
  %16 = load i64, i64* %6, align 8
  %17 = udiv i64 128, %16
  store i64 %17, i64* %7, align 8
  %18 = load i64, i64* %7, align 8
  %19 = icmp ne i64 %18, 0
  %20 = xor i1 %19, true
  %21 = zext i1 %20 to i32
  %22 = sext i32 %21 to i64
  %23 = load i64, i64* %7, align 8
  %24 = add i64 %23, %22
  store i64 %24, i64* %7, align 8
  br label %25

25:                                               ; preds = %15, %12
  %26 = load i64, i64* %6, align 8
  %27 = udiv i64 9223372036854775807, %26
  %28 = load i64, i64* %7, align 8
  %29 = icmp ult i64 %27, %28
  br i1 %29, label %30, label %31

30:                                               ; preds = %25
  call void @xalloc_die() #13
  unreachable

31:                                               ; preds = %25
  br label %44

32:                                               ; preds = %3
  %33 = load i64, i64* %6, align 8
  %34 = udiv i64 6148914691236517204, %33
  %35 = load i64, i64* %7, align 8
  %36 = icmp ule i64 %34, %35
  br i1 %36, label %37, label %38

37:                                               ; preds = %32
  call void @xalloc_die() #13
  unreachable

38:                                               ; preds = %32
  %39 = load i64, i64* %7, align 8
  %40 = udiv i64 %39, 2
  %41 = add i64 %40, 1
  %42 = load i64, i64* %7, align 8
  %43 = add i64 %42, %41
  store i64 %43, i64* %7, align 8
  br label %44

44:                                               ; preds = %38, %31
  %45 = load i64, i64* %7, align 8
  %46 = load i64*, i64** %5, align 8
  store i64 %45, i64* %46, align 8
  %47 = load i8*, i8** %4, align 8
  %48 = load i64, i64* %7, align 8
  %49 = load i64, i64* %6, align 8
  %50 = mul i64 %48, %49
  %51 = call i8* @xrealloc(i8* %47, i64 %50)
  ret i8* %51
}

; Function Attrs: noinline nounwind optnone uwtable
define internal noalias i8* @xcalloc(i64 %0, i64 %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %6 = load i64, i64* %4, align 8
  %7 = udiv i64 9223372036854775807, %6
  %8 = load i64, i64* %3, align 8
  %9 = icmp ult i64 %7, %8
  br i1 %9, label %15, label %10

10:                                               ; preds = %2
  %11 = load i64, i64* %3, align 8
  %12 = load i64, i64* %4, align 8
  %13 = call noalias i8* @calloc(i64 %11, i64 %12) #15
  store i8* %13, i8** %5, align 8
  %14 = icmp ne i8* %13, null
  br i1 %14, label %16, label %15

15:                                               ; preds = %10, %2
  call void @xalloc_die() #13
  unreachable

16:                                               ; preds = %10
  %17 = load i8*, i8** %5, align 8
  ret i8* %17
}

; Function Attrs: nounwind
declare dso_local noalias i8* @calloc(i64, i64) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @xmemdup(i8* %0, i64 %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  %6 = call noalias i8* @xmalloc(i64 %5)
  %7 = load i8*, i8** %3, align 8
  %8 = load i64, i64* %4, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 %7, i64 %8, i1 false)
  ret i8* %6
}

; Function Attrs: noinline nounwind optnone uwtable
define internal noalias i8* @xstrdup(i8* %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i64 @strlen(i8* %4) #14
  %6 = add i64 %5, 1
  %7 = call i8* @xmemdup(i8* %3, i64 %6)
  ret i8* %7
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i1 @yesno() #0 {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  %3 = call i32 @getchar()
  store i32 %3, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp eq i32 %4, 121
  br i1 %5, label %9, label %6

6:                                                ; preds = %0
  %7 = load i32, i32* %2, align 4
  %8 = icmp eq i32 %7, 89
  br label %9

9:                                                ; preds = %6, %0
  %10 = phi i1 [ true, %0 ], [ %8, %6 ]
  %11 = zext i1 %10 to i8
  store i8 %11, i8* %1, align 1
  br label %12

12:                                               ; preds = %20, %9
  %13 = load i32, i32* %2, align 4
  %14 = icmp ne i32 %13, 10
  br i1 %14, label %15, label %18

15:                                               ; preds = %12
  %16 = load i32, i32* %2, align 4
  %17 = icmp ne i32 %16, -1
  br label %18

18:                                               ; preds = %15, %12
  %19 = phi i1 [ false, %12 ], [ %17, %15 ]
  br i1 %19, label %20, label %22

20:                                               ; preds = %18
  %21 = call i32 @getchar()
  store i32 %21, i32* %2, align 4
  br label %12, !llvm.loop !190

22:                                               ; preds = %18
  %23 = load i8, i8* %1, align 1
  %24 = trunc i8 %23 to i1
  ret i1 %24
}

declare dso_local i32 @getchar() #6

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @rpl_fclose(%struct._IO_FILE* nonnull %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store i32 0, i32* %4, align 4
  store i32 0, i32* %6, align 4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %8 = call i32 @fileno(%struct._IO_FILE* %7) #15
  store i32 %8, i32* %5, align 4
  %9 = load i32, i32* %5, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %14

11:                                               ; preds = %1
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %13 = call i32 @fclose(%struct._IO_FILE* %12)
  store i32 %13, i32* %2, align 4
  br label %40

14:                                               ; preds = %1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %16 = call i32 @__freading(%struct._IO_FILE* %15) #15
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %23

18:                                               ; preds = %14
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %20 = call i32 @fileno(%struct._IO_FILE* %19) #15
  %21 = call i64 @lseek(i32 %20, i64 0, i32 1) #15
  %22 = icmp ne i64 %21, -1
  br i1 %22, label %23, label %30

23:                                               ; preds = %18, %14
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %25 = call i32 @rpl_fflush(%struct._IO_FILE* %24)
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %30

27:                                               ; preds = %23
  %28 = call i32* @__errno_location() #16
  %29 = load i32, i32* %28, align 4
  store i32 %29, i32* %4, align 4
  br label %30

30:                                               ; preds = %27, %23, %18
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %32 = call i32 @fclose(%struct._IO_FILE* %31)
  store i32 %32, i32* %6, align 4
  %33 = load i32, i32* %4, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %38

35:                                               ; preds = %30
  %36 = load i32, i32* %4, align 4
  %37 = call i32* @__errno_location() #16
  store i32 %36, i32* %37, align 4
  store i32 -1, i32* %6, align 4
  br label %38

38:                                               ; preds = %35, %30
  %39 = load i32, i32* %6, align 4
  store i32 %39, i32* %2, align 4
  br label %40

40:                                               ; preds = %38, %11
  %41 = load i32, i32* %2, align 4
  ret i32 %41
}

; Function Attrs: nounwind
declare dso_local i32 @fileno(%struct._IO_FILE*) #5

declare dso_local i32 @fclose(%struct._IO_FILE*) #6

; Function Attrs: nounwind
declare dso_local i32 @__freading(%struct._IO_FILE*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @rpl_fcntl(i32 %0, i32 %1, ...) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [1 x %struct.__va_list_tag], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  store i32 -1, i32* %6, align 4
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0
  %12 = bitcast %struct.__va_list_tag* %11 to i8*
  call void @llvm.va_start(i8* %12)
  %13 = load i32, i32* %4, align 4
  switch i32 %13, label %86 [
    i32 1030, label %14
  ]

14:                                               ; preds = %2
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0
  %16 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %15, i32 0, i32 0
  %17 = load i32, i32* %16, align 16
  %18 = icmp ule i32 %17, 40
  br i1 %18, label %19, label %25

19:                                               ; preds = %14
  %20 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %15, i32 0, i32 3
  %21 = load i8*, i8** %20, align 16
  %22 = getelementptr i8, i8* %21, i32 %17
  %23 = bitcast i8* %22 to i32*
  %24 = add i32 %17, 8
  store i32 %24, i32* %16, align 16
  br label %30

25:                                               ; preds = %14
  %26 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %15, i32 0, i32 2
  %27 = load i8*, i8** %26, align 8
  %28 = bitcast i8* %27 to i32*
  %29 = getelementptr i8, i8* %27, i32 8
  store i8* %29, i8** %26, align 8
  br label %30

30:                                               ; preds = %25, %19
  %31 = phi i32* [ %23, %19 ], [ %28, %25 ]
  %32 = load i32, i32* %31, align 4
  store i32 %32, i32* %7, align 4
  %33 = load i32, i32* @rpl_fcntl.have_dupfd_cloexec, align 4
  %34 = icmp sle i32 0, %33
  br i1 %34, label %35, label %56

35:                                               ; preds = %30
  %36 = load i32, i32* %3, align 4
  %37 = load i32, i32* %4, align 4
  %38 = load i32, i32* %7, align 4
  %39 = call i32 (i32, i32, ...) @fcntl(i32 %36, i32 %37, i32 %38)
  store i32 %39, i32* %6, align 4
  %40 = load i32, i32* %6, align 4
  %41 = icmp sle i32 0, %40
  br i1 %41, label %46, label %42

42:                                               ; preds = %35
  %43 = call i32* @__errno_location() #16
  %44 = load i32, i32* %43, align 4
  %45 = icmp ne i32 %44, 22
  br i1 %45, label %46, label %47

46:                                               ; preds = %42, %35
  store i32 1, i32* @rpl_fcntl.have_dupfd_cloexec, align 4
  br label %55

47:                                               ; preds = %42
  %48 = load i32, i32* %3, align 4
  %49 = load i32, i32* %7, align 4
  %50 = call i32 (i32, i32, ...) @rpl_fcntl(i32 %48, i32 0, i32 %49)
  store i32 %50, i32* %6, align 4
  %51 = load i32, i32* %6, align 4
  %52 = icmp slt i32 %51, 0
  br i1 %52, label %53, label %54

53:                                               ; preds = %47
  br label %109

54:                                               ; preds = %47
  store i32 -1, i32* @rpl_fcntl.have_dupfd_cloexec, align 4
  br label %55

55:                                               ; preds = %54, %46
  br label %60

56:                                               ; preds = %30
  %57 = load i32, i32* %3, align 4
  %58 = load i32, i32* %7, align 4
  %59 = call i32 (i32, i32, ...) @rpl_fcntl(i32 %57, i32 0, i32 %58)
  store i32 %59, i32* %6, align 4
  br label %60

60:                                               ; preds = %56, %55
  %61 = load i32, i32* %6, align 4
  %62 = icmp sle i32 0, %61
  br i1 %62, label %63, label %85

63:                                               ; preds = %60
  %64 = load i32, i32* @rpl_fcntl.have_dupfd_cloexec, align 4
  %65 = icmp eq i32 %64, -1
  br i1 %65, label %66, label %85

66:                                               ; preds = %63
  %67 = load i32, i32* %6, align 4
  %68 = call i32 (i32, i32, ...) @fcntl(i32 %67, i32 1)
  store i32 %68, i32* %8, align 4
  %69 = load i32, i32* %8, align 4
  %70 = icmp slt i32 %69, 0
  br i1 %70, label %77, label %71

71:                                               ; preds = %66
  %72 = load i32, i32* %6, align 4
  %73 = load i32, i32* %8, align 4
  %74 = or i32 %73, 1
  %75 = call i32 (i32, i32, ...) @fcntl(i32 %72, i32 2, i32 %74)
  %76 = icmp eq i32 %75, -1
  br i1 %76, label %77, label %84

77:                                               ; preds = %71, %66
  %78 = call i32* @__errno_location() #16
  %79 = load i32, i32* %78, align 4
  store i32 %79, i32* %9, align 4
  %80 = load i32, i32* %6, align 4
  %81 = call i32 @close(i32 %80)
  %82 = load i32, i32* %9, align 4
  %83 = call i32* @__errno_location() #16
  store i32 %82, i32* %83, align 4
  store i32 -1, i32* %6, align 4
  br label %84

84:                                               ; preds = %77, %71
  br label %85

85:                                               ; preds = %84, %63, %60
  br label %109

86:                                               ; preds = %2
  %87 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0
  %88 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %87, i32 0, i32 0
  %89 = load i32, i32* %88, align 16
  %90 = icmp ule i32 %89, 40
  br i1 %90, label %91, label %97

91:                                               ; preds = %86
  %92 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %87, i32 0, i32 3
  %93 = load i8*, i8** %92, align 16
  %94 = getelementptr i8, i8* %93, i32 %89
  %95 = bitcast i8* %94 to i8**
  %96 = add i32 %89, 8
  store i32 %96, i32* %88, align 16
  br label %102

97:                                               ; preds = %86
  %98 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %87, i32 0, i32 2
  %99 = load i8*, i8** %98, align 8
  %100 = bitcast i8* %99 to i8**
  %101 = getelementptr i8, i8* %99, i32 8
  store i8* %101, i8** %98, align 8
  br label %102

102:                                              ; preds = %97, %91
  %103 = phi i8** [ %95, %91 ], [ %100, %97 ]
  %104 = load i8*, i8** %103, align 8
  store i8* %104, i8** %10, align 8
  %105 = load i32, i32* %3, align 4
  %106 = load i32, i32* %4, align 4
  %107 = load i8*, i8** %10, align 8
  %108 = call i32 (i32, i32, ...) @fcntl(i32 %105, i32 %106, i8* %107)
  store i32 %108, i32* %6, align 4
  br label %109

109:                                              ; preds = %102, %85, %53
  %110 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0
  %111 = bitcast %struct.__va_list_tag* %110 to i8*
  call void @llvm.va_end(i8* %111)
  %112 = load i32, i32* %6, align 4
  ret i32 %112
}

declare dso_local i32 @fcntl(i32, i32, ...) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @rpl_fflush(%struct._IO_FILE* %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %7 = icmp eq %struct._IO_FILE* %6, null
  br i1 %7, label %12, label %8

8:                                                ; preds = %1
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %10 = call i32 @__freading(%struct._IO_FILE* %9) #15
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %15, label %12

12:                                               ; preds = %8, %1
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %14 = call i32 @fflush(%struct._IO_FILE* %13)
  store i32 %14, i32* %2, align 4
  br label %41

15:                                               ; preds = %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %17 = call i64 @ftello(%struct._IO_FILE* %16)
  store i64 %17, i64* %4, align 8
  %18 = load i64, i64* %4, align 8
  %19 = icmp eq i64 %18, -1
  br i1 %19, label %20, label %22

20:                                               ; preds = %15
  %21 = call i32* @__errno_location() #16
  store i32 9, i32* %21, align 4
  store i32 -1, i32* %2, align 4
  br label %41

22:                                               ; preds = %15
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  call void @clear_ungetc_buffer(%struct._IO_FILE* %23)
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %25 = call i32 @fpurge(%struct._IO_FILE* %24)
  store i32 %25, i32* %5, align 4
  %26 = load i32, i32* %5, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %22
  %29 = load i32, i32* %5, align 4
  store i32 %29, i32* %2, align 4
  br label %41

30:                                               ; preds = %22
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %32 = call i32 @fileno(%struct._IO_FILE* %31) #15
  %33 = load i64, i64* %4, align 8
  %34 = call i64 @lseek(i32 %32, i64 %33, i32 0) #15
  store i64 %34, i64* %4, align 8
  %35 = load i64, i64* %4, align 8
  %36 = icmp eq i64 %35, -1
  br i1 %36, label %37, label %38

37:                                               ; preds = %30
  store i32 -1, i32* %2, align 4
  br label %41

38:                                               ; preds = %30
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %40 = load i64, i64* %4, align 8
  call void @update_fpos_cache(%struct._IO_FILE* %39, i64 %40)
  store i32 0, i32* %2, align 4
  br label %41

41:                                               ; preds = %38, %37, %28, %20, %12
  %42 = load i32, i32* %2, align 4
  ret i32 %42
}

declare dso_local i32 @fflush(%struct._IO_FILE*) #6

declare dso_local i64 @ftello(%struct._IO_FILE*) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal void @clear_ungetc_buffer(%struct._IO_FILE* %0) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %4 = call i32 @rpl_fseeko(%struct._IO_FILE* %3, i64 0, i32 1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @update_fpos_cache(%struct._IO_FILE* %0, i64 %1) #0 {
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca i64, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store i64 %1, i64* %4, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @fpurge(%struct._IO_FILE* nonnull %0) #0 {
  %2 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  call void @__fpurge(%struct._IO_FILE* %3) #15
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local void @__fpurge(%struct._IO_FILE*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @rpl_fseeko(%struct._IO_FILE* nonnull %0, i64 %1, i32 %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store %struct._IO_FILE* %0, %struct._IO_FILE** %5, align 8
  store i64 %1, i64* %6, align 8
  store i32 %2, i32* %7, align 4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %9, i32 0, i32 2
  %11 = load i8*, i8** %10, align 8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %13 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %12, i32 0, i32 1
  %14 = load i8*, i8** %13, align 8
  %15 = icmp eq i8* %11, %14
  br i1 %15, label %16, label %39

16:                                               ; preds = %3
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %17, i32 0, i32 5
  %19 = load i8*, i8** %18, align 8
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %21 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %20, i32 0, i32 4
  %22 = load i8*, i8** %21, align 8
  %23 = icmp eq i8* %19, %22
  br i1 %23, label %24, label %39

24:                                               ; preds = %16
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %25, i32 0, i32 9
  %27 = load i8*, i8** %26, align 8
  %28 = icmp eq i8* %27, null
  br i1 %28, label %29, label %39

29:                                               ; preds = %24
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fileno(%struct._IO_FILE* %30) #15
  %32 = load i64, i64* %6, align 8
  %33 = load i32, i32* %7, align 4
  %34 = call i64 @lseek(i32 %31, i64 %32, i32 %33) #15
  store i64 %34, i64* %8, align 8
  %35 = load i64, i64* %8, align 8
  %36 = icmp eq i64 %35, -1
  br i1 %36, label %37, label %38

37:                                               ; preds = %29
  store i32 -1, i32* %4, align 4
  br label %44

38:                                               ; preds = %29
  store i32 0, i32* %4, align 4
  br label %44

39:                                               ; preds = %24, %16, %3
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %41 = load i64, i64* %6, align 8
  %42 = load i32, i32* %7, align 4
  %43 = call i32 @fseeko(%struct._IO_FILE* %40, i64 %41, i32 %42)
  store i32 %43, i32* %4, align 4
  br label %44

44:                                               ; preds = %39, %38, %37
  %45 = load i32, i32* %4, align 4
  ret i32 %45
}

declare dso_local i32 @fseeko(%struct._IO_FILE*, i64, i32) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @dup_safer(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i32, i32, ...) @rpl_fcntl(i32 %3, i32 0, i32 3)
  ret i32 %4
}

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind optnone readnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind readonly "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline noreturn nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readnone "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn nounwind "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noinline nounwind optnone readonly uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nofree nosync nounwind willreturn }
attributes #13 = { noreturn }
attributes #14 = { nounwind readonly }
attributes #15 = { nounwind }
attributes #16 = { nounwind readnone }
attributes #17 = { noreturn nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
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
!50 = distinct !{!50, !6}
!51 = distinct !{!51, !6}
!52 = distinct !{!52, !6}
!53 = distinct !{!53, !6}
!54 = distinct !{!54, !6}
!55 = distinct !{!55, !6}
!56 = distinct !{!56, !6}
!57 = distinct !{!57, !6}
!58 = distinct !{!58, !6}
!59 = distinct !{!59, !6}
!60 = distinct !{!60, !6}
!61 = distinct !{!61, !6}
!62 = distinct !{!62, !6}
!63 = distinct !{!63, !6}
!64 = distinct !{!64, !6}
!65 = distinct !{!65, !6}
!66 = distinct !{!66, !6}
!67 = distinct !{!67, !6}
!68 = distinct !{!68, !6}
!69 = distinct !{!69, !6}
!70 = distinct !{!70, !6}
!71 = distinct !{!71, !6}
!72 = distinct !{!72, !6}
!73 = distinct !{!73, !6}
!74 = distinct !{!74, !6}
!75 = distinct !{!75, !6}
!76 = distinct !{!76, !6}
!77 = distinct !{!77, !6}
!78 = distinct !{!78, !6}
!79 = distinct !{!79, !6}
!80 = distinct !{!80, !6}
!81 = distinct !{!81, !6}
!82 = distinct !{!82, !6}
!83 = distinct !{!83, !6}
!84 = distinct !{!84, !6}
!85 = distinct !{!85, !6}
!86 = distinct !{!86, !6}
!87 = distinct !{!87, !6}
!88 = distinct !{!88, !6}
!89 = distinct !{!89, !6}
!90 = distinct !{!90, !6}
!91 = distinct !{!91, !6}
!92 = distinct !{!92, !6}
!93 = distinct !{!93, !6}
!94 = distinct !{!94, !6}
!95 = distinct !{!95, !6}
!96 = distinct !{!96, !6}
!97 = distinct !{!97, !6}
!98 = distinct !{!98, !6}
!99 = distinct !{!99, !6}
!100 = distinct !{!100, !6}
!101 = distinct !{!101, !6}
!102 = distinct !{!102, !6}
!103 = distinct !{!103, !6}
!104 = distinct !{!104, !6}
!105 = distinct !{!105, !6}
!106 = distinct !{!106, !6}
!107 = distinct !{!107, !6}
!108 = distinct !{!108, !6}
!109 = distinct !{!109, !6}
!110 = distinct !{!110, !6}
!111 = distinct !{!111, !6}
!112 = distinct !{!112, !6}
!113 = distinct !{!113, !6}
!114 = distinct !{!114, !6}
!115 = distinct !{!115, !6}
!116 = distinct !{!116, !6}
!117 = distinct !{!117, !6}
!118 = distinct !{!118, !6}
!119 = distinct !{!119, !6}
!120 = distinct !{!120, !6}
!121 = distinct !{!121, !6}
!122 = distinct !{!122, !6}
!123 = distinct !{!123, !6}
!124 = distinct !{!124, !6}
!125 = distinct !{!125, !6}
!126 = distinct !{!126, !6}
!127 = distinct !{!127, !6}
!128 = distinct !{!128, !6}
!129 = distinct !{!129, !6}
!130 = distinct !{!130, !6}
!131 = distinct !{!131, !6}
!132 = distinct !{!132, !6}
!133 = distinct !{!133, !6}
!134 = distinct !{!134, !6}
!135 = distinct !{!135, !6}
!136 = distinct !{!136, !6}
!137 = distinct !{!137, !6}
!138 = distinct !{!138, !6}
!139 = distinct !{!139, !6}
!140 = distinct !{!140, !6}
!141 = distinct !{!141, !6}
!142 = distinct !{!142, !6}
!143 = distinct !{!143, !6}
!144 = distinct !{!144, !6}
!145 = distinct !{!145, !6}
!146 = distinct !{!146, !6}
!147 = distinct !{!147, !6}
!148 = distinct !{!148, !6}
!149 = distinct !{!149, !6}
!150 = distinct !{!150, !6}
!151 = distinct !{!151, !6}
!152 = distinct !{!152, !6}
!153 = distinct !{!153, !6}
!154 = distinct !{!154, !6}
!155 = distinct !{!155, !6}
!156 = distinct !{!156, !6}
!157 = distinct !{!157, !6}
!158 = distinct !{!158, !6}
!159 = distinct !{!159, !6}
!160 = distinct !{!160, !6}
!161 = distinct !{!161, !6}
!162 = distinct !{!162, !6}
!163 = distinct !{!163, !6}
!164 = distinct !{!164, !6}
!165 = distinct !{!165, !6}
!166 = distinct !{!166, !6}
!167 = distinct !{!167, !6}
!168 = distinct !{!168, !6}
!169 = distinct !{!169, !6}
!170 = distinct !{!170, !6}
!171 = distinct !{!171, !6}
!172 = distinct !{!172, !6}
!173 = distinct !{!173, !6}
!174 = distinct !{!174, !6}
!175 = distinct !{!175, !6}
!176 = distinct !{!176, !6}
!177 = distinct !{!177, !6}
!178 = distinct !{!178, !6}
!179 = distinct !{!179, !6}
!180 = distinct !{!180, !6}
!181 = distinct !{!181, !6}
!182 = distinct !{!182, !6}
!183 = distinct !{!183, !6}
!184 = distinct !{!184, !6}
!185 = distinct !{!185, !6}
!186 = distinct !{!186, !6}
!187 = distinct !{!187, !6}
!188 = distinct !{!188, !6}
!189 = distinct !{!189, !6}
!190 = distinct !{!190, !6}
