#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

for package in $(yq -r ".dev_dependencies | keys | .[]" pubspec.yaml); do
  version="$(yq -r ".dev_dependencies.$package" pubspec.yaml)"
  dart pub global activate "$package" "$version"
done
echo "y" | fvm install

if [ ! -v GITHUB_REPOSITORY ]; then
  fvm flutter precache
  melos bootstrap
else
  melos exec -c1 -- flutter pub get
  melos run format
fi

fvm dart run husky install
