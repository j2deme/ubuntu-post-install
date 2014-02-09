#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 2 -*-
#
# Authors:
#   Sam Hewitt <hewittsamuel@gmail.com>
#   Jaime Delgado-Meraz <j2deme@gmail.com>
#
# Description:
#   A post-installation bash script for Ubuntu (13.10)
#
# Legal Stuff:
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>

echo ''
echo '#-------------------------------------------#'
echo '#     Ubuntu 13.10 Post-Install Script      #'
echo '#-------------------------------------------#'

#----- FUNCTIONS -----#

# SYSTEM UPGRADE
function sysupgrade {
# Perform system upgrade
echo ''
read -p 'Proceed with system upgrade? (Y)es, (N)o : ' REPLY
case $REPLY in
# Positive action
[Yy]* )
    # Update Repository Information
    echo 'Updating repository information...'
    echo 'Requires root privileges:'
    sudo apt-get update -qq
    # Dist-Upgrade
    echo 'Performing system upgrade...'
    sudo apt-get dist-upgrade -y
    echo 'Done.'
    main
    ;;
# Negative action
[Nn]* )
    clear && main
    ;;
# Error
* )
    clear && echo 'Sorry, try again.'
    sysupgrade
    ;;
esac
}

# INSTALL APPLICATIONS
function favourites {
# Install Favourite Applications
echo ''
echo 'Installing selected favourite applications...'
echo ''
echo 'Current package list:
easytag
filezilla
gnome-tweak-tool
nautilus-dropbox
nautilus-open-terminal
pyrenamer
gparted
vlc
pgadmin3
wajig
tasksel
mysql-workbench
dia
guake
diffuse
cheese
shutter'
echo ''
read -p 'Proceed? (Y)es, (N)o : ' REPLY
case $REPLY in
# Positive action
[Yy]* )
    echo 'Requires root privileges:'
    # Feel free to change to whatever suits your preferences.
    sudo apt-get install -y --no-install-recommends easytag filezilla gnome-tweak-tool nautilus-dropbox nautilus-open-terminal pyrenamer vlc gparted pgadmin3 wajig tasksel mysql-workbench dia guake diffuse cheese shutter
    echo 'Done.'
    main
    ;;
# Negative action
[Nn]* )
    clear && main
    ;;
# Error
* )
    clear && echo 'Sorry, try again.'
    favourites
    ;;
esac
}

# INSTALL SYSTEM TOOLS
function system {
echo ''
echo '1. Install favourite system utilities?'
echo '2. Install Latex utilities'
echo 'r. Return.'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# Install Favourite System utilities
1)
    echo 'Installing favourite system utilities...'
    echo ''
    echo 'Current package list:
    aptitude
    dconf-tools
    openjdk-7-jdk
    openssh-server
    p7zip-full
    ppa-purge
    samba
    ssh
    symlinks
    synaptic
    virt-manager
    zsync'
    echo ''
    read -p 'Proceed? (Y)es, (N)o : ' REPLY
    case $REPLY in
    # Positive action
    [Yy]* )
        echo 'Requires root privileges:'
        # Feel free to change to whatever suits your preferences.
        sudo apt-get install -y --no-install-recommends aptitude dconf-tools openjdk-7-jdk openssh-server p7zip-full ppa-purge samba ssh symlinks synaptic virt-manager zsync
        echo 'Done.'
        clear && system
        ;;
    # Negative action
    [Nn]* )
        clear && system
        ;;
    # Error
    * )
        clear && echo 'Sorry, try again.'
        system
        ;;
    esac
    ;;
