function update --description 'Get OS X Software Updates and update Homebrew'
    sudo softwareupdate -i -a
    brew update
    brew upgrade --force --all
    brew cleanup
end
