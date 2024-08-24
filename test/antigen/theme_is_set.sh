#!/bin/bash

set -e

source dev-container-features-test-lib
cat $HOME/.zshrc
check  "theme is set" zsh -c "cat $HOME/.zshrc | grep 'antigen theme spaceship-prompt/spaceship-prompt'"


reportResults