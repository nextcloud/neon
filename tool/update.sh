#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

if [[ "$1" == "flutter" ]]; then
  flutter_channel="stable"
  flutter_version="$(curl https://raw.githubusercontent.com/fluttertools/fvm/main/releases_linux.json | jq -r "[.releases[] | select(.channel==\"$flutter_channel\")][0].version")"
  yes | fvm use --force "$flutter_version@$flutter_channel" || true
  dart_version="$(fvm flutter --version --machine | jq -r ".dartSdkVersion")"
  dart_version_major="$(echo "$dart_version" | cut -d "." -f 1)"
  dart_version_minor="$(echo "$dart_version" | cut -d "." -f 2)"
  dart_version_next_major=$(( dart_version_major + 1 ))
  find ./packages -name "pubspec.yaml" -exec sed -i "s/flutter: '>=.*'/flutter: '>=$flutter_version'/" {} \;
  find ./packages -name "pubspec.yaml" -exec sed -i "s/sdk: '>=.* <.*'/sdk: '>=$dart_version_major.$dart_version_minor.0 <$dart_version_next_major.0.0'/" {} \;
  fvm exec mono_repo pub get
elif [[ "$1" == "dependencies" ]]; then
    fvm exec mono_repo pub upgrade --major-versions
    fvm exec mono_repo pub upgrade
elif [ -d "external/nextcloud-$1" ]; then
    (
      cd "external/nextcloud-$1"
      git fetch --tags --force
      latest_tag="$(git tag --sort=v:refname | grep -vi "rc" | grep -vi "alpha" | grep -vi "beta" | tail -n 1)"
      git reset --hard "$latest_tag"
      git submodule update
    )
else
  echo "$1 not found"
  exit 1
fi