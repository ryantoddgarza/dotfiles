source $ZDOTDIR/src/before.zsh
source $ZDOTDIR/src/config.zsh
source $ZDOTDIR/src/aliases.zsh
source $ZDOTDIR/src/prompt.zsh
source $ZDOTDIR/src/after.zsh

custom_config_file="$ZDOTDIR/custom.zsh"

if [[ -f $custom_config_file ]]; then
  source $custom_config_file
fi
