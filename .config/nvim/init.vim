":checkhealth
":PlugInstall 
"pip install pynvim 
"Maps  #see shortcuts


set nocompatible
set fileformat=unix
set encoding=utf-8
set hidden
set scrolloff=6
set laststatus=2
set showcmd
set confirm
set nobackup



set history=200
set wildmode=longest,list,full
set nowritebackup
set ignorecase
set smartindent
set autoindent
set textwidth=79
set pastetoggle=<F2>
syntax enable
syntax on
filetype off
filetype plugin indent on




" Mouse
set mouse=a


" Colors
set t_Co=256
set termguicolors
set background=dark


" Complition
set wildmenu
set spell


" Disable stupid backup and swap 

set noswapfile


" Make search case insensitive
set hlsearch
 smartcase
set incsearch
set showmatch
set nohlsearch


" Indentation



" TABs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showtabline=2


" Numbers lines
set number 
set relativenumber
set colorcolumn=80
set cursorline
set nowrap


" Enable syntax highlighting



" Better copy & paste
set clipboard=unnamedplus


let mapleader = " "


" Plugins.....
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim' 

Plug 'tpope/vim-surround'	  		         
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'               		"ysw

Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'  
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'preservim/tagbar'
Plug 'prettier/vim-prettier' , { 'do': 'yarn install' }    
Plug 'tpope/vim-commentary'                             "gcc cmnt
Plug 'terryma/vim-multiple-cursors'                     "C-n multiple cursors

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'norcalli/nvim-colorizer.lua'  
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           
Plug 'liuchengxu/vim-which-key'

call plug#end()


luafile ~/.config/nvim/lua/plug-colorizer.lua




" Key Remapping.....


" Goyo keys
map <C-z> :Goyo 200<CR>


" Tagbar
nmap <F8> :TagbarToggle<CR>


" Emmet keys
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','


" Move line
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
nnoremap <C-j> yyp
nnoremap <C-k> yyP


" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>


" Better tabbing
vnoremap < <gv
vnoremap > >gv


" jk escape
inoremap jk <esc>


map <C-s> :so ~/.config/nvim/init.vim <Enter>
map <C-t> :term <Enter>


" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Use alt + hjkl to resize windows
nnoremap <M-j>	:resize -2<CR>
nnoremap <M-k>	:resize +2<CR>
nnoremap <M-h>	:vertical resize -2<CR>
nnoremap <M-l>	:vertical resize +2<CR>


" NerdTree
map <C-f> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"FZF keys
map <C-p> :Files<CR>
map <C-g> :GFiles<CR>  "only shows tracked by git
map <C-b> :BLines<CR>
map <C-o> :Rg!




" Plugin Setting.....

" Colored parentheses
let g:rainbow_active = 1  "set 0 to disable, :RainbowToggle to enable 


" Status bar
let g:lightline = {
   \ 'colorscheme': 'wombat',
   \ 'separator': {'left': '', 'right': ''},
   \ 'subseparator': { 'left': '', 'right': '┇'}
   \ }
      

" TreeSitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "json" "bash" "typescript", "python", "c", "lua", "rust" },
  sync_install = false,
  
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}




" General Settings.....

" save sudo file
cmap w!! w !sudo tee > /dev/null %


" Indentation
let g:indentLine_char ="."


" Restore last line position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


colorscheme onedark


let g:prettier#autoformat = 0
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync





















