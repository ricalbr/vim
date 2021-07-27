" status line

let g:currentmode={
      \ 'n'  : 'n',
      \ 'v'  : 'v',
      \ 'V'  : 'vl',
      \ ''   : 'vb',
      \ 'i'  : 'i',
      \ 'R'  : 'r',
      \ 'Rv' : 'rv',
      \ 'c'  : 'c',
      \ 't'  : 'f',
      \}

hi InsertColor  ctermbg=darkgreen ctermfg=black
hi ReplaceColor ctermbg=darkred   ctermfg=black
hi VisualColor  ctermbg=darkblue  ctermfg=black


set laststatus=2
set statusline=
set statusline+=%#NormalColor#%{(g:currentmode[mode()]=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(g:currentmode[mode()]=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(g:currentmode[mode()]=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#ReplaceColor#%{(g:currentmode[mode()]=='rv')?'\ \ V-REPLACE\ ':''}
set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='vl')?'\ \ V-LINE\ ':''}
set statusline+=%#VisualColor#%{(g:currentmode[mode()]=='vb')?'\ \ V-BLOCK\ ':''}
set statusline+=%#NormalColor#%{(g:currentmode[mode()]=='c')?'\ \ COMMAND\ ':''}
set statusline+=%#NormalColor#%{(g:currentmode[mode()]=='f')?'\ \ FINDER\ ':''}
set statusline+=%#LineNr#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#LineNr#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=%5p%%
set statusline+=\ (%3l:%2c)
