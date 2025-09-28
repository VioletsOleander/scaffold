# source .bashrc
if [[ -f ~/.bashrc ]]; then
    source .bashrc
fi

# set prompt string 1
# %n: username
# %m: hostname
# %~: current dir
# %#: # for root, $ for regular users
PS1='[%n@%m %~]%# '

