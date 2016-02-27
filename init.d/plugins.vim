let g:plug_window = 'botright new'
 
call plug#begin('~/.config/nvim/plugged')
 
Plug 'https://github.com/rking/ag.vim'
Plug 'https://github.com/milkypostman/vim-togglelist.git'
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/kana/vim-textobj-line.git'
Plug 'https://github.com/kana/vim-textobj-entire.git'
Plug 'https://github.com/thinca/vim-textobj-function-javascript.git'
Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
 
call plug#end()

"
" Matchit
"
runtime! macros/matchit.vim

"
" Tagbar
"
nnoremap <silent> gtb  :TagbarToggle<CR> 
let g:tagbar_left = 1

"
" AutoPairs 
"
nnoremap <silent> gap  :call AutoPairsToggle()<CR> 

"
" Ag
"
let g:ag_mapping_message=0
nnoremap gag :Ag 
nnoremap <Leader>s :Ag 

"
" Autoformat
"
"au BufWrite * :Autoformat
nnoremap <silent> gaf :Autoformat<CR>

"
" FZF
"
set rtp+=~/.fzf
nnoremap <silent> gff :Files<CR>
nnoremap <silent> gfb :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

"
" vim-bookmark
"
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1

"
" YouCompleteMe 
"
let g:ycm_key_list_select_completion=['<C-n>']
let g:ycm_key_list_previous_completion=['<C-p>']

"
" vim-togglelist 
"
nnoremap <script> <silent> gof :call ToggleLocationList()<CR>
nnoremap <script> <silent> goq :call ToggleQuickfixList()<CR>
let g:toggle_list_no_mappings = 1

"
" Text-object 
"
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
	normal! ^"+y$
	call setpos('.', pos)
	echo "1 line yanked"
endfunction

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

" " Colorizer
" nnoremap <silent> [oc :ColorHighlight<CR>
" nnoremap <silent> ]oc :ColorClear<CR>
"

