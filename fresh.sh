#!/bin/bash

# Check for Oh My Zsh and install if we don't have it
if test ! $(which zsh); then
  echo "[Install oh-my-zsh] -> Start https://github.com/ohmyzsh/ohmyzsh#basic-installation"
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
  echo "[Install oh-my-zsh] -> DONE"
  echo "---------------------------"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "[Install homebrew] -> Start https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "[Install homebrew] -> DONE"
  echo "---------------------------"
fi

# Update Homebrew recipes
brew update
brew install wtf
brew install lazygit
brew install tree
brew install grep
brew install git

git config --global user.name "Qihang Chen"
git config --global user.email "qihangchen64@gmail.com"

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
echo "[Set up .zshrc] -> Start"
echo "ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc"
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
echo "[Set up .zshrc] -> DONE"
echo "---------------------------"

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
ZSH_CUSTOM=$DOTFILES
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  echo "[Install zsh-autosuggestions] -> Start"
  echo "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
  echo "[Install zsh-autosuggestions] -> DONE"
  echo "---------------------------"
fi

# https://www.macinstruct.com/tutorials/how-to-switch-the-control-and-command-keys/
# https://vimforvscode.com/enable-key-repeat-vim
echo "[Set up vim key press & hold] -> Start https://vimforvscode.com/enable-key-repeat-vim"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
echo "[Set up vim key press & hold] -> DONE"
echo "---------------------------"

if test ! $(which tmux); then
  echo "[Install tmux] -> Start https://github.com/tmux/tmux/wiki/Installing"
  echo "install tmux"
  brew install tmux
  echo "[Install tmux] -> DONE"
  echo "---------------------------"
fi



