#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

output="version: 2
updates:"

function add_update() {
  package_ecosystem="$1"
  path="$2"

  output+="
  - package-ecosystem: \"$package_ecosystem\"
    directory: \"$path\"
    schedule:
      interval: \"daily\"
    labels:
      - \"dependencies\""
}

add_update github-actions /
add_update gradle /packages/app/android
add_update pub /
for path in $(melos list --relative --parsable); do
  add_update pub "/$path"
done

echo "$output" > .github/dependabot.yml
