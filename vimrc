set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/badwolf'
Plugin 'scrooloose/NERDtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"
" Add all plugins here

call vundle#end()

colorscheme solarized 
syntax enable

set tabstop=4
set softtabstop=4
set expandtab
set number
set showcmd
set cursorline
filetype indent on

set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch

nnoremap <leader><space> :nohlsearch<CR>

set foldenable

set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent
nnoremap j gj
nnoremap k gk
let mapleader=","
inoremap jk <esc> 
nnoremap <leader>u :GundoToggle<CR> 


call togglebg#map("F5")
let g:airline#extensions#tabline#enabled = 1

map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in")| NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
