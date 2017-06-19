source ~/.config/nvim/vimplug.vim
set background=light
colorscheme summerfruit256

" custom settings {{
    "set relativenumber
    let mapleader = "\<Space>"
    filetype plugin on
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
" }}


    " TODO set colors first
    "autocmd WinEnter * setlocal cursorline
    "autocmd WinLeave * setlocal nocursorline

" goyo limelight {{
    let g:goyo_width=120
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
