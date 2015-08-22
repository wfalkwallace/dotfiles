#!/bin/bash
###############################################################################
#                                ./install.sh                                 #
#            This script creates symlinks from the home directory             #
#            to any desired dotfiles in ~/dotfiles                            #
###############################################################################

### Variables
# dotfiles directory
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# old dotfiles backup directory
backup=dotfiles_old
# list of files/folders to symlink in homedir
bash_files="bashrc bash_profile bash_aliases bash_functions bash_header"
git_files="gitconfig gitignore_global git-completion.bash"
aux_files="vimrc inputrc"
files="$bash_files $git_files $aux_files"

###############################################################################

# create dotfiles_old in homedir
echo "Creating $backup for backup of any existing dotfiles in ~"
mkdir -p ~/$backup
echo "...done"

# move any existing dotfiles in dir to backup directory, then create symlinks
for file in $files; do
  if [[ -L ~/.$file ]]; then
    echo ".$file is a symlink"
    echo "removing .$file"
    echo "rm -f ~/.$file"
    echo
    rm -f ~/.$file
  else
    echo ".$file is a file"
    echo "moving .$file to $backup/$file"
    echo "mv ~/.$file $backup/$file"
    echo
    mv ~/.$file $backup/$file
  fi
  echo "symlinking .$file ~/.$file"
  echo "ln -s $dir/$file ~/.$file"
  echo
  ln -s $dir/$file ~/.$file
done

echo "...done"
