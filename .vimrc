" Pressing jj instead of 'Esc' to enter INSERT mode.
:imap jj <Esc> 

" Visualizes numbers on the left of the screen according to the line you are
" and shows the line you are in.
:set relativenumber number

" Shows text in color according to your main colorscheme.
:syntax on

" Shows line numbers in a dark grey color.
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE 

" Mapping Ctrl+c and Ctrl+v working in insert mode.
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Highlight search clearing highlighted with enter.
:set hlsearch
nnoremap <CR> :noh<CR>

" Ignore case sensitive
set ignorecase

" Vim-plug.
call plug#begin()
" Emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim'
call plug#end()

" EMMET -------------------------------------------------

" Enables Emmet only in html and css files.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Completes html tags pressing ,, (, 2 times).
let g:user_emmet_leader_key=','

" Shows tags and </> in white color.
highlight link htmlTagName white
highlight link htmlTag htmlTagName
highlight link htmlEndTag htmlTagName
