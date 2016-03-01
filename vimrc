set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'

" Add all plugins here
"

call vundle#end()


syntax on
filetype plugin indent on

if has('gui_running')
	set background=dark
	colorschem solarized
else
	colorscheme zenburn
endif
call togglebg#map("<F5>")
set wrap
set autoindent
set encoding=utf-8

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap jk <ESC>
set foldmethod=indent
set foldlevel=99
set nu
let python_highlight_all=1
syntax on
nnoremap <space> za

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
set clipboard=unnamedplus
