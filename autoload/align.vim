" Use a bunch of standard UNIX commands for quick an dirty
" whitespace-based alignment

function! align#Align()
    '<,'>!column -t|sed 's/  \(\S\)/ \1/g'
    normal gv=
endfunction
