#!/bin/bash -x

set -euo pipefail
set -x 

echo "This is a test script to demonstrate error handling."

echo "TARGET=${TARGET}"
echo "OUTPUT_PATH=${OUTPUT_PATH}"
echo "VERSION=${VERSION}"

echo "MISE_TRUSTED_CONFIG_PATHS: $MISE_TRUSTED_CONFIG_PATHS"
echo "MISE_YES: $MISE_YES"
echo "MISE_LOG_LEVEL: $MISE_LOG_LEVEL"

bazel info

bazel build || {
  echo "Bazel build failed. Exiting script."
  exit 1
}
