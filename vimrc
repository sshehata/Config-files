syntax enable              "syntax highlighting
set number		   "line numbering
filetype plugin on         "file type detection and loading plugins for specific types
filetype indent on	   "enable indentation based on file type
set shellslash	     	   "handle forward slashes in file names
set grepprg=grep\ -nH\ $*  "set grep program
set exrc 		   "source vimrc if present in directory
set secure 		   "restrict usage of commands if not default vimrc
set fillchars+=vert:\      "remove bar character in vertical split 

execute pathogen#infect()  

colorscheme xoria256

" vim-latex options
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi, pdf'

" slimv options
let g:lisp_rainbow=1
let g:slimv_repl_split=4
