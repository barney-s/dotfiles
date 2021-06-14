" Welcome to Vim (http://go/vim).
"
" Enable modern Vim features not compatible with Vi spec.
set nocompatible

" Use the 'google' package by default (see http://go/vim/packages).
source /usr/share/vim/google/google.vim

call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'ashfinal/vim-colors-paper'
"Plug 'mhinz/vim-startify'
"Plug 'rhysd/vim-clang-format'
Plug 'w0rp/ale'
"Plug 'SirVer/ultisnips'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-sayonara'
Plug 'rakr/vim-one'
"Plug 'fatih/vim-go'
Plug 'yuratomo/w3m.vim'
Plug 'tpope/vim-rhubarb'
Plug 'wannesm/wmgraphviz.vim'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'mhinz/vim-signify'


" Colorschemes
"Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jcherven/jummidark.vim'
Plug 'mcmartelle/vim-monokai-bold'



if has('nvim')
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "Plug 'Shougo/deoplete-lsp'
    "Plug 'zchee/deoplete-jedi', { 'for' : [ 'python' ] }
    "Plug 'zchee/deoplete-clang', { 'for': [ 'c', 'cpp', 'h' ]}
    Plug 'Shougo/neoinclude.vim'
    Plug 'sbdchd/neoformat'
    Plug 'nathanalderson/yang.vim'
    Plug 'zchee/libclang-python3'
    Plug 'artur-shaik/vim-javacomplete2'
    "Plug 'neovim/nvim-lspconfig'
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'

    Plug 'racer-rust/vim-racer'
endif

call plug#end()

Glug csearch
Glug blaze
Glug blaze plugin[mappings]='<leader>b'
Glug blazedeps auto_filetypes=`['go']`
Glug codefmt plugin[mappings] gofmt_executable="goimports"
Glug codefmt
Glug codefmt-google enable_nclfmt
Glug piper plugin[mappings]
Glug g4
Glug codefmt-google enable_gclfmt
"Glug git5
Glug ultisnips-google
"Glug youcompleteme-google
Glug critique plugin[mappings]
Glug relatedfiles plugin[mappings]
Glug syntastic-google
Glug ft-cpp
Glug ft-proto
"Glug google-logo
Glug grok
Glug refactorer
Glug whitespace
Glug outline-window

set background=light
colorscheme summerfruit256

"let g:tagbar_ctags_bin='ctags-exuberant'
let g:signify_vcs_list = [ 'perforce' , 'git']
let g:airline_theme='papercolor'

" custom settings {{
    "set relativenumber
    let mapleader = "\<Space>"
    filetype plugin on
    set hidden " allow switching buffers even if not written
"}}

" keymaps {{
    " -- Insert Mode mappings ------------------------------
    " ctrl+d in insert mode -> delete line
    inoremap <c-d> <esc>ddi

    " ctrl+u in insert mode -> Uppercase word
    inoremap <c-u> <esc>viwUi

    " -- Normal Mode mappings ------------------------------
    nnoremap <leader>d :silent Goyo<cr>
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    nnoremap <leader>n :NERDTreeToggle<cr>
    nnoremap <leader>l :call NumberToggle()<cr>
    nnoremap <leader>t :TagbarToggle<CR>
    nnoremap <leader>f :Files<cr>
    nnoremap <leader>s :Tags<cr>
    nnoremap <leader>b :Buffers<cr>
    nnoremap <leader><Right> <C-w>l
    nnoremap <leader><Left> <C-w>h
    nnoremap [b :bp<cr>
    nnoremap ]b :bn<cr>
    nnoremap gb :ls<cr>:b<space>
    nnoremap [t :tabp<cr>
    nnoremap ]t :tabn<cr>
    nnoremap tn :tabnew<cr>
    nnoremap ts :tab split<cr>

    " --- LSP shortcuts
    nnoremap <C-]> :LspDefinition<CR>
    nnoremap <C-\> :LspPeekDefinition<CR>
    nnoremap <leader>] :LspHover<CR>

    " --- Google
    nnoremap <leader>o :GoogleOutlineWindow<CR>

    " -- Quit behaviour ------------------------------------
    nnoremap zz :qa<cr>
" }}


    " TODO set colors first
    "autocmd WinEnter * setlocal cursorline
    "autocmd WinLeave * setlocal nocursorline

" w3m.vim {
  "let g:w3m#option = '-o display_charset=utf-8 -dump -o frame=true  -o strict_iso2022=0 -o ucs_conv=1'
" }

" WMGraphviz {{
    let g:WMGraphviz_output='png'
" }}

" goyo limelight {   let g:goyo_width=120
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
" }}


" UtilSnips {{
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackardTrigger="<s-tab>"
    let g:UltiSnipsEditSplit="vertical"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"
    let g:SuperTabDefaultCompletionType = "<c-n>"
" }}


" Line Numbers {{
function! NumberToggle()
    if(&relativenumber == 1 && &number == 1)
        set number
        set norelativenumber
    elseif (&number == 1 && &relativenumber == 0)
        set norelativenumber
        set nonumber
    else
        set number
        set relativenumber
    endif
endfunction
" }}

" fzf {{
" }}

" Deoplete {{
"     let g:deoplete#enable_at_startup = 1
" }}

" Asynctasks {{
let g:asyncrun_open = 6
" }}


" {{{ ncm2
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect
" }}}

" {{{ Racer
let g:racer_experimental_completer = 1
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END
" }}}

" {{{ Language server setup
    au User lsp_setup call lsp#register_server({
    \ 'name': 'CiderLSP',
    \ 'cmd': {server_info->[
    \   '/google/bin/releases/cider/ciderlsp/ciderlsp',
    \   '--tooltag=vim-lsp',
    \   '--noforward_sync_responses',
    \ ]},
    \ 'allowlist': ['c', 'cpp', 'java', 'proto', 'textproto', 'go', 'python', 'swift'],
    \})

    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    " Send async completion requests.
    " WARNING: Might interfere with other completion plugins.
    let g:lsp_async_completion = 1

    " Enable UI for diagnostics
    let g:lsp_signs_enabled = 1           " enable diagnostics signs in the gutter
    let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

    " Automatically show completion options
    let g:asyncomplete_auto_popup = 1

" }}}

" {{{ Google autogroup
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  "autocmd FileType c,cpp,javascript AutoFormatBuffer clang-format
  autocmd FileType go AutoFormatBuffer gofmt
  "autocmd FileType markdown AutoFormatBuffer mdformat
  autocmd FileType ncl AutoFormatBuffer nclfmt
  "autocmd FileType borg AutoFormatBuffer gclfmt
  "autocmd FileType gcl AutoFormatBuffer gclfmt
  "autocmd FileType python AutoFormatBuffer pyformat
  " Add more filetypes here
augroup END
" }}}

