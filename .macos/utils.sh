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

make_scripts_executable() {
  find $1 -type f | xargs chmod +x
}

print_spaced() {
  printf "\n$1\n\n"
}
