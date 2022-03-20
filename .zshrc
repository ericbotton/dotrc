autoload -U compinit
compinit
autoload -U colors
colors
eval "$(dircolors -b)"
#autoload -U zmv
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' completer _complete _expand _match _correct _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: TAB for more, or character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z} r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=8
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose false
zstyle :compinstall filename '/usr/local/home/edb/.zshrc'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
setopt appendhistory autocd beep extendedglob nomatch notify correct
setopt AUTO_PUSHD
setopt COMPLETE_IN_WORD
setopt NOBGNICE
setopt HUP
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
#setopt NO_BEEP
DIRSTACKSIZE=16
LISTMAX=0
HISTFILE=~/.histfile
HISTSIZE=4096
SAVEHIST=4096
[[ -f /etc/environment ]] && source /etc/environment
bindkey '^[[3~' delete-char      #\
bindkey '^[OH' beginning-of-line # \ gnome|
bindkey '^[OF' end-of-line       # /      |terminal
bindkey '^[[2~' overwrite-mode   #/
if [[ $(id -u) == "0" ]]; then
  USER_COLOR="red"
else
  USER_COLOR="blue"
fi
PROMPT="%B[%{${fg[$USER_COLOR]}%}%n%{${fg[default]}%}]%b "
RPROMPT="%(?,%F{green}%~,%F{yellow}%? %F{red}:()%f"
#RPROMPT="%{%U%}%~%{%u%}"
if [[ -f ~/.shrc ]]; then
    . ~/.shrc
else
	alias ls='ls --color=auto'
	alias grep='egrep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias ll='ls --group-directories-first -lhF'
	alias l.='ls --group-directories-first -Ad .*'
	alias la='ls -Art'
	alias cp='cp -vi';alias mv='mv -vi';alias rm='rm -vi'
fi
if [ -f /etc/zsh_command_not_found ]; then
  . /etc/zsh_command_not_found
fi
export PATH="$PATH:$HOME/bin";
cowarray=( $(cowsay -l | grep -v Cow\ files\ in) )
fortune | cowsay -f $cowarray[$(( 1 + $RANDOM % ${#cowarray[@]} ))]
if [[ -f ~/.shsig ]]; then
    cat ~/.shsig
fi

. ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. ~/.liquidprompt/liquidprompt 2> /dev/null || echo liquidprompt not found.

# -----------------------------------------------------------------------------
# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
# -----------------------------------------------------------------------------
