# === primary ===

# source the global configuration
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# if not running interactively, don't do anything
# $- is a special bash vairale containing the current shell options
# *i* is a glob pattern means any string contains 'i'
# && return means if condition is true, just return
[[ $- != *i* ]] && return


# === alias ===

alias ls='ls --color=auto'
alias ll='ls -al'

alias grep='grep --color=auto'

alias df='df -h'
alias du='du -h'

alias cls=clear

alias vi=vim

alias rm='echo "rm is not allow, use trach-cli please."; false'


# === functions ===

cl() {
    cd "$1" && ll
}


# === environment variables ===

export CURRENT_UID=$(id -u)
export CURRENT_GID=$(id -g)
export CURRENT_NAME=$(whoami)
export CURRENT_GROUPS=$(groups)
export EDITOR=vim


# === misc ===

# set prompt string 1 (i.e. the primary prompt in shell)
# \u: current user name
# \h: short host name
# \W: current directory name
# \$: display $ for regular users, # for root
PS1='[\u@\h \W]\$ '

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	/bin/rm -f -- "$tmp"
}

# uv
. "$HOME/.local/bin/env"

# pixi
export PATH="/home/vio/.pixi/bin:$PATH"
