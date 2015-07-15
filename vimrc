set nocompatible               " be iMproved
set encoding=UTF-8
set showcmd     	" Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set number
set tw=80
set tabstop=4 
set shiftwidth=4 
set hidden
set history=10000
set display=uhex
"set expandtab

runtime! macros/matchit.vim
"set cindent
set autoread		
set autowriteall

"In Ex mode, press <tab> to list all the files in the current working directory
set wildmode=list:longest   

set t_Co=256
set hlsearch
set cursorline
set backspace=indent,eol,start 
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
set scrolloff=5
set sidescrolloff=5
 
filetype plugin indent on      " activate filetype after initializing vundle 
syntax on
    
colorscheme sorcerer
 

execute pathogen#infect()  
execute pathogen#helptags()  

set timeoutlen=1000 ttimeoutlen=0

map <Space> \
nnoremap <silent>[os :set scrolloff=999<CR>
nnoremap <silent>]os :set scrolloff=0<CR>

" customized unimpaired mapping
nnoremap [op :set paste<CR>
nnoremap ]op :set nopaste<CR>
nnoremap <silent> [oq :copen<CR>
nnoremap <silent> ]oq :cclose<CR>
nnoremap <silent> [ol :lopen<CR>
nnoremap <silent> ]ol :lclose<CR>
nnoremap <silent> [oh :set hlsearch<CR>
nnoremap <silent> ]oh :set nohlsearch<CR>
nnoremap <silent> [oc :set cursorcolumn<CR>
nnoremap <silent> ]oc :set nocursorcolumn<CR>
nnoremap <silent> [or :set relativenumber<CR>
nnoremap <silent> ]or :set norelativenumber<CR>
nnoremap <silent> [ow :set wrap<CR>
nnoremap <silent> ]ow :set nowrap<CR>
nnoremap <silent> [ol :set list<CR>
nnoremap <silent> ]ol :set nolist<CR>

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

nnoremap <silent> [T :tabfirst<CR>
nnoremap <silent> ]T :tablast<CR>
nnoremap <silent> [t :tabp<CR>
nnoremap <silent> ]t :tabn<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap [c :call Conflict(1)<CR>
nnoremap ]c :call Conflict(0)<CR>

inoremap jk <Esc>

function! Conflict(reverse)
  "call search('^@@ .* @@\|^[<=>|]\{7}[<=>|]\@!', a:reverse ? 'bW' : 'W')
  call search('^@@ .* @@\|^[<]\{7\}[<]\@!', a:reverse ? 'bW' : 'W')
endfunction


nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
nnoremap <C-c> <c-w>c

nnoremap <silent> <F2> :TagbarToggle<CR> 
nnoremap <silent> <F4> :ColorToggle<CR> 

nnoremap <silent> <Leader>so :source ~/.vimrc<CR>
nnoremap <silent> <Leader>df :TernDef<CR>
nnoremap <silent> <Leader>rf :TernRef<CR>
nnoremap <silent> <Leader>ral :.w !bash<CR>
nnoremap <silent> <Leader>rae :%w !bash<CR>
nnoremap <Leader>wa :wa!<CR>
nnoremap <silent> <Leader>qa :qa!<CR>
"nnoremap <silent> <Leader>yal :call CopyLine()<CR>
"nnoremap <silent> <Leader>yap :call CopyParagraph()<CR>
"nnoremap <silent> <Leader>yae :call CopyEntire()<CR>
"nnoremap <silent> <Leader>p o<C-r>+<ESC>
noremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <silent> <C-u> 10<C-y>
nnoremap <silent> <C-d> 10<C-e>
nnoremap <silent> <leader>m :CommandTMRU<CR>
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
set wildignore+=.git,*.class,*.o,.svn,*.jar,.vim-bookmarks

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
autocmd FileType html setlocal tabstop=2 sw=2

let longLine=matchadd('WarningMsg', '\%>80v.\+', -1)

" vim-bookmark
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1

" auto-pairs
let g:AutoPairsShortcutBackInsert = '<C-b>'

autocmd FileType html setlocal sw=2 ts=2 foldlevel=3
autocmd FileType xml setlocal sw=2 ts=2 foldlevel=3
autocmd FileType javascript setlocal sw=4 ts=4 
"set foldmethod=indent
autocmd FileType css setlocal sw=4 ts=4

"syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"setlocal foldmethod=syntax
"setlocal foldlevel=2

" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  "let sub = sub . "                                                                                                                  "
  "let sub = sub . "                                                          "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction
