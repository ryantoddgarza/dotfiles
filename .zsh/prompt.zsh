autoload -Uz colors && colors

prompt_color() {
  [[ -n "$1" ]] && print "%{$2%}$1%{$reset_color%}"
}

prompt_dircolor() {
  dir_color="$fg[cyan]"
  print "$(prompt_color "$1" "$dir_color")"
}

prompt_branchcolor() {
  branch_color="$fg[yellow]"
  print "$(prompt_color "$1" "$branch_color")"
}

prompt_successcolor() {
  success_color="$fg[white]"
  print "$(prompt_color "$1" "$success_color")"
}

prompt_errorcolor() {
  error_color="$fg[red]"
  print "$(prompt_color "$1" "$error_color")"
}

prompt_exit_status() {
  print "%(?:$(prompt_successcolor "➜ "):$(prompt_errorcolor "➜ "))"
}

prompt_shortened_path() {
  print "$(prompt_dircolor "%1~")"
}

prompt_git_branch() {
  ref=${$(command git symbolic-ref HEAD 2>/dev/null)#refs/heads/} || \
    ref=${$(command git rev-parse HEAD 2>/dev/null)[1][1,7]} || \
    return
  print "($(prompt_branchcolor "%20>..>$ref%<<"))"
}

setopt prompt_subst

PS1='$(prompt_exit_status) $(prompt_shortened_path) $(prompt_git_branch) '
