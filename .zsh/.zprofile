# Use 'unique' to avoid PATH duplicates
typeset -U PATH path

# Prepend Homebrew to path
path=(/opt/homebrew/bin $path)

# Append current Python bin to PATH
PYTHON_VERSION_NUMBER=$(python3 --version 2>&1 | awk '{print $2}' | awk -F. '{print $1"."$2}')
path+=~/Library/Python/$PYTHON_VERSION_NUMBER/bin

# Append local bin to PATH
LOCAL_BIN="$HOME/.local/bin"
if [[ ! -d $LOCAL_BIN ]];
then
  mkdir -p $LOCAL_BIN
fi
path+=$LOCAL_BIN

# Export PATH after changes
export PATH
