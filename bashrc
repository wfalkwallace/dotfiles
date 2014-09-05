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

# Put your favorite editor here, the default is vim
VISUAL=vim

CDPATH=:$HOME

#POSIX startfile - not really important, I'll deal with it later
ENV=$HOME/.profile

# History file
HISTFILE=$HOME/.hist
: ${HISTSIZE:=500}
export HISTSIZE

# Standard PATH
PATH=$HOME/bin:$PATH

#Set up prompt
export PS1='[\A]\[\e[36m\]\u\[\e[0m\]@\h:[\W]'
export PROMPT_COMMAND="prompt_colorize"

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

#Source git autocompletion
if [ -f "${HOME}/.git-completion.bash" ]; then
	source "${HOME}/.git-completion.bash"
fi

#guard against "fork-bomb" (cs3157)
# ulimit -u 256



##############################  ALSO:  ######################################
### add scripts to path
export PATH=$PATH:~/Documents/code/scripts:~/Documents/code/scripts/3P
### add pass: http://www.zx2c4.com/projects/password-store
# source /usr/local/etc/bash_completion.d/password-store


##############################RUBY JUNK######################################
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/gems/ruby-2.1.0/bin # Add Gems to PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


##############################BREW JUNK######################################
export PATH=/usr/local/bin:$PATH


#################################HEROKU JUNK#################################
### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"


###############################OPT JUNK######################################
# source /Users/wfalkwallace/Documents/code/optimizely/.source_this.sh
export PATH=/Users/wfalkwallace/Documents/code/optimizely/out:$PATH
export PATH=/Users/wfalkwallace/Documents/code/optimizely/out/ec2_api_tools/bin:$PATH
export EC2_HOME=/Users/wfalkwallace/Documents/code/optimizely/out/ec2_api_tools
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

### move user ruby to front of path
# export PATH=/usr/bin:$PATH
