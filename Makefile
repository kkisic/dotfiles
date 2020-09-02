setup: \
	setup-nvim \
	setup-git \
	setup-tmux

clean: \
	clean-nvim \
	clean-git \
	clean-tmux

setup-nvim:
	mkdir -p ~/.config/coc/extensions
	ln -s $(shell pwd)/nvim ~/.config/nvim
	ln -s $(shell pwd)/nvim/package.json ~/.config/coc/extensions/package.json
	npm i --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod --prefix "~/.config/coc/extensions/"

clean-nvim:
	rm ~/.config/nvim
	rm -rf ~/.config/coc/extensions/package.json
	rm -rf ~/.config/coc/extensions/node_modules
	

setup-git:
	ln -s $(shell pwd)/git/.gitconfig ~/.gitconfig
	ln -s $(shell pwd)/git/.gitignore_global ~/.gitignore_global
	ln -s $(shell pwd)/git/.git-completion.bash ~/.git-completion.bash
	ln -s $(shell pwd)/git/.git-prompt.sh ~/.git-prompt.sh

clean-git:
	rm ~/.gitconfig
	rm ~/.gitignore_global
	rm ~/.git-completion.bash
	rm ~/.git-prompt.sh

setup-tmux:
	ln -s $(shell pwd)/tmux/.tmux.conf ~/.tmux.conf

clean-tmux:
	rm ~/.tmux.conf
