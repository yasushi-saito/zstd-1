package(default_visibility = ["//visibility:public"])

cc_library(
    name = "libzstd",
    copts = [
        "-DXXH_NAMESPACE=ZSTD_",
        "-DZSTD_MULTITHREAD",
    ],
    linkopts = ["-lpthread"],
    deps = [":zstd_header"],
    srcs = glob(
        [
            "lib/*.h",
            "lib/decompress/*.c",
            "lib/decompress/*.h",
            "lib/common/*.c",
            "lib/common/*.h",
            "lib/dictBuilder/*.c",
            "lib/dictBuilder/*.h",
            "lib/deprecated/*.c",
            "lib/deprecated/*.h",
            "lib/compress/*.c",
            "lib/compress/*.h",
        ],
    ),
)

cc_library(
    name = "zstd_header",
    hdrs = ["lib/zstd.h"],
    strip_include_prefix = "lib",
)
