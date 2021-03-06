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

# Replace the git-sh-prompt with the copy in this repo
if [[ -f /usr/lib/git-core/git-sh-prompt || -L /usr/lib/git-core/git-sh-prompt ]]; then
    sudo rm -f /usr/lib/git-core/git-sh-prompt
    sudo ln -s `pwd`/Scripts/git-sh-prompt /usr/lib/git-core/git-sh-prompt
else
    echo "git-sh-prompt not found... Ignoring"
fi

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
if [[ ! -d ~/.vim/bundle/vim-fugitive ]]; then
    git clone git://github.com/tpope/vim-fugitive.git               ~/.vim/bundle/vim-fugitive
fi
if [[ ! -d ~/.vim/bundle/vim-flavored-markdown ]]; then
    git clone git://github.com/jtratner/vim-flavored-markdown.git   ~/.vim/bundle/vim-flavored-markdown
fi
if [[ ! -d ~/.vim/bundle/vim-flake8 ]]; then
    git clone git://github.com/nvie/vim-flake8                      ~/.vim/bundle/vim-flake8
fi
if [[ ! -d ~/.vim/bundle/vim-json ]]; then
    git clone git://github.com/elzr/vim-json.git                    ~/.vim/bundle/vim-json
fi
if [[ ! -d ~/.vim/bundle/tabular ]]; then
    git clone git://github.com/godlygeek/tabular.git                ~/.vim/bundle/tabular
fi
if [[ ! -d ~/.vim/bundle/vim-markdown ]]; then
    git clone git://github.com/plasticboy/vim-markdown.git          ~/.vim/bundle/vim-markdown
fi
if [[ ! -d ~/.vim/bundle/vim-airline ]] || [[ ! -d ~/.fonts/ ]]; then
    git clone https://github.com/bling/vim-airline                  ~/.vim/bundle/vim-airline
fi
if [[ ! -d ~/.vim/bundle/tagbar ]]; then
    git clone https://github.com/majutsushi/tagbar                  ~/.vim/bundle/tagbar
fi

# Check for the gsettings command
which gsettings &> /dev/null
if [[ $? -eq 0 ]] ; then
    # Opening another terminal tab will open to the current directory, instead of ~/
    gsettings set org.pantheon.terminal.settings follow-last-tab true
fi
