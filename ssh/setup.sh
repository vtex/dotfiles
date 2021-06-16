#! /usr/bin/env bash

mkdir $HOME/.ssh
echo "Host *
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_rsa
" >> ~/.ssh/config