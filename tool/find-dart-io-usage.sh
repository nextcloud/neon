#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

dart_io_usage=("$(grep -r packages --include "*\.dart" -e "dart:io" -l | grep -v "/\.dart_tool/" | grep -v "/bin/" | grep -v "/test_driver/" || true)")

if [[ -n "${dart_io_usage[*]}" ]]; then
  printf "%s\n" "${dart_io_usage[@]}"
  exit 1
fi
