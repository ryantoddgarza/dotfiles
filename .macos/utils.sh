#!/bin/bash

validate_sudo() {
  sudo -v
}

verbose_script() {
  filename="$(basename $0)"

  print_spaced "› $filename"

  exit_trap() {
    if [ $? -eq 0 ]
    then
      print_spaced "[✔] $filename"
    else
      print_spaced "[✖] $filename"
    fi
  }

  trap exit_trap EXIT
}

print_spaced() {
  printf "\n$1\n\n"
}

brew_pkg_is_instaled() {
  brew list --formula --versions $1 &>/dev/null
  brew list --cask --versions $1 &>/dev/null
}

install_brew_package() {
  if [ ! $brew_pkg_is_installed ]
  then
    brew install $@
  else
    echo "$1 exists"
  fi
}
