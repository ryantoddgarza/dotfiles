#!/bin/bash

# Set macOS defaults and install software.

set -e

usage() {
cat << EOF
usage: $(basename $0) [options]

options:
  -f, --force    Do not prompt for confirmation before running
  -h, --help     Show this help message
EOF
}

init_dotfile_repo() {
  dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

  $dotfiles checkout --force
  $dotfiles submodule update --init --recursive
  $dotfiles config status.showUntrackedFiles no

  unset dotfiles
}

source_scripts() {
  for file in ~/.macos/bin/{set-macos-defaults,install-software,set-app-preferences}
  do
    source "$file"
  done
  unset file
}

bootstrap() {
  init_dotfile_repo
  source_scripts
}

prompt_to_run() {
  read -p 'This will overwrite existing system preferences and install software. Are you sure? (y/n) '
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo ''
    source_scripts
  else
    exit 1
  fi
}

parse_options() {
  for opt in $@
  do
    case $opt in
      -h | --help ) usage ;;
      -f | --force ) bootstrap ;;
      * ) echo "unknown option: $opt"; usage; exit 1 ;;
    esac
  done
  unset opt
}

if [[ -n $@ ]]
then
  parse_options $@
else
  prompt_to_run
fi
