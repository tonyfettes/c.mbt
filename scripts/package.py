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


if __name__ == "__main__":
    package()
