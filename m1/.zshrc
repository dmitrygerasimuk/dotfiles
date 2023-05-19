#PROMPT='%F{red}%n%f@%m %. %% '
setopt PROMPT_SUBST
source /Users/dmitry/.zsh_prompt
alias ls='ls -G'
alias l='gls  --group-directories-first --color -p '
alias pi='ssh pi@192.168.1.66'
alias ll='ls -lG'
alias ttl='sudo sysctl -w net.inet.ip.ttl=65'
alias kino='open https://i9rf.grt.ovh/'
alias rzf='/Users/dmitry/_DEV/dotfiles/rzf '
alias f='/Users/dmitry/_DEV/dotfiles/f '
p() { 
      (date; ps -ef) |
      fzf --bind='ctrl-r:reload(date; ps -ef)' \
      --color fg:242,bg:233,hl:65,fg+:15,bg+:234,hl+:108 \
      --color info:108,prompt:109,spinner:108,pointer:168,marker:168 \
      --header=$'Press CTRL-R to reload\n\n' --header-lines=2 \
      --preview='echo {}' --preview-window=down,3,wrap \
      --layout=reverse --height=80% | awk '{print $2}' | xargs kill -9
    }
    
uploadhttp()    { scp $1 gerasimu@gerasimuk.net:/home/gerasimu/public_html/dos/2023/}
upload()        { scp $1 gerasimu@gerasimuk.net:/home/gerasimu/share/}
packvideofast() { ffmpeg -i "$1" -vcodec hevc_videotoolbox -b:v 6000k -tag:v hvc1 -pix_fmt yuv420p -c:a eac3 -b:a 224k "fastpacked_$1"    }
packvideo()     { ffmpeg -i "$1" -vcodec libx265 -crf 28 -tag:v hvc1 -pix_fmt yuv420p -c:a aac -ac 2 "packed_$1"}
86boxman()      { cd /Users/dmitry/86Box/86box_manager_py/; python3 src/86BoxManager.py &; cd -; }
vicecity()      { cd /Users/dmitry/GAMES/VICE/VICECITY_2/; ./reVC }

t1000() { 
    ~/_DEV/86Box.app/Contents/MacOS/./86Box  > /dev/null 2>&1 & 
    cd "/Users/dmitry/Library/Application Support/net.86box.86Box/roms/machines/t1000/"
}
export PATH="/opt/homebrew/bin:$PATH"
export LIBRARY_PATH=/opt/homebrew/lib:$LIBRARY_PATH
export CPATH=/opt/homebrew/include:$CPATH
export PATH="/opt/homebrew/opt/php@7.4/bin:/Users/dmitry/_DEV/GHIDRA:$PATH"
export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"
export PATH="/Users/dmitry/open-watcom-v2/build/binbuild:$PATH"
export PATH=/usr/local/clamav/bin:/usr/local/clamav/sbin:$PATH

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi
export FZF_DEFAULT_OPTS="--height=50% --layout=reverse --info=inline   --padding=1 --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export HOMEBREW_GITHUB_API_TOKEN=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
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#echo "Remove watcom env once done\n it's in ~/.zshrc"
#source ~/setvars.sh
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
 export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
