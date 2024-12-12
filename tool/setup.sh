#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

dart pub global activate coverage 1.12.0
dart pub global activate custom_lint 0.7.5
dart pub global activate fvm 3.2.1
dart pub global activate melos 6.0.0

echo "y" | fvm install

if [ ! -v GITHUB_REPOSITORY ]; then
  fvm flutter precache
fi

fvm flutter pub get
