" ----------------------------------------------------------------------------
"   .vimrc                                                                {{{
" ----------------------------------------------------------------------------

" Allow vim to break compatibility with vi
set nocompatible " This must be first, because it changes other options

" }}}-------------------------------------------------------------------------
"   Plugin                                                                {{{
" ----------------------------------------------------------------------------

" Run `:PlugInstall` to install these plugins

" Download the Plug plugin manager if we don't have it yet
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Start the Plug plugin manager. Install plugins in this directory.
call plug#begin('~/.vim/plugged')

    " These plugins will be automatically downloaded from GitHub
    " Plug 'username/project'

    " Syntastic: Code linting errors
    Plug 'scrooloose/syntastic'

    " Fuzzy file opener
    Plug 'kien/ctrlp.vim'

    Plug 'captbaritone/molokai'

call plug#end()

" }}}-------------------------------------------------------------------------
"   Visual                                                                {{{
" ----------------------------------------------------------------------------

set showcmd                 " Show (partial) command in the last line of the screen.
set laststatus=2            " The last window will have a status line always
set visualbell              " Use a visual bell, don't beep!
set number                  " Show line numbers
set list                    " Make whitespace characters visible 
set listchars=trail:•       " Show trailing spaces
colorscheme molokai

" }}}-------------------------------------------------------------------------
"   Mouse                                                                 {{{
" ----------------------------------------------------------------------------

set mouse+=a  " Add mouse support for 'all' modes, may require iTerm to scroll

" }}}-------------------------------------------------------------------------
"   Search                                                                {{{
" ----------------------------------------------------------------------------

set incsearch               " Jump to search results as we type

" }}}-------------------------------------------------------------------------
"   Tabs                                                                  {{{
" ----------------------------------------------------------------------------

" Feel free to change these to fit your preferences
set tabstop=4               " Show a tab as four spaces
set shiftwidth=4            " Reindent is also four spaces
set softtabstop=4           " When hit <tab> use four columns
set expandtab               " Create spaces when I type <tab>

set shiftround              " Round indent to multiple of 'shiftwidth'.
filetype plugin indent on   " Rely on file plugins to handle indenting

" }}}-------------------------------------------------------------------------
"   Custom commands                                                       {{{
" ----------------------------------------------------------------------------

" Handy mappings to e[dit] or s[ource] your .vimrc
nmap <silent> <Leader>ev :vsplit $MYVIMRC<CR>
nmap <silent> <Leader>sv :source $MYVIMRC<CR>

" }}}-------------------------------------------------------------------------
"   Configure My Plugins                                                  {{{
" ----------------------------------------------------------------------------

" Syntastic
" Don't user pylint even though it's installed
let g:syntastic_python_checkers = ['python', 'pyflakes', 'pep8']
let g:syntastic_python_pep8_args="--ignore=E501,E121,E125,E126,E128,C0111"

" Ctrl-P
let g:ctrlp_working_path_mode = 'rw' " Search within the current Git project
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache|pip_download_cache|wheel_cache)$',
    \ 'file': '\v\.(png|jpg|jpeg|gif|DS_Store|pyc)$',
    \ 'link': '',
    \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
" Wait to update results (This should fix the fact that backspace is so slow)
let g:ctrlp_lazy_update = 1

" If we have The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" }}}-------------------------------------------------------------------------
"   Custom mappings                                                       {{{
" ----------------------------------------------------------------------------

" Do what my fat fingers mean!
command! Bd bd
command! BD bd
command! Q q
command! W w

" Nobody ever uses "Ex" mode, and it's annoying to leave
noremap Q <nop>

" }}}-------------------------------------------------------------------------
"   Undo, Backup and Swap file locations                                  {{{
" ----------------------------------------------------------------------------

" Don't leave .swp files everywhere. Put them in a central place
set directory=$HOME/.vim/swp/
set backupdir=$HOME/.vim/backupdir//
if exists('+undodir')
    set undodir=$HOME/.vim/undodir
    set undofile
endif

" }}}-------------------------------------------------------------------------
"                                                                         {{{
" ----------------------------------------------------------------------------
