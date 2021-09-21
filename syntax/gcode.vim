" Vim syntax file
" Language: Aerobasic G-Code
" Maintainer: Riccardo Albiero <albr.riccardo@gmail.com>
" Last Change: 2021 July
"
" Rework of https://github.com/vim-scripts/nc.vim--Eno to be compatible with Aerotech GCODE used for femtosecond laser micromachining.

" Quit when a (custom syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

syn case ignore
syn  match gcComment "'.*$" contains=gcTodo
syn  match gcComment "\/\/.*$" contains=gcTodo
syn  match gcComment ";.*$" contains=gcTodo
syn  match gcOperator "[\+|\-|\*|\/|=|>|<|>=|<=|&|\||%|!|\^|\(|\)]"
syn  keyword gcGCodes G01 G02 G03 G04 G1 G2 G3 G4 G10 G17 G18 G19 G20 G21 G28 G30 G33 G33.1 G38.2 G38.X G40 G41 G41.1 G42 G42.1 G43 G43.1 G49 G53 G54 G55 G56 G57 G58 G59 G59.1 G59.2 G59.3 G61 G61.1 G64 G76 G80 G81 G82 G83 G84 G85 G86 G87 G88 G89 G90 G91 G92 G92.1 G92.2 G92.3 G93 G94 G95 G96 G97 G98 G99 G359
syn  keyword gcMCodes M00 M01 M02 M03 M04 M05 M06 M07 M08 M09 M0 M1 M2 M3 M4 M5 M6 M7 M8 M9 M30 M48 M49 M50 M51 M52 M53 M60 M62 M63 M64 M65 M66
syn  keyword gcFunction ENABLE METRIC SECONDS VELOCITY PSOCONTROL PSOOUTPUT CONTROL PSOCONTROL ABSOLUTE INCREMENTAL LINEAR DWELL DVAR CALL
syn keyword gcIter FOR NEXT TO REPEAT ENDRPT DFS END ENDDFS
syn keyword gcStatus ON OFF RESET

syntax match gcXAxis "\<[XY]\>"
syntax match gcXAxis "\<[XY]-\?\d\+\>"
syntax match gcXAxis "\<[XY]-\?\.\d\+\>"
syntax match gcXAxis "\<[XY]-\?\d\+\."
syntax match gcXAxis "\<[XY]-\?\d\+\.\d\+\>"
syntax match gcXAxis "\<[XY]\ze\(\s*\d\+\)*\>"

syntax match gcYAxis "\<[XY]\>"
syntax match gcYAxis "\<[XY]-\?\d\+\>"
syntax match gcYAxis "\<[XY]-\?\.\d\+\>"
syntax match gcYAxis "\<[XY]-\?\d\+\."
syntax match gcYAxis "\<[XY]-\?\d\+\.\d\+\>"
syntax match gcYAxis "\<[XY]\ze\(\s*\d\+\)*\>"

syntax match gcZAxis "\<[Z]\>"
syntax match gcZAxis "\<Z-\?\d\+\>"
syntax match gcZAxis "\<Z-\?\.\d\+\>"
syntax match gcZAxis "\<Z-\?\d\+\."
syntax match gcZAxis "\<Z-\?\d\+\.\d\+\>"
syntax match gcZAxis "\<[Z]\ze\(\s*\d\+\)*\>"

syntax match gcUAxis "\<[U]\>"
syntax match gcUAxis "\<U-\?\d\+\>"
syntax match gcUAxis "\<U-\?\.\d\+\>"
syntax match gcUAxis "\<U-\?\d\+\."
syntax match gcUAxis "\<U-\?\d\+\.\d\+\>"
syntax match gcUAxis "\<[U]\ze\(\s*\d\+\)*\>"

syntax match gcFeed "\<[F]\>"
syntax match gcFeed "\<[F]-\?\d\+\>"
syntax match gcFeed "\<[F]-\?\.\d\+\>"
syntax match gcFeed "\<[F]-\?\d\+\."
syntax match gcFeed "\<[F]-\?\d\+\.\d\+\>"
syntax match gcFeed "\<[F]\ze\(\s*\d\+\)*\>"

syntax match gcRotationParam "\<[PQR]\ze\(\s*\d\+\)*\>"

syntax match gcVariable "\$"

hi def link gcComment Comment
hi def link gcGCodes gcodeCommand
hi def link gcMCodes gcodeCommand
hi def link gcFunction gcodeFunction
hi def link gcXAxis gcodeAxis
hi def link gcYAxis gcodeAxis
hi def link gcZAxis gcodeAxis
hi def link gcUAxis gcodeAxis
hi def link gcFeed gcodeCommand
hi def link gcIter gcodeIter
hi def link gcStatus gcodeStatus
hi def link gcVariable gcodeVariable
hi def link gcOperator gcodeOperator
hi def link gcRotationParam gcodeRotationParam

let b:current_syntax = "gcode"
