# If not running interactively, don't do anything
[[ $- == *i* ]] || return

# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.

# Normal Colors
black='\e[30m'        # Black
red='\e[31m'          # Red
green='\e[32m'        # Green
yellow='\e[33m'       # Yellow
blue='\e[34m'         # Blue
magenta='\e[35m'      # Magenta
cyan='\e[36m'         # Cyan
white='\e[37m'        # White

# Bold
BLACK='\e[1;30m'       # Black
RED='\e[1;31m'         # Red
GREEN='\e[1;32m'       # Green
YELLOW='\e[1;33m'      # Yellow
BLUE='\e[1;34m'        # Blue
MAGENTA='\e[1;35m'     # Magenta
CYAN='\e[1;36m'        # Cyan
WHITE='\e[1;37m'       # White

# Background
Black='\e[40m'       # Black
Red='\e[41m'         # Red
Green='\e[42m'       # Green
Yellow='\e[43m'      # Yellow
Blue='\e[44m'        # Blue
Magenta='\e[45m'     # Magenta
Cyan='\e[46m'        # Cyan
White='\e[47m'       # White

NC="\e[m"               # Color Reset


ALERT=${WHITE}${Red} # Bold White on red background

# Default editor
export EDITOR='vim'

# Aliases (the `--color` option may not be available in plain sh environments)
alias l='ls -l -a --color=always --group-directories-first'
alias ll='ls -l -a --color=always --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias rmdir='rmdir --ignore-fail-on-non-empty'

alias tmux="tmux new-session -A -s main -n DevEnv 'source $HOME/.devenv; exec bash'"
alias neofetch="$HOME/utils/neofetch/neofetch"

# Terminal protanopia colors (LS_COLORS should work if GNU ls is installed)
export LS_COLORS='di=34:fi=0:ln=36:pi=33:so=35:bd=44:cd=43:or=31:mi=05;37:ex=32:*.tar=33:*.gz=33:*.tgz=33:*.zip=33:*.z=33:*.7z=33:*.rar=33:*.jar=33:*.tar.gz=33:*.tgz=33:*.xz=33:*.bz2=33:*.lz=33:*.lzma=33:*.pdf=33:*.ppt=33:*.doc=33:*.docx=33:*.odt=33:*.ods=33:*.svg=33'

# GTK theme
export GTK_THEME=Arc-Dark

# Start X if no DISPLAY and at tty1 (use sh-compatible condition)
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec startx 2>> "$HOME/.startx_errors.log"
fi

if test -z "${XDG_RUNTIME_DIR}"; then
  export XDG_RUNTIME_DIR=/tmp/xdg/"${UID}"-xdg-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
      mkdir -p "${XDG_RUNTIME_DIR}"
      chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

# Making sure urxvt doesn't start in the middle of the terminal
if [[ `ps ho command $(ps ho ppid $$)` == 'urxvt' ]]; then
  clear
fi

# PS1 Prompt
PS1="[\u@\[$BLUE\]\h\[$NC\]]:\w\$ "

## THESE HAVE GOT TO GO
# Manage Rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# GHCup
[ -f "/home/$USER/.ghcup/env" ] && . "/home/$USER/.ghcup/env" # ghcup-env

# Manage NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
