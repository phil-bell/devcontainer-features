#!/bin/bash

set -e

source dev-container-features-test-lib

check  "no bundles are set when not given" zsh -c "cat $HOME/.zshrc | grep --invert-match 'antigen bundle'"


reportResults