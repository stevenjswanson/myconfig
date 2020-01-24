#!/bin/bash

if which sudo; then
    SUDO=sudo;
else
    SUDO=
fi

git config --global user.email "swanson@cs.ucsd.edu"
git config --global user.name "Steven Swanson"
git config --global push.default simple

$SUDO apt-get update
$SUDO apt-get install -y emacs git man less curl 

if ! [ -e ~/.emacs ]; then
    curl https://raw.githubusercontent.com/stevenjswanson/myconfig/master/.emacs > ~/.emacsxb
fi

git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
