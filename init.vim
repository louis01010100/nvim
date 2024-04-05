function Init()
    call General()
    call ConfigNERDTree()
    call ConfigVimPlug()
    call ConfigFzf()
    call ConfigTagbar()
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
    " set textwidth=78 " line to limit to 80 chars
    set hidden
    set autoindent
    set mouse=   " disable mouse
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
    noremap gpt :set paste! <CR>

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
        Plug 'tpope/vim-repeat'
        Plug 'preservim/nerdtree'
        Plug 'arcticicestudio/nord-vim'

        " The extra settings make sure that when you update the plugin it will also update the executable itself as well.
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'tweekmonster/fzf-filemru'
        Plug 'jiangmiao/auto-pairs'
        Plug 'tomtom/tcomment_vim'
        Plug 'majutsushi/tagbar'

        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround' 
        Plug 'louis01010100/nord-vim'

    call plug#end()
endfunction

""
"" theme
""
function Theme()
    set termguicolors
    colorscheme nord
endfunction

function ConfigTagbar()
    let g:tagbar_left = 0
    "let g:tagbar_width = 40
    let g:tagbar_autoclose = 0
    let g:tagbar_sort = 0
    let g:tagbar_foldlevel = 0
    nnoremap <silent> <F3> :TagbarToggle<CR>
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



call Init()
