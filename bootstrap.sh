#! /usr/bin/env bash

DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh

if grep Developer git/.gitconfig; then
    error "Please change your name in git/.gitconfig"
    exit 1
fi

if grep developer@vtex.com git/.gitconfig; then
    error "Please change your email in git/.gitconfig"
    exit 1
fi

if grep "COMPUTER_NAME=rio" macos/setup.sh; then
    error "Please change your computer name in macos/setup.sh"
    exit 1
fi

info "Prompting for sudo password..."
if sudo -v; then
    # Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo credentials updated."
else
    error "Failed to obtain sudo credentials."
fi

info "Installing XCode command line tools..."
if xcode-select --print-path &>/dev/null; then
    success "XCode command line tools already installed."
elif xcode-select --install &>/dev/null; then
    success "Started installing XCode command line tools. Run bootstrap again once it's finished."
    exit 0
else
    error "Failed to install XCode command line tools."
fi

# Package control must be executed first in order for the rest to work
./packages/setup.sh

find * -name "setup.sh" -not -wholename "packages*" | while read setup; do
    ./$setup
done

success "Finished installing Dotfiles"
