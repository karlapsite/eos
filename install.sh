#!/bin/bash
function replace
{
    if [[ -e $1 ]] ; then
        rm -rf ~/$1
        ln -s `pwd`/$1 ~/$1
    fi
}

replace .bashrc
replace .bash_aliases
replace .bash_logout
replace .vimrc
replace .tmux.conf

if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/gmarik/Vundle.vim.git              ~/.vim/bundle/Vundle.vim
fi
if [[ ! -d ~/.vim/bundle/vim-colors-solarized ]]; then
    git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
fi
if [[ ! -d ~/.vim/bundle/vim-go ]]; then
    git clone git://github.com/fatih/vim-go.git                     ~/.vim/bundle/vim-go
fi
if [[ ! -d ~/.vim/bundle/vim-sleuth ]]; then
    git clone git://github.com/tpope/vim-sleuth.git                 ~/.vim/bundle/vim-sleuth
fi
if [[ ! -d ~/.vim/bundle/vim-flavored-markdown ]]; then
    git clone git://github.com/jtratner/vim-flavored-markdown.git   ~/.vim/bundle/vim-flavored-markdown
fi
if [[ ! -d ~/.vim/github.com/scrooloose/syntastic ]]; then
    git clone git://github.com/scrooloose/syntastic                 ~/.vim/bundle/syntastic
fi


sudo rm /usr/lib/git-core/git-sh-prompt
sudo ln -s `pwd`/Scripts/git-sh-prompt /usr/lib/git-core/git-sh-prompt

