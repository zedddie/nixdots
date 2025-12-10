#!/usr/bin/env bash

cd ~/.config/hypr/ 
mv hyprland.conf hyprland1.conf
mv hyprland3.conf hyprland.conf
mv hyprland1.conf hyprland3.conf
pkill waybar
