﻿set nocompatible    " be iMproved
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set nu
set tw=0
set expandtab
set tabstop=4 
set cindent
set autoread		"When a file has been detected to have been changed outside of Vim and 
                    "it has not been changed inside of Vim, automatically read it again
set autowriteall
set t_Co=256
set hls
set cursorline
set backspace=indent,eol,start 


" Customize status line
set laststatus=2
set statusline=\ %F     "Full path to the file in the buffer
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]
set statusline+=%m      "Modified flag, text is [+]; [-] if 'modifiable' is off."
set statusline+=%=      "Separation point between left and right aligned items
set statusline+=%c,     "Column number
set statusline+=%l/     "Line number
set statusline+=%L      "Number of lines in buffer
set statusline+=(%p%%)\     "Percentage through file in lines as in CTRL-G
 
filetyp plugin indent on      " activate filetype after initializing vundle 
syntax on
  
  
colorscheme sorcerer
 
autocmd BufReadPre *.sh call system("ctags -R -a --languages-force=Sh")
autocmd BufReadPre *.pl,*.pm call system("ctags -R -a --languages-force=Perl")
autocmd BufReadPre *.rb,*.erb call system("ctags -R -a --languages-force=Ruby")
autocmd BufReadPre *.c call system("ctags -R -a --languages-force=C")
autocmd BufReadPre *.cpp call system("ctags -R -a --languages-force=C++")
autocmd BufReadPre *.js call system("ctags -R -a --languages-force=Javascript")
autocmd BufReadPre *.java call system("ctags -R -a --languages-force=Java")
 
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal iskeyword=64,48-57,95,192-255
autocmd FileType css setlocal  sw=2 ts=2 cindent

autocmd FileType html setlocal sw=2 ts=2 cindent
autocmd FileType html setlocal iskeyword=64,48-57,95,192-255

autocmd FileType javascript setlocal sw=4 ts=4 cindent
autocmd FileType java setlocal sw=4 ts=4 cindent
autocmd FileType perl setlocal sw=4 ts=4 cindent
 
 
call pathogen#infect()  
call pathogen#helptags()  
 
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <F1> :TagbarToggle<CR>

" For Command-T
let g:CommandTCancelMap=['<ESC>','<C-c>']
set wildignore+=.git,tags,*.class,*.o,.svn

" For auto-pairs
let g:AutoPairsShortcutBackInsert = '<Leader><BS>'
