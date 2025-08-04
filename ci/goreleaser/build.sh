#!/bin/bash -x

set -euo pipefail

echo "This is a test script to demonstrate error handling."

echo "MISE_TRUSTED_CONFIG_PATHS: $MISE_TRUSTED_CONFIG_PATHS"`
echo "MISE_YES: $MISE_YES"
echo "MISE_LOG_LEVEL: $MISE_LOG_LEVEL"
bazel info

bazel build //:test_target || {
  echo "Bazel build failed. Exiting script."
  exit 1
}
