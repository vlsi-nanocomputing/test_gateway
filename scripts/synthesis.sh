#!/usr/bin/env bash
set -euo pipefail

BUILD_DIR="${1:-build}"

mkdir -p "$BUILD_DIR"

echo "Running placeholder synthesis"
echo "BUILD_DIR=$BUILD_DIR"
echo "Date: $(date -Is)"

echo "This is where synthesis commands will go." > "$BUILD_DIR/synthesis.log"

echo "Placeholder synthesis completed"
