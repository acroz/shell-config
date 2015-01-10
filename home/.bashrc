
# Interactive shells only
case $- in
    *i*)
        case $(hostname) in
            login*) # SuperMUC
                export SHELL=/usr/bin/zsh
                [ -z "$ZSH_VERSION" ] && exec /usr/bin/zsh -l
                ;;
        esac
    ;;
esac

# Colourful shell
export PS1="\n\[\e[1;35m\][\u@\h]\[\e[1;31m\]\w\$\[\e[m\] "
if shopt -q login_shell; then
    case $(hostname) in
        crozier-pc|andrew-mac.home)
        source $HOME/.sh/colors
        ;;
    esac
fi

# Get git extensions, and modify PS1 to show branch if it exists
GITPROMPT=$HOME/.bash/git-prompt.sh
if [ -f $GITPROMPT ]; then
   source $GITPROMPT
   export PS1="\n\[\e[1;35m\][\u@\h]\[\e[1;31m\]\w\[\e[1;37m\]\$(__git_ps1 \"(%s)\")\[\e[1;31m\]\$\[\e[m\] "
fi

source $HOME/.path
source $HOME/.alias
