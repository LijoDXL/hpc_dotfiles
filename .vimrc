execute pathogen#infect()
set ttyfast
set lazyredraw

" for built-in fuzzy finding
set path+=**
" Nice tab of matched file
set wildmenu

" Sessions
let g:session_autoload = 'no'

" Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F9> :NERDTreeFind<CR>

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>

" Reduce timeout after <ESC> is recieved.
set ttimeout
set ttimeoutlen=20
set notimeout

set backspace=2   " Backspace deletes like most programs in insert mode
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight matches
set autowrite     " Automatically :write before running commands

"code folding
set foldmethod=indent
set foldlevel=99

" statusline
set laststatus=2  " Always display the status line
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter *  hi StatusLine term=reverse ctermfg=3 ctermbg=0 gui=undercurl guisp=Magenta
  au InsertLeave *  hi StatusLine term=reverse ctermfg=2 ctermbg=0 gui=bold,reverse
endif
" Formats the statusline
set statusline=%f                               " file name
set statusline+=%m                              " modified flag
set statusline+=%h                              " help file flag
set statusline+=%r                              " read only flag
" set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
" set statusline+=%{&ff}]                         " file format
set statusline+=\ %=                            " align left
set statusline+=%y                              " filetype
set statusline+=\ Line:%l/%L[%p%%]                " line X of Y [percent of file]
set statusline+=\ Col:%c                        " current column
set statusline+=\ Buf:%n                        " Buffer number

" syntax higlight for ferret jnl files 
" let mysyntaxfile="~/.vim/myferretsyntax.vim"

" syntax higlight for HWRF conf files 
au BufRead,BufNewFile *.conf set filetype=dosini

syntax on
colorscheme my_desert

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['python']
let g:syntastic_fortran_checkers = ['gfortran']
let g:syntastic_matlab_checkers = ['mlint']
let g:syntastic_sh_checkers = ['Bashate']

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  " autocmd FileType markdown setlocal spell
  " For commenting in ferret
  autocmd FileType ferret setlocal commentstring=!\ %s
" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set smartcase
set ignorecase

" Numbers
set number
set numberwidth=5

" insert time stamp
nnoremap <F5> "=strftime("%d-%b-%Y %T")<CR>P

" align at =
nnoremap <Leader>= :Tab 1=<CR>
vnoremap <Leader>= :Tab 1=<CR>

" align at !
nnoremap <Leader>! :Tab /!<CR>
vnoremap <Leader>! :Tab /!<CR>

" makes switching modes easy
inoremap jj <Esc>

" ENTER insterts newline in normal mode (also shift+ENTER)
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"cd to path of current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" cmd n, cmd p for fwd/backward in search
map <C-n> :cn<CR>
map <C-p> :cp<CR>

