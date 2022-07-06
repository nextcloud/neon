#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

(
  cd packages
  fvm dart format --fix --line-length 120 .
)
