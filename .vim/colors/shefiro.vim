" Vim color file
" Maintainer:	Teng-Wei Hsu
" Last Change:	2015 Dec 15

set background=dark
hi clear
"hi clear Normal

" Remove all existing highlighting and set the defaults.
hi clear
hi clear Search
hi clear MatchParen

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "shefiro"


" attr-list is a comma separated list (without spaces) of the
" following items (in any order):
" 	bold
" 	underline
" 	undercurl	not always available
" 	reverse
" 	inverse		same as reverse
" 	italic
" 	standout
" 	NONE		no attributes used (used to reset it)
"
" NR-16   NR-8    COLOR NAME ~
" 0	    0	    Black
" 1	    4	    DarkBlue
" 2	    2	    DarkGreen
" 3	    6	    DarkCyan
" 4	    1	    DarkRed
" 5	    5	    DarkMagenta
" 6	    3	    Brown, DarkYellow
" 7	    7	    LightGray, LightGrey, Gray, Grey
" 8	    0*	    DarkGray, DarkGrey
" 9	    4*	    Blue, LightBlue
" 10	    2*	    Green, LightGreen
" 11	    6*	    Cyan, LightCyan
" 12	    1*	    Red, LightRed
" 13	    5*	    Magenta, LightMagenta
" 14	    3*	    Yellow, LightYellow
" 15	    7*	    White
" Console
hi Normal	guifg=gray										guibg=black
hi Constant	ctermfg=magenta									guifg=magenta
hi Comment	ctermfg=blue									guifg=SlateBlue
hi Preproc	ctermfg=darkcyan								guifg=darkcyan
hi Search	ctermfg=black ctermbg=yellow					guifg=black			guibg=yellow
hi Special	ctermfg=darkyellow								guifg=darkyellow
hi Pmenu	ctermfg=black	ctermbg=gray					guifg=black			guibg=gray
hi PmenuSel				ctermbg=lightblue										guibg=lightblue
hi MatchParen	ctermfg=darkcyan							guifg=darkcyan
hi TabLine     ctermfg=lightgray ctermbg=darkblue cterm=none guifg=lightgray guibg=darkblue
hi TabLineSel  ctermfg=red       ctermbg=black    cterm=none guifg=red       guibg=black
hi TabLineFill ctermfg=darkblue                              guifg=darkblue
hi Folded	ctermfg=green		ctermbg=black				guifg=green			guibg=black
hi CursorColumn	term=reverse
hi CursorLine	term=reverse ctermfg=gray					guifg=gray
"hi CursorColumn	term=reverse		ctermbg=darkblue
"hi CursorLine	term=reverse		ctermbg=darkblue
hi PmenuSel	guifg=white guibg=blue
hi IndentGuidesOdd  ctermbg=234
hi IndentGuidesEven ctermbg=236
