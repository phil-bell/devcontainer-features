#!/bin/bash

set -e

source dev-container-features-test-lib

check  "bundles are set" zsh -c "cat $HOME/.zshrc | grep 'antigen bundle git docker'"


reportResults