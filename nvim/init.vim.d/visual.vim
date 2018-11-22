vnoremap <silent> gyv :call CopyVisualSelection()<CR>
nnoremap <silent> gpv o<c-o>"+P<Esc>
  
function! CopyVisualSelection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  let @+ = join(lines, "\n")
endfunction
