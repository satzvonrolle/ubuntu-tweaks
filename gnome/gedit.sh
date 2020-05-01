#!/bin/bash

if [ "$1" == "reset" ]
then
    gsettings reset org.gnome.gedit.preferences.editor tabs-size
    gsettings reset org.gnome.gedit.preferences.editor insert-spaces
    gsettings reset org.gnome.gedit.preferences.editor display-right-margin
    # gsettings reset org.gnome.gedit.preferences.editor wrap-mode
    rm ~/.local/share/gedit/styles/cauchy.xml
    gsettings reset org.gnome.gedit.preferences.editor scheme
else
    gsettings set org.gnome.gedit.preferences.editor tabs-size 'uint32 4'
    gsettings set org.gnome.gedit.preferences.editor insert-spaces true
    gsettings set org.gnome.gedit.preferences.editor display-right-margin true
    # gsettings set org.gnome.gedit.preferences.editor wrap-mode 'none'
    cp /usr/share/gtksourceview-4/styles/oblivion.xml ~/cauchy.xml
    sed -i s/Oblivion/Cauchy/g ~/cauchy.xml
    sed -i s/oblivion/cauchy/g ~/cauchy.xml
    sed -i s/2e3436/343434/g ~/cauchy.xml  # aluminium6
    sed -i s/000000/3e3e3e/g ~/cauchy.xml  # black
    # Adapt color scheme for line numbers
    sed -i s/foreground=\"aluminium5\"/foreground=\"aluminium3\"/g ~/cauchy.xml
    # Use dark green instead of bright green
    sed -i s/foreground=\"chameleon1\"/foreground=\"chameleon3\"/g ~/cauchy.xml
    mv ~/cauchy.xml ~/.local/share/gedit/styles
    gsettings set org.gnome.gedit.preferences.editor scheme 'cauchy'
fi

