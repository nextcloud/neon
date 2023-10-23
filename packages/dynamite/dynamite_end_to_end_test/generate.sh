#!/bin/bash
set -euxo pipefail

(
  fvm dart pub run build_runner build --delete-conflicting-outputs
  fvm dart fix --apply lib/
  melos run format
)
