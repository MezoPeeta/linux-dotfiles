#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\w\n> '
export PATH="/home/mazen/.flutter/bin/:$PATH"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus

. "$HOME/.cargo/env"

export PATH="$PATH":"$HOME/.pub-cache/bin"

