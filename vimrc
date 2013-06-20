set nocompatible               " be iMproved
set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set nu
set sts=4
set expandtab
set sw=4
set tw=0
set cindent
set hidden
set autoread
set clipboard=unnamedplus
set autowriteall
set t_Co=256
set hls
set exrc
set cursorline
set backspace=indent,eol,start 
  
filetyp plugin indent on      " activate filetype after initializing vundle 
syntax on
   
   
colorscheme sorcerer
  
autocmd BufReadPre *.sh call system("ctags -R -a --languages=Sh")
autocmd BufReadPre *.pl,*.pm call system("ctags -R -a --languages=Perl")
autocmd BufReadPre *.rb,*.erb call system("ctags -R -a --languages=Ruby")
autocmd BufReadPre *.c call system("ctags -R -a --languages=C")
autocmd BufReadPre *.cpp call system("ctags -R -a --languages=C++")
autocmd BufReadPre *.js call system("ctags -R -a --languages=Javascript")
autocmd BufReadPre *.java call system("ctags -R -a --languages=Java")
autocmd BufReadPre *.js call system("jsctags * -o jstags")
  
  
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
 
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
autocmd FileType javascript setlocal tags=jstags,./jstags
  
  
call pathogen#infect()  
call pathogen#helptags()  
  
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <F2> :TagbarToggle<CR>
 
" For Command-T
let g:CommandTCancelMap=['<ESC>','<C-c>']
set wildignore+=.git,tags,*.class,*.o,.svn
 
" For auto-pairs
let g:AutoPairsShortcutBackInsert = '<Leader><BS>'
