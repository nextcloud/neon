#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

git submodule init
git submodule update
dart pub global activate mono_repo 6.4.2
dart pub global activate fvm 2.4.1
yes | fvm install
fvm exec mono_repo pub get
