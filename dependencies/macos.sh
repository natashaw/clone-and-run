#!/usr/bin/env bash

set -euo pipefail

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

# Homebrew
command_absent? brew && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# osx-cross
tapped? osx-cross/avr && brew tap osx-cross/avr

# lsusb
tapped? jlhonora/lsusb && brew tap jlhonora/lsusb

# fzf - fuzzy search
command_absent? fzf && brew install fzf

# youtube-dl
command_absent? youtube-dl && brew install youtube-dl

# gh - github cli interface
command_absent? gh && brew install gh

# mas - cli for Mac App Store
command_absent? mas && brew install mas

# htop
command_absent? htop && brew install htop

# nmap
command_absent? nmap && brew install nmap

# iTerm
application_absent? iTerm && brew install --cask iterm2

# Dropbox
application_absent? Dropbox && brew install --cask dropbox

# Google Chrome
application_absent? "Google Chrome" && brew install --cask google-chrome

# WhatsApp
application_absent? WhatsApp && brew install --cask whatsapp

# Spotify
application_absent? Spotify && brew install --cask spotify

# Tunnelblick
application_absent? Tunnelblick && brew install --cask tunnelblick

# Turbo Boost Switcher
application_absent? "Turbo Boost Switcher" && brew install --cask turbo-boost-switcher

# 1Password
application_absent? "1Password 7" && brew install --cask 1password

# Raycast
application_absent? Raycast && brew install --cask raycast

# Notion
application_absent? Raycast && brew install --cask notion

# Todoist
# application_absent? Todoist && mas install // TODO add app id

# Spark
# application_absent? Spark && mas install // TODO add app id

# Visual Studio Code
application_absent? "Visual Studio Code" && brew install --cask visual-studio-code

# Kite
application_absent? Kite && brew install --cask kite

# Dash
application_absent? Dash && brew install --cask dash

# Postman
application_absent? Postman && brew install --cask postman

# Slack
application_absent? Slack && brew install --cask slack

# Zoom
application_absent? Zoom && brew install --cask zoom

# Brew Cleanup
brew cleanup

exit 0