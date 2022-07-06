#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

cloc \
  --fullpath \
  --not-match-d="(./external|./specs/templates|./packages/.*/.idea|./packages/.*/build|./packages/.*/coverage|./packages/.*/.dart_tool|./packages/harbour/linux/flutter/ephemeral|./packages/nextcloud/lib/src/clients/common|./packages/nextcloud/lib/src/clients/generated|./packages/nextcloud/doc)" \
  --exclude-ext="g.dart" \
  .
