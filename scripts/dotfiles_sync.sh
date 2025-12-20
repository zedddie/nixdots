#!/usr/bin/env bash

cd ~/.config || exit 1

NOW=$( date '+%F_%H:%M:%S' )
DOTFILES_DIR="$HOME/nixdots/"
BRANCH=$( hostname )

cp -r fastfetch $DOTFILES_DIR
cp -r ghostty $DOTFILES_DIR
cp -r kitty $DOTFILES_DIR
cp -r rofi $DOTFILES_DIR
cp -r tmux $DOTFILES_DIR
cp -r hypr $DOTFILES_DIR
cp -r waybar $DOTFILES_DIR
cp -r fish $DOTFILES_DIR
sudo /run/current-system/sw/bin/cp /etc/nixos/configuration.nix $DOTFILES_DIR
# cp $HOME/.config/Cursor/User/keybindings.json $DOTFILES_DIR/cursor/
# cp $HOME/.config/Cursor/User/settings.json $DOTFILES_DIR/cursor/

cd $DOTFILES_DIR

if [ "$(git symbolic-ref --short HEAD)"!="$BRANCH" ]; then
	git checkout "$BRANCH"
fi

git add .
git commit -m "dotfiles sync: $NOW"
git push
