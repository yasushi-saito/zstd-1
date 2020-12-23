load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)

def repositories():
    _maybe(
        http_archive,
        name = "com_github_facebook_zstd",
	build_file = "@com_github_cschuet_zstd//bazel/third_party:zstd.BUILD",
        strip_prefix = "zstd-1.4.8",
	sha256 = "f176f0626cb797022fbf257c3c644d71c1c747bb74c32201f9203654da35e9fa",
        urls = [
            "https://github.com/facebook/zstd/archive/v1.4.8.tar.gz",
        ],
    )
