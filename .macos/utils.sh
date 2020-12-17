validate_sudo() {
  sudo -v
}

make_scripts_executable() {
  find $1 -type f -name '*.sh' | xargs chmod +x
}
