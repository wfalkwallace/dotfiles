#!/bin/bash
###############################################################################
#                                ./install.sh                                 #
#            This script creates symlinks from the home directory             #
#            to any desired dotfiles in ~/dotfiles                            #
###############################################################################

### Variables
# dotfiles directory
dir=$(pwd)
# old dotfiles backup directory
backup=~/dotfiles_old
# list of files/folders to symlink in homedir
bash_files="bashrc bash_profile bash_aliases bash_functions bash_header"
aux_files_2="gitconfig gitignore_global vimrc inputrc netrc ansiweatherrc"
aux_files_1="jrnl_config git-completion.bash assistant"
files="$bash_files $aux_files_1 $aux_files_2"
# TODO: vim colors
###############################################################################

# create dotfiles_old in homedir
echo "Creating $backup for backup of any existing dotfiles in ~"
mkdir -p $backup
echo "...done"

# move any existing dotfiles in dir to backup directory, then create symlinks
for file in $files; do
  if [[ -L ~/.$file ]]; then
    echo "-------------------------"
    echo "rm -f ~/.$file -- SYMLINK"
    rm -f ~/.$file
  else
    echo "-------------------------"
    echo "mv ~/.$file $backup/$file"
    mv ~/.$file $backup/$file
  fi
  echo "-------------------------"
  echo "ln -s $dir/$file ~/.$file"
  ln -s $dir/$file ~/.$file
done
