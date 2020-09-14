export PATH=~/.local/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config

stty stop undef
if [ $SHLVL = 1 ]; then
    tmux
fi

# haskell
alias ghc='stack ghc'
alias ghci='stack ghci'
alias runhaskell='stack runhaskell'

# nvim
alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'

# git completion
source ~/.git-completion.bash
source ~/.git-prompt.sh
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
if [ "$(uname)" = "Darwin" ] ; then
    export NRFSDK12_ROOT=/Users/`whoami`/qmk_firmware/nRF5_SDK_12.3.0_d7731ad
else
    export NRFSDK12_ROOT=~/Dropbox/git_local/qmk_firmware/nRF5_SDK_12.3.0_d7731ad
fi
export GNU_BD="/opt/gnuarm/gcc-arm-none-eabi-7-2017-q4-major"
export PATH=$PATH:${GNU_BD}/bin

# arm-none-eabi-gcc
# export PATH=$PATH:/usr/lib/gcc/gcc-arm-none-eabi-7-2017-q4-majo

# llvm
# export PATH="/usr/local/opt/llvm/bin:$PATH"

# rust
export PATH=$HOME/.cargo/bin:$PATH

# ~/sh
export PATH=$HOME/sh:$PATH

# neovim
export EDITOR="nvim"

# direnv
if type direnv > /dev/null 2>&1; then
    eval "$(direnv hook bash)"
fi

# prompt
if [ "$(uname)" = "Darwin" ] ; then
    export PS1="\[\e[1;32m\](\u):\w\n\[\e[1;36m\]\$(__git_ps1 [%s])\[\e[1;32m\]\$ \[\e[00m\]"
else
    export PS1='\[\e[1;32m\](\u)@\h:\w\n\[\e[1;36m\]$(__git_ps1 [%s])\[\e[1;32m\]\$ \[\e[00m\]'
fi

# kubectl
if type kubectl > /dev/null 2>&1; then
    source /usr/local/etc/bash_completion
    source <(kubectl completion bash)
    alias k=kubectl
    complete -o default -F __start_kubectl k
fi

# kube-ps1
kube_ps1="/usr/local/opt/kube-ps1/share/kube-ps1.sh"
if [ -f ${kube_ps1} ] ; then
    source ${kube_ps1}
    export PS1='$(kube_ps1) '$PS1
fi

# for login function
if [ -f ~/.internal_bashrc ] ; then
    . ~/.internal_bashrc
fi
