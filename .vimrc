set hidden
set nocompatible
set number relativenumber
set spell
set nobackup                  
set history=100
syntax enable
set encoding=utf-8
set hlsearch
set ignorecase smartcase
set smartindent
set showmatch
set incsearch
set nohlsearch
set laststatus=2
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
syntax on
set t_Co=256
set showcmd
set background=dark
set cursorline
hi CursorLine cterm=bold ctermbg=green ctermfg=black  


"set showtabline=2




" Plugins
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'ap/vim-css-color' 
Plug 'vimwiki/vimwiki'  
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary' "gc for cmnt
Plug 'mattn/emmet-vim'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                          
Plug 'itchyny/lightline.vim' 
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-prettier',
  \ ]


"Plug 'airblade/vim-gitgutter'
"Plug 'preservim/tagbar'


call plug#end()




" Restore last line position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


colorscheme onedark


" Goyo keys
map <C-g> :Goyo 200<CR>


" Emmet keys
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','


" Colored parentheses
let g:rainbow_active = 1 "set 0 to disable, :RainbowToggle to enable 


" Status bar
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }


" Indentation
let g:indentLine_char ="."




"FZF keys
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :BLines<CR>
nnoremap <C-g> :GFiles<CR>



