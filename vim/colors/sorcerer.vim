" 'sorcerer.vim' -- Vim color scheme.
" Maintainer:   Jeet Sukumaran
" Based on 'Mustang' by Henrique C. Alves (hcarvalhoalves@gmail.com),

"set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "sorcerer"

" 256 Colors {{{1
" ============================================================================
hi Normal                 cterm=NONE             ctermbg=NONE   ctermfg=248
hi ColorColumn            cterm=NONE             ctermbg=16     ctermfg=fg
hi Cursor                 cterm=NONE             ctermbg=241   ctermfg=fg
hi CursorColumn           cterm=NONE             ctermbg=16   
hi CursorLine             cterm=NONE             ctermbg=236   ctermfg=NONE
hi DiffAdd                cterm=NONE             ctermbg=71    ctermfg=16
hi DiffDelete             cterm=NONE             ctermbg=124    ctermfg=16
hi DiffChange             cterm=NONE             ctermbg=68    ctermfg=16
hi DiffText               cterm=NONE             ctermbg=117   ctermfg=16
hi Directory              cterm=NONE             ctermfg=110
hi ErrorMsg               cterm=NONE             ctermbg=NONE    ctermfg=202
hi FoldColumn             cterm=NONE             ctermbg=239   ctermfg=66
hi Folded                 cterm=NONE             ctermbg=16    ctermfg=60
hi IncSearch              cterm=NONE             ctermbg=185   ctermfg=236
hi LineNr                 cterm=NONE             ctermbg=NONE    ctermfg=239
hi CursorLineNr                 cterm=NONE             ctermbg=NONE    ctermfg=246
hi MatchParen             cterm=NONE             ctermbg=16    ctermfg=226
hi ModeMsg                cterm=NONE             ctermbg=236   ctermfg=145
hi MoreMsg                cterm=NONE             ctermbg=234   ctermfg=29
hi NonText                cterm=NONE             ctermbg=NONE   ctermfg=59
hi Pmenu                  cterm=NONE             ctermbg=236   ctermfg=145
hi PmenuSel               cterm=NONE             ctermbg=238   ctermfg=230
hi PmenuSbar              cterm=NONE             ctermbg=238   ctermfg=65
hi PmenuThumb             cterm=reverse          ctermbg=NONE    ctermfg=130
hi Question               cterm=NONE             ctermbg=NONE    ctermfg=46
hi Search                 cterm=NONE             ctermbg=185   ctermfg=236
hi SignColumn             cterm=NONE             ctermbg=187   ctermfg=231
hi SpecialKey             cterm=NONE             ctermbg=NONE    ctermfg=59
hi SpellBad               cterm=NONE             ctermbg=NONE    ctermfg=196
hi SpellCap               cterm=NONE             ctermbg=NONE    ctermfg=21
hi SpellLocal             cterm=undercurl        ctermbg=NONE    ctermfg=30
hi SpellRare              cterm=undercurl        ctermbg=NONE    ctermfg=201
hi StatusLine             cterm=NONE            ctermbg=239 ctermfg=248
hi StatusLineNC           cterm=NONE             ctermbg=236   ctermfg=242
hi VertSplit              cterm=NONE             ctermbg=238   ctermfg=238
hi TabLine                cterm=NONE             ctermbg=102   ctermfg=16
hi TabLineFill            cterm=NONE             ctermbg=102   ctermfg=16
hi TabLineSel             cterm=NONE             ctermbg=16    ctermfg=59
hi Title                  cterm=NONE             ctermbg=NONE    ctermfg=66
hi Visual                 cterm=NONE             ctermbg=237   
hi WarningMsg             cterm=NONE             ctermbg=234   ctermfg=208
hi WildMenu               cterm=NONE             ctermbg=116   ctermfg=16
hi Comment                cterm=NONE             ctermbg=NONE    ctermfg=65
hi Boolean                cterm=NONE             ctermbg=NONE    ctermfg=208
hi String                 cterm=NONE             ctermbg=NONE    ctermfg=101
hi Identifier             cterm=NONE             ctermbg=NONE    ctermfg=145
hi Function               cterm=NONE             ctermbg=NONE    ctermfg=230
hi Type                   cterm=NONE             ctermbg=NONE    ctermfg=103
hi Statement              cterm=NONE             ctermbg=NONE    ctermfg=110
hi Keyword                cterm=NONE             ctermbg=NONE    ctermfg=110
hi Constant               cterm=NONE             ctermbg=NONE    ctermfg=208
hi Number                 cterm=NONE             ctermbg=NONE    ctermfg=172
hi Special                cterm=NONE             ctermbg=NONE    ctermfg=64
hi PreProc                cterm=NONE             ctermbg=NONE    ctermfg=66
hi Todo                   cterm=NONE             ctermbg=234   ctermfg=96

hi diffOldFile            cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffNewFile            cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffFile               cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffLine               cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffAdded              cterm=NONE             ctermfg=NONE    ctermfg=71
hi diffRemoved            cterm=NONE             ctermfg=NONE    ctermfg=124
hi diffChanged            cterm=NONE             ctermfg=NONE    ctermfg=68
hi link             diffSubname     diffLine
hi link             diffOnly        Constant
hi link             diffIdentical   Constant
hi link             diffDiffer      Constant
hi link             diffBDiffer     Constant
hi link             diffIsA         Constant
hi link             diffNoEOL       Constant
hi link             diffCommon      Constant
hi link             diffComment     Constant

hi Conceal                cterm=BOLD             ctermbg=248   ctermfg=252
hi Error                  cterm=NONE             ctermbg=196   ctermfg=231
hi Ignore                 cterm=NONE             ctermbg=NONE    ctermfg=234
"hi InsertModeCursorLine   cterm=NONE             ctermbg=150    ctermfg=fg
"hi NormalModeCursorLine   cterm=NONE             ctermbg=235   ctermfg=fg
hi StatusLineAlert        cterm=NONE             ctermbg=160   ctermfg=231
hi StatusLineUnalert      cterm=NONE             ctermbg=238   ctermfg=144
hi Test                   cterm=NONE             ctermbg=NONE    ctermfg=fg
hi Underlined             cterm=NONE        ctermbg=NONE    ctermfg=250
hi VisualNOS              cterm=NONE             ctermbg=NONE    ctermfg=fg
hi cCursor                cterm=reverse          ctermbg=NONE    ctermfg=fg
hi iCursor                cterm=NONE             ctermbg=210   ctermfg=16
hi lCursor                cterm=NONE             ctermbg=145   ctermfg=234
hi nCursor                cterm=NONE             ctermbg=46    ctermfg=16
hi vCursor                cterm=NONE             ctermbg=201   ctermfg=16
" 1}}}
