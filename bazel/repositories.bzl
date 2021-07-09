load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name=name, **kwargs)


def repositories():
    _maybe(
        http_archive,
        name="com_github_facebook_zstd",
        build_file="@com_github_cschuet_zstd//bazel/third_party:zstd.BUILD",
        strip_prefix="zstd-1.5.0",
        sha256="0d9ade222c64e912d6957b11c923e214e2e010a18f39bec102f572e693ba2867",
        urls=["https://github.com/facebook/zstd/archive/v1.5.0.tar.gz",],
    )
