# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
# elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

alias ghc='stack ghc'
alias ghci='stack ghci'
alias runhaskell='stack runhaskell'

alias vim='nvim'
alias vi='nvim'

export PATH=~/.local/bin:$PATH

stty stop undef
if [ $SHLVL = 1 ]; then
    tmux
fi

# git completion
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

# mysql
export PATH=/usr/local/mysql/bin:$PATH

# python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# go
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$PATH:$GOPATH/bin

export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"

# nrf - ble
export NRFSDK12_ROOT=/Users/`whoami`/qmk_firmware/nRF5_SDK_12.3.0_d7731ad
export GNU_BD="/opt/gnuarm/gcc-arm-none-eabi-7-2017-q4-major"
export PATH=$PATH:${GNU_BD}/bin

# llvm
# export PATH="/usr/local/opt/llvm/bin:$PATH"

# rust
export PATH=$HOME/.cargo/bin:$PATH

# ~/sh
export PATH=$HOME/sh:$PATH

# neovim
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="nvim"

# direnv
eval "$(direnv hook bash)"

## kubectl
source /usr/local/etc/bash_completion
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k

# kube-ps1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"

#export PS1="\[\e[1;32m\](\u):\w\n\$ \[\e[00m\]"
export PS1="\[\e[1;32m\](\u):\w\n\[\e[1;36m\]\$(__git_ps1 [%s])\[\e[1;32m\]\$ \[\e[00m\]"
export PS1='$(kube_ps1) '$PS1

# for sd-oor
export SD_OOR_SILENCE_DURATION_OPT='-v+1H'

# for login function
if [ -f ~/.login_func ] ; then
    . ~/.login_func
fi
