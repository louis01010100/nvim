set showcmd     	" Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set fillchars=stl:\ ,stlnc:\ ,vert:\  "get rid of | in the vertical split 
set number
set tabstop=4 
set shiftwidth=4 
set hidden
set history=10000
set display=uhex
set expandtab
set ffs=unix
set noswapfile
set autoread		
set autowriteall
set wildmode=list:longest   "In Ex mode, press <tab> to list all the files in the current working directory
set hlsearch
set cursorline
set backspace=indent,eol,start 
set autowriteall
set splitbelow
set splitright
set mouse-=a
filetype plugin indent on      " activate filetype after initializing vundle 
    
" invisible character
set listchars=tab:▸\ ,eol:¬ "ctrl-v u25b8=▸; ctrl-v u00ac=¬; ctrl-v u2423=␣

set background=dark
colorscheme sorcerer

let g:python_host_prog = '/usr/bin/python2'
