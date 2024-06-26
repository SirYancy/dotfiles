#!/bin/bash
############################
# .install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

###### VARIABLES

dir=~/dotfiles
olddir=~/dotfiles_old
files="vimrc gitconfig bash_profile alias export"

#########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving $file from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in ~"
    ln -s $dir/$file ~/.$file
done
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "add to .bashrc:  [ -f ~/.bash_profile ] && . ~/.bash_profile"
echo "In vim, run :PlugInstall"
