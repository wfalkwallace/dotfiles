#!/bin/bash
###############################################################################
# ./install.sh
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles
###############################################################################

### Variables
# dotfiles directory
DIR=~/dotfiles
# old dotfiles backup directory
BACKUP=~/dotfiles_old
# list of files/folders to symlink in homedir
BASH_FILES="bashrc bash_profile bash_aliases bash_functions bash_header"
AUX_FILES="gitconfig gitignore_global vimrc inputrc"
FILES="$BASH_FILES $AUX_FILES"

###############################################################################

# create dotfiles_old in homedir
echo "Creating $BACKUP for backup of any existing dotfiles in ~"
mkdir -p $BACKUP
echo "...done"

# change to the dotfiles directory
echo "Changing to the $DIR directory"
cd $DIR
echo "...done"

# move any existing dotfiles in DIR to BACKUP directory, then create symlinks
for FILE in $FILES; do
    echo "Moving any existing dotfiles from ~ to $BACKUP"
    mv ~/.$FILE $BACKUP/$FILE
    echo "Creating symlink to $FILE in home directory."
    ln -s $DIR/$FILE ~/.$FILE
done

for FILE in $FILES; do
    echo "Moving any existing dotfiles from ~ to $BACKUP"
    mv ~/.$FILE ~/dotfiles/$FILE
done
