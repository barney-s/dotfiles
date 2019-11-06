call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'ashfinal/vim-colors-paper'
Plug 'mhinz/vim-startify'
Plug 'rhysd/vim-clang-format'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-sayonara'
Plug 'rakr/vim-one'
Plug 'fatih/vim-go'
Plug 'yuratomo/w3m.vim'
Plug 'tpope/vim-rhubarb'
Plug 'wannesm/wmgraphviz.vim'
Plug 'pedrohdz/vim-yaml-folds'
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
