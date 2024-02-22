#!/bin/sh

# removing current kitty and fish configs
rm -rf ~/.config/kitty
rm -rf ~/.config/fish
rm ~/.config/starship.toml

# symlink dotfile repo configs
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/fish ~/.config/fish
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml

