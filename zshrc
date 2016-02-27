#!/bin/zsh
#
# William Falk-Wallace
# .zshrc
#

cat ~/.bash_header

################################  ZSH EXPORTS  #################################
export ZSH=/Users/fww/.oh-my-zsh # Path to your oh-my-zsh installation.
export ZSH_THEME="agnoster" # theme to load (from ~/.oh-my-zsh/themes)
export CASE_SENSITIVE="false" # use case-insensitive completion
export HYPHEN_INSENSITIVE="true" # use hyphen-insensitive completion
export ENABLE_CORRECTION="true" # enable command auto-correction
# export COMPLETION_WAITING_DOTS="true" # display red dots while waiting for completion
# export HIST_STAMPS="yyyy-mm-dd" # cmd timer in history cmd output
# export ZSH_CUSTOM=/path/to/new-custom-folder # custom folder other than $ZSH/custom

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

################################  OTHER CONFIG  ################################
### initialize autocomplete
autoload -Uz compinit
compinit

typeset DOTFILES # explicitly locally declare the variable
DOTFILES=~/.dotfiles # the location of my dotfiles TODO: make this generic
source $DOTFILES/**/path.zsh # load the path file
### load everything but the path file (loaded above)
typeset -U CONFIG_FILES # declare the variable as a unique list
CONFIG_FILES=($DOTFILES/**/*.zsh) # zshrc does not have extension
for file in ${CONFIG_FILES:#*/path.zsh}; do # see "Parameter Expansion"
  source $file
done
unset CONFIG_FILES DOTFILES

# wd - warp directory
# tmuxinator
# virtualenvwrapper
# chucknorris
plugins=(git git-extras compleat rails tmux)
source $ZSH/oh-my-zsh.sh
