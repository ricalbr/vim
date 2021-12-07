set shiftwidth=2 tabstop=2 softtabstop=2 autoindent smartindent

set foldmethod=marker
set foldmarker={{{,}}}
set foldlevelstart=0
set foldlevel=0

" Tabularize mapping
if exists(":Tabularize")
  nmap <Leader>a# :Tabularize /#<CR>
  vmap <Leader>a# :Tabularize /#<CR>
endif
