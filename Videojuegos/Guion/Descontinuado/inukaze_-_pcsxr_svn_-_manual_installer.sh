#!/bin/bash

# About This Script
# Author : Inukaze
# Web : http://inukaze.wordpress.com
# Email : inukaze.otaku@gmail.com

# Its a simple Script
# For Download & Install
# PCSXR SVN
# Dependencies , Manual Download
# Compile and Installation into System

clear
echo "Downloading & Installing Dependencies"
sudo apt-get install -y automake
sudo apt-get install -y build-fssentials
sudo apt-get install -y cmake
sudo apt-get install -y colorgcc
sudo apt-get install -y g++
sudo apt-get install -y g++-4.2
sudo apt-get install -y g++-4.2-multilib
sudo apt-get install -y g++-4.4
sudo apt-get install -y g++-4.4-multilib
sudo apt-get install -y g++-4.5
sudo apt-get install -y g++-4.5-multilib
sudo apt-get install -y g++-4.6
sudo apt-get install -y g++-4.6-multilib
sudo apt-get install -y gawk
sudo apt-get install -y gcc
sudo apt-get install -y gcc-4.2
sudo apt-get install -y gcc-4.2-base
sudo apt-get install -y gcc-4.2-locales
sudo apt-get install -y gcc-4.2-multilib
sudo apt-get install -y gcc-4.4
sudo apt-get install -y gcc-4.4-base
sudo apt-get install -y gcc-4.4-locales
sudo apt-get install -y gcc-4.4-multilib
sudo apt-get install -y gcc-4.5
sudo apt-get install -y gcc-4.5-base
sudo apt-get install -y gcc-4.5-locales
sudo apt-get install -y gcc-4.5-multilib
sudo apt-get install -y gcc-4.5-plugin-dev
sudo apt-get install -y gcc-4.6
sudo apt-get install -y gcc-4.6-base
sudo apt-get install -y gcc-4.6-locales
sudo apt-get install -y gcc-4.6-multilib
sudo apt-get install -y gcc-4.6-plugin-dev
sudo apt-get install -y gcc-multilib
sudo apt-get install -y gcc-opt
sudo apt-get install -y gccxml
sudo apt-get install -y gettext
sudo apt-get install -y gettext-base
sudo apt-get install -y git
sudo apt-get install -y gnome-doc-utils
sudo apt-get install -y gstreamer0.10-sdl
sudo apt-get install -y intltool
sudo apt-get install -y intltool-debian
sudo apt-get install -y lib32gcc1
sudo apt-get install -y lib32gcc1-dbg
sudo apt-get install -y lib64stdc++6
sudo apt-get install -y libao-dev
sudo apt-get install -y libao2
sudo apt-get install -y libasound2-dev
sudo apt-get install -y libavcodec-dev
sudo apt-get install -y libavformat-dev
sudo apt-get install -y libbluetooth-dev
sudo apt-get install -y libbz2-dev
sudo apt-get install -y libcairo2-dbg
sudo apt-get install -y libcairo2-dev
sudo apt-get install -y libcdio-dev
sudo apt-get install -y libconfig++8
sudo apt-get install -y libconfig++8-dev
sudo apt-get install -y libgcc1
sudo apt-get install -y libgcc1-dbg
sudo apt-get install -y libgettext-ruby1.8
sudo apt-get install -y libglade2-0
sudo apt-get install -y libglade2-dev
sudo apt-get install -y libglew1.5-dev
sudo apt-get install -y libgmp3-dev
sudo apt-get install -y libgtk2.0-0
sudo apt-get install -y libgtk2.0-bin
sudo apt-get install -y libgtk2.0-common
sudo apt-get install -y libgtk2.0-dev
sudo apt-get install -y libgtkmm-2.4-dev
sudo apt-get install -y libguichan-sdl-0.8.1-1
sudo apt-get install -y liblocale-gettext-perl
sudo apt-get install -y libperl5.10
sudo apt-get install -y libpng++-dev
sudo apt-get install -y libpulse-dev
sudo apt-get install -y libreadline5-dev
sudo apt-get install -y libsdl-console-dev
sudo apt-get install -y libsdl-gfx1.2-dev
sudo apt-get install -y libsdl-image1.2-dev
sudo apt-get install -y libsdl-mixer1.2-dev
sudo apt-get install -y libsdl-net1.2-dev
sudo apt-get install -y libsdl-ocaml-dev
sudo apt-get install -y libsdl-pango-dev
sudo apt-get install -y libsdl-perl
sudo apt-get install -y libsdl-ruby
sudo apt-get install -y libsdl-ruby1.8
sudo apt-get install -y libsdl-sge-dev
sudo apt-get install -y libsdl-sound1.2-dev
sudo apt-get install -y libsdl-ttf2.0-dev
sudo apt-get install -y libsdl1.2-dev
sudo apt-get install -y libsndfile1-dev
sudo apt-get install -y libstdc++6-4.5-dev
sudo apt-get install -y libswscale-dev
sudo apt-get install -y libtool
sudo apt-get install -y libwxbase2.8-0
sudo apt-get install -y libwxbase2.8-dbg
sudo apt-get install -y libwxbase2.8-dev
sudo apt-get install -y libwxgtk2.8-0
sudo apt-get install -y libwxgtk2.8-dbg
sudo apt-get install -y libwxgtk2.8-dev
sudo apt-get install -y libxcb-xtest0
sudo apt-get install -y libxcb-xv0
sudo apt-get install -y libxext-dev
sudo apt-get install -y libxext6-dbg
sudo apt-get install -y libxml2
sudo apt-get install -y libxml2-dev
sudo apt-get install -y libxml2-utils
sudo apt-get install -y libxrandr-dev
sudo apt-get install -y libxrandr2-dbg
sudo apt-get install -y libxtst-dev
sudo apt-get install -y libxv-dev
sudo apt-get install -y libxv1
sudo apt-get install -y libxvmc1
sudo apt-get install -y libxxf86vm-dev
sudo apt-get install -y mawk
sudo apt-get install -y nasm
sudo apt-get install -y nvidia-cg-toolkit
sudo apt-get install -y perl
sudo apt-get install -y perl-base
sudo apt-get install -y perl-modules
sudo apt-get install -y pkg-config
sudo apt-get install -y ppu-g++
sudo apt-get install -y ppu-gcc
sudo apt-get install -y python-glade2
sudo apt-get install -y python-gtk2
sudo apt-get install -y python-libxml2
sudo apt-get install -y scons
sudo apt-get install -y subversion
sudo apt-get install -y wx2.8-headers
sudo apt-get install -y x11proto-record-dev
sudo apt-get install -y zlib-bin
sudo apt-get install -y zlib1g
sudo apt-get install -y zlib1g-dev
clear

# Get the lastest code from GIT and go to new folder:
reset && cd $HOME
mkdir .inukaze-srcs && cd .inukaze-srcs
svn co https://pcsxr.svn.codeplex.com/svn pcsxr && cd pcsxr/pcsxr/
autoreconf -f -i && ./configure --enable-opengl && make && sudo make install
cd $HOME && rm -rf .inukaze-srcs
sudo ldconfig && sudo update-menus
reset
exit
