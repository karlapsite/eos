#!/bin/bash

if [[ -e .bashrc ]] ; then
    rm -r ~/.bashrc
    ln -s `pwd`/.bashrc ~/.bashrc
fi

if [[ -e .bash_aliases ]] ; then
    rm -r ~/.bash_aliases
    ln -s `pwd`/.bash_aliases ~/.bash_aliases
fi

if [[ -e .bash_logout ]] ; then
    rm -r ~/.bash_logout
    ln -s `pwd`/.bash_logout ~/.bash_logout
fi

