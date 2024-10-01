# Default editor
export EDITOR='vim'

# Aliases
alias ll='ls -l -a --color=always'
alias emax='emacsclient -nc'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias cp='rsync --progress'
alias mv='rsync --progress --remove-source-files'

# Stolen from https://medium.com/pareture/simplest-zsh-prompt-configs-for-git-branch-name-3d01602a6f33
# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats " (%b) -"
precmd() {
    vcs_info
}

# Enable substitution in the prompt.
setopt prompt_subst

# Terminal protanopia colors
export LS_COLORS='di=34:fi=0:ln=36:pi=33:so=35:bd=44:cd=43:or=31:mi=05;37:ex=32:*.tar=33:*.gz=33:*.tgz=33:*.zip=33:*.z=33:*.7z=33:*.rar=33:*.jar=33:*.tar.gz=33:*.tgz=33:*.xz=33:*.bz2=33:*.lz=33:*.lzma=33:*.pdf=33:*.ppt=33:*.doc=33:*.docx=33:*.odt=33:*.ods=33:*.svg=33'

# Prompt
export PROMPT='%F{cyan}%B%n@%m - %F{178}${vcs_info_msg_0_} %f%d %f%b%#'

# Manage NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Start X if no DISPLAY and at tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx 2>> "$HOME/.startx_errors.log"
fi


[ -f "/home/$USER/.ghcup/env" ] && . "/home/$USER/.ghcup/env" # ghcup-env
