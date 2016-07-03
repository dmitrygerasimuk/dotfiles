# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

#
export EDITOR=vim
#export TERM=xterm-256colors
#


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#byobu-tmux attach || byobu-tmux new-session -d vim new-window bc new-window bash
#byobu-tmux new-window sh
#byobu-tmux attach

_byobu_sourced=1 . /usr/bin/byobu-launch
. /home/dmitry/torch/install/bin/torch-activate
