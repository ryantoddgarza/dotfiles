#!/bin/bash

set -e

main() {
  dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

  $dotfiles checkout --force
  $dotfiles submodule update --init --recursive
  $dotfiles config status.showUntrackedFiles no

  unset dotfiles
}

main