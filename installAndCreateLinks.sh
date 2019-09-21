#!/usr/bin/env bash
source function.sh

unamestr=`uname`

# linux only
if [ "$unamestr" == "Linux" ] ; then
  echo "Linux"
fi
mytest sudo rm -f /etc/motd
mytest rm -f ~/.bashrc
mytest rm -f ~/.profile
# mac only
if [ "$unamestr" == "Darwin" ]; then
  echo "on Mac"

  mytest   ln -sf $(pwd)/mac/bashrc             ~/.bashrc
  mytest  ln -sf  $(pwd)/mac/profile        ~/.profile
  mytest sudo ln -sf $(pwd)/mac/motd /etc/motd
  mytest ln -sf $(pwd)/mac/bash_profile        ~/.bash_profile
  echo "Testing..."
  file ~/.bashrc ~/.profile ~/.bash_profile /etc/motd

fi