# Install Latex utilities
2)
  echo 'Installing Latex utilities...'
  echo ''
  echo 'Current package list:
  texlive
  texlive-generic-recomended
  preview-latex-style
  pdf2svg'
  echo ''
  read -p 'Proceed? (Y)es, (N)o : ' REPLY
  case $REPLY in
  # Positive action
  [Yy]* )
      echo 'Requires root privileges:'
      # Feel free to change to whatever suits your preferences.
      sudo apt-get install -y --no-install-recommends texlive texlive-generic-recommended texlive-fonts-recommended texlive-math-extra texlive-latex-recommended texlive-pictures texlive-fonts-extra texlive-fonts-extra texlive-humanities texlive-lang-english texlive-lang-spanish texlive-generic-extra texlive-metapost texlive-publishers texlive-science texlive-formats-extra preview-latex-style pdf2svg
      echo 'Done.'
      clear && system
      ;;
  # Negative action
  [Nn]* )
      clear && system
      ;;
  # Error
  * )
      clear && echo 'Sorry, try again.'
      system
      ;;
  esac
  ;;
# Return
[Rr]*)
    clear && main;;
# Invalid choice
* )
    clear && echo 'Not an option, try again.' && development;;
esac
}

# INSTALL GNOME COMPONENTS
function gnome {
echo ''
echo '1. Add GNOME3 PPA?'
echo '2. Add GNOME3 Staging PPA?'
echo '3. Install GNOME Shell?'
echo '4. Configure GNOME Shell Specific Settings?'
echo 'r. Return.'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# Add GNOME3 PPA
1)
    echo 'Adding GNOME3 PPA to software sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository -y ppa:gnome3-team/gnome3
    echo 'Updating repository information...'
    sudo apt-get update -qq
    echo 'Performing system upgrade...'
    sudo apt-get dist-upgrade -y
    echo 'Done.'
    echo ''
    gnome
    ;;
# Add GNOME3 Staging PPA
2)
    echo 'Adding GNOME3 Staging PPA to software sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository -y ppa:gnome3-team/gnome3-staging
    echo 'Updating repository information...'
    sudo apt-get update -qq
    echo 'Performing system upgrade...'
    sudo apt-get dist-upgrade -y
    echo 'Done.'
    echo ''
    gnome
    ;;
# Install GNOME Shell
3)
    echo 'Installing GNOME Shell...'
    echo 'Requires root privileges:'
    sudo apt-get install -y gnome-shell
    echo 'Done.'
    echo ''
    gnome
    ;;
# Configure Shell Specific Settings
4)
    # Font Sizes
    echo 'Setting font preferences...'
    echo 'Requires the "Cantarell" font.'
    PACKAGE=$(dpkg-query -W --showformat='${Status}\n' fonts-cantarell | grep "install ok installed")
    echo "Checking if installed..."
    if [ "" == "$PACKAGE" ]; then
        echo 'Cantarell is not installed.'
        echo 'Installing... '
        echo 'Requires root privileges:'
        sudo apt-get install -y fonts-cantarell
        echo 'Done. '
    else
        echo 'Cantarell is installed, proceeding... '
    fi
    gsettings set org.gnome.desktop.interface text-scaling-factor '1.0'
    gsettings set org.gnome.desktop.interface document-font-name 'Cantarell 10'
    gsettings set org.gnome.desktop.interface font-name 'Cantarell 10'
    gsettings set org.gnome.nautilus.desktop font 'Cantarell 10'
    gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Cantarell Bold 10'
    gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
    gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'slight'
    echo 'Done. '
    # GNOME Shell Settings
    echo 'Setting GNOME Shell window button preferences...'
    gsettings set org.gnome.shell.overrides button-layout 'close:'
    echo 'Done. '
    echo ''
    gnome
    ;;
# Return
[Rr]*)
    clear && main;;
# Invalid choice
* )
    clear && echo 'Not an option, try again.' && gnome;;
esac
}


# INSTALL UBUNTU RESTRICTED EXTRAS
function codecinstall {
echo ''
read -p 'Install Ubuntu Restricted Extras? (Y)es, (N)o : ' REPLY
case $REPLY in
# Positive action
[Yy]* )
    echo 'Installing...'
    echo 'Requires root privileges:'
    # Feel free to change to whatever suits your preferences.
    sudo apt-get install -y ubuntu-restricted-extras
    echo 'Done.'
    main
    ;;
# Negative action
[Nn]* )
    clear && main;;
# Error
* )
    clear && echo 'Sorry, try again.' && codecinstall
esac
}

