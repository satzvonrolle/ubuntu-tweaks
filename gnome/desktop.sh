#!/bin/bash

if [ "$1" == "reset" ]
then
    gsettings reset org.gnome.desktop.interface enable-animations
    gsettings reset org.gnome.desktop.interface gtk-theme
    gsettings reset org.gnome.shell.extensions.desktop-icons show-home
    gsettings reset org.gnome.shell.extensions.desktop-icons show-trash
else
    gsettings set org.gnome.desktop.interface enable-animations false
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
    gsettings set org.gnome.shell.extensions.desktop-icons show-home false
    gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
fi

