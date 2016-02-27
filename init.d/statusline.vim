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
set statusline+=%#warningmsg#
set statusline+=%*
