#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

dart pub global activate melos 3.1.0
dart pub global activate mono_repo 6.5.6
dart pub global activate fvm 2.4.1
echo "y" | fvm install
melos exec --concurrency=1 flutter pub get