# INSTALL DEVELOPMENT TOOLS
function development {
echo ''
echo '1. Install development tools?'
echo '2. Install Ubuntu SDK?'
echo '3. Install Ubuntu Phablet Tools?'
echo '4. Install Qt 5 Tools?'
echo 'r. Return'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# Install Development Tools
1)
    echo 'Installing development tools...'
    echo ''
    echo 'Current package list:
    devscripts
    eclipse
    git
    gitg
    python-launchpadlib
    python3-distutils-extra
    build-essential
    libssl-dev
    g++'
    echo ''
    read -p 'Proceed? (Y)es, (N)o : ' REPLY
    case $REPLY in
    # Positive action
    [Yy]* )
        echo 'Requires root privileges:'
        # Feel free to change to whatever suits your preferences.
        sudo apt-get install -y devscripts eclipse git gitg python-launchpadlib python3-distutils-extra build-essential libssl-dev curl g++
        echo 'Done.'
        development
        ;;
    # Negative action
    [Nn]* )
        clear && development
        ;;
    # Error
    * )
        clear && echo 'Sorry, try again.'
        development
        ;;
    esac
    ;;
# Install Ubuntu SDK
2)
    echo 'Adding Ubuntu SDK Team PPA to software sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository -y ppa:ubuntu-sdk-team/ppa
    echo 'Updating repository information...'
    sudo apt-get update -qq
    echo 'Installing Ubuntu SDK...'
    sudo apt-get install -y ubuntu-sdk
    echo 'Done.'
    development
    ;;
# Install Ubuntu Phablet Tools
3)
    echo 'Installing Phablet Tools...'
    sudo apt-get install -y phablet-tools
    echo 'Done.'
    development
    ;;
4)
  echo 'Installing Qt 5 Tools...'
  # Download Qt installer that matches system architecture
  if [ $(uname -i) = 'i386' ]; then
      wget http://download.qt-project.org/official_releases/online_installers/1.5/qt-linux-opensource-1.5.0-x86-online.run
  elif [ $(uname -i) = 'x86_64' ]; then
      wget http://download.qt-project.org/official_releases/online_installers/1.5/qt-linux-opensource-1.5.0-x64-online.run
  fi
  # Install the package
  chmod +x qt-linux-opensource-1.5.0-x*-online.run
  ./qt-linux-opensource-1.5.0-x*-online.run
  # Cleanup and finish
  rm qt-linux-opensource-1.5.0-x*-online.run
  cd
  echo 'Done'
  development
  ;;
# Return
[Rr]*)
    clear && main;;
# Invalid choice
* )
    clear && echo 'Not an option, try again.' && development;;
esac
}

# INSTALL DESIGN TOOLS
function design {
echo ''
echo 'Installing design tools...'
echo ''
echo 'Current package list:
gimp
gimp-plugin-registry
icontool
imagemagick
inkscape'
echo ''
read -p 'Proceed? (Y)es, (N)o : ' REPLY
case $REPLY in
# Positive action
[Yy]* )
    echo 'Requires root privileges:'
    # Feel free to change to whatever suits your preferences.
    sudo apt-get install -y gimp gimp-plugin-registry icontool imagemagick inkscape
    echo 'Done.'
    main
    ;;
# Negative action
[Nn]* )
    clear && main;;
# Error
* )
    clear && echo 'Sorry, try again.' && design
    ;;
esac
}


# INSTALL SUBLIME TEXT 3
function sublime3 {
  echo 'Adding WebUp8Team/SublimeText3 PPA to software sources...'
  echo 'Requires root privileges:'
  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
  echo 'Updating repository information...'
  sudo apt-get update -qq
  echo 'Installing Sublime Text 3...'
  sudo apt-get install -y sublime-text-installer
  echo 'Done.'
  thirdparty
}


# INSTALL PANTHEON SHELL
function pantheon {
echo ''
echo '1. Add elementary OS daily PPA?'
echo '2. Install Pantheon Shell?'
echo '3. Configure Pantheon Specific Settings?'
echo 'r. Return.'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# Add elementary OS daily PPA
1)
    echo 'Adding elementary OS daily to software sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository -y ppa:elementary-os/daily
    echo 'Updating repository information...'
    sudo apt-get update -qq
    echo 'Done.'
    echo ''
    pantheon
    ;;
