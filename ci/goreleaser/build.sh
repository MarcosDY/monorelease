#!/bin/bash -x

set -euo pipefail

echo "OS=${OS}"
echo "ARCH=${ARCH}"
echo "TARGET=${TARGET}"
echo "OUTPUT_PATH=${OUTPUT_PATH}"
echo "VERSION=${VERSION}"

# Validate required environment variables
required_vars=("OS" "ARCH" "TARGET" "OUTPUT_PATH" "VERSION")
for var in "${required_vars[@]}"; do
  if [ -z "${!var}" ]; then
    echo "ERROR: Required environment variable $var is not set" >&2
    exit 1
  fi
done

echo "Building for OS: $OS, ARCH: $ARCH, TARGET: $TARGET"
