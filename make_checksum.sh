#!/bin/bash
set -euo pipefail

archive="${1:-UXCamSwiftUI.xcframework.zip}"
if [[ ! -f "$archive" ]]; then
  echo "usage: $0 /path/to/UXCamSwiftUI.xcframework.zip" >&2
  exit 2
fi

swift package compute-checksum "$archive"
