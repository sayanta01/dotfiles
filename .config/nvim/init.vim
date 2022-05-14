":checkhealth
":PlugInstall 
"pip install pynvim 


set nocompatible
set fileformat=unix
set encoding=utf-8
set hidden
set scrolloff=6
set laststatus=2
set showcmd
set history=200


" Mouse
set mouse=a


" Colors
set t_Co=256
set background=dark


" Complition
set wildmode=longest,list,full
set wildmenu
set spell


" Disable stupid backup and swap 
set nobackup
set nowritebackup
set noswapfile


" Make search case insensitive
set hlsearch
set ignorecase smartcase
set incsearch
set showmatch
set nohlsearch


" Indentation
set smartindent
set autoindent


" TABs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set showtabline=2


" Numbers lines
set number 
set relativenumber
set colorcolumn=80
set cursorline
set nowrap


" Enable syntax highlighting
syntax enable
filetype off
filetype plugin indent on


" Better copy & paste
set clipboard=unnamedplus
set pastetoggle=<F2>


" Plugins.....

call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'ap/vim-css-color' 
Plug 'itchyny/lightline.vim' 
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'	  		         
Plug 'luochen1990/rainbow'               		"ysw
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'         			"gc cmnt
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                          
Plug 'Yggdroot/indentLine'
Plug 'vimwiki/vimwiki'  
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/terryma/vim-multiple-cursors'  "CTRL + n multiple cursors
Plug 'neoclide/coc.nvim', {'branch': 'release'}		     "yarnpkg install
Plug 'prettier/vim-prettier'                            "yarnpkg install

call plug#end()




" Key Remapping.....

let g:mapleader = "\<Space>"


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
map <C-n> :NERDTreeToggle <Enter>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''


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
   
   
" CoC
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-json',
  \ ]




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






















{ 
  "suggest.noselect": false,
  "coc.preferences.formatOnSaveFiletypes": [
    "javascript",
    "typescript",
    "typescriptreact",
    "json",
    "javascriptreact",
    "typescript.tsx",
    "graphql",
    "html",
    "css"
  ],
  "prettier.tabWidth": 4,
  "prettier.singleQuote": true,
  "prettier.disableSuccessMessage": true
}

