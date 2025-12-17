#!/usr/bin/env python3


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
