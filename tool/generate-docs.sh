#!/usr/bin/env bash
set -euxo pipefail
cd "$(dirname "$0")/.."

plantuml -tsvg docs/*.puml
