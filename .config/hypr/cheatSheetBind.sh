#!/usr/bin/env bash
LIST="---KEYBINDS---
SUPER + Q	->	terminal
SUPER + M	->	shutdown hyprland
SUPER + C	->	kill app
SUPER + R	->	app launcher
SUPER + E	->	file mgr

---COMMANDS---
nmcli dev wifi list
nmcli dev wifi connect SSID password PASS
nmcli dev wifi show
sudo timeshift-launcher
sudo timeshift --create
system-update

---APPS---
ncdu 		->	cli disk mgr
(/ --exclude /mnt/windows)
yazi		->	cli file mgr
mov-cli		->	cli yt,...

---LOCATION---
~/.config/hypr/
"

echo "$LIST" | wofi -dmenu -i -p "󰌌 CheatSheet" -l 10 -w 650
