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

syntax match   hipackIdentError "\<[^:[:space:]]\+\>" contained
syntax keyword hipackTodo       TODO FIXME XXX NB NOTE contained
syntax region  hipackComment    start="#" end="$" contains=hipackTodo,@Spell
syntax region  hipackDict       transparent fold matchgroup=hipackDictBound start="{" end="}" contains=ALLBUT,hipackCommaError,hipackColonError,hipackIdentError
syntax region  hipackList       transparent matchgroup=hipackListBound start="\[" end="\]" contains=ALLBUT,hipackCommaError
syntax region  hipackString     start=/"/ skip=/\\"/ end=/"/ contains=NONE
syntax match   hipackNumber     "\<[-+]\?\d\+\(\.\d\+\)\?\([eE][-+]\?\d\+\)\?"
syntax match   hipackNumber     "\<0[xX]\x\+"
syntax match   hipackNumber     "\<0\o\+"
syntax keyword hipackBoolean    true True false False
syntax match   hipackComma      "," contained
syntax match   hipackColon      ":"
syntax match   hipackCommaError "\<,\>"
syntax match   hipackColonError ":" contained

highlight default link hipackTodo      Todo
highlight default link hipackComment   Comment
highlight default link hipackColon     Operator
highlight default link hipackComma     Operator
highlight default link hipackNumber    Number
highlight default link hipackBoolean   Boolean
highlight default link hipackString    String
highlight default link hipackDictBound Structure
highlight default link hipackListBound Structure

highlight default link hipackCommaError Error
highlight default link hipackColonError Error
highlight default link hipackIdentError Error

let b:current_syntax = 'hipack'
let &cpo = s:cpo_save
unlet s:cpo_save
