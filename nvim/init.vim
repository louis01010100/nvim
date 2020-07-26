function Init()
    call General()
    call ConfigNERDTree()
    call Theme()
    call ConfigVimPlug()
    call ConfigFzf()
    call ConfigCoc()
    " call ConfigVista()
    call ConfigTagbar()
    call ConfigLightLine()
    " call ConfigAle()
    " call ConfigAutoFormat()
endfunction


""
"" config config
""
function General()
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set number " shows the line number
    set relativenumber
    set textwidth=78 " line to limit to 80 chars
    set hidden
    set autoindent
    " set cursorline
    set scrolloff=3 
    " SPLITS
    set splitbelow " open a new vertical split below
    set splitright " open a new horizontal split on the right

    " set pyx=3
    " let g:loaded_python_provider = 1   " enable python 2 support
    " let g:loaded_python3_provider = 1  " enable python 3 support
    let g:python_host_prog = '/home/louis/.pyenv/versions/2.7.17/bin/python2.7'
    let g:python3_host_prog = '/home/louis/.pyenv/versions/3.8.2/bin/python3.8'
    let g:node_host_prog = '/home/louis/.nodenv/versions/14.5.0/bin/neovim-node-host'
    let g:ruby_host_prg = '/home/louis/.rbenv/versions/2.7.1/bin/neovim-ruby-host'

    " let g:node_host_prog = '/home/louis/.nodenv/versions/14.5.0/bin/node'


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
    noremap gwp :set wrap! <CR>
    "noremap grn :set rnu!<CR>

    vnoremap <C-c> "+y
    noremap <C-v> "+p
    nnoremap * :set hlsearch<CR>*N

    " Disable the default increment/decrement function
    nmap <C-a> <NOP>
    nmap <C-x> <NOP>
endfunction


""
"" vim plug
""
function ConfigVimPlug()
    let g:plug_window = 'botright new'

    call plug#begin('~/.config/nvim/plugged')
        Plug 'wellle/targets.vim'	 " text object
        " Plug 'junegunn/vim-peekaboo' "register management
        " Plug 'roman/golden-ratio' " Auto-expands current split
        Plug 'preservim/nerdtree'
        " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        " Plug 'Xuyuanp/nerdtree-git-plugin' 
        " Plug 'ryanoasis/vim-devicons'

        " The extra settings make sure that when you update the plugin it will also update the executable itself as well.
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'tweekmonster/fzf-filemru'
        Plug 'jiangmiao/auto-pairs'
        Plug 'tomtom/tcomment_vim'
        " Plug 'machakann/vim-sandwich'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " Plug 'liuchengxu/vista.vim'
        Plug 'majutsushi/tagbar'
        Plug 'itchyny/lightline.vim'
        " Plug 'w0rp/ale'

        Plug 'tpope/vim-fugitive'
        " Plug 'ryanoasis/vim-devicons'
        "
        " Plug 'psliwka/vim-smoothie'
        Plug 'tpope/vim-surround' 
        " Plug 'sbdchd/neoformat'
        " Plug 'fisadev/vim-isort'
    call plug#end()
endfunction

""
"" theme
""
function Theme()
    set termguicolors
    colorscheme louis01010100

endfunction

