#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

yq -iy "del(.flags)" .github/codecov.yaml

for package in $(melos list --dir-exists=test --json | jq -c '.[]'); do
    name=$(echo $package | jq -r '.name')
    location=$(echo $package | jq -r '.location')
    location=${location##"$(pwd)/"}
    echo "$name $location"

    yq -iy ".flags.$name.paths[0] = \"$location\" | .flags.$name.carryforward = true" .github/codecov.yaml
done
