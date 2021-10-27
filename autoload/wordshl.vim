" hightlight word under cursor
"
" use also `n` and `p` to navigate words
" function taken from https://github.com/fastai/dotfiles/blob/master/.vimrc.

let g:highlighting = 0
function! wordshl#Highlighting() abort
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
