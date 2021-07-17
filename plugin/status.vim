
" status line
set laststatus=2
set statusline=
set statusline+=%#LineNr#
set statusline+=\ \ \ %F
set statusline+=\ %m%r
set statusline+=%#LineNr#
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %m
set statusline+=\[%{&fileformat}\]
set statusline+=\ \ \ %p%%
set statusline+=\ (%l:%c)
set statusline+=\ \ %m
