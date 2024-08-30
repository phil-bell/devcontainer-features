#!/bin/bash
set -e

echo "Finding current user"
chsh -s "$(which zsh)" "$_REMOTE_USER"

echo "Current user $_REMOTE_USER"
if [ "$_REMOTE_USER" = "root" ]; then
  USER_LOCATION="/root"
  curl -L git.io/antigen > "$USER_LOCATION/antigen.zsh"
else
  USER_LOCATION="/home/$_REMOTE_USER"
  curl -L git.io/antigen > "$USER_LOCATION/antigen.zsh"
fi
# apt install zsh-antigen

echo "Installing antigen to $USER_LOCATION/antigen.zsh"
echo "source $USER_LOCATION/antigen.zsh" >> $USER_LOCATION/.zshrc

if [ -z "${THEME}" ]; then
  echo "No theme set"
else
  echo "Setting theme to ${THEME}"
  echo "antigen theme ${THEME}" >> $USER_LOCATION/.zshrc
fi

echo "Bundles found: ${BUNDLES}"
if [ -z "${BUNDLES}"  ]; then
  echo "No bundles set"
else
  echo "Bundles found: ${BUNDLES}"
  IFS=', ' read -r -a array <<< "$BUNDLES"

  for bundle in ${array[@]}; do
    echo "Installing plugins: ${bundle}"
    echo "antigen bundle ${bundle}" >> $USER_LOCATION/.zshrc
  done 
fi
echo "Setting antigen to apply"
echo "antigen apply" >> $USER_LOCATION/.zshrc