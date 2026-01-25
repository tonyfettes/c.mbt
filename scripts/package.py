#!/usr/bin/env python3

# Copyright 2025 International Digital Economy Academy
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

from pathlib import Path
import shutil
import json


def package():
    src_dir = Path.cwd() / "src"
    pub_dir = Path.cwd() / "publish"
    pub_dir.mkdir(exist_ok=True)

    # Copy moon.mod.json, README.md, and LICENSE
    for filename in ["moon.mod.json", "README.md", "LICENSE"]:
        src_file = Path.cwd() / filename
        if src_file.exists():
            shutil.copy2(src_file, pub_dir / filename)

    shutil.copytree(src_dir, pub_dir / "src", dirs_exist_ok=True)

    # Remove *_test.mbt files
    for test_file in (pub_dir / "src").rglob("*_test.mbt"):
        test_file.unlink()

    # Clean moon.pkg.json files
    for pkg_file in (pub_dir / "src").rglob("moon.pkg.json"):
        with open(pkg_file, "r") as f:
            pkg = json.load(f)

        # Remove test-import field
        pkg.pop("test-import", None)

        # Remove *_test.mbt entries from targets
        if "targets" in pkg:
            pkg["targets"] = {
                k: v for k, v in pkg["targets"].items()
                if not k.endswith("_test.mbt")
            }
            # Remove targets if empty
            if not pkg["targets"]:
                del pkg["targets"]

        with open(pkg_file, "w") as f:
            json.dump(pkg, f, indent=2)
            f.write("\n")


if __name__ == "__main__":
    package()
