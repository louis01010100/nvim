
" 'sorcerer.vim' -- Vim color scheme.
" Maintainer:   Jeet Sukumaran
" Based on 'Mustang' by Henrique C. Alves (hcarvalhoalves@gmail.com),

set background=dark

" hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "sorcerer"

" 256 Colors {{{1
" ============================================================================
hi Normal                 cterm=NONE             ctermbg=NONE   ctermfg=246
hi ColorColumn            cterm=NONE             ctermbg=234   ctermfg=fg
"hi Cursor                 cterm=NONE             ctermbg=88  ctermfg=88
hi CursorColumn           cterm=NONE             ctermbg=234  ctermfg=NONE
hi CursorLine             cterm=NONE             ctermbg=234   ctermfg=NONE
hi DiffAdd                cterm=NONE             ctermbg=71    ctermfg=16
hi DiffDelete             cterm=NONE             ctermbg=166    ctermfg=NONE
hi DiffChange             cterm=NONE             ctermbg=166    ctermfg=67
hi DiffText               cterm=NONE             ctermbg=117   ctermfg=16
hi Directory              cterm=NONE             ctermbg=234   ctermfg=67
hi ErrorMsg               cterm=NONE             ctermbg=88    ctermfg=230
hi FoldColumn             cterm=NONE             ctermbg=239   ctermfg=66
hi Folded                 cterm=NONE             ctermbg=16    ctermfg=60
hi IncSearch              cterm=NONE             ctermbg=237  ctermfg=185
hi LineNr                 cterm=NONE             ctermbg=NONE    ctermfg=238
hi CursorLineNr           cterm=NONE             ctermbg=NONE    ctermfg=238
hi MatchParen             cterm=NONE             ctermbg=237    ctermfg=226
hi ModeMsg                cterm=NONE             ctermbg=NONE  ctermfg=230
hi MoreMsg                cterm=NONE             ctermbg=234   ctermfg=29
hi NonText                cterm=NONE             ctermbg=NONE   ctermfg=59
hi Pmenu                  cterm=NONE             ctermbg=102   ctermfg=230
hi PmenuSbar              cterm=NONE             ctermbg=250   ctermfg=fg
hi PmenuSel               cterm=NONE             ctermbg=109   ctermfg=230
hi PmenuThumb             cterm=reverse          ctermbg=NONE    ctermfg=fg
hi Question               cterm=NONE             ctermbg=NONE    ctermfg=246
hi Search                 cterm=NONE             ctermbg=237   ctermfg=185
"hi SignColumn             cterm=NONE             ctermbg=23   ctermfg=231
hi SignColumn             cterm=NONE             ctermbg=NONE   ctermfg=NONE
hi SpecialKey             cterm=NONE             ctermbg=NONE    ctermfg=59
hi SpellBad               cterm=NONE             ctermbg=88    ctermfg=230
hi SpellCap               cterm=NONE             ctermbg=166    ctermfg=230
hi SpellLocal             cterm=NONE             ctermbg=NONE    ctermfg=30
hi SpellRare              cterm=NONE             ctermbg=NONE    ctermfg=201
hi StatusLine             cterm=NONE             ctermbg=241   ctermfg=252
hi StatusLineNC           cterm=NONE             ctermbg=238   ctermfg=244
hi VertSplit              cterm=NONE             ctermbg=238   ctermfg=238
hi TabLine                cterm=NONE             ctermbg=238   ctermfg=243
hi TabLineFill            cterm=NONE             ctermbg=NONE   ctermfg=NONE
hi TabLineSel             cterm=NONE             ctermbg=59    ctermfg=250
hi Title                  cterm=NONE             ctermbg=NONE    ctermfg=66
hi Visual                 cterm=NONE             ctermbg=237    ctermfg=NONE
hi WarningMsg             cterm=NONE             ctermbg=166   ctermfg=230
hi WildMenu               cterm=NONE             ctermbg=109   ctermfg=230

hi Comment                cterm=NONE             ctermbg=NONE    ctermfg=59
hi Boolean                cterm=NONE             ctermbg=NONE    ctermfg=130
hi String                 cterm=NONE             ctermbg=NONE    ctermfg=102
hi Identifier             cterm=NONE             ctermbg=NONE    ctermfg=67
hi Function               cterm=NONE             ctermbg=NONE    ctermfg=67
hi Type                   cterm=NONE             ctermbg=NONE    ctermfg=102
hi Statement              cterm=NONE             ctermbg=NONE    ctermfg=67
hi Keyword                cterm=NONE             ctermbg=NONE    ctermfg=96
hi Constant               cterm=NONE             ctermbg=NONE    ctermfg=130
hi Number                 cterm=NONE             ctermbg=NONE    ctermfg=130
hi Special                cterm=NONE             ctermbg=NONE    ctermfg=65
hi PreProc                cterm=NONE             ctermbg=NONE    ctermfg=65
hi Todo                   cterm=NONE			 ctermbg=234     ctermfg=96

hi diffOldFile            cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffNewFile            cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffFile               cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffLine               cterm=NONE             ctermbg=NONE    ctermfg=67
hi diffAdded              cterm=NONE             ctermfg=NONE    ctermfg=71
hi diffRemoved            cterm=NONE             ctermfg=NONE    ctermfg=166
hi diffChanged            cterm=NONE             ctermfg=NONE    ctermfg=67
hi link             diffSubname     diffLine
hi link             diffOnly        Constant
hi link             diffIdentical   Constant
hi link             diffDiffer      Constant
hi link             diffBDiffer     Constant
hi link             diffIsA         Constant
hi link             diffNoEOL       Constant
hi link             diffCommon      Constant
hi link             diffComment     Constant

hi Conceal                cterm=NONE             ctermbg=246 ctermfg=252
hi Error                  cterm=NONE             ctermbg=88  ctermfg=230
hi Ignore                 cterm=NONE             ctermbg=NONE    ctermfg=234
"hi InsertModeCursorLine   cterm=NONE             ctermbg=16    ctermfg=fg
"hi NormalModeCursorLine   cterm=NONE             ctermbg=235   ctermfg=fg
hi PmenuThumb             cterm=reverse          ctermbg=NONE    ctermfg=fg
hi StatusLineAlert        cterm=NONE             ctermbg=88   ctermfg=230
hi StatusLineUnalert      cterm=NONE             ctermbg=238   ctermfg=144
hi Test                   cterm=NONE             ctermbg=NONE    ctermfg=fg
hi Underlined             cterm=underline        ctermbg=NONE    ctermfg=111
hi VisualNOS              cterm=NONE,underline   ctermbg=NONE    ctermfg=fg
hi cCursor                cterm=reverse          ctermbg=NONE    ctermfg=fg
"hi iCursor                cterm=NONE             ctermbg=210   ctermfg=16
"hi lCursor                cterm=NONE             ctermbg=145   ctermfg=234
"hi nCursor                cterm=NONE             ctermbg=46    ctermfg=16
"hi vCursor                cterm=NONE             ctermbg=201   ctermfg=16

set background=dark
