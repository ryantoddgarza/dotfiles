# User-specific executables
LOCAL_BIN="$HOME/.local/bin"
if [[ ! -d $LOCAL_BIN ]];
then
  mkdir -p $LOCAL_BIN
fi

# PATH management
typeset -U PATH path

path=(/opt/homebrew/bin $path)
path+=$LOCAL_BIN

export PATH