# Install Pantheon Shell
2)
    echo 'Installing Pantheon Shell...'
    echo 'Requires root privileges:'
    sudo apt-get install -y gala noise pantheon-shell pantheon-wallpaper slingshot-launcher switchboard wingpanel
    echo 'Done.'
    echo ''
    pantheon
    ;;
# Configure Shell Specific Settings
3)
    # Gala Animations
    echo 'Setting Gala animations preferences...'
    gsettings set org.pantheon.desktop.gala.animations close-duration '100'
    gsettings set org.pantheon.desktop.gala.animations menu-duration '50'
    gsettings set org.pantheon.desktop.gala.animations minimize-duration '100'
    gsettings set org.pantheon.desktop.gala.animations open-duration '100'
    echo 'Done. '
    # Gala Hotcorners
    echo 'Setting Gala Hotcorner preferences...'
    gsettings set org.pantheon.desktop.gala.behaviour hotcorner-bottomleft 'show-workspace-view'
    gsettings set org.pantheon.desktop.gala.behaviour hotcorner-topleft 'window-overview-all'
    echo 'Done. '
    # Slingshot preferences
    echo 'Setting Slingshot preferences...'
    gsettings set org.pantheon.desktop.slingshot icon-size '64'
    echo 'Done. '
    echo ''
    pantheon
    ;;
# Return
[Rr]*)
    clear && thirdparty;;
# Invalid choice
* )
    clear && echo 'Not an option, try again.' && pantheon;;
esac
}


# THIRD PARTY APPLICATIONS
function thirdparty {
echo ''
echo '1. Install Google Chrome?'
echo '2. Install Google Talk Plugin?'
echo '3. Install Google Music Manager?'
echo '4. Install Steam?'
echo '5. Install Unity Tweak Tool?'
echo '6. Install Sublime Text 3?'
echo '7. Install Pantheon Desktop?'
echo '8. Install My Weather Indicator?'
echo '9. Install Variety Wallpaper Changer?'
echo 'r. Return'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# Google Chrome
1)
    echo 'Downloading Google Chrome...'
    # Download Debian file that matches system architecture
    if [ $(uname -i) = 'i386' ]; then
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
    elif [ $(uname -i) = 'x86_64' ]; then
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    fi
    # Install the package
    echo 'Installing Google Chrome...'
    echo 'Requires root privileges:'
    sudo dpkg -i google-chrome*.deb
    sudo apt-get install -fy
    # Cleanup and finish
    rm google-chrome*.deb
    cd
    echo 'Done.'
    thirdparty
    ;;
# Google Talk Plugin
2)
    echo 'Downloading Google Talk Plugin...'
    # Download Debian file that matches system architecture
    if [ $(uname -i) = 'i386' ]; then
        wget https://dl.google.com/linux/direct/google-talkplugin_current_i386.deb
    elif [ $(uname -i) = 'x86_64' ]; then
        wget https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb
    fi
    # Install the package
    echo 'Installing Google Talk Plugin...'
    echo 'Requires root privileges:'
    sudo dpkg -i google-talkplugin_current*.deb
    sudo apt-get install -fy
    # Cleanup and finish
    rm google-talkplugin_current*.deb
    cd
    echo 'Done.'
    thirdparty
    ;;
# Google Music Manager
3)
    echo 'Downloading Google Music Manager...'
    # Download Debian file that matches system architecture
    if [ $(uname -i) = 'i386' ]; then
        wget https://dl.google.com/linux/direct/google-musicmanager-beta_current_i386.deb
    elif [ $(uname -i) = 'x86_64' ]; then
        wget https://dl.google.com/linux/direct/google-musicmanager-beta_current_amd64.deb
    fi
    # Install the package
    echo 'Installing Google Music Manager...'
    echo 'Requires root privileges:'
    sudo dpkg -i google-musicmanager-*.deb
    sudo apt-get install -fy
    # Cleanup and finish
    rm google-musicmanager*.deb
    cd
    echo 'Done.'
    thirdparty
    ;;
