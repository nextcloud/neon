#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

for file in .cspell/*; do
  rm "$file"
  cspell lint --quiet --unique --words-only . | tr '[:upper:]' '[:lower:]' | sort -f | uniq > "$file" || true
done
