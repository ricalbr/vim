" zsh

set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent

set foldmethod=marker
set foldmarker={{{,}}}
set foldlevelstart=0
set foldlevel=0

" Tabularize mapping
if exists(":Tabularize")
  nmap <Leader>a# :Tabularize /#<CR>
  vmap <Leader>a# :Tabularize /#<CR>
endif
