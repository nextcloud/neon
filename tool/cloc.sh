#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")/.."

cloc \
  --fullpath \
  --not-match-d="(./external|./specs/templates|./packages/.*/.idea|./packages/.*/build|./packages/.*/coverage|./packages/.*/.dart_tool|./packages/neon/linux/flutter/ephemeral|./packages/nextcloud/doc)" \
  --exclude-ext="g.dart" --exclude-ext="openapi.dart" \
  .
