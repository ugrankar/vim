" Vim syntax file
" Language: EMC Symmetrix cli syntax highlighting file 
" Maintainer: Pritesh Ugrankar 
" Latest Revision: 24th Oct 2014

if exists("b:current_syntax")
  finish
endif

syn match symmserialNumber '\d\+'
syn keyword symcliCmd symcfg symconfigure symaccess symmask symmaskdb symcli
syn keyword symcliCmd symdev -sid nextgroup=symmserialNumber skipwhite

let b:current_syntaxt="symm"
hi def link symcliCmd Statement
hi def link symmserialNumber Constant




