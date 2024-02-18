#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

dart_html_usage=("$(grep -r packages --include "*\.dart" -e "dart:html" -l | grep -v "/\.dart_tool/" || true)")

if [[ -n "${dart_html_usage[*]}" ]]; then
  printf "%s\n" "${dart_html_usage[@]}"
    echo "Use package:web/web.dart instead"
  exit 1
fi
