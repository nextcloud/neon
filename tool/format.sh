#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages
  fvm dart format --fix --line-length 120 .
  # mitigate dart format bug
  fvm dart format --fix --line-length 120 .
)
