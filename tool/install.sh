#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

git submodule init
git submodule update
fvm dart pub global activate mono_repo 6.3.0
fvm dart pub global activate fvm 2.4.1
fvm install
(
  cd external/openapi-generator
  ./mvnw package -DskipTests -Dmaven.test.skip=true
)
fvm exec mono_repo pub get
