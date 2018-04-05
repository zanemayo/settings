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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="/home/zane/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

setxkbmap -option 'caps:ctrl_modifier'
# xcape -e 'Caps_Lock=Escape'
. /usr/share/autojump/autojump.sh 

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export GOPATH=$HOME/dev/go
export GOROOT=/usr/local/go
export PATH="$PATH:$HOME/dev/go/bin"
synclient TapButton1=0
synclient TapButton2=0
synclient TapButton3=0

alias unaws='unset AWS_PROFILE; unset AWS_ACCESS_KEY_ID; unset AWS_SECRET_ACCESS_KEY; unset AWS_SESSION_TOKEN'
alias mmgdev='eval $(unaws && platutils-switch-aws-account mmgdev zanemayo)'
alias mmgprod='eval $(unaws && platutils-switch-aws-account mmgprod zanemayo)'
alias tmux2="TERM=xterm-256color tmux"

