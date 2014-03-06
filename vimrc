set nocompatible               " be iMproved
set showcmd     	" Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set nu
set tw=0
set tabstop=4 
set shiftwidth=4 
"set cindent
set autoread		"When a file has been detected to have been changed outside of Vim and 
                    "it has not been changed inside of Vim, automatically read it again
set autowriteall
set wildmode=list   "In Ex mode, press <tab> to list all the files in the current working directory
set t_Co=256
set hls
set cursorline
set backspace=indent,eol,start 
set splitright

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
 
" autocmd BufReadPre *.sh call system("ctags -R -a --languages-force=Sh")
" autocmd BufReadPre *.pl,*.pm call system("ctags -R -a --languages-force=Perl")
" autocmd BufReadPre *.rb,*.erb call system("ctags -R -a --languages-force=Ruby")
" autocmd BufReadPre *.c call system("ctags -R -a --languages-force=C")
" autocmd BufReadPre *.cpp call system("ctags -R -a --languages-force=C++")
" autocmd BufReadPre *.js call system("ctags -R -a --languages-force=Javascript")
" autocmd BufReadPre *.java call system("ctags -R -a --languages-force=Java")
 
autocmd BufReadPre *.txt setlocal spell
autocmd FileType css setlocal  sw=2 ts=2 cindent 
autocmd FileType xml setlocal  sw=2 ts=2 cindent
autocmd FileType html setlocal sw=2 ts=2 cindent iskeyword=64,48-57,95,192-255
autocmd FileType javascript setlocal sw=4 ts=4 cindent
autocmd FileType java setlocal sw=4 ts=4 cindent
autocmd FileType perl setlocal sw=4 ts=4 cindent

call pathogen#infect()  
call pathogen#helptags()  
 
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-c> <c-w>c

nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F3> :TagbarToggle<CR>
nmap <silent> <F4> :call AutoPairsToggle()<CR>

nmap <silent> <Leader>n :set nu!<CR>
nmap <silent> <Leader>h :set hls!<CR>
nmap <silent> <Leader>n :set nu!<CR>
nmap <silent> <Leader>h :set hls!<CR>
nmap <silent> <Leader>p :set paste!<CR>
nmap <silent> <Leader>w :set wrap!<CR>
nmap <silent> <Leader>cl :call CopyLine()<CR>
nmap <silent> <Leader>cs :call CopySection()<CR>
nmap <silent> <Leader>v "+p
nmap <Leader>s :so ~/.vimrc<CR>
nmap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nmap <silent> <C-u> 5<C-y>
nmap <silent> <C-d> 5<C-e>


" invisible character
nmap <silent> <Leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬ "ctrl-v u25b8=▸; ctrl-v u00ac=¬; ctrl-v u2423=␣
hi specialKey	cterm=NONE	ctermbg=NONE	ctermfg=239
hi nontext		cterm=NONE	ctermbg=NONE	ctermfg=239

" For Command-T 
let g:CommandTCancelMap=['<ESC>','<C-c>']
set wildignore+=.git,tags,*.class,*.o,.svn

" For auto-pairs
"let g:AutoPairsShortcutBackInsert = '<Leader><BS>'


call textobj#user#plugin('path', {
\   '-': {
\     'pattern': '/[0-9a-zA-Z_-]\+',
\     'select': 'ah',
\   },
\ })

call textobj#user#plugin('var', {
\	'-': {
\		'pattern' : '\(\$\|@\|%\)\({\)\?[-_0-9a-zA-Z]\+\(}\)\?\_s*',
\		'select' : 'av',
\	},
\ })

function! CopyLine() 		
	let pos = getpos('.')
	normal! ^"+y$
	call setpos('.', pos)
	echo "1 line yanked"
endfunction

function! CopySection() 		
	let pos = getpos('.')
	normal! "+yip
	call setpos('.', pos)
endfunction