# Steam
4)
    echo 'Downloading Steam...'
    cd $HOME/Downloads
    # Download Debian file that matches system architecture
    if [ $(uname -i) = 'i386' ]; then
        wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
    elif [ $(uname -i) = 'x86_64' ]; then
        wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
    fi
    # Install the package
    echo 'Installing Steam...'
    echo 'Requires root privileges:'
    sudo dpkg -i steam*.deb
    sudo apt-get install -fy
    # Cleanup and finish
    rm steam*.deb
    cd
    echo 'Done.'
    thirdparty
    ;;
# Unity Tweak Tool
5)
    # Add repository
    echo 'Adding Unity Tweak Tool repository to sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository -y ppa:freyja-dev/unity-tweak-tool-daily
    # Update Repository Information
    echo 'Updating repository information...'
    echo 'Requires root privileges:'
    sudo apt-get update -qq
    # Install the package
    echo 'Installing Unity Tweak Tool...'
    echo 'Requires root privileges:'
    sudo apt-get install -y unity-tweak-tool
    echo 'Done.'
    thirdparty
    ;;
# Sublime Text 3
6)
    sublime3
    ;;
# Pantheon
7)
    pantheon
    ;;
# My Weather Indicator
8)
    # Add repository
    echo 'Adding My Weather Indicator repository to sources...'
    echo 'Requires root privileges:'
    sudo add-apt-repository -y ppa:atareao/atareao
    # Update Repository Information
    echo 'Updating repository information...'
    echo 'Requires root privileges:'
    sudo apt-get update -qq
    # Install the package
    echo 'Installing My Weather Indicator...'
    echo 'Requires root privileges:'
    sudo apt-get install -y my-weather-indicator
    echo 'Done.'
    thirdparty
    ;;
# Variety Wallpaper changer
9)
# Add repository
  echo 'Adding Variety Wallpaper Changer repository to sources...'
  echo 'Requires root privileges:'
  sudo add-apt-repository -y ppa:peterlevi/ppa
  # Update Repository Information
  echo 'Updating repository information...'
  echo 'Requires root privileges:'
  sudo apt-get update -qq
  # Install the package
  echo 'Installing My Weather Indicator...'
  echo 'Requires root privileges:'
  sudo apt-get install -y variety
  echo 'Done.'
  thirdparty
;;
# Return
[Rr]*)
    clear && main;;
# Invalid choice
* )
    clear && echo 'Not an option, try again.' && thirdparty;;
esac
}

# CONFIG
function config {
echo ''
echo '1. Set preferred application-specific settings?'
echo '2. Show all startup applications?'
echo 'r. Return'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# GSettings
1)
    # Font Sizes
    echo 'Setting font preferences...'
    gsettings set org.gnome.desktop.interface text-scaling-factor '1.0'
    gsettings set org.gnome.desktop.interface document-font-name 'Ubuntu 11'
    gsettings set org.gnome.desktop.interface font-name 'Ubuntu 11'
    gsettings set org.gnome.desktop.interface monospace-font-name 'Ubuntu Mono 12'
    gsettings set org.gnome.nautilus.desktop font 'Ubuntu 11'
    gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 10'
    gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
    gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'slight'
    # Unity Settings
    echo 'Setting Unity preferences...'
    gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false
    gsettings set com.canonical.unity-greeter draw-user-backgrounds true
    gsettings set com.canonical.indicator.power icon-policy 'charge'
    gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
    # Nautilus Preferences
    echo 'Setting Nautilus preferences...'
    gsettings set org.gnome.nautilus.preferences sort-directories-first true
    # Gedit Preferences
    echo 'Setting Gedit preferences...'
    gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
    gsettings set org.gnome.gedit.preferences.editor create-backup-copy false
    gsettings set org.gnome.gedit.preferences.editor auto-save true
    gsettings set org.gnome.gedit.preferences.editor insert-spaces true
    gsettings set org.gnome.gedit.preferences.editor tabs-size 2
    # Rhythmbox Preferences
    echo 'Setting Rhythmbox preferences...'
    gsettings set org.gnome.rhythmbox.rhythmdb monitor-library true
    gsettings set org.gnome.rhythmbox.sources browser-views 'artists-albums'
    gsettings set org.gnome.rhythmbox.sources visible-columns '['post-time', 'artist', 'duration', 'genre', 'album']'
    # Done
    echo "Done."
    config
    ;;
