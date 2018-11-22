"
" general
"
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set fillchars=stl:\ ,stlnc:\ ,vert:\  "get rid of | in the vertical split
set relativenumber
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
set hls
set cursorline
set backspace=indent,eol,start
set autowriteall
set splitbelow
set splitright
set mouse-=a
filetype plugin indent on      " activate filetype after initializing vundle
     
" invisible character
set listchars=tab:▸\ ,eol:¬ "ctrl-v u25b8=▸; ctrl-v u00ac=¬; ctrl-v u2423=␣
 
"
" hotkeys
"
nnoremap <silent> gpt :set paste!<CR>
nnoremap <silent> grn :set relativenumber!<CR>
nnoremap <silent> gnb :set number!<CR>
nnoremap <silent> gwp :set wrap!<CR>
nnoremap <silent> gls :set list!<CR>
nnoremap <silent> ghl :nohlsearch<CR>
  
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
  
nnoremap * :set hlsearch<CR>*N
nnoremap # :set hlsearch<CR>#N
  
  
nnoremap <silent> gwa :wa!<CR>
nnoremap <silent> gqa :qa!<CR>
nnoremap <silent> gxa :xa!<CR>
nnoremap <silent> <leader>w :wa!<CR>
nnoremap <silent> <leader>q :qa!<CR>
nnoremap <silent> <leader>x :xa!<CR>
nnoremap <silent> gsr :source ~/.config/nvim/init.vim<CR>
  
  
" Disable the default increment/decrement function
nmap <C-a> <Nop>
nmap <C-x> <Nop> 
