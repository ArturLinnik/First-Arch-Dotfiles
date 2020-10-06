
" Vim vundle

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'vim-python/python-syntax'
Plugin 'mattn/emmet-vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tmsvg/pear-tree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Pressing jj instead of 'Esc' to enter INSERT mode.
imap jj <Esc> 

" Visualizes numbers on the left of the screen according to the line you are
" and shows the line you are in.
set relativenumber number

" Light colorscheme for dark background
set background=dark

" Shows text in color according to your main colorscheme.
syntax on

" Mapping Ctrl+c and Ctrl+v working in insert mode.
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Highlight search clearing highlighted with enter.
set hlsearch
nnoremap <CR> :noh<CR>

" Ignoe case sensitive
set ignorecase

" Peachpuff colorscheme
colorscheme peachpuff

" Shows line numbers in a dark grey color.
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE 
highlight MatchParen term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE 

" Moving between splited terminals by ^H ^J ^K and  ^L
set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ^N for opening NerdTree
map <C-n> :NERDTreeToggle<CR>

" Changed NerdTree arrows
let g:NERDTreeDirArrowExpandable = '> '
let g:NERDTreeDirArrowCollapsible = 'v'

" Full highlighting in python files
let g:python_highlight_all = 1

" DevIcons needed configuration
set encoding=UTF-8

"" EMMET -------------------------------------------------
"
" Enables Emmet only in html and css files.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"
" Completes html tags pressing ,, (, 2 times).
let g:user_emmet_leader_key=','
"
"" Shows tags and </> in white color.
"highlight link htmlTagName white
"highlight link htmlTag htmlTagName
"highlight link htmlEndTag htmlTagName
"
