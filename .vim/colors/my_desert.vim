"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/desert.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my_desert"

"Clear the colors for any items that you don't like
hi clear StatusLine
hi clear Search
"Set up your new & improved colors
hi StatusLine ctermfg=2 ctermbg=0 gui=bold,reverse
hi Search guibg=peru guifg=wheat
hi Search cterm=NONE ctermfg=black ctermbg=yellow
