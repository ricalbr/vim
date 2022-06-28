" python

" add filetype specific plugins
packadd vim-flake8
  let g:flake8_show_in_gutter=1
  let g:flake8_quickfix_height=3
  " to use colors defined in the colorscheme
  highlight link Flake8_Error      Error
  highlight link Flake8_Warning    WarningMsg
  highlight link Flake8_Complexity WarningMsg
  highlight link Flake8_Naming     WarningMsg
  highlight link Flake8_PyFlake    WarningMsg
  " mapping
  nnoremap <F3> :call flake8#Flake8()<CR>
packadd python-syntax
  let g:python_highlight_all = 1

" basic settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set formatoptions=croql
set expandtab
set autoindent
set encoding=utf-8
set fileformat=unix
set textwidth=120
set colorcolumn=121
set foldmethod=indent
set foldlevel=99

" compiler settings
" compiler pylint
" set makeprg=python3\ %

" augroup Linting
"     autocmd!
"     autocmd BufWritePost *.py silent make! <afile> | silent redraw!
"     autocmd QuickFixCmdPost [^l]* cwindow
" augroup END

" include and define
setlocal include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)
setlocal define=^\\s*\\\\(def\\\|class\\)\\>
" setlocal includeexpr=PyInclude(v:fname)

function! PyInclude(fname)
  let parts = split(a:fname, ' import ')
  let l = parts[0]
  if len(parts) > 1
  let r = parts[1]
  let joined = join([l, r]. '.')
  let fp = substitute(joined, '\.', '/', 'g') . '.py'
  let found = glob(fp, 1)
  if len(found)
    return found
  endif
  return substitute(l, '\.', '/', 'g') . '.py'
endfunction

" mappings
nnoremap <F5> :update <CR>:exec '!python' shellescape(@%, 1)<CR>
inoremap <F5> <ESC> :update <CR>:exec '!python' shellescape(@%, 1)<CR>

" Tabularize mapping
if exists(":Tabularize")
  nmap <Leader>a# :Tabularize /#<CR>
  vmap <Leader>a# :Tabularize /#<CR>
endif

