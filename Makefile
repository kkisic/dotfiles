setup: \
	setup-nvim \
	setup-git \
	setup-tmux \
	setup-peco \
	setup-asdf

clean: \
	clean-nvim \
	clean-git \
	clean-tmux \
	clean-peco \
	clean-asdf

setup-nvim:
	mkdir -p ~/.config/coc/extensions
	ln -s $(shell pwd)/nvim ~/.config/nvim

clean-nvim:
	rm ~/.config/nvim
	rm -rf ~/.config/coc/extensions/node_modules

setup-git:
	ln -s $(shell pwd)/git/.gitconfig ~/.gitconfig
	ln -s $(shell pwd)/git/.git-completion.bash ~/.git-completion.bash
	ln -s $(shell pwd)/git/.git-prompt.sh ~/.git-prompt.sh
	mkdir -p ~/.config/git
	ln -s $(shell pwd)/git/ignore ~/.config/git/ignore

clean-git:
	rm ~/.gitconfig
	rm ~/.git-completion.bash
	rm ~/.git-prompt.sh
	rm ~/.config/git/ignore

setup-tmux:
	ln -s $(shell pwd)/tmux/.tmux.conf ~/.tmux.conf

clean-tmux:
	rm ~/.tmux.conf

setup-peco:
	ln -s $(shell pwd)/peco ~/.peco

clean-peco:
	rm ~/.peco

setup-asdf:
	ln -s $(shell pwd)/asdf/.tool-versions  ~/.tool-versions

clean-asdf:
	rm ~/.tool-versions
