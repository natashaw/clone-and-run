#!/usr/bin/env bash

set -euo pipefail

# Ask for the super user password upfront
sudo -v

print_and_return () {
  echo "$2"
  return $1
}

tapped? () {
  ! brew tap | grep "$1" > /dev/null || print_and_return $? "Tap $1 is already tapped. Skipping."
}

command_absent? () {
  ! [ -x "$(command -v $1)" ] || print_and_return $? "Command $1 found. Skipping."
}

application_absent? () {
  ! [ -d "/Applications/$1.app" ] || print_and_return $? "Application $1 found. Skipping."
}

# Docker
if ! [ -d "/Applications/Docker.app" ]; then
  softwareupdate --install-rosetta
  cd ~/Downloads
  curl -O https://desktop.docker.com/mac/main/amd64/Docker.dmg
  sudo hdiutil attach Docker.dmg
  sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
  sudo hdiutil detach /Volumes/Docker
else
  echo "Docker is already installed. Skipping."
fi

# Homebrew
command_absent? brew && NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile

# osx-cross
tapped? osx-cross/avr && brew tap osx-cross/avr

# lsusb
tapped? jlhonora/lsusb && brew tap jlhonora/lsusb

# Turbo Boost Switcher
application_absent? "Turbo Boost Switcher" && brew install --cask turbo-boost-switcher

# iTerm
application_absent? iTerm && brew install --cask iterm2

# Raycast
application_absent? Raycast && brew install --cask raycast

# 1Password
application_absent? "1Password 7" && brew install --cask 1password

# Notion
application_absent? Notion && brew install --cask notion

# Dropbox
application_absent? Dropbox && brew install --cask dropbox

# WhatsApp
application_absent? WhatsApp && brew install --cask whatsapp

# Spotify
application_absent? Spotify && brew install --cask spotify

# Slack
application_absent? Slack && brew install --cask slack

# Zoom
application_absent? Zoom && brew install --cask zoom

# Google Chrome
application_absent? "Google Chrome" && brew install --cask google-chrome

# youtube-dl
command_absent? youtube-dl && brew install youtube-dl

# Brew Cleanup
brew cleanup

exit 0
