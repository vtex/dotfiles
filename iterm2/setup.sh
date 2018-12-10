#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath .)"

info "Setting up iTerm2..."

# Load custom preferences from this folder
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$SOURCE"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

success "Successfully set up iTerm2."

