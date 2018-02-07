#!/bin/zsh
#
# William Falk-Wallace
# .zshrc
#

################################  ZSH EXPORTS  #################################
export ZSH=$HOME/.oh-my-zsh # Path to your oh-my-zsh installation.
export ZSH_THEME="agnoster" # theme to load (from ~/.oh-my-zsh/themes)
export CASE_SENSITIVE="false" # use case-insensitive completion
export HYPHEN_INSENSITIVE="true" # use hyphen-insensitive completion
export ENABLE_CORRECTION="true" # enable command auto-correction
# export COMPLETION_WAITING_DOTS="true" # display red dots while waiting for completion
# export HIST_STAMPS="yyyy-mm-dd" # cmd timer in history cmd output
# export ZSH_CUSTOM=/path/to/new-custom-folder # custom folder other than $ZSH/custom
# ZSH_TMUX_AUTOSTART=true # tmux

###############################  OTHER EXPORTS  ################################
### Basics
export EDITOR=vim
export VISUAL=vim
export TERM=xterm-256color # mostly for legacy systems
export CDPATH=$HOME # default cd path
# export MANPATH="/usr/local/man:$MANPATH"
### History file
export HISTFILE=$HOME/.zsh_history # where to store command history
export HISTSIZE=10000 # I like history
export SAVEHIST=10000 # I like history
export HISTTIMEFORMAT="%F %T " # TODO: Document this
### update terminal color scheme
export CLICOLOR=true
export LSCOLORS="exfxcxdxbxegedabagacad"

### initialize autocomplete
autoload -Uz compinit
compinit

source ~/.zsh_path # load the path file

# wd - warp directory
# tmuxinator
# virtualenvwrapper
# chucknorris
plugins=(git git-extras compleat rails tmux)
source $ZSH/oh-my-zsh.sh

################################  OTHER CONFIG  ################################

CONFIG_FILES=(zsh_aliases     \
              zsh_completion  \
              zsh_config      \
              zsh_functions   \
              zsh_keybindings \
              zsh_options     \
              zsh_prompt)

### load everything but the path file (loaded above)
for file in $CONFIG_FILES; do
  source ~/.$file
done

### Outsource Contextual Configs
if [ -f "${HOME}/.googlerc" ]; then
  source "${HOME}/.googlerc"
fi

### Outsource OSX-Specific Configs
if [ -f "${HOME}/.osxrc" ]; then # TODO: check for OSX
  source "${HOME}/.osxrc"
fi

### Outsource Local-Machine Configs
if [ -f "${HOME}/.localrc" ]; then
  source "${HOME}/.localrc"
fi

export NVM_DIR="/usr/local/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
