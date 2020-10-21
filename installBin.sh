#!/usr/bin/env bash
source function.sh

unamestr=`uname`

# linux only
if [ "$unamestr" == "Linux" ] ; then
  echo "Linux"
mytest ln -sf $(pwd)/bin/far /usr/local/bin/far 

  file /usr/local/bin/far 
fi
# mac only
if [ "$unamestr" == "Darwin" ]; then
  echo "on Mac"
fi
