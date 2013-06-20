set nocompatible               " be iMproved
"filetype off                   " required!
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"Bundle 'gmarik/vundle'
execute pathogen#infect() 

filetype plugin indent on      " activate filetype after initializing vundle 
 
syntax on
 
set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set backspace=indent,eol,start
 
set nu
set sts=4
set expandtab
set sw=4
set tw=0
set cindent
 
set t_Co=256
 
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <F2> :TagbarToggle<CR>
 
set cursorline
 
colorscheme sorcerer
 
set hidden
set autoread
set clipboard=unnamedplus
set autowriteall
autocmd BufReadPre *.sh call system("ctags -R -a --languages=Sh")
autocmd BufReadPre *.pl,*.pm call system("ctags -R -a --languages=Perl")
autocmd BufReadPre *.rb call system("ctags -R -a --languages=Ruby")
autocmd BufReadPre *.c call system("ctags -R -a --languages=C")
autocmd BufReadPre *.cpp call system("ctags -R -a --languages=C++")
autocmd BufReadPre *.java call system("ctags -R -a --languages=Java")
autocmd BufReadPre *.js call system("jsctags * -o jstags")
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS tags=jstags,./jstags

