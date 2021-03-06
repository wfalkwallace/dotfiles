" William Falk-Wallace
" vimrc
"

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
Plug 'mhinz/vim-startify'

" Utility
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'rstacruz/sparkup'
Plug 'tpope/vim-endwise', { 'for': 'rb'}
Plug 'tpope/vim-surround'
Plug 'gorkunov/smartpairs.vim'
Plug 'wakatime/vim-wakatime'

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

" Set color scheme settings.
colorscheme spacegray

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
set t_ut= " disable Background Color Erase

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

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim) or on gitcommit file types. Also
" don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Language-specific settings.
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.py,*.js,*.txt,*.md,*.css,*.sh :call <SID>StripTrailingWhitespaces()
    autocmd BufWritePre *.html,*.rb,*.jsx,*.jade,.c,*.zsh :call <SID>StripTrailingWhitespaces()
    autocmd BufWritePre *.h,*.go,*.less,*.sass,*.scss :call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal expandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Move backups out of working directory for cleanliness.
if !isdirectory($HOME."/.vim-tmp")
    call mkdir($HOME."/.vim-tmp", "", 0755)
endif
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/tmp
set writebackup

" Save undo info.
if !isdirectory($HOME."/.vim-undo")
    call mkdir($HOME."/.vim-undo", "", 0755)
endif
set undodir=~/.vim-undo
set undofile
set undoreload=10000


" FUNCTIONS
" ##############################################################################
" Toggle between number and relativenumber.
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
" From http://dougblack.io/words/a-good-vimrc.html.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
