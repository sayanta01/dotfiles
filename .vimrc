"set nocompatible
"set spell
"set hidden


set number relativenumber
set nobackup                  
set history=100
syntax enable
syntax on
set encoding=utf-8
set hlsearch
set ignorecase smartcase
set smartindent
set showmatch
set incsearch
set nohlsearch
set laststatus=2
set background=dark
set t_Co=256
set nowrap
set scrolloff=6
set mouse=a
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set fileformat=unix
set clipboard=unnamedplus
set wildmode=longest,list,full
set showcmd


"set cursorline
"hi CursorLine cterm=bold ctermbg=green ctermfg=black  




" Plugins
" PlugInstall PlugUpdate PlugClean

call plug#begin('~/.vim/plugged')


Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color' 
Plug 'tpope/vim-commentary' "gc for cmnt
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'prettier/vim-prettier'

"Plug 'itchyny/lightline.vim' 
"Plug 'preservim/tagbar'
"Plug 'vimwiki/vimwiki'  
"Plug 'junegunn/fzf.vim'                           

"install coc


call plug#end()




" restore last line position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
















