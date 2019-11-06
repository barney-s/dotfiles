source ~/.config/nvim/vimplug.vim
set background=light
colorscheme summerfruit256

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
