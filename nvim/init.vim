call plug#begin()
    " Vim extensions
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    " Plug 'Raimondi/delimitMate'
    Plug 'jiangmiao/auto-pairs'

    " Appearance
    Plug 'morhetz/gruvbox'

    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    " Git
    Plug 'airblade/vim-gitgutter'

    " Autocompletion
    Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
    Plug 'plasticboy/vim-markdown'

call plug#end()


" Jump a line when a word doesn't fit the screen instead of cutting it
set linebreak

" Pressing jj instead of 'Esc' to enter INSERT mode.
inoremap jj <Esc>
inoremap jh <Esc>
inoremap hj <Esc>
inoremap jk <Esc>
inoremap kk <Esc>

" Show existing tab with 4 spaces width
set tabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

set smartindent

" On pressing tab, insert 4 spaces
set expandtab

" Visualizes numbers on the left of the screen according to the line you are
" and shows the line you are in.
set relativenumber number

" Colorscheme
colorscheme gruvbox

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
" nmap <Space> ``

" Highlight search clearing highlighted with enter.
set incsearch
nnoremap <CR> :noh<CR>

" Insert spaces from normal mode
nnoremap <Space> i<Space><Esc>

" Ignore case sensitive
set ignorecase
 
" Toggle between paste with indent and without indent
set pastetoggle=<F3>

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
" map <C-n> :NERDTreeToggle<CR>

" Open and close terminal with ^Q
" noremap <C-q> :terminal<CR>
" tnoremap <C-q> <C-\><C-n>:q!<CR>
noremap <F6> :terminal<CR>
tnoremap <F6> <C-\><C-n>:q!<CR>

" Write ``` with g`
nnoremap g` i```<CR>```<Esc>O
inoremap g` ```<CR>```<Esc>O

" Execute python files with F9
" autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:!clear<CR>:exec '!python3' shellescape(@%, 1)<CR>
" autocmd FileType python map <buffer> <F9> :w<CR>:!clear<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Execute pudb with F6
" autocmd FileType python imap <buffer> <F6> <esc>:w<CR>:!clear<CR>:exec '!python3 -m pudb.run' shellescape(@%, 1)<CR>
" autocmd FileType python map <buffer> <F6> :w<CR>:!clear<CR>:exec '!python3 -m pudb.run' shellescape(@%, 1)<CR>

" Execute HTML files in Firefox with F9, change to workspace 2 and Enter again
" the html file
autocmd FileType html imap <buffer> <F9> <esc>:w<CR>:!clear<CR>:exec '!firefox' shellescape(@%, 1)<CR>:exec '!i3-msg workspace2'<CR><CR>
autocmd FileType html map <buffer> <F9> :w<CR>:!clear<CR>:exec '!firefox' shellescape(@%, 1)<CR>:exec '!i3-msg workspace2'<CR><CR>

" Changed NerdTree arrows
" let g:NERDTreeDirArrowExpandable = '>'
" let g:NERDTreeDirArrowCollapsible = 'v'

" Full highlighting in python files
" let g:python_highlight_all = 1

" DevIcons needed configuration
" set encoding=UTF-8

" Set split below
set splitbelow

" Terminal size
" set termwinsize=10x0

" Change window from terminal with ^H ^J ^K ^L
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

" Normal mode in terminal with jj
tnoremap jh <C-\><C-n>

" Changes Search highlight color
highlight Search ctermbg=DarkGrey

" Enables Emmet only in html and css files.
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

" Completes html tags pressing ,, (, 2 times).
" let g:user_emmet_leader_key=','

"
" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
"
"
"
"
"

" Disable Markdown realtime and autostart
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

highlight Pmenu ctermfg=15 ctermbg=4 guifg=#ffffff guibg=#000000

"" Shows tags and </> in white color.
highlight link htmlTagName white
" highlight link htmlTag htmlTagName
" highlight link htmlEndTag htmlTagName


""" Plugins
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"
:highlight CocFloating ctermbg=black
:highlight CocErrorFloat ctermfg=white

inoremap <expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"
inoremap <silent><expr> <c-space> coc#refresh()

"" Run prettier at save
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"" Git gutter
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg

" Update sign column every quarter second
set updatetime=250