function ConfigLightLine()
    set noshowmode
    " let g:lightline = {'colorscheme': 'nord'}
    " let g:lightline = {'colorscheme': 'jellybeans'}
    "

    let g:lightline = {
      \     'colorscheme': 'jellybeans',
      \     'active': {
      \         'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified'] ],
      \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']],
      \      },
      \     'inactive': {
      \         'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified'] ],
      \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']],
      \      },
      \     'component_function': {
      \         'mode': 'LightlineMode',
      \         'readonly': 'LightlineReadonly',
	  \         'filename': 'LightlineFilename',
      \         'modified': 'LightlineModified',
	  \         'fileformat': 'LightlineFileformat',
	  \         'fileencoding': 'LightlineFileencoding',
      \      },
      \ }

    function! LightlineMode()
      let fname = expand('%:t')
      return fname =~# '^__vista__' ? 'Vista' :
            \ fname =~# 'NERD_tree' ? 'NERDTree' :
            \ winwidth(0) > 78 ? lightline#mode() : ''
    endfunction

    function! LightlineReadonly()
      return winwidth(0) > 78 ? (&ft !~? 'help' && &readonly ? 'RO' : ''): ''
    endfunction

    function! LightlineFilename()
      let fname = expand('%:t')
      return fname =~# '^__vista__\|NERD_tree' ? '' : (fname !=# '' ? fname : '[No Name]')
    endfunction

    function! LightlineModified()
      return winwidth(0) > 78 ? (&ft ==# 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'): ''
    endfunction

    function! LightlineFileformat()
      return winwidth(0) > 78 ? &fileformat : ''
    endfunction

    function! LightlineFileencoding()
      return winwidth(0) > 78 ? (&fenc !=# '' ? &fenc : &enc) : ''
    endfunction



endfunction


" function! LightlineReadonly()
"     return &readonly && &filetype !=# 'help' ? 'RO' : ''
" endfunction

function ConfigTagbar()
    let g:tagbar_left = 0
    "let g:tagbar_width = 40
    let g:tagbar_autoclose = 0
    let g:tagbar_sort = 0
    let g:tagbar_foldlevel = 0
    nnoremap <silent> <F3> :TagbarToggle<CR>
endfunction

" function ConfigVista()
"
"     let g:vista_default_executive = 'ctags'
"     let g:vista#renderer#enable_icon = 1
"     let g:vista_disable_statusline = 1
"     let g:vista_highlight_whole_line = 0
"     let g:vista_blink = [0, 0]
"     " let g:vista_icon_indent = ["▸ ", ""] 
"     " let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"     let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"     let g:vista_update_on_text_changed = 1
"     let g:vista_ignore_kinds = ['variables', 'maps', 'commands', 'Variable', 'Unknown']
"
"     " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
"     let g:vista#renderer#enable_icon = 1
"     let g:vista#renderer#icons = {
"         \   "function": "\uf794",
"         \   "variable": "\uf71b",
"         \  }
"
"     let g:vista_executive_for = {
"           \ 'python': 'coc',
"           \ }
"
"     nnoremap <F3> :Vista!!<CR>
"
" endfunction

function ConfigCoc()

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

    set signcolumn=yes

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
    " autocmd CursorHold * silent call CocActionAsync('highlight')

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
"" NERDTree
""
function ConfigNERDTree()
    let g:NERDTreeStatusline = -1
    let g:NERDTreeShowHidden = 1 " Always show dot (hidden) files
    let g:NERDTreeMinimalUI = 1
    noremap <F2> :NERDTreeToggle<CR> 

    " NERDTree Git Plugin
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }
endfunction


function ConfigFzf()
    set runtimepath+=~/.fzf
    noremap <Leader>zf :Files<CR>
    noremap <Leader>zb :Buffers<CR>
    noremap <Leader>zm :FilesMru --tiebreak=end<CR>
    " Open files on enter in a new tab
endfunction

function ConfigAle()
    let g:ale_lint_on_text_changed = 'never'
    " Write this in your vimrc file
    let g:ale_lint_on_insert_leave = 1
    " You can disable this option too
    " if you don't want linters to run on opening a file
    let g:ale_lint_on_enter = 1
    let g:ale_lint_delay=0
    
	let g:ale_disable_lsp = 1                  " use coc for this instead
    let g:ale_linters = { 'python': ['pylint']}
    let g:ale_fixers = { 'python': ['yapf', 'isort'] }

    noremap <F5> :ALEFix<CR>

	nnoremap ]r :ALENextWrap<CR> " move to the next ALE warning / error
	nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error
endfunction

" function ConfigAutoFormat()
"     nnoremap <F5> :Neoformat<CR>:Isort<CR>
"     let g:vim_isort_config_overrides = {'force_single_line': 1}
"     let g:neoformat_enabled_python = ['yapf']
" endfunction



call Init()
