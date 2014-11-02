syntax enable              "syntax highlighting
set number		   "line numbering
filetype plugin on         "file type detection and loading plugins for specific types
filetype indent on	   "enable indentation based on file type
set shellslash	     	   "handle forward slashes in file names
set grepprg=grep\ -nH\ $*  "set grep program
set exrc 		   "source vimrc if present in directory
set secure 		   "restrict usage of commands if not default vimrc
set fillchars+=vert:\      "remove bar character in vertical split 
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab


execute pathogen#infect()  

colorscheme xoria256

" vim-latex options
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi, pdf'

" slimv options
let g:lisp_rainbow=1
let g:slimv_repl_split=4

" cvim options
let g:C_UseTool_cmake  ='yes'
let g:C_UseTool_doxygen='yes'

" YCM options
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
