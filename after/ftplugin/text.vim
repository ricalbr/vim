" text files

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" twitter mode
" nnoremap <leader>tw :match Error '\%>281v.\+'<CR>

let s:activatedt = 0
function! TwitterMode()
    if s:activatedt == 0
        let s:activatedt = 1
        match Error '\%>281v.\+'
    else
        let s:activatedt = 0
        match none
    endif
endfunction

nnoremap <leader>tw :call TwitterMode()<CR>
