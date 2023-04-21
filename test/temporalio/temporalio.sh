#!/bin/sh

set -e

# Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

go install github.com/temporalio/tctl/cmd/tctl@latest

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "validate default namespace exist" tctl namespace list | grep 'default'

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
