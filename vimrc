" PREP
" ##############################################################################
" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible


" PLUGINS
" ##############################################################################
" Load vim-plug (https://jordaneldredge.com/blog/why-i-switched-from-vundle-to-plug/)
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

" Syntax
Plug 'vim-ruby/vim-ruby', { 'for': 'rb'}
Plug 'moll/vim-node', { 'for': 'js'}
Plug 'pangloss/vim-javascript', { 'for': 'js'}
Plug 'othree/html5.vim', { 'for': 'html'}
Plug 'leshill/vim-json', { 'for': 'js'}
Plug 'tpope/vim-markdown', { 'for': 'md'}
Plug 'mxw/vim-jsx', { 'for': 'jsx'}
Plug 'tpope/vim-rails', { 'for': 'rb'}

" Navigation
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree', { 'on': 'NerdTree' }

" Utility
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'rstacruz/sparkup'
Plug 'tpope/vim-endwise', { 'for': 'rb'}
Plug 'tpope/vim-surround'
Plug 'gorkunov/smartpairs.vim'

" Git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'

" Color Schemes
Plug 'altercation/vim-colors-solarized'
Plug 'ajh17/Spacegray.vim'

" Look into more:
" valloric/YouCompleteMe
" easymotion/vim-easymotion
" tpope/vim-sleuth
" tpope/vim-unimpaired
" rking/ag.vim
" tpope/vim-eunuch
" christoomey/vim-tmux-navigator
" junegunn/fzf
" christoomey/vim-tmux-runner

call plug#end() "Add plugins to &runtimepath


" SETUP
" ##############################################################################
" Enable file type detection and load indent/plugin files
filetype indent plugin on
" Allow backspacing over autoindent, line breaks and start of insert action.
set backspace=indent,eol,start
" Always set smartindenting on.
set smartindent
" Syntax on.
syntax on
" Line numbers.
set number
" Relative line numbers.
set relativenumber
" Highlight last used search pattern.
set hlsearch
" Keep 50 lines of command line history.
set history=1000
" Show the cursor position all the time.
set ruler
" Display incomplete commands.
set showcmd
" Do incremental searching.
set incsearch
" Use zsh.
set shell=/bin/zsh

" In many terminal emulators the mouse works just fine, so enable it.
if has('mouse')
  set mouse=a
endif

" Set color scheme settings.
set background=dark
colorscheme solarized

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim) or on gitcommit file types. Also
" don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
