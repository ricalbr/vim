" G-code"

" basic settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set formatoptions=tcq
set expandtab
set autoindent
set encoding=utf-8
set fileformat=unix
set textwidth=179

" set comment string
setlocal commentstring='\ %s

" Tabularize mapping
if exists(":Tabularize")
  nmap <Leader>a' :Tabularize /'<CR>
  vmap <Leader>a' :Tabularize /'<CR>
endif
