nnoremap <Leader>p :set paste!<CR>
" nnoremap goh :set hlsearch!<CR>
" nnoremap gor :set relativenumber!<CR>
" nnoremap gon :set number!<CR>
nnoremap gr :set wrap!<CR>
nnoremap gl :set list!<CR>
nnoremap gh :nohlsearch<CR>

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

nnoremap <C-h> <c-w>h
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
nnoremap <C-c> <c-w>c

nnoremap gw :wa!<CR>
nnoremap gq :qa!<CR>
nnoremap <silent> g. :source ~/.config/nvim/init.vim<CR>
" nnoremap <silent> gdf :TernDef<CR>
" nnoremap <silent> grf :TernRef<CR>
" nnoremap <silent> grl :.w !bash<CR>
" nnoremap <silent> gre :%w !bash<CR>
" nnoremap <silent> <Leader>w :wa!<CR>
" nnoremap <silent> <Leader>q :qa!<CR>
" nnoremap <silent> <Leader>x :xa!<CR>
" nnoremap gwb :w!<CR>
" nnoremap gqb :q!<CR>
" nnoremap gxb :x!<CR>
" nnoremap gwa :wa!<CR>
" nnoremap gqa :qa!<CR>
" nnoremap gxa :xa!<CR>
" nnoremap <silent> gpp o<C-r>+<ESC>
" nnoremap gef :e <C-R>=expand('%:p:h') . '/'<CR>

" nnoremap <silent> ghl
"       \ :if exists('w:long_line_match') <Bar>
"       \   silent! call matchdelete(w:long_line_match) <Bar>
"       \   unlet w:long_line_match <Bar>
"       \ elseif &textwidth > 0 <Bar>
"       \   let w:long_line_match = matchadd('WarningMsg', '\%>'.&tw.'v.\+', -1) <Bar>
"       \ else <Bar>
"       \   let w:long_line_match = matchadd('WarningMsg', '\%>78v.\+', -1) <Bar>
"       \ endif<CR>


" expand <xml> tags
inoremap <expr> <CR> Expander()
function! Expander()
.   let line   = getline(".")
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
