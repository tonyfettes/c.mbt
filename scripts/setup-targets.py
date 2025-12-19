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
import json


def main():
    for moon_pkg_path in Path.cwd().rglob("moon.pkg.json"):
        moon_pkg_text = moon_pkg_path.read_text()
        moon_pkg_json = json.loads(moon_pkg_text)
        targets = moon_pkg_json.get("targets", {})
        moonbit_files = moon_pkg_path.parent.glob("*.mbt")
        for moonbit_path in moonbit_files:
            moonbit_name = moonbit_path.name
            if moonbit_name not in targets:
                targets[moonbit_name] = ["native"]
        moon_pkg_json["targets"] = targets
        moon_pkg_path.write_text(json.dumps(moon_pkg_json, indent=2) + "\n")


if __name__ == "__main__":
    main()
