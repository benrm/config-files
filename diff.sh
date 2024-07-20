#!/bin/sh
set -e

find acpi/ -type f | while read -r target ; do
	echo "Comparing $target"
	diff "$target" "/etc/$target"
done

CONFIG_DIR="$XDG_CONFIG_HOME"
if [ -z "$CONFIG_DIR" ] ; then
	CONFIG_DIR="$HOME/.config"
fi

find alacritty/ polybar/ xmonad/ -type f | while read -r target ; do
	echo "Comparing $target"
	diff "$target" "$CONFIG_DIR/$target"
done

find bin/ -type f | while read -r script ; do
	echo "Comparing $script"
	diff "$script" "$HOME/$script"
done

find dotfiles/ -type f | sed -e 's/^dotfiles\///' | while read -r dotfile ; do
	echo "Comparing $dotfile"
	diff  "dotfiles/$dotfile" "$HOME/.$dotfile"
done

