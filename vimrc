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
Plug 'sjl/gundo.vim'
Plug 'rking/ag.vim'

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
" Plug 'sjl/badwolf'
" Plug 'altercation/vim-colors-solarized'
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
filetype indent plugin on " load filetype-specific indent files
set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert action.
set smartindent " Always set smartindenting on.
syntax on " Syntax processing on.
set number " Line numbers.
set relativenumber " Relative line numbers.
set incsearch " Do incremental searching.
set hlsearch " Highlight search matches.
set history=1000 " Keep 50 lines of command line history.
set ruler " Show the cursor position all the time.
set showcmd " Display incomplete commands.
set shell=/bin/zsh " Use zsh.
set wildmenu " Visual autocomplete for command menu.
set ignorecase " Use case insensitive search, except when using capital letters.
set smartcase " ???
set nostartofline " Stop certain movements from going to the first character of a line.
set ruler " Display the cursor position.
set laststatus=2 " Always display the status line, even if only one window is displayed.
set visualbell " Use visual bell instead of beeping when doing something wrong.
" set t_vb= " Reset the terminal code for the visual bell.
set pastetoggle=<F11> " Use <F11> to toggle between 'paste' and 'nopaste'.
set tabstop=2 " Number of visual spaces per TAB.
set shiftwidth=2 " ???
set softtabstop=2 " Number of spaces in tab when editing.
set expandtab " Tabs are spaces.
set wildmode=full " ???
set cursorline " Highlight current line.
set lazyredraw " Redraw only when we need to.
set showmatch " Highlight matching [{()}].
set foldenable " Enable folding.
set foldlevelstart=10 " Open most folds by default.
set foldnestmax=10 " 10 nested fold max.
set foldmethod=indent " Fold based on indent level.


" MAPPINGS
" ##############################################################################
map Y y$ " Y should act like D and C - yank until EOL, rather than yy.
nnoremap <leader><space> :nohlsearch<CR> " Turn off search highlight.
nnoremap <space> za " Space open/closes folds.
nnoremap j gj " Move up vertically by visual line, not real line.
nnoremap k gk " Move down vertically by visual line, not real line.
nnoremap gV `[v`] " Highlight last inserted text.
let mapleader=',' " Leader is comma.
nnoremap <leader>u :GundoToggle<CR> " Toggle gundo.
nnoremap <leader>ev :vsp $MYVIMRC<CR> " Edit vimrc.
nnoremap <leader>ez :vsp ~/.zshrc<CR> " Edit zshrc.
nnoremap <leader>sv :source $MYVIMRC<CR> " Load vimrc bindings.
nnoremap <leader>s :mksession<CR> " Save session.
nnoremap <leader>a :Ag " Open ag.vim.


" OTHER
" ##############################################################################
" In many terminal emulators the mouse works just fine, so enable it.
if has('mouse')
  set mouse=a
endif

" Set color scheme settings.
set background=dark
colorscheme spacegray

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim) or on gitcommit file types. Also
" don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
