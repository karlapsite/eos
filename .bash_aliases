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
        echo -e $red"make: Something isn\'t very happy"$NC
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
    #cat $1 | xclip -i -selection clipboard
    cat $1 | xclip -i
}

# Environment Variables
export EDITOR="vim"

# Aliases
# Startup
alias rc='vim /home/arlx/.bashrc'
alias rcs='vim /home/arlx/.bashrc && source /home/arlx/.bashrc'
alias rca='vim /home/arlx/.bash_aliases'
alias rcas='vim /home/arlx/.bash_aliases && source /home/arlx/.bash_aliases'

# Tools
alias ack='ack-grep'

alias make='wrap_make'
alias dts='wrap_dts'
alias dtb='wrap_dtb'
alias copy='wrap_copy'

if [ -d /usr/local/go/bin ]; then
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=~/go
fi

# Directory traversal
alias github='mkdir -p ~/Github && cd ~/Github'
