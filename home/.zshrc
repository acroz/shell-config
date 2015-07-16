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
[[ $(uname -s) == "Darwin" ]] && plugins=(osx brew $plugins)

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

# Load colour profile
source $HOME/.sh/colors
# Assign LS_COLORS to zsh autocomplete
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Programs to avoid globbing
alias mpiexec="noglob mpiexec"
alias carp.debug.petsc.pt="noglob carp.debug.petsc.pt"
alias gdb="noglob gdb"

# Temporary fix for grep
unset GREP_OPTIONS

# Sensible handling of vcs_info when it does not exist
function zrcautoload() {
    emulate -L zsh
    setopt extended_glob
    local fdir ffile
    local -i ffound

    ffile=$1
    (( found = 0 )) 
    for fdir in ${fpath} ; do 
        [[ -e ${fdir}/${ffile} ]] && (( ffound = 1 )) 
    done 

    (( ffound == 0 )) && return 1
    if [[ $ZSH_VERSION == 3.1.<6-> || $ZSH_VERSION == <4->* ]] ; then 
        autoload -U ${ffile} || return 1
    else 
        autoload ${ffile} || return 1
    fi
    return 0
}
zrcautoload vcs_info || vcs_info() {return 1}
