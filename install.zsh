#!/bin/zsh
###############################################################################
#                                ./install.sh                                 #
#            This script creates symlinks from the home directory             #
#            to any desired dotfiles in ~/dotfiles                            #
###############################################################################

### Variables
# dotfiles directory
dir="$(dirname "$0")"
# old dotfiles backup directory, dated
backup=$HOME/.dotfiles_$(date "+%Y_%m_%d")
# list of files/folders to symlink in homedir
zsh_files=(zsh_aliases       \
           zsh_completion    \
           zsh_config        \
           zsh_functions     \
           zsh_keybindings   \
           zsh_options       \
           zsh_path          \
           zsh_prompt        \
           zshrc)
git_files=(gitconfig         \
           gitignore_global)
pkg_files=(vimrc             \
           eslintrc          \
           curlrc            \
           tmux.conf)
other_files=(linuxrc         \
             osxrc)

files=($zsh_files \
       $git_files \
       $pkg_files \
       $other_files)

###############################################################################

# create dotfiles_old in homedir
print "\x1b[32;01m" "Creating $backup for backup of any existing dotfiles in ~"
print $fg[red] "mkdir -p $backup"
mkdir -p $backup

# move any existing dotfiles in dir to backup directory, then create symlinks
for file in $files; do
  if [[ -L $HOME/.$file ]]; then
    print "\x1b[32;01m .$file is a symlink"
    print "\x1b[32;01m   removing .$file"
    print "\x1b[34;01m   rm -f ~/.$file"
    rm -f $HOME/.$file
    print "\x1b[32;01m   ...done"
  else
    print "\x1b[32;01m .$file is a regular file"
    print "\x1b[32;01m   moving .$file to $backup/$file"
    print "\x1b[34;01m   mv ~/.$file $backup/$file"
    mv $HOME/.$file $backup/$file
    print "\x1b[32;01m   ...done"
  fi
  print "\x1b[32;01m copying .$file to ~/.$file"
  print "\x1b[34;01m   cp $dir/$file ~/.$file"
  cp $dir/$file $HOME/.$file
  print "\x1b[32;01m   ...done"
done

print "complete"
