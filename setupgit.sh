#!/bin/bash

# This script is based upon the works by Eric Dubois

# Checking if git is installed
if ! location="$(type -p "git")" || [ -z "git" ]; then
	echo "----------------------------------------------"
	echo " Installing git for this script to work"
	echo "----------------------------------------------"

	# check if apt-get is installed
	if which apt-get > /dev/null; then
		sudo apt-get install -y git
	fi

	# check if pacman is installed
	if which pacman > /dev/null; then
		sudo pacman -S --noconfirm git
	fi

	# check if eopkg is installed
	if which eopkg > /dev/null; then
		sudo eopkg -y install git
	fi
fi

# Setting up git
# https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config

echo "----------------------------------------------"
echo " Git init "
echo "----------------------------------------------"

git init
git config --global user.name "Gerard Aalders"
git config --global user.email "linuxwizd3m@gmail.com"
sudo git config --system core.editor nano
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=18000'
git config --global push.default simple

# Setting up the remote github repository
echo "----------------------------------------------"
echo "What is the title of the repository:"
echo "----------------------------------------------"
read input

# https://github.com/wizd3m/archlive.git
git remote add origin https://github.com/wizd3m/$input.git

echo "----------------------------------------------"
echo " Done"
echo "----------------------------------------------"
