function Init()
    call _General()
    call _VimPlug()
    call _NERDTree()
    call _KeyMapping()
    call _Theme()
    call _Fzf()
    call _Coc()
    call _Vista()
    call _Lightline()
endfunction



""
"" vim plug
""
function _VimPlug()
    let g:plug_window = 'botright new'
     
    call plug#begin('~/.config/nvim/plugged')
        "Plug 'rafi/awesome-vim-colorschemes'
        Plug 'arcticicestudio/nord-vim'
        Plug 'wellle/targets.vim'	 " text object
        Plug 'junegunn/vim-peekaboo' "register management
        " Plug 'roman/golden-ratio' " Auto-expands current split
        Plug 'scrooloose/nerdtree'


        " The extra settings make sure that when you update the plugin it will also update the executable itself as well.
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'tweekmonster/fzf-filemru'
        Plug 'jiangmiao/auto-pairs'
        Plug 'tomtom/tcomment_vim'
        Plug 'machakann/vim-sandwich'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'liuchengxu/vista.vim'

        Plug 'itchyny/lightline.vim'

        " Plug 'terryma/vim-multiple-cursors'
    call plug#end()
endfunction

""
"" theme
""
function _Theme()
    colorscheme nord
    " let s:nord3_gui_bright = "#7b88a1"
endfunction

function _Lightline()
    set noshowmode
    let g:lightline = {'colorscheme': 'jellybeans'}

    let s:base03 = [ '#151513', 233 ]
    let s:base02 = [ '#30302c ', 236 ]
    let s:base01 = [ '#4e4e43', 239 ]
    let s:base00 = [ '#666656', 242  ]
    let s:base0 = [ '#808070', 244 ]
    let s:base1 = [ '#949484', 246 ]
    let s:base2 = [ '#a8a897', 248 ]
    let s:base3 = [ '#bdbdbd', 253 ]
    let s:yellow = [ '#ffb964', 215 ]
    let s:orange = [ '#B3865A', 222 ]
    let s:red = [ '#cf6a4c', 167 ]
    let s:magenta = [ '#f0a0c0', 217 ]
    let s:blue = [ '#8197bf', 103 ]
    "let s:blue = [ '#37394A', 103 ]
    let s:cyan = [ '#8fbfdc', 110 ]
    let s:green = [ '#6C9A85', 107 ]

    let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
    let s:p.normal.left = [ [ s:base03, s:blue ], [ s:base3, s:base01 ] ]
    let s:p.normal.right = [ [ s:base02, s:base1 ], [ s:base2, s:base01 ] ]
    let s:p.inactive.right = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
    let s:p.inactive.left =  [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
    let s:p.insert.left = [ [ s:base03, s:green ], [ s:base3, s:base01 ] ]
    let s:p.replace.left = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
    let s:p.visual.left = [ [ s:base03, s:orange ], [ s:base3, s:base01 ] ]
    let s:p.normal.middle = [ [ s:base0, s:base02 ] ]
    let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]
    let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
    let s:p.tabline.tabsel = [ [ s:base3, s:base02 ] ]
    let s:p.tabline.middle = [ [ s:base01, s:base1 ] ]
    let s:p.tabline.right = copy(s:p.normal.right)
    let s:p.normal.error = [ [ s:red, s:base02 ] ]
    let s:p.normal.warning = [ [ s:yellow, s:base01 ] ]

    let g:lightline#colorscheme#jellybeans#palette = lightline#colorscheme#flatten(s:p)
endfunction

function _Vista()
    let g:vista_default_executive = 'ctags'
    let g:vista#renderer#enable_icon = 1
    let g:vista_blink = [0, 0]
    " let g:vista_icon_indent = ["▸ ", ""] 
    " let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
    let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

    " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
    let g:vista#renderer#enable_icon = 1
    let g:vista#renderer#icons = {
        \   "function": "\uf794",
        \   "variable": "\uf71b",
        \  }

    let g:vista_executive_for = {
          \ 'python': 'coc',
          \ }

    nnoremap <F3> :Vista!!<CR>

endfunction

function _Coc()

    inoremap <silent><expr> <C-n>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()

    inoremap <silent><expr> <C-p>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()

    " Add `:Format` command to format current buffer.
    " nnoremap :call CocAction('format')

    """
    """ Default
    """
        " TextEdit might fail if hidden is not set.
    "set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    " set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    " set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    " inoremap <silent><expr> <TAB>
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()


    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    

    " Use K to show documentation in preview window.
    " nnoremap <silent> K :call <SID>show_documentation()<CR>

    " function! s:show_documentation()
    "   if (index(['vim','help'], &filetype) >= 0)
    "     execute 'h '.expand('<cword>')
    "   else
    "     call CocAction('doHover')
    "   endif
    " endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    " augroup mygroup
    "   autocmd!
    "   " Setup formatexpr specified filetype(s).
    "   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    "   " Update signature help on jump placeholder.
    "   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
        
endfunction


""
"" config config
""
function _General()
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set number " shows the line number
    set relativenumber
    set textwidth=80 " line to limit to 80 chars
    set hidden
    set autoindent

    " SPLITS
    set splitbelow " open a new vertical split below
    set splitright " open a new horizontal split on the right

    let g:loaded_python_provider = 0   " disable python 2 support
    let g:loaded_python3_provider = 1  " enable python 2 support
    let g:python3_host_prog = '/home/louis/.pyenv/versions/3.8.2/bin/python3.8'


    "Key Mapping
    noremap <UP> <NOP>
    noremap <DOWN> <NOP>
    noremap <LEFT> <NOP>
    noremap <RIGHT> <NOP>
    " not that noremap only affect normal/visual/select/operator-pending mode, not
    " command-line or insert mode
    inoremap <UP> <NOP>
    inoremap <DOWN> <NOP>
    inoremap <LEFT> <NOP>
    inoremap <RIGHT> <NOP>

    noremap gso :so $MYVIMRC<CR>
    noremap gnu :set nu! rnu! <CR>
    noremap ghl :nohls <CR>
    noremap gqa :qa! <CR>
    noremap gqq :q! <CR>
    noremap gwa :wa! <CR>
    noremap gww :w! <CR>
    noremap gxa :xa! <CR>
    noremap gxx :x! <CR>
    "noremap grn :set rnu!<CR>
endfunction

""
"" NERDTree
""
function _NERDTree()
    let NERDTreeShowHidden=1 " Always show dot (hidden) files
    noremap <F2> :NERDTreeToggle<CR> 
endfunction


function _KeyMapping()
    "Key Mapping
    noremap <UP> <NOP>
    noremap <DOWN> <NOP>
    noremap <LEFT> <NOP>
    noremap <RIGHT> <NOP>
    " not that noremap only affect normal/visual/select/operator-pending mode, not
    " command-line or insert mode
    inoremap <UP> <NOP>
    inoremap <DOWN> <NOP>
    inoremap <LEFT> <NOP>
    inoremap <RIGHT> <NOP>
endfunction

function _Fzf()
    set runtimepath+=~/.fzf
    noremap <Leader>zf :Files<CR>
    noremap <Leader>zb :Buffers<CR>
    noremap <Leader>zm :FilesMru --tiebreak=end<CR>
    " Open files on enter in a new tab
endfunction


call Init()
