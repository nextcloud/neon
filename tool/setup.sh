#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

dart pub global activate melos 3.0.1
dart pub global activate mono_repo 6.5.6
dart pub global activate fvm 2.4.1
yes | fvm install
fvm exec mono_repo pub get
