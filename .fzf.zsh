# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/dmitry/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/dmitry/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/dmitry/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/dmitry/.fzf/shell/key-bindings.zsh"

