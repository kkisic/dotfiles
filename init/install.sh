#!/bin/bash

# brew for mac
if [ "$(uname)" = "Darwin" ] && !(type brew > /dev/null 2>&1); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#if [ "$(uname)" = "Darwin" ] ; then
#    brew install \
#        ag \
#        bash-completion \
#        boost \
#        cmake \
#        jq \
#        tig \
#        tree \
#        yq \
#fi

# asdf plugin add python
# asdf plugin add golang
# asdf plugin add nodejs
# cd && asdf install
