# Default editor
export EDITOR='vim'

# Aliases (the `--color` option may not be available in plain sh environments)
alias l='ls -l -a --color=always'
alias ll='ls -l -a --color=always'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Terminal protanopia colors (LS_COLORS should work if GNU ls is installed)
export LS_COLORS='di=34:fi=0:ln=36:pi=33:so=35:bd=44:cd=43:or=31:mi=05;37:ex=32:*.tar=33:*.gz=33:*.tgz=33:*.zip=33:*.z=33:*.7z=33:*.rar=33:*.jar=33:*.tar.gz=33:*.tgz=33:*.xz=33:*.bz2=33:*.lz=33:*.lzma=33:*.pdf=33:*.ppt=33:*.doc=33:*.docx=33:*.odt=33:*.ods=33:*.svg=33'

# GTK theme
export GTK_THEME=Arc-Dark

# GHCup
[ -f "/home/$USER/.ghcup/env" ] && . "/home/$USER/.ghcup/env" # ghcup-env

# Manage NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Start X if no DISPLAY and at tty1 (use sh-compatible condition)
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec startx 2>> "$HOME/.startx_errors.log"
fi

# PS1 Prompt (simpler sh prompt, no colors)
PS1='\u@\h:\w\$ '
