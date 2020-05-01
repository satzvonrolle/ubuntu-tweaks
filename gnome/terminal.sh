#!/bin/bash

# Tango scheme https://sobac.com/sobac/tangocolors.htm
# https://askubuntu.com/questions/731774/how-to-change-gnome-terminal-profile-preferences-using-dconf-or-gsettings
# https://askubuntu.com/questions/825229/how-to-deactivate-use-colors-from-system-theme-in-gnome-terminal-via-cli

profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
profile=${profile:1:-1}

if [ "$1" == "reset" ]
then
    gsettings reset "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors
    gsettings reset "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color
    gsettings reset "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" palette 

else
    gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors false
    gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color '#343434'
    # match Tango Palette Colors
    gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" palette "['#2E3436', '#CC0000', '#4E9A06', '#C4A000', '#3465A4', '#75507B', '#c17d11', '#D3D7CF', '#555753', '#EF2929', '#8AE234', '#FCE94F', '#729FCF', '#AD7FA8', '#e9b96e', '#EEEEEC']"
fi

