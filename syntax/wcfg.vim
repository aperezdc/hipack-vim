" Author: Adrián Pérez de Castro <aperez@igalia.com>
" License: Distributed under terms of the GPLv3 license

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax case match
syntax sync minlines=100

syntax region  wcfgDict    transparent fold matchgroup=wcfgDictBound start="{" end="}" contains=ALLBUT,wcfgComma,wcfgColonError,wcfgIdentError
syntax region  wcfgList    transparent matchgroup=wcfgListBound start="\[" end="\]" contains=ALLBUT,wcfgIdent,wcfgCommaError
syntax keyword wcfgTodo    contained TODO FIXME XXX NB NOTE
syntax region  wcfgComment start="#" end="$" contains=wcfgTodo,@Spell
syntax region  wcfgString  start=/"/ skip=/\\"/ end=/"/
syntax keyword wcfgBoolean true True false False
syntax match   wcfgIdent   "\v<[^:[:space:]]+>"
syntax match   wcfgNumber  "\v<[-+]?\d+>"
syntax match   wcfgNumber  "\v<[-+]?\d*.\d+>"
syntax match   wcfgNumber  "\v<[-+]?\d*\.?\d+([Ee]-?)?\d+>"
syntax match   wcfgNumber  "\v<0[xX]\x+([Pp]-?)?\x+>"
syntax match   wcfgNumber  "\v<0\o+>"
syntax match   wcfgColon   ":"
syntax match   wcfgComma   contained ","

syntax match wcfgCommaError ","
syntax match wcfgColonError contained ":"
syntax match wcfgIdentError contained "\v<[^:[:space:]]+>"

highlight default link wcfgTodo      Todo
highlight default link wcfgComment   Comment
highlight default link wcfgColon     Operator
highlight default link wcfgComma     Operator
highlight default link wcfgIdent     Identifier
highlight default link wcfgNumber    Number
highlight default link wcfgBoolean   Boolean
highlight default link wcfgString    String
highlight default link wcfgDictBound Structure
highlight default link wcfgListBound Structure

highlight default link wcfgCommaError Error
highlight default link wcfgColonError Error
highlight default link wcfgIdentError Error

let b:current_syntax = "wcfg"
let &cpo = s:cpo_save
unlet s:cpo_save
