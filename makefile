ROOT_DIR        := $(shell dirname "$0")
VIM_BUNDLE_DIR  := $(HOME)/.vim/bundle
OSX_BIN_DIR     := $(HOME)/homebrew/bin
LINUX_BIN_DIR		:= /usr/bin
VUNDLE          := $(VIM_BUNDLE_DIR)/vundle
VIMRC           := $(HOME)/.vimrc
BREW            := $(OSX_BIN_DIR)/brew
OSX_TMUX        := $(OSX_BIN_DIR)/tmux
LINUX_TMUX      := $(LINUX_BIN_DIR)/tmux
OSX_CTAGS       := $(OSX_BIN_DIR)/ctags
LINUX_CTAGS     := $(LINUX_BIN_DIR)/ctags
LINUXRC					:= $(HOME)/.linuxrc
OSXRC					  := $(HOME)/.osxrc

.PHONY: osx
osx: dotfiles $(OSXRC) $(OSX_TMUX) $(OSX_CTAGS) vim

.PHONY: linux
linux: dotfiles $(LINUXRC) $(LINUX_TMUX) $(LINUX_CTAGS) vim

$(LINUXRC):
	cp $(ROOT_DIR)/linuxrc $(LINUXRC)

$(OSXRC):
	cp $(ROOT_DIR)/osxrc $(OSXRC)

# symlink core dotfiles to home directory
.PHONY: dotfiles
dotfiles: $(ROOT_DIR)
	$(ROOT_DIR)/install.zsh

# setup vim bundles
.PHONY: vim
vim: $(VIMRC)
	mkdir ~/.vim-tmp
	mkdir -p $(VIM_BUNDLE_DIR)
	git clone http://github.com/gmarik/vundle.git $(VUNDLE)
	vim +PluginInstall! +PluginClean +qall

# install homebrew
$(BREW):
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# install TMUX
$(OSX_TMUX): $(BREW)
	brew install reattach-to-user-namespace # tmux pb correction
	brew install tmux

$(LINUX_TMUX):
	sudo apt-get install tmux

# install CTAGS
$(OSX_CTAGS): $(BREW)
	brew install ctags-exuberant

$(LINUX_CTAGS):
	sudo apt-get exuberant-ctags

# TODO: https://help.github.com/articles/caching-your-github-password-in-git/
