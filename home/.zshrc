#!/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster-mod"

DEFAULT_USER=$(whoami)

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to disable marking untracked files as dirty.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found colored-man pip zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
source $HOME/.path
source $HOME/.alias

export TERM=xterm-256color
export EDITOR=vim

# Load custom functions and completion definitions
fpath=($HOME/.zsh/functions $HOME/.zsh/completion $fpath)
autoload cv
autoload cdpwd

# Match ls colours and autocomplete colours
eval `dircolors $HOME/.dircolors`
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit