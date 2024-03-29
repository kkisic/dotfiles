# setup
# Add the following to ~/.bash_profile or ~/.bashrc
# if [ -f path/to/dir/dotfiles/bash/.bashrc ] ; then
#     . path/to/dir/dotfiles/bash/.bashrc
# fi

export PATH=~/.local/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config

stty stop undef
if [ $SHLVL = 1 ]; then
    tmux
fi

# tmux
alias tmux_reload='tmux source-file ~/.tmux.conf'

# ls
export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"
alias ll='ls -l'
alias la='ls -la'

# nvim
export EDITOR="nvim"
export PATH=$XDG_CONFIG_HOME/coc/extensions/coc-clangd-data/install/11.0.0/clangd_11.0.0/bin:$PATH
alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'

# git completion
source ~/.git-completion.bash
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

# mysql
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/opt/homebrew/opt/mysql@5.7/bin:$PATH

# asdf
if [ -f $HOME/.asdf/asdf.sh ] ; then
    . $HOME/.asdf/asdf.sh
fi

# go
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$PATH:$GOPATH/bin

# haskell
alias ghc='stack ghc'
alias ghci='stack ghci'
alias runhaskell='stack runhaskell'

# rust
export PATH=$HOME/.cargo/bin:$PATH

# python
PY_VER=$(python -V | cut -d ' ' -f 2)
export PATH=~/.asdf/installs/python/$PY_VER/bin:$PATH

# ~/sh
export PATH=$HOME/sh:$PATH

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
    # bash-completion is needed
    source $(brew --prefix)/etc/bash_completion
    source <(kubectl completion bash)
    alias k=kubectl
    complete -o default -F __start_kubectl k
fi

# krew
# show https://krew.sigs.k8s.io/docs/user-guide/setup/install/
export PATH=$HOME/.krew/bin:$PATH

# kube-ps1
kube_ps1="/usr/local/opt/kube-ps1/share/kube-ps1.sh"
if [ -f ${kube_ps1} ] ; then
    source ${kube_ps1}
    export PS1='$(kube_ps1) '$PS1
fi

# hide zsh message for mac
export BASH_SILENCE_DEPRECATION_WARNING=1

# for ghq & peco
function ghql() {
  local selected_file=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      echo ${selected_file}
      cd ${selected_file}
      pwd
    fi
  fi
}

bind '"\C-g":"ghql\C-m"'

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

# for local function
if [ -f ~/.internal_bashrc ] ; then
    . ~/.internal_bashrc
fi
