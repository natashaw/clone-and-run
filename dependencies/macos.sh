#!/usr/bin/env bash

set -euo pipefail

# Ask for the super user password upfront
sudo -v

print_and_return () {
  echo "$2"
  return $1
}

command_absent? () {
  ! [ -x "$(command -v $1)" ] || print_and_return $? "Command $1 found. Skipping."
}

# Homebrew
command_absent? brew && NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile

# Docker
if ! [ -d "/Applications/Docker.app" ]; then
  # NOTE: uncomment the following line for Intel machines (i.e., non M1/M2 chip)
  # softwareupdate --install-rosetta
  cd ~/Downloads
  curl -O https://desktop.docker.com/mac/main/amd64/Docker.dmg
  sudo hdiutil attach Docker.dmg
  sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
  sudo hdiutil detach /Volumes/Docker
else
  echo "Docker is already installed. Skipping."
fi

exit 0
