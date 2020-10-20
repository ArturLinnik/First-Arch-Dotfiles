
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
Plugin 'christoomey/vim-sort-motion'
Plugin 'christoomey/vim-titlecase'
Plugin 'christoomey/vim-g-dot'
Plugin 'mg979/vim-visual-multi'
Plugin 'suan/vim-instant-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Pressing jj instead of 'Esc' to enter INSERT mode.
imap jj <Esc>
imap kk <Esc>

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

" Go back where cursor was
nmap <Space> ``

" Highlight search clearing highlighted with enter.
set incsearch
set hlsearch
nnoremap <CR> :noh<CR>

" Ignore case sensitive
set ignorecase

" Peachpuff colorscheme
colorscheme peachpuff

" Changes color background of the line you are in
set cursorline
hi CursorLine term=bold cterm=NONE ctermfg=NONE ctermbg=235

" Shows line numbers in a dark grey color.
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE 
highlight CursorLineNR term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE 
highlight MatchParen term=bold cterm=NONE ctermfg=NONE ctermbg=DarkGrey gui=NONE guifg=DarkGrey guibg=NONE 

" Moving between splited terminals by ^H ^J ^K and  ^L
set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ^N for opening NerdTree
map <C-n> :NERDTreeToggle<CR>

" Open and close terminal with ^Q
noremap <C-q> :terminal<CR>
tnoremap <C-q> <C-\><C-n>:q!<CR>

" Write ``` with g`
nnoremap g` i```<CR>```<Esc>O
inoremap g` ```<CR>```<Esc>O

" Execute python files with F9
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:!clear<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <F9> :w<CR>:!clear<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Execute pudb with F6
autocmd FileType python imap <buffer> <F6> <esc>:w<CR>:!clear<CR>:exec '!python3 -m pudb.run' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <F6> :w<CR>:!clear<CR>:exec '!python3 -m pudb.run' shellescape(@%, 1)<CR>

" Execute HTML files in Firefox with F9 and change to workspace 2
autocmd FileType html imap <buffer> <F9> <esc>:w<CR>:!clear<CR>:exec '!firefox' shellescape(@%, 1)<CR>:exec '!i3-msg workspace2'<CR>
autocmd FileType html map <buffer> <F9> :w<CR>:!clear<CR>:exec '!firefox' shellescape(@%, 1)<CR>:exec '!i3-msg workspace2'<CR>

" Changed NerdTree arrows
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

" Full highlighting in python files
let g:python_highlight_all = 1

" DevIcons needed configuration
set encoding=UTF-8

" Set split below
set splitbelow

" Terminal size
set termwinsize=10x0

" Change window from terminal with ^H ^J ^K ^L
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

" Normal mode in terminal with jj
tnoremap jj <C-\><C-n>

" Changes Search highlight color
highlight Search ctermbg=DarkGrey

" Enables Emmet only in html and css files.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Completes html tags pressing ,, (, 2 times).
let g:user_emmet_leader_key=','

" Disable Markdown realtime and autostart
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

"" Shows tags and </> in white color.
"highlight link htmlTagName white
"highlight link htmlTag htmlTagName
"highlight link htmlEndTag htmlTagName
"
