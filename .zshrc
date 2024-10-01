# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/galileo/.zsh/completions:"* ]]; then export FPATH="/home/galileo/.zsh/completions:$FPATH"; fi
# Set the default editor
export EDITOR='vim'

# Set up the prompt with colors
PROMPT='%n - %~%#'

# Aliases for colorized output
alias ls='ls --color=always'
alias ll='ls -la'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias emax='emacsclient -nc'

# Configure git for colorized output
git config --global color.ui auto

# Terminal colors
export LS_COLORS='di=34:fi=0:ln=36:pi=33:so=35:bd=44:cd=43:or=31:mi=05;37:ex=32:*.tar=31:*.gz=31:*.tgz=31:*.zip=31:*.z=31:*.7z=31:*.rar=31:*.jar=31:*.tar.gz=31:*.tgz=31:*.xz=31:*.bz2=31:*.lz=31:*.lzma=31:*.pdf=31:*.ppt=31:*.doc=31:*.docx=31:*.odt=31:*.ods=31:*.svg=31'

# Manage NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Start X if no DISPLAY and at tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx 2>> "$HOME/.startx_errors.log"
fi

# ghcup
[ -f "/home/galileo/.ghcup/env" ] && . "/home/galileo/.ghcup/env" # ghcup-env

