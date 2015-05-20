set nocompatible               " be iMproved
set encoding=UTF-8
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
set history=10000

runtime! macros/matchit.vim

"set cindent
set autoread		
set autowriteall
set wildmode=list:longest   "In Ex mode, press <tab> to list all the files in the current working directory
set t_Co=256
set nohls
set cursorline
set backspace=indent,eol,start 
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
set scrolloff=1
set sidescrolloff=5
 
filetype plugin indent on      " activate filetype after initializing vundle 
syntax on
    
colorscheme hybrid
 

execute pathogen#infect()  
execute pathogen#helptags()  

set timeoutlen=1000 ttimeoutlen=0
 
map <Space> \

" customized unimpaired mapping
nnoremap [op :set paste<CR>
nnoremap ]op :set nopaste<CR>

nnoremap <silent> [oq :copen<CR>
nnoremap <silent> ]oq :cclose<CR>
nnoremap <silent> [ol :lopen<CR>
nnoremap <silent> ]ol :lclose<CR>

nnoremap <silent> [A :first<CR>
nnoremap <silent> ]A :last<CR>
nnoremap <silent> [a :previous<CR>
nnoremap <silent> ]a :next<CR>

nnoremap <silent> [B :first<CR>
nnoremap <silent> ]B :last<CR>
nnoremap <silent> [b :previous<CR>
nnoremap <silent> ]b :next<CR>

nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>

nnoremap <silent> [T :tfirst<CR>
nnoremap <silent> ]T :tlast<CR>
nnoremap <silent> [t :tprevious<CR>
nnoremap <silent> ]t :tnext<CR>


nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>


nnoremap [c :call Conflict(1)<CR>
nnoremap ]c :call Conflict(0)<CR>

function! Conflict(reverse)
  call search('^@@ .* @@\|^[<=>|]\{7}[<=>|]\@!', a:reverse ? 'bW' : 'W')
endfunction

nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
nnoremap <C-c> <c-w>c

nnoremap <F1> :DelimitMateSwitch<CR> 
nnoremap <silent> <F2> :TagbarToggle<CR> 

nnoremap <silent> <Leader>so :source ~/.vimrc<CR>
nnoremap <silent> <Leader>jsd :TernDef<CR>
nnoremap <silent> <Leader>jsr :TernRef<CR>
nnoremap <silent> <Leader>ral :.w !bash<CR>
nnoremap <silent> <Leader>rae :%w !bash<CR>
nnoremap <silent> <Leader>wa :wa!<CR>
nnoremap <silent> <Leader>wqa :wqa!<CR>
nnoremap <silent> <Leader>yal :call CopyLine()<CR>
nnoremap <silent> <Leader>yap :call CopyParagraph()<CR>
nnoremap <silent> <Leader>yae :call CopyEntire()<CR>
nnoremap <silent> <Leader>p o<C-r>+<ESC>
nnoremap <silent> <Leader>q :bd<CR>
nnoremap <silent> <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <silent> <C-u> 5<C-y>
nnoremap <silent> <C-d> 5<C-e>
nnoremap <Leader>f :Ack<SPACE>

" invisible character

set listchars=tab:▸\ ,eol:¬ "ctrl-v u25b8=▸; ctrl-v u00ac=¬; ctrl-v u2423=␣
hi specialKey	cterm=NONE	ctermbg=NONE	ctermfg=239
hi nontext		cterm=NONE	ctermbg=NONE	ctermfg=239

"let g:scratch_insert_autohide = 0

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

"YouCompleteMe"
let g:ycm_key_list_select_completion=['<C-n>']
let g:ycm_key_list_previous_completion=['<C-p>']

autocmd WinLeave * setlocal nocursorline
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
