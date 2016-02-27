#!/bin/zsh
#
# William Falk-Wallace
# config.zsh
#

#################################  VENV JUNK  ##################################
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
  source /usr/local/bin/virtualenvwrapper.sh
  export WORKON_HOME=$HOME/.virtualenvs
fi

##################################  NVM JUNK  ##################################
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
