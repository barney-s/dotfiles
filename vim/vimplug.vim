call plug#begin(' ~/.local/share/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"Plug 'tpope/vim-eunuch'     "Vim sugar for the UNIX shell commands that need it the most
"Plug 'bling/vim-airline'
"Plug 'python-mode/python-mode'
Plug 'mhinz/vim-startify'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'mhinz/vim-sayonara'
"Plug 'stefandtw/quickfix-reflector.vim'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'
"Plug 'scrooloose/nerdcommenter'
"Plug 'Yggdroot/indentLine'
Plug 'rhysd/vim-clang-format'
"Plug 'wellle/targets.vim'
"Plug 'haya14busa/incsearch.vim'
"Plug 'tpope/vim-unimpaired'
"Plug 'rhysd/clever-f.vim'
"Plug 'vim-utils/vim-man'
"Plug 'easymotion/vim-easymotion'
"Plug 'ervandew/supertab'
"Plug 'tpope/vim-fugitive'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'benmills/vimux'
"Plug 'plasticboy/vim-markdown'
"Plug 'elzr/vim-json'
"Plug 'mzlogin/vim-markdown-toc'
"Plug 'Raimondi/delimitMate'
"Plug 'roxma/vim-tmux-clipboard'
"Plug 'tmux-plugins/vim-tmux-focus-events'
"Plug 'sickill/vim-pasta'
"Plug 'davidhalter/jedi-vim'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'tommcdo/vim-lion'
Plug 'w0rp/ale'

" Colorschemes
"Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'joshdick/onedark.vim'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi', { 'for' : [ 'python' ] }
    Plug 'zchee/deoplete-clang', { 'for': [ 'c', 'cpp', 'h' ]}
    Plug 'Shougo/neoinclude.vim'
    Plug 'sbdchd/neoformat'
    Plug 'nathanalderson/yang.vim'
    Plug 'zchee/libclang-python3'
    Plug 'artur-shaik/vim-javacomplete2'
endif

call plug#end()