# Startup Applications
2)
    echo 'Changing display of startup applications.'
    echo 'Requires root privileges:'
    cd /etc/xdg/autostart/ && sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop
    cd
    echo 'Done.'
    config
    ;;
# Return
[Rr]*)
    clear && main;;
# Invalid choice
* )
    clear && echo 'Not an option, try again.' && config;;
esac
}

# CLEANUP SYSTEM
function cleanup {
echo ''
echo '1. Remove unused pre-installed packages?'
echo '2. Remove old kernel(s)?'
echo '3. Remove orphaned packages?'
echo '4. Remove leftover configuration files?'
echo '5. Clean package cache?'
echo 'r. Return?'
echo ''
read -p 'What would you like to do? (Enter your choice) : ' REPLY
case $REPLY in
# Remove Unused Pre-installed Packages
1)
    echo 'Removing selected pre-installed applications...'
    echo 'Requires root privileges:'
    sudo apt-get purge
    echo 'Done.'
    cleanup
    ;;
# Remove Old Kernel
2)
    echo 'Removing old Kernel(s)...'
    echo 'Requires root privileges:'
    sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | grep -v linux-libc-dev | xargs sudo apt-get -y purge
    echo 'Done.'
    cleanup
    ;;
# Remove Orphaned Packages
3)
    echo 'Removing orphaned packages...'
    echo 'Requires root privileges:'
    sudo apt-get autoremove -y
    echo 'Done.'
    cleanup
    ;;
# Remove residual config files?
4)
    echo 'Removing leftover configuration files...'
    echo 'Requires root privileges:'
    sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep '^rc' | tr -s ' ' | cut -d ' ' -f 2)
    echo 'Done.'
    cleanup
    ;;
# Clean Package Cache
5)
    echo 'Cleaning package cache...'
    echo 'Requires root privileges:'
    sudo apt-get clean
    echo 'Done.'
    cleanup
    ;;
# Return
[Rr]*)
    clear && main;;
# Invalid choice
* )
    clear && echo 'Not an option, try again.' && cleanup;;
esac
}

# Quit
function quit {
read -p "Are you sure you want to quit? (Y)es, (N)o " REPLY
case $REPLY in
    [Yy]* ) exit 99;;
    [Nn]* ) clear && main;;
    * ) clear && echo 'Sorry, try again.' && quit;;
esac
}

#----- MAIN FUNCTION -----#
function main {
echo ''
echo '1. Perform system update & upgrade?'
echo '2. Install favourite applications?'
echo '3. Install favourite system utilities?'
echo '4. Install development tools?'
echo '5. Install design tools?'
echo '6. Install extra GNOME components?'
echo '7. Install Ubuntu Restricted Extras?'
echo '8. Install third-party applications?'
echo '9. Configure system?'
echo '10. Cleanup the system?'
echo 'q. Quit?'
echo ''
read -p 'What would you like to do? (Enter the your choice) : ' REPLY
case $REPLY in
    1) sysupgrade;; # System Upgrade
    2) clear && favourites;; # Install Favourite Applications
    3) clear && system;; # Install Favourite Tools
    4) clear && development;; # Install Dev Tools
    5) clear && design;; # Install Design Tools
    6) clear && gnome;; # Install GNOME components
    7) clear && codecinstall;; # Install Ubuntu Restricted Extras
    8) clear && thirdparty;; # Install Third-Party Applications
    9) clear && config;; # Configure System
    10) clear && cleanup;; # Cleanup System
    [Qq]* ) clear && quit;; # Quit
    * ) clear && echo 'Not an option, try again.' && main;;
esac
}

#----- RUN MAIN FUNCTION -----#
main

#END OF SCRIPT
