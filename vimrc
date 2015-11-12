set nocompatible               " be iMproved
set encoding=UTF-8
set showcmd     	" Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set fillchars+=vert:\ "get rid of | in the vertical split 

set number
"set textwidth=78
set tabstop=4 
set shiftwidth=4 
set hidden
set history=10000
set display=uhex
set expandtab
set ffs=unix
set noswapfile

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
"set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}]

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


"ket timeoutlen=1000 ttimeoutlen=0

"let mapleader = "\<Space>"

"nnoremap <silent>]os :set scrolloff=999<CR>
"nnoremap <silent>[os :set scrolloff=0<CR>

" customized unimpaired mapping

nnoremap gop :set paste!<CR>
nnoremap goh :set hlsearch!<CR>
nnoremap gor :set relativenumber!<CR>
nnoremap gow :set wrap!<CR>
nnoremap gol :set list!<CR>
nnoremap <script> <silent> gof :call ToggleLocationList()<CR>
nnoremap <script> <silent> goq :call ToggleQuickfixList()<CR>


" " Colorizer
" nnoremap <silent> [oc :ColorHighlight<CR>
" nnoremap <silent> ]oc :ColorClear<CR>

nnoremap <silent> [A :first<CR>
nnoremap <silent> ]A :last<CR>
nnoremap <silent> [a :previous<CR>
nnoremap <silent> ]a :next<CR>

nnoremap <silent> [B :first<CR>
nnoremap <silent> ]B :last<CR>
nnoremap <silent> [b :previous<CR>
nnoremap <silent> ]b :next<CR>

nnoremap <silent> [F :lfirst<CR>
nnoremap <silent> ]F :llast<CR>
nnoremap <silent> [f :lprevious<CR>
nnoremap <silent> ]f :lnext<CR>

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

function! Conflict(reverse)
  call search('^@@ .* @@\|^[<]\{7\}[<]\@!', a:reverse ? 'bW' : 'W')
endfunction

function! HighlightCword(reverse)
    set hlsearch | let @/='\<'.expand("<cword>").'\>'
endfunction

nnoremap <silent> ghw :call HighlightCword(1)<CR>

nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
 nnoremap <C-c> <c-w>c

nnoremap <silent> gtb  :TagbarToggle<CR> 
nnoremap <silent> gap  :call AutoPairsToggle()<CR> 

nnoremap <silent> gso :source ~/.vimrc<CR>
nnoremap <silent> <Leader>df :TernDef<CR>
nnoremap <silent> <Leader>rf :TernRef<CR>
nnoremap <silent> grl :.w !bash<CR>
nnoremap <silent> gre :%w !bash<CR>
nnoremap gwb :w!<CR>
nnoremap gqb :q!<CR>
nnoremap gxb :x!<CR>
nnoremap gwa :wa!<CR>
nnoremap gqa :qa!<CR>
nnoremap gxa :xa!<CR>
nnoremap <silent> gpp o<C-r>+<ESC>
nnoremap gef :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <silent> <C-u> 5<C-y>
nnoremap <silent> <C-d> 5<C-e>

" invisible character
set listchars=tab:▸\ ,eol:¬ "ctrl-v u25b8=▸; ctrl-v u00ac=¬; ctrl-v u2423=␣
hi specialKey	cterm=NONE	ctermbg=NONE	ctermfg=239
hi nontext		cterm=NONE	ctermbg=NONE	ctermfg=239

" ag.vim
let g:ag_mapping_message=0
nnoremap gag :Ag 

" vim-autoformat
nnoremap <silent> gaf :Autoformat<CR>

" For Command-T 
let g:CommandTCancelMap=['<ESC>','<C-c>', '<C-x>']
let g:CommandTMaxHeight=20
let g:CommandTSelectNextMap='<C-n>'
let g:CommandTSelectPrevMap='<C-p>'
let g:CommandTFileScanner='find'
set wildignore+=.git,*.class,*.o,.svn,*.jar,.vim-bookmarks
nnoremap <silent> gcm :CommandTMRU<cr>
nnoremap <silent> gct :CommandT<CR>
nnoremap <silent> gcb :CommandTBuffer<CR>

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

nnoremap <silent> gyl :call CopyLine()<CR>
nnoremap <silent> gyp :call CopyParagraph()<CR>
nnoremap <silent> gye :call CopyEntire()<CR>
nnoremap <silent> gy" :call CopyDoubleQuotes()<CR>
nnoremap <silent> gy' :call CopySingleQuotes()<CR>
nnoremap <silent> gy( :call CopyParentheses()<CR>
nnoremap <silent> gy[ :call CopyBrackets()<CR>
nnoremap <silent> gy{ :call CopyBraces()<CR>

function! CopyLine() 		
	let pos = getpos('.')
	normal! "+y$
	call setpos('.', pos)
	echo "1 line yanked"
endfunction

" function! Source() 
"     let pos = getpos('.')
"     :source ~/.vimrc
"     call setpos('.', pos)
"     echo "~/.vimrc sourced"
" endfunction

function! CopyParagraph() 		
	normal! "+yip
endfunction

function! CopyDoubleQuotes() 		
	normal! "+yi"
    echo "Words in the double quotes yanked"
endfunction

function! CopySingleQuotes() 		
	normal! "+yi'
    echo "Words in the single quotes yanked"
endfunction

function! CopyParentheses() 		
	normal! "+yi(
    echo "Words in the parentheses yanked"
endfunction

function! CopyBrackets() 		
	normal! "+yi[
    echo "Words in the brackets yanked"
endfunction

function! CopyBraces() 		
	normal! "+yi{
    echo "Words in the braces yanked"
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

"let longLine=matchadd('WarningMsg', '\%>'.&tw.'v.\+', -1)

" vim-bookmark
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1


autocmd FileType html setlocal sw=2 ts=2 tw=120
autocmd FileType xml setlocal sw=2 ts=2 tw=120
autocmd FileType javascript setlocal sw=4 ts=4  tw=78
autocmd FileType css setlocal sw=4 ts=4 tw=78

"syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
"setlocal foldmethod=syntax
"setlocal foldlevel=2

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"highlight link SyntasticError SpellBad
"highlight link SyntasticWarning SpellCap

" Highlight characters exceeding the text-width 
nnoremap <silent> ghl
      \ :if exists('w:long_line_match') <Bar>
      \   silent! call matchdelete(w:long_line_match) <Bar>
      \   unlet w:long_line_match <Bar>
      \ elseif &textwidth > 0 <Bar>
      \   let w:long_line_match = matchadd('WarningMsg', '\%>'.&tw.'v.\+', -1) <Bar>
      \ else <Bar>
      \   let w:long_line_match = matchadd('WarningMsg', '\%>78v.\+', -1) <Bar>
      \ endif<CR>


" expand <xml> tags

function! Expander()
    let line   = getline(".")
    let col    = col(".")
    let first  = line[col-2]
    let second = line[col-1]
    let third  = line[col]
    let betweenTag =  first == ">" && second == "<" && third == "/" 

    if betweenTag
        return "\<CR>\<C-o>O"
    else

      return "\<CR>"
    endif
endfunction

inoremap <expr> <CR> Expander()
