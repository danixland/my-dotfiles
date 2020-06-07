export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true

# turns on bash autocompletion
if [ -f /etc/profile.d/bash_completion.sh ]; then
 . /etc/profile.d/bash_completion.sh
fi

# actual theme "MATERIAL DARK"
#if [ "$TERM" = "linux" ]; then
#    echo -en "\e]P0303030"
#    echo -en "\e]P1d32f2f"
#    echo -en "\e]P2388e3c"
#    echo -en "\e]P3f57c00"
#    echo -en "\e]P4303f9f"
#    echo -en "\e]P5c51162"
#    echo -en "\e]P61976d2"
#    echo -en "\e]P7bdbdbd"
#    echo -en "\e]P8424242"
#    echo -en "\e]P9e57373"
#    echo -en "\e]PA81c784"
#    echo -en "\e]PBffb74d"
#    echo -en "\e]PC7986cb"
#    echo -en "\e]PDff4081"
#    echo -en "\e]PE64b5f6"
#    echo -en "\e]PFf5f5f5"
#    clear
#fi

user_color=32m
if [ ${UID} -eq 0 ]
then
        user_color=31m
fi

PS1='[\[\e[$user_color\]\u\[\e[37m\]@\[\e[34m\]\h \[\e[37m\]- \w] \d \t\n$(__git_ps1)\\$ '

case "$TERM" in
    xterm*|*rxvt*)
	    PROMPT_COMMAND='echo -ne "\033]0;${USER}@`echo $HOSTNAME|cut -d"." -f1`: ${PWD}\007"'
        ;;
    *)
	    PROMPT_COMMAND=""
        ;;
esac

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

