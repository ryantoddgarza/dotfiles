# ~/.zshrc

# always start in tmux
if [[ -z $TMUX  ]]; then;
  tmux;
fi

for file in "$ZSH_DIR"/*.zsh; do
  source "$file"
done

# load plugins last
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
