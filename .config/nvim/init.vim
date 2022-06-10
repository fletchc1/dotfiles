let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Install vim-plug if not found


if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter' { 'do': 'TSUpdate' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug  'tpope/vim-fugitive'



Plug 'psf/black', { 'branch': 'stable' }
Plug 'heavenshell/vim-pydocstring'

Plug 'dracula/vim' {'as': 'dracula'}

call plug#end()


filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set encoding=utf-8
set textwidth=0
set hidden
set number
set title
