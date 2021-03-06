" This ./vimrc expects that vundle is installed.  To install vundle:
"   git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" The Following Pluggins are installed:
"   git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
"   git clone git://github.com/fatih/vim-go.git                     ~/.vim/bundle/vim-go
"   git clone git://github.com/tpope/vim-sleuth.git                 ~/.vim/bundle/vim-sleuth

set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, this is required (duh)
Plugin 'gmarik/Vundle.vim'
" Tell Vundle about the others
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-sleuth'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'elzr/vim-json'
Plugin 'nvie/vim-flake8'
"Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'avakhov/vim-yaml'

" Do not add plugins after this line!
call vundle#end()            " required
filetype plugin indent on    " required

" Set the default encoding to utf-8
set encoding=utf-8

" Make Airline work...... ._.
set laststatus=2
set noshowmode

" Pretty fonts!
let g:airline_powerline_fonts = 1
" Some default settings that modify the statusline
" Not sure what these do to be honest here
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" Beginning key for shortcuts
let mapleader=","

" Add Line Numbers
set number

" Line wrapping options
set wrap
set linebreak
set nolist  " list will disable linebreak
nmap <up> gk
nmap <down> gj

" Tab Kernoodeling
set tabstop=4    " tab is interpreted as 4 spaces (still is \t)
set shiftwidth=4 " indents will have a width of 4
set expandtab    " by default, convert tabs to spaces (a pluggin will guess through)

" Prevent vim from automatically inserting line breaks in entered text
set textwidth=0
set wrapmargin=0

" Pressing ,ss will toggle and untoggle spell checking
nmap <leader>ss :setlocal spell!<cr>

nmap <leader>sn ]s
nmap <leader>sp {s
nmap <leader>sa zg
nmap <leader>s? z=

" Let the mouse move the cursor
set mouse=n

" Enable titles in terminal tabs!
set title

" COLORS!
set t_Co=256

" Syntax Highlighting
syntax enable
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" Enable ctags (Search up parent directories until it finds 'tags')
set tags=tags;

" goto definition, and pop back
nmap <A-i> <C-]>
nmap <C-A-i> <C-t>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

augroup go
    au!
    " gotags
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }"
augroup END

augroup json
    au!
    " Remove concealment in json files... it's annoying
    let g:vim_json_syntax_conceal = 0
augroup END

augroup markdown
    au!
    " Stop folding markdown... just as annoying
    let g:vim_markdown_folding_disabled=1
    " remove buffer-local auto commands for the current buffer
    " hook to run TableFormat when <bar> is entered in insert mode
    au FileType mkd.markdown exec 'inoremap <bar> <bar><C-O>:TableFormat<CR><C-O>f\|<right>'
    " Ctrl+\ will run TableFormat in either mode
    au FileType mkd.markdown exec 'inoremap <C-\> <C-O>:TableFormat<CR>'
    au FileType mkd.markdown exec 'noremap <silent><C-\> :TableFormat<CR>'
augroup END

augroup python
    au!
    " Remove trailing whitespace
    au BufWritePre *.py,*.c :%s/\s\+$//e
    " Run flake8 whenever we write to a python source file unless it's an
    " __init__.py which causes issues
    au BufWritePost *.py if @% !~ '__init__.py' | call Flake8()
augroup END

augroup worddoc
    au!
    au BufReadPre *.docx set ro
    au BufReadPost *.docx %!docx2txt
augroup END

augroup c
    au!
    " Remove trailing whitespace
    au BufWritePre *.h,*.c :%s/\s\+$//e
augroup END
