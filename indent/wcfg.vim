" Author: Adrián Pérez de Castro <aperez@igalia.com>
" License: Distributed under terms of the GPLv3 license

if exists("b:did_indent")
	finish
endif

setlocal cindent
setlocal cinkeys=0#,{,0},!^F,o,O
setlocal cinoptions={0,}0,L0,J1,j1,+0

let b:did_indent = 1
