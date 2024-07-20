#!/bin/sh
set -e

find acpi/ -type f | while read -r target ; do
	sudo install -b -D "$target" "/etc/$target"
done

CONFIG_DIR="$XDG_CONFIG_HOME"
if [ -z "$CONFIG_DIR" ] ; then
	CONFIG_DIR="$HOME/.config"
fi

find alacritty/ polybar/ xmonad/ -type f | while read -r target ; do
	install -b -D "$target" "$CONFIG_DIR/$target"
done

find bin/ -type f | while read -r script ; do
	install -b "$script" "$HOME/$script"
done

find dotfiles/ -type f | sed -e 's/^dotfiles\///' | while read -r dotfile ; do
	install -b  "dotfiles/$dotfile" "$HOME/.$dotfile"
done
