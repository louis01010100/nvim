autocmd WinLeave * setlocal nocursorline
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline

autocmd FileType html setlocal sw=2 ts=2 tw=120
autocmd FileType xml setlocal sw=2 ts=2 tw=120
autocmd FileType javascript setlocal sw=4 ts=4  tw=78
autocmd FileType css setlocal sw=4 ts=4 tw=78

autocmd FileType c setlocal sw=4 ts=4 tw=78 
autocmd FileType c set makeprg=clang\ -std=c11\ -Wall\ -g\ -O0\ -o\ %:p:r\ %
