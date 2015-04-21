#!/bin/bash
function replace
{
    if [[ -e $1 ]] ; then
        rm -r ~/$1
        ln -s `pwd`/$1 ~/$1
    fi
}

replace .bashrc
replace .bash_aliases
replace .bash_logout
replace .vimrc

