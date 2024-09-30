# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/galileo/.zsh/completions:"* ]]; then export FPATH="/home/galileo/.zsh/completions:$FPATH"; fi
# Set the default editor
export EDITOR='vi'

# Enable command auto-correction
unsetopt correct

# Enable case-insensitive completion
unsetopt nocaseglob

# Enable history appending and timestamp in history
setopt append_history
setopt extended_history
setopt hist_ignore_dups

# Load colors
autoload -U colors && colors

# Set up the prompt with colors
PROMPT='%n - %~%#'

# Aliases for colorized output
alias ls='ls --color=always'
alias ll='ls -la'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Configure git for colorized output
git config --global color.ui auto

# Terminal colors
export LS_COLORS='di=34:fi=0:ln=36:pi=33:so=35:bd=44:cd=43:or=31:mi=05;37:ex=32:*.tar=31:*.gz=31:*.tgz=31:*.zip=31:*.z=31:*.7z=31:*.rar=31:*.jar=31:*.tar.gz=31:*.tgz=31:*.xz=31:*.bz2=31:*.lz=31:*.lzma=31:*.pdf=31:*.ppt=31:*.doc=31:*.docx=31:*.odt=31:*.ods=31:*.svg=31'

# Disable the beep
unsetopt beep

# Manage nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Start X if no DISPLAY and at tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx 2>> "$HOME/.startx_errors.log"
fi

