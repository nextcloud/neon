#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

dart pub global activate coverage
dart pub global activate custom_lint
dart pub global activate fvm
dart pub global activate melos
echo "y" | fvm install

if [ ! -v GITHUB_REPOSITORY ]; then
  fvm flutter precache
  fvm flutter pub get
else
  fvm flutter pub get
  melos run format
fi
