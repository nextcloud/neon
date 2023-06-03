#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

color="#f37736"

wget https://raw.githubusercontent.com/Templarian/MaterialDesign/master/svg/cable-data.svg -O assets/logo.svg
sed -i "s/<path /<path fill=\"$color\" /g" assets/logo.svg
