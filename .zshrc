for file in "$ZSH_DIR"/*.zsh; do
  source "$file"
done

# load plugins last
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
