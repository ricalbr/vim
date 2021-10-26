" python

" add filetype specific plugins
packadd python-syntax

" basic settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set formatoptions=croql
set fileformat=unix

" compiler settings
compiler pyunit
set makeprg=python3\ %

augroup Linting
    autocmd!
    autocmd BufWritePost *.py silent make! <afile> | silent redraw!
    autocmd QuickFixCmdPost [^l]* cwindow
augroup END

" include and define
setlocal include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)
setlocal define=^\\s*\\\\(def\\\|class\\)\\>
setlocal includeexpr=PyInclude(v:fname)

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
nnoremap <F7> :update <CR>:!clear; python % <CR>
inoremap <F7> <ESC> :update <CR>:!clear; python % <CR>
