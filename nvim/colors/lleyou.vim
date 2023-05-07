" lleyou
" hisco
" Last modified (optional)

" Set the default background and foreground colors
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "lleyou"

" Define the color palette
" The 'guifg' and 'guibg' options define the foreground and background
" colors for different elements, respectively.
" For example, to set the color of comments, use:
" hi Comment guifg=#555555
" For more options, refer to the Vim documentation on syntax highlighting.
hi Comment        guifg=#555566
hi Constant       guifg=#0FED98
hi String         guifg=#79BF46
hi Identifier     guifg=#e8e8e8
hi Statement      guifg=#0FED98
hi PreProc        guifg=#0FB459
hi Type           guifg=#fffff9
hi Function       guifg=#FCEDA2
hi Special        guifg=#eeeeee
hi Conditional    guifg=#FFED98
hi Repeat         guifg=#fFB459
hi Operator       guifg=#fFED98
hi Keyword        guifg=#FFDD33
hi Exception      guifg=#fFB459
hi Include        guifg=#ffdd33
hi Label          guifg=#0FB459
hi Macro          guifg=#0FB459
hi Tag            guifg=#0FB459
hi Attribute      guifg=#0FB459
hi Number         guifg=#eeeeee

" Ctrlp
hi CtrlPLinePre   guifg=#ff0000
hi CtrlPMark   guifg=#ff0000


hi LineNr         guifg=#7b7b7b
" hi Cursor         guifg=#00ff00 guibg=#ff00ff
hi SignColumn     guibg=transparent
hi Pmenu          guibg=#181818
hi EndOfBuffer    guifg=#555566
hi Title          guifg=#555566
hi FloatTitle     guifg=#555566
hi DiffAdd        guibg=transparent
hi Search         guifg=#ffdd33
hi IncSearch      guibg=reverse
highlight Cursor guifg=NONE guibg=red


" Define the background and foreground colors for the editor interface
" and different elements
" For example, to set the background color of the status bar, use:
" hi StatusLine guibg=#282828 guifg=#ffffff
" For more options, refer to the Vim documentation on syntax highlighting.
hi Normal          guibg=#181818 guifg=#e8e8e8
hi StatusLine      guibg=#aaaaaa guifg=#181818
hi StatusLineNC    guibg=#aaaaaa guifg=#181818
hi CursorLine      guibg=#282828
hi CursorLineNr    guifg=#e2e2e2 guibg=#7575753
hi Search          guibg=#d38f8f
hi IncSearch       guibg=reverse guifg=reverse
hi Visual          guibg=#e2e2e2 guifg=#181818
hi MatchParen      guibg=#757575
hi TabLine         guibg=#2e2e2e guifg=#e8e8e8
hi TabLineFill     guibg=#2e2e2e guifg=#e8e8e8
hi TabLineSel      guibg=#383838 guifg=#b0af81
hi Error           guifg=#c22121
hi Warning         guifg=#c2aa21
hi Info            guibg=#000000
hi Link            guifg=#7ba092
