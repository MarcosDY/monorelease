#!/bin/bash -x

set -euo pipefail

echo "This is a test script to demonstrate error handling."
# Force an error
this_command_does_not_exist
