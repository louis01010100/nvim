﻿set nocompatible               " be iMproved
set showcmd     	" Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set nu
set tw=0
set tabstop=4 
set shiftwidth=4 
set hidden

"set cindent
set autoread		
set autowriteall
set wildmode=list:longest   "In Ex mode, press <tab> to list all the files in the current working directory
set t_Co=256
set nohls
set cursorline
set backspace=indent,eol,start 
set scrolloff=5
set relativenumber
set autowriteall

" Customize status line
set laststatus=2
set statusline=\ %F     "Full path to the file in the buffer
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]
set statusline+=%m      "Modified flag, text is [+]; [-] if 'modifiable' is off."
set statusline+=%=      "Separation point between left and right aligned items
set statusline+=%c,     "Column number
set statusline+=%l/     "Line number
set statusline+=%L      "Number of lines in buffer
set statusline+=(%p%%)\   "Percentage through file in lines as in CTRL-G

set splitbelow
set splitright
 
filetype plugin indent on      " activate filetype after initializing vundle 
syntax on
    
colorscheme sorcerer
 

execute pathogen#infect()  
execute pathogen#helptags()  

set timeoutlen=1000 ttimeoutlen=0
 
nnoremap [op :set paste<CR>
nnoremap ]op :set nopaste<CR>
map <Space> \
"nnoremap j gj
"nnoremap k gk
nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
nnoremap <C-c> <c-w>c


nnoremap <silent> <F6> :call AutoPairsToggle()<CR>
nnoremap <silent> <F5> :TagbarToggle<CR> 
nnoremap <silent> <Leader>h :set hls!<CR>
nnoremap <silent> <Leader>v :VimShellPop<CR>
nnoremap <silent> <Leader>ral :.w !bash<CR>
nnoremap <silent> <Leader>rae :%w !bash<CR>
nnoremap <silent> <Leader>wa :wa!<CR>
nnoremap <silent> <Leader>wp :set wrap!<CR>
nnoremap <silent> <Leader>yal :call CopyLine()<CR>
nnoremap <silent> <Leader>yap :call CopyParagraph()<CR>
nnoremap <silent> <Leader>yae :call CopyEntire()<CR>
nnoremap <silent> <Leader>p o<C-r>+<ESC>
nnoremap <silent> <Leader>q :bd<CR>
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <silent> <C-u> 5<C-y>
nnoremap <silent> <C-d> 5<C-e>

" invisible character
nnoremap <silent> <Leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬ "ctrl-v u25b8=▸; ctrl-v u00ac=¬; ctrl-v u2423=␣
hi specialKey	cterm=NONE	ctermbg=NONE	ctermfg=239
hi nontext		cterm=NONE	ctermbg=NONE	ctermfg=239

let g:scratch_insert_autohide = 0

" For Command-T 
let g:CommandTCancelMap=['<ESC>','<C-c>', '<C-x>']
let g:CommandTMaxHeight=20
let g:CommandTSelectNextMap='<C-n>'
let g:CommandTSelectPrevMap='<C-p>'
set wildignore+=.git,*.class,*.o,.svn

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

function! CopyParagraph() 		
	normal! "+yap
endfunction

function! CopyEntire() 		
	let pos = getpos('.')
	normal! gg"+yG
	call setpos('.', pos)
endfunction

highlight SignColumn ctermbg=none
"
"YouCompleteMe"
let g:ycm_key_list_select_completion=['<C-n>']
let g:ycm_key_list_previous_completion=['<C-p>']
