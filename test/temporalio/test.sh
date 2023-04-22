#!/bin/bash -i

set -e

# Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

check "validate default namespace exist" temporalite | grep 'default'

reportResults
