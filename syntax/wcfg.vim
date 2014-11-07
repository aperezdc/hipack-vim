" Author: Adrián Pérez de Castro <aperez@igalia.com>
" License: GPLv3

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax case match
syntax sync minlines=100

syntax match   wcfgIdentError "\<[^:[:space:]]\+\>" contained
syntax keyword wcfgTodo       TODO FIXME XXX NB NOTE contained
syntax region  wcfgComment    start="#" end="$" contains=wcfgTodo,@Spell
syntax region  wcfgDict       transparent fold matchgroup=wcfgDictBound start="{" end="}" contains=ALLBUT,wcfgComma,wcfgColonError,wcfgIdentError
syntax region  wcfgList       transparent matchgroup=wcfgListBound start="\[" end="\]" contains=ALLBUT,wcfgCommaError
syntax region  wcfgString     start=/"/ skip=/\\"/ end=/"/ contains=NONE
syntax match   wcfgNumber     "\<[-+]\?\d\+\(\.\d\+\)\?\([eE][-+]\?\d\+\)\?"
syntax match   wcfgNumber     "\<0[xX]\x\+"
syntax match   wcfgNumber     "\<0\o\+"
syntax keyword wcfgBoolean    true True false False
syntax match   wcfgComma      "," contained
syntax match   wcfgColon      ":"
syntax match   wcfgCommaError "\<,\>"
syntax match   wcfgColonError ":" contained

highlight default link wcfgTodo      Todo
highlight default link wcfgComment   Comment
highlight default link wcfgColon     Operator
highlight default link wcfgComma     Operator
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
