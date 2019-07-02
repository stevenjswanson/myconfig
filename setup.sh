#!/bin/bash

if which sudo; then
    SUDO=sudo;
else
    SUDO=
fi

$SUDO apt-get update
$SUDO apt-get install -y emacs git man less curl 

git config --global user.email "swanson@cs.ucsd.edu"
git config --global user.name "Steven Swanson"

