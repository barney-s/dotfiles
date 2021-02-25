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
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" Colorschemes
"Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }


if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi', { 'for' : [ 'python' ] }
    Plug 'zchee/deoplete-clang', { 'for': [ 'c', 'cpp', 'h' ]}
    Plug 'Shougo/neoinclude.vim'
    Plug 'sbdchd/neoformat'
    Plug 'nathanalderson/yang.vim'
    Plug 'zchee/libclang-python3'
    Plug 'artur-shaik/vim-javacomplete2'
    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
        " assuming you're using vim-plug: https://github.com/junegunn/vim-plug
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'

    Plug 'racer-rust/vim-racer'

endif

call plug#end()
