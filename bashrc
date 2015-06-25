#!/bin/bash
#
# William Falk-Wallace
# .bashrc
#

##################################  EXPORTS  ###################################

# Basics
EDITOR=vim
VISUAL=vim
TERM=xterm-256color
CDPATH=:$HOME
ENV=$HOME/.profile #POSIX startfile - not really important, deal with it later
export VISUAL EDITOR CDPATH TERM ENV

# History file
HISTFILE=$HOME/.bash_history
HISTSIZE=1000
export HISTFILE HISTSIZE

# Standard PATH
PATH=$HOME/bin:$PATH
#Set up prompt
PS1='[\A]\[\e[36m\]\u\[\e[0m\]@\h:[\W]'
PROMPT_COMMAND="set_prompt"
export PROMPT_COMMAND PS1 PS2 PATH

# history #, basename of pwd
#export PS1=":\[$WHITE\]\n\![\W]"
# prints current branch name, colored based on git status
#export PS1="$PS1\[\$(git_color)\]\$(git_branch)"
#export PS1="$PS1 \$ "  # '#' for root, else '$'

# set erase character to "back space"
#stty erase ^H

# Put your printer name after PRINTER and remove the # sign
# to activate your printer name
#PRINTER=your-printer-name; export PRINTER

#guard against "fork-bomb" (cs3157)
# ulimit -u 256

#################################  MODULARITY  #################################
### Outsource Aliases
if [ -f "${HOME}/.bash_aliases" ]; then
	source "${HOME}/.bash_aliases"
fi

### Outsource Functions
if [ -f "${HOME}/.bash_functions" ]; then
	source "${HOME}/.bash_functions"
fi


####################################  ALSO  ####################################
### add scripts to path
export PATH=$PATH:~/Documents/code/scripts:~/Documents/code/scripts/3P
### add bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  complete -F _todo t # alias todo and todo completion to t
fi
### Source git autocompletion
### see http://stackoverflow.com/questions/342969/ -->
### how-do-i-get-bash-completion-to-work-with-aliases/1793178
if [ -f "${HOME}/.git-completion.bash" ]; then
  source "${HOME}/.git-completion.bash"
  __git_complete g __git_main # alias git to g (2chars = big difference)
fi


#################################  RUBY JUNK  ##################################
### Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
### Add Gems to PATH
PATH=$PATH:$HOME/.rvm/gems/ruby-2.1.0/bin
### Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


################################  HEROKU JUNK  #################################
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


#################################  BREW JUNK  ##################################
export PATH=/usr/local/bin:$PATH


#################################  VENV JUNK  ##################################
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
  source /usr/local/bin/virtualenvwrapper.sh
  export WORKON_HOME=$HOME/.virtualenvs
fi


#################################  TODO JUNK  ##################################
export TODOTXT_DEFAULT_ACTION=ls


##################################  NVM JUNK  ##################################
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


##############################  CAPPUCCINO JUNK  ###############################
export NARWHAL_ENGINE=jsc
export PATH="/usr/local/narwhal/bin:$PATH"
export CAPP_BUILD="/Users/wfalkwallace/Build"
