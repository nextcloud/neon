#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

for package in packages/neon/*; do
  (
    cd "$package"
    fvm flutter gen-l10n
  ) &
done

wait

./tool/format.sh
