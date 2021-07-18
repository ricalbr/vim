set shiftwidth=2 tabstop=2 softtabstop=2 autoindent smartindent

" Automatically source .vimrc on save
augroup Vimrc
  autocmd!
  autocmd! bufwritepost vimrc source %
augroup END

au FileType help wincmd L                               " open help in vertical split
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
