#!/bin/bash

#####################################################################
# This script will setup Ubuntu for Crouton on ChromeOS after it
# is installed.
#####################################################################

#####################################################################
# Confirm execution of trailing script 
#####################################################################
confirm() {
   echo -n "Run \"$*\" [Y/n]? "
   read -r answer
   if [ "$answer" == "Y" ] || [ "$answer" == "y" ] || [ "$answer" == "" ]
   then
      $*
   else
      echo "Skipping \"$*\"..."
   fi
   
   echo -e "######################################################\n\n"
}

# move to downloads/install
pushd ~/Downloads > /dev/null
if [ ! -d "install" ]
then 
   mkdir "install"
fi
cd "install"

# GNU C and C++ compilers
confirm sudo apt-get install gcc g++

# Git version control management
confirm sudo apt-get install git

# GNOME terminal (default for Ubuntu)
confirm sudo apt-get install gnome-terminal

# cURL and wget
confirm sudo apt-get install curl wget

# update locale to make GNOME terminal work
confirm sudo apt-get install language-pack-en locales
confirm sudo localectl set-locale LANG="en_US.UTF-8"

# CLING interactive C++ interpreter from CERN
tempURL="https://root.cern.ch/download/cling//cling_2018-05-21_ubuntu16.tar.bz2"
confirm curl $tempURL -o cling.tar.bz2 &&\
confirm bzip2 -d cling.tar.bz2 &&\
confirm tar -xf cling.tar &&\
rm -i cling.tar
confirm sudo mv cling* /usr/lib/cling &&\
confirm sudo update-alternatives --install "/usr/bin/cling" "cling" "/usr/lib/cling/bin/cling" 1

# Python 3 and IDLE
confirm sudo apt-get install idle3 python3 python3-pip

# OpenJDK (Java Development Kit)
confirm sudo apt-get install openjdk-8-jdk

# PHP & PHP development server
confirm sudo apt-get install php7.0-fpm php7.0

# Perl
confirm sudo apt-get install perl

# Node.js
confirm sudo apt-get install nodejs

# GNU Text Editor
confirm sudo apt-get install gedit

# VIM Text Editor
confirm sudo apt-get install vim

# XCalib (i.e. for high contrast mode switcher)
confirm sudo apt-get install xcalib

# TeXmacs WYSIWYG LaTeX editor
tempURL="www.texmacs.org/Download/ftp/tmftp/generic/TeXmacs-1.99.6-B.tar.gz"
confirm curl $tempURL -o texmacs.tar.gz &&\
confirm gunzip texmacs.tar.gz &&\
confirm tar -xf texmacs.tar &&\
rm -i texmacs.tar
confirm sudo mv texmacs* /usr/lib/texmacs &&\
confirm sudo cp ./scripts/texmacs.sh /usr/lib/texmacs/ &&\
confirm sudo chown $USER /usr/lib/texmacs/texmacs.sh &&\
confirm sudo chmod u+x /usr/lib/texmacs/texmacs.sh &&\
confirm sudo update-alternatives --install "/usr/bin/texmacs" "texmacs" "/usr/lib/texmacs/texmacs.sh" 1

# GNOME Tweak Tool
confirm sudo apt-get install gnome-tweak-tool

# GNOME Flashback Session, standard themes and Panels
confirm sudo apt-get install gnome-session-flashback gnome-themes-standard gnome-panel

# Wine (to run Windows32 programs)
confirm sudo apt-get install wine

# DOSBox (to run MS-DOS programs)
confirm sudo apt-get install dosbox

# MuseScore (music notation software)
confirm sudo apt-get install musescore

# MilkyTracker (music tracker-notation software)
confirm sudo apt-get install milkytracker

# GNU Image Manipulation Program
confirm sudo apt-get install gimp

# DNS Utilities
confirm sudo apt-get install dnsutils

# Lynx console-based web browser
confirm sudo apt-get install lynx

# Tree viewer for console
confirm sudo apt-get install tree

# Terminus X-Font
confirm sudo apt-get install xfonts-terminus

# Mozilla Firefox web browser
confirm sudo apt-get install firefox

# Famitracker (NES-style music tracker-notation software)
tempURL="http:/www.famitracker.com/files/FamiTracker-v0.4.6.zip"
confirm curl $tempURL -o famitracker.zip &&\
confirm unzip famitracker.zip -d famitracker &&\
rm -i famitracker.zip
confirm sudo mv famitracker* /usr/lib/famitracker
confirm sudo cp ./scripts/famitracker.sh /usr/lib/famitracker/ &&\
confirm sudo chown $USER /usr/lib/famitracker/famitracker.sh &&\
confirm sudo chmod u+x /usr/lib/famitracker/famitracker.sh &&\
confirm sudo update-alternatives --install "/usr/bin/famitracker" "famitracker" "/usr/lib/famitracker/famitracker.sh" 1

# GNOME Control Center (system settings)
confirm sudo apt-get install gnome-control-center

# Common Lisp Interpreter
confirm sudo apt-get install clisp

# OpenGL, GLUT and GLEW
confirm sudo apt-get install freeglut3-dev libglew-dev

# LibGTK-3 for Developers
confirm sudo apt-get install libgtk-3-dev libgtk-3-doc

# Zenity (GTK+ GUI dialogs)
confirm sudo apt-get install zenity

# Readline-dev (for building compilers such as Lua)
confirm sudo apt-get install libreadline-dev

# Install Lua
vernum="5.3.4"
tempURL="http://www.lua.org/ftp/lua-$vernum.tar.gz"
confirm curl -R -O $tempURL
confirm tar zxf lua-$vernum.tar.gz
confirm cd lua-$vernum
confirm make linux test
confirm mv lua-$vernum
confirm sudo mkdir /usr/lib/lua
confirm sudo mv lua-$vernum /usr/lib/lua/
confirm sudo update-alternatives --install "/usr/bin/lua" "lua" "/usr/lib/lua/lua-$vernum/bin/lua" 1
confirm sudo update-alternatives --install "/usr/bin/luac" "luac" "/usr/lib/lua/lua-$vernum/bin/luac" 1

# Install Kotlin
vernum="1.2.41"
tempURL="https://github.com/JetBrains/kotlin/releases/download/v$vernum/kotlin-compiler-$vernum.zip"
confirm curl -R -O $tempURL
confirm unzip kotlin-compiler-$vernum.zip
sudo mv kotlinc /usr/lib/
sudo update-alternatives --install "/usr/bin/kotlin" "kotlin" "/usr/lib/kotlinc/bin/kotlin" 1
sudo update-alternatives --install "/usr/bin/kotlinc" "kotlinc" "/usr/lib/kotlinc/bin/kotlinc" 1
sudo update-alternatives --install "/usr/bin/kotlinc-js" "kotlinc-js" "/usr/lib/kotlinc/bin/kotlinc-js" 1
sudo update-alternatives --install "/usr/bin/kotlinc-jvm" "kotlinc-jvm" "/usr/lib/kotlinc/bin/kotlinc-jvm" 1
sudo update-alternatives --install "/usr/bin/kotlin-dce-js" "kotlin-dce-js" "/usr/lib/kotlinc/bin/kotlin-dce-js" 1

# exit downloads/install
popd > /dev/null