export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true

# turns on bash autocompletion
if [ -f /etc/profile.d/bash_completion.sh ]; then
 . /etc/profile.d/bash_completion.sh
fi

user_color=32m
if [ ${UID} -eq 0 ]
then
        user_color=31m
fi

bash_prompt() {
    local NONE="\[\033[0m\]"    # unsets color to term's fg color
    
    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white
    
    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"
    
    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"
    
    local UC=$EMG                 # user's color
    [ $UID -eq "0" ] && UC=$EMR   # root's color
    
    PS1="${UC}\u ${NONE}@ ${EMB}\h ${NONE}{ ${M}\d ${NONE}} ${G}[ ${NONE}\w ${G}] ${NONE}\n\# ${UC}\\$> ${NONE}"
}
bash_prompt

alias su="su -"
alias ls="ls --color -lh"
alias cp="cp -v"
alias rm="rm -v"
alias mv="mv -v"
alias chmod="chmod -v"
alias chown="chown -v"
alias apropos="wtf is"
alias free="free -m"
alias df="df -h"
alias du="du -sh"
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias path='(IFS=:;ls -1d $PATH |  nl)'
alias hf='history|grep'

# history as big as possible!!
HISTSIZE=1000000
HISTFILESIZE=2000000
HISTIGNORE='hf *'
# unix.stackexchange.com/a/18443
# history: erase duplicates...
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend



export PATH=~/.local/bin:~/bin:$PATH
export INTEL_BATCH=1
export QT_QPA_PLATFORMTHEME="lxqt"
export QT_STYLE_OVERRIDE="kvantum-dark"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"

# Tailoring LESS
alias more='less'
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export PAGER=less
export SVN_EDITOR=vim
export LESSCHARSET='latin1'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# sudo password helper
export SUDO_ASKPASS=/usr/bin/lxsudo

# logdate appends a date to a script output
logdate() {
	while IFS= read -r line; do
		echo "$(date +"%F_%R.%S") $line"
	done
}

unset GPG_AGENT_INFO
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi
GPG_TTY=$(tty)
export GPG_TTY
if [ -x "$(which gpg-connect-agent)" ]; then
	gpg-connect-agent updatestartuptty /bye >& /dev/null
fi

mount-fs () {
    ( echo Filesystem Mountpoint Fstype;
      mount | \grep -E '^[^[:lower:]_-]+' | awk '{print $1,$3,$5}'
    ) | column -t
}

