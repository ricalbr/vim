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
syn  keyword gcGCodes G0 G01 G1 G02 G2 G03 G3 G04 G4 G8 G9 G10 G12 G13 G16 G17 G18 G19 G20 G21 G22 G26 G27 G28 G29 G30 G33 G33.1 G34 G35 G36 G37 G38.2 G38.X G40 G41 G41.1 G42 G42.1 G43 G43.1 G44 G45 G46 G47 G49 G51 G52 G53 G54 G55 G56 G57 G58 G59 G59.1 G59.2 G59.3 G60 G61 G61.1 G63 G64 G65 G66 G67 G68 G70 G71 G72 G75 G76 G80 G81 G82 G83 G84 G85 G86 G87 G88 G89 G90 G91 G92 G92.1 G92.2 G92.3 G93 G94 G95 G96 G97 G98 G99 G100 G101 G108 G109 G110 G111 G112 G113 G114 G115 G116 G117 G118 G120 G121 G143 G144 G149 G150 G151 G153 G165 G166 G202 G203 G212 G213 G295 G296 G297 G300 G301 G359 G360 G361 G395 G396 G397 G495 G496 G497
syn  keyword gcMCodes M00 M0 M01 M1 M02 M2 M03 M3 M04 M4 M05 M5 M06 M6 M07 M7 M08 M8 M09 M9 M19 M23 M25 M30 M33 M34 M44 M45 M46 M47 M48 M49 M50 M51 M52 M53 M60 M62 M63 M64 M65 M66 M97 M98 M103 M104 M123 M124 M133 M134 M143 M144 M146 M219 M319 M419
syn  keyword gcFunction ENABLE METRIC SECONDS VELOCITY PSOCONTROL PSOOUTPUT CONTROL PSOCONTROL ABSOLUTE INCREMENTAL LINEAR DWELL DVAR CALL
syn keyword gcIter FOR NEXT TO REPEAT ENDRPT DFS END ENDDFS
syn keyword gcStatus ON OFF RESET

syntax match gcXAxis "\<[X]\>"
syntax match gcXAxis "\<[X]-\?\d\+\>"
syntax match gcXAxis "\<[X]-\?\.\d\+\>"
syntax match gcXAxis "\<[X]-\?\d\+\."
syntax match gcXAxis "\<[X]-\?\d\+\.\d\+\>"
syntax match gcXAxis "\<[X]\ze\(\s*\d\+\)*\>"

syntax match gcYAxis "\<[Y]\>"
syntax match gcYAxis "\<[Y]-\?\d\+\>"
syntax match gcYAxis "\<[Y]-\?\.\d\+\>"
syntax match gcYAxis "\<[Y]-\?\d\+\."
syntax match gcYAxis "\<[Y]-\?\d\+\.\d\+\>"
syntax match gcYAxis "\<[Y]\ze\(\s*\d\+\)*\>"

syntax match gcZAxis "\<[Z]\>"
syntax match gcZAxis "\<[Z]-\?\d\+\>"
syntax match gcZAxis "\<[Z]-\?\.\d\+\>"
syntax match gcZAxis "\<[Z]-\?\d\+\."
syntax match gcZAxis "\<[Z]-\?\d\+\.\d\+\>"
syntax match gcZAxis "\<[Z]\ze\(\s*\d\+\)*\>"

syntax match gcUAxis "\<[U]\>"
syntax match gcUAxis "\<[U]-\?\d\+\>"
syntax match gcUAxis "\<[U]-\?\.\d\+\>"
syntax match gcUAxis "\<[U]-\?\d\+\."
syntax match gcUAxis "\<[U]-\?\d\+\.\d\+\>"
syntax match gcUAxis "\<[U]\ze\(\s*\d\+\)*\>"

syntax match gcFeed "\<[EFS]\>"
syntax match gcFeed "\<[EFS]-\?\d\+\>"
syntax match gcFeed "\<[EFS]-\?\.\d\+\>"
syntax match gcFeed "\<[EFS]-\?\d\+\."
syntax match gcFeed "\<[EFS]-\?\d\+\.\d\+\>"
syntax match gcFeed "\<[EFS]\ze\(\s*\d\+\)*\>"

syntax match gcUserParam "\<[LO]\>"
syntax match gcUserParam "\<[LO]-\?\d\+\>"
syntax match gcUserParam "\<[LO]-\?\.\d\+\>"
syntax match gcUserParam "\<[LO]-\?\d\+\."
syntax match gcUserParam "\<[LO]-\?\d\+\.\d\+\>"
syntax match gcUserParam "\<[LO]\ze\(\s*\d\+\)*\>"

syntax match gcRotationParam "\<[IJKPQR]\ze\(\s*\d\+\)*\>"

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
hi def link gcUserParam gcodeRotationParam

let b:current_syntax = "gcode"
