#!/bin/bash

if [ "$1" == "reset" ]
then
    gsettings reset org.gnome.shell favorite-apps
else
    gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.gedit.desktop', 'org.gnome.Terminal.desktop']"
fi

