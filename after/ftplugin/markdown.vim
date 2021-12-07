" markdown

" markdown specific text format
set linebreak
set fo-=t

" commment string
setlocal commentstring=<!--\ %s\ -->

" Tabularize mapping
if exists(":Tabularize")
  nmap <Leader>a| :Tabularize /|<CR>
  vmap <Leader>a| :Tabularize /|<CR>
endif
