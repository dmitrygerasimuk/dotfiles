#!/usr/bin/env bash
source function.sh

unamestr=`uname`

# linux only
if [ "$unamestr" == "Linux" ] ; then
  echo "Linux"
mytest cp ~/.bashrc ~/.bashrc.bak
mytest rm -f ~/.bashrc
mytest ln -sf $(pwd)/linux/bashrc ~/.bashrc
mytest cp ~/.profile ~/.profile.bak
mytest rm -f ~/.profile
mytest ln -sf $(pwd)/linux/profile ~/.profile
mytest ln -sf $(pwd)/linux/motd ~/welcome.msg

  file ~/.bashrc ~/.profile ~/.bash_profile /etc/motd
fi
# mac only
if [ "$unamestr" == "Darwin" ]; then
  echo "on Mac"
mytest cp /etc/motd /etc/motd.bak
mytest sudo rm -f /etc/motd
mytest cp ~/.profile ~/.profile.bak
mytest rm -f ~/.profile
mytest cp ~/.bashrc ~/.bashrc.bak
mytest rm -f ~/.bashrc
  mytest   ln -sf $(pwd)/mac/bashrc             ~/.bashrc
  mytest  ln -sf  $(pwd)/mac/profile        ~/.profile
  mytest sudo ln -sf $(pwd)/mac/motd /etc/motd
  mytest ln -sf $(pwd)/mac/bash_profile        ~/.bash_profile
  echo "Testing..."

  file ~/.bashrc ~/.profile ~/.bash_profile /etc/motd
fi
