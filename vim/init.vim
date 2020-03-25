source ~/.config/nvim/vimplug.vim
set background=light
colorscheme pencil

let g:tagbar_ctags_bin='ctags-exuberant'


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
    nnoremap [b :bp<cr>
    nnoremap ]b :bn<cr>
    nnoremap gb :ls<cr>:b<space>
    nnoremap [t :tabp<cr>
    nnoremap ]t :tabn<cr>
    nnoremap tn :tabnew<cr>
    nnoremap ts :tab split<cr>
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


" << LSP >> {{{
nnoremap <leader>lcs :LanguageClientStart<CR>
" if you want it to turn on automatically
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'] }
noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>
" }}}

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
