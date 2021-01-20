autoload -Uz colors && colors
setopt prompt_subst

# Pre-command

precmd_functions+=( precmd_prompts )

precmd_prompts() {
  RPS1=""
}

# Color

prompt_color() {
  [[ -n "$1" ]] && print "%{$2%}$1%{$reset_color%}"
}

prompt_dircolor() {
  dir_color="$fg[cyan]"
  print "$(prompt_color "$1" "$dir_color")"
}

prompt_successcolor() {
  success_color="$fg[white]"
  print "$(prompt_color "$1" "$success_color")"
}

prompt_warningcolor() {
  warning_color="$fg[yellow]"
  print "$(prompt_color "$1" "$warning_color")"
}

prompt_errorcolor() {
  error_color="$fg[red]"
  print "$(prompt_color "$1" "$error_color")"
}

# PS1

prompt_exit_status() {
  print "%(?:$(prompt_successcolor "➜  "):$(prompt_errorcolor "➜  "))"
}

prompt_shortened_path() {
  print "$(prompt_dircolor "%1~ ")"
}

prompt_git_branch() {
  ref=${$(command git symbolic-ref HEAD 2> /dev/null)#refs/heads/} || return
  print "$ref"
}

prompt_git_dirty() {
  if $(! command git status -s &> /dev/null)
  then
    print ''
  else
    if [[ $(command git status --porcelain) == '' ]]
    then
      print "on $(prompt_git_branch) "
    else
      print "on $(prompt_warningcolor $(prompt_git_branch)) "
    fi
  fi
}

PS1='$(prompt_exit_status)$(prompt_shortened_path)$(prompt_git_dirty) '

# R[ight]PS1

function zle-line-init zle-keymap-select {
   RPS1="${${KEYMAP}/(main|viins)/}"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
