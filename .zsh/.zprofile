# User-specific executables
LOCAL_BIN="$HOME/.local/bin"
if [[ ! -d $LOCAL_BIN ]];
then
  mkdir -p $LOCAL_BIN
fi

# PATH management
typeset -U PATH path

path+=$LOCAL_BIN
path+=$HOME/.node-versions/current/bin

export PATH

# Configure Homebrew environment variables
eval $(/opt/homebrew/bin/brew shellenv)
