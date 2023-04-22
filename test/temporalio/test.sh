#!/bin/bash

set -e

# Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

check "Validate temporalite is installed." temporalite --version | grep 'temporalite version 0.3.0 (server 1.18.1)'

reportResults
