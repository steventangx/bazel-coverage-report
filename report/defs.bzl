# Copyright 2018 The Bazel Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Coverage report generation."""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

_LCOV_BUILD_FILE_CONTENT = """
filegroup(
    name = "bin",
    srcs = glob(["bin/**/*"]),
    visibility = ["//visibility:public"],
)
"""

def bazel_coverage_report_repositories():
    """Add to the WORKSPACE external dependencies needed by the generator.
    """
    if "lcov" not in native.existing_rules():
        new_git_repository(
            name = "lcov",
            build_file_content = _LCOV_BUILD_FILE_CONTENT,
            commit = "a5dd9529f9232b8d901a4d6eb9ae54cae179e5b3",
            remote = "https://github.com/linux-test-project/lcov.git",
        )
