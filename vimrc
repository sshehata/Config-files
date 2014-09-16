:syntax enable             "syntax highlighting
filetype plugin on         "file type detection and loading plugins for specific types
filetype indent on	   "enable indentation based on file type
set shellslash	     	   "handle forward slashes in file names
set grepprg=grep\ -nH\ $*  "set grep program
set exrc 		   "source vimrc if present in directory
set secure 		   "restrict usage of commands if not default vimrc

execute pathogen#infect()  

" vim-latex options
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi, pdf'

