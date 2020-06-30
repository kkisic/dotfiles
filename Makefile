setup: \
	setup-nvim \
	setup-git \
	setup-tmux

clean: \
	clean-nvim \
	clean-git \
	clean-tmux

setup-nvim:
	ln -s $(shell pwd)/nvim ~/.config

clean-nvim:
	rm ~/.config/nvim

setup-git:
	echo $(shell pwd)
	ln -s $(shell pwd)/git/.gitconfig ~/.gitconfig
	ln -s $(shell pwd)/git/.git-completion.bash ~/.git-completion.bash
	ln -s $(shell pwd)/git/.git-prompt.sh ~/.git-prompt.sh

clean-git:
	rm ~/.gitconfig
	rm ~/.git-completion.bash
	rm ~/.git-prompt.sh

setup-tmux:
	ln -s $(shell pwd)/tmux/.tmux.conf ~/.tmux.conf

clean-tmux:
	rm ~/.tmux.conf
