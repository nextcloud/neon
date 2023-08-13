#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

for package in $(yq -r ".dev_dependencies | keys | .[]" pubspec.yaml); do
  version="$(yq -r ".dev_dependencies.$package" pubspec.yaml)"
  dart pub global activate "$package" "$version"
done
echo "y" | fvm install
melos exec --concurrency=1 flutter pub get
dart run husky install
