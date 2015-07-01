# Color Definitions
black='\e[0;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
light_grey='\e[0;37m'
dark_grey='\e[1;30m'
light_red='\e[1;31m'
light_green='\e[1;32m'
orange='\e[1;33m'
light_blue='\e[1;34m'
light_purple='\e[1;35m'
light_cyan='\e[1;36m'
white='\e[1;37m'
# Return color to normal formatting
NC='\e[0m'


# Functions
function wrap_make() 
{
    clear;
    /usr/bin/make "$@"
    if [[ $? -eq 0 ]] ; then
        echo -e $green"make: Success!"$NC
        return 0
    else
        echo -e $red"make: Something isn't very happy"$NC
        return 1
    fi
}

function wrap_dts()
{
    file=${1%.dtb}

    if [[ -e ${file}.dtb ]] ; then
        if [[ -e ${file}.dtb.old ]] ; then
            read -p "Replace backup "${file}".dtb.old? [Y/n] "
            if [[ $REPLY =~ ^Y$|^y$|^$ ]] ; then #string starts with a Y, or doesn't have anything
                rm ${file}.dtb.old
                cp ${file}.dtb ${file}.dtb.old
            fi
        else
            cp ${file}.dtb ${file}.dtb.old
        fi

        dtc -I dtb -O dts -o ${file}.dts ${file}.dtb && \
        rm ${file}.dtb && \
        echo -e ${green}Converted Device Tree Binary to Source || \
        echo -e ${red}Conversion Failed
    else 
        echo -e ${red}Error Converting: ${file}.dtb does not exist!
    fi
}

function wrap_dtb()
{
    file=${1%.dts}

    if [[ -e ${file}.dts ]] ; then
        if [[ -e ${file}.dts.old ]] ; then
            read -p "Replace backup "${file}".dts.old? [Y/n] "
            if [[ $REPLY =~ ^Y$|^y$|^$ ]] ; then #string starts with a Y, or doesn't have anything
                rm ${file}.dts.old
                cp ${file}.dts ${file}.dts.old
            fi
        else
            cp ${file}.dts ${file}.dts.old
        fi

        dtc -I dts -O dtb -o ${file}.dtb ${file}.dts && \
        rm ${file}.dts && \
        echo -e ${green}Converted Device Tree Binary to Source || \
        echo -e ${red}Conversion Failed
    else 
        echo -e ${red}Error Converting: ${file}.dts does not exist!
    fi
}

function wrap_copy()
{
    if [[ ! -e $1 ]] ; then
        echo -e ${red}"file '"$1"' does not exist."${nc}
        return 1
    fi
    cat $1 | xclip -i -selection clipboard
}

# Usage: br N
# Output: the combined diff of the last N commits
function wrap_bt()
{
    git diff HEAD`for ((i=0; i<$1; ++i)); do echo -n ^; done;` HEAD
}

# Usage: df N
# Output: the diff from N commits ago
function wrap_df()
{
    git diff HEAD`for ((i=0; i<$1; ++i)); do echo -n ^; done;` HEAD`for ((i=0; i<$(($1-1)); ++i)); do echo -n ^; done;`
}

# Environment Variables
export EDITOR="vim"

# Aliases
alias sudo='sudo '

# Startup
alias rc='vim ~/.bashrc'
alias rcs='vim ~/.bashrc && source ~/.bashrc'
alias rca='vim ~/.bash_aliases'
alias rcas='vim ~/.bash_aliases && source ~/.bash_aliases'
alias rcam='vim ~/.more_bash_aliases'
alias rcams='vim ~/.more_bash_aliases && source ~/.bash_aliases'

# Vim Things
alias vis='vim ~/.vimrc'

# Tmux things
alias tmux='tmux -2' #256 color support
alias tms='vim ~/.tmux.conf'
alias tma='tmux attach -t 0'

# Grub Things
alias 40grub='sudo vi /etc/grub.d/40_custom && sudo update-grub'
alias grubdef='sudo vi /etc/default/grub && sudo update-grub'

# Tools
alias ack='ack-grep'

alias make='wrap_make'
alias dts='wrap_dts'
alias dtb='wrap_dtb'
alias copy='wrap_copy'
alias bt='wrap_bt'
alias df='wrap_df'

if [ -d /usr/local/go/bin ]; then
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=~/go
fi

if [ -e ~/.more_bash_aliases ]; then
    . ~/.more_bash_aliases
fi

# Directory traversal
alias github='mkdir -p ~/Github && cd ~/Github'
