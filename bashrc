#!/bin/bash
#
# William Falk-Wallace
# .bashrc
#
# Template taken from Columbia University CRF Default bash profile

export VISUAL EDITOR CDPATH PS1 PS2 PATH TERM ENV

# Set your editor so that various programs (including git) will
# know which one to run when they want you to type something.
EDITOR=vim

export TERM=xterm-256color

# Put your favorite editor here, the default is vim
VISUAL=vim

CDPATH=:$HOME

#POSIX startfile - not really important, I'll deal with it later
ENV=$HOME/.profile

# History file
HISTFILE=$HOME/.bash_history
: ${HISTSIZE:=500}
export HISTSIZE

# Standard PATH
PATH=$HOME/bin:$PATH

#Set up prompt
export PS1='[\A]\[\e[36m\]\u\[\e[0m\]@\h:[\W]'
export PROMPT_COMMAND="set_prompt"

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

#Outsource Aliases
if [ -f "${HOME}/.bash_aliases" ]; then
	source "${HOME}/.bash_aliases"
fi

#Outsource Functions
if [ -f "${HOME}/.bash_functions" ]; then
	source "${HOME}/.bash_functions"
fi

#guard against "fork-bomb" (cs3157)
# ulimit -u 256


##############################  ALSO:  ######################################
### add scripts to path
export PATH=$PATH:~/Documents/code/scripts:~/Documents/code/scripts/3P
### add pass: http://www.zx2c4.com/projects/password-store
# source /usr/local/etc/bash_completion.d/password-store
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  complete -F _todo t
fi
#Source git autocompletion
#see http://stackoverflow.com/questions/342969/how-do-i-get-bash-completion-to-work-with-aliases/1793178
if [ -f "${HOME}/.git-completion.bash" ]; then
  source "${HOME}/.git-completion.bash"
  __git_complete g __git_main
fi

###############################RUBY JUNK#######################################
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/gems/ruby-2.1.0/bin # Add Gems to PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


##################################HEROKU JUNK##################################
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


###############################BREW JUNK#######################################
export PATH=/usr/local/bin:$PATH


################################OPT JUNK#######################################
export OPTIMIZELY_HOME="$HOME/Documents/code/optimizely/optimizely"
if [ -d "$OPTIMIZELY_HOME" ]; then

  # Add arcanist to PATH environment variable
  export PATH=$PATH:$HOME/tools/arcanist/bin
  # Add tab completion at the command-line
  source ~/tools/arcanist/resources/shell/bash-completion

  # Add powerline-shell
  export PROMPT_COMMAND="_update_ps1;"
fi


###############################JRNL JUNK#######################################
export HISTIGNORE="jrnl*:$HISTIGNORE"
export HISTIGNORE="*.private:$HISTIGNORE"


###############################VENV JUNK#######################################
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
  source /usr/local/bin/virtualenvwrapper.sh
  export WORKON_HOME=$HOME/.virtualenvs
fi


###############################TODO JUNK#######################################
export TODOTXT_DEFAULT_ACTION=ls
