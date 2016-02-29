ROOT_DIR        := $(shell dirname "$0")
VIM_BUNDLE_DIR  := $(HOME)/.vim/bundle
BIN_DIR         := $(HOME)/homebrew/bin
VUNDLE          := $(VIM_BUNDLE_DIR)/vundle
VIMRC           := $(HOME)/.vimrc
BREW            := $(BIN_DIR)/brew
TMUX            := $(BIN_DIR)/tmux
CTAGS           := $(BIN_DIR)/ctags

.PHONY: all
all: shell vim

.PHONY: shell
shell: dotfiles $(TMUX) $(CTAGS)

# symlink core dotfiles to home directory
.PHONY: dotfiles
dotfiles: $(ROOT_DIR)
	$(ROOT_DIR)/install.zsh

# setup vim bundles
.PHONY: vim
vim: $(VIMRC)
	mkdir -p $(VIM_BUNDLE_DIR)
	git clone http://github.com/gmarik/vundle.git $(VUNDLE)
	vim +PluginInstall! +PluginClean +qall

# install homebrew
$(BREW):
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# install TMUX
$(TMUX): $(BREW)
	brew install reattach-to-user-namespace # tmux pb correction
	brew install tmux

# install CTAGS
$(CTAGS): $(BREW)
	brew install ctags-exuberant

# TODO: https://help.github.com/articles/caching-your-github-password-in-git/
# TODO: brew rules for linux
