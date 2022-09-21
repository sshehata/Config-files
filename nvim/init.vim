colorscheme xoria256

syntax enable              "syntax highlighting
set number		   "line numbering
filetype plugin on         "file type detection and loading plugins for specific types
filetype indent on	   "enable indentation based on file type
set shellslash	           "handle forward slashes in file names
set grepprg=grep\ -nH\ $*  "set grep program
set fillchars+=vert:\      "remove bar character in vertical split
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab
set tw=100                 "80 chars per line
set ff=unix                "file format
set formatoptions+=t
set wrap
set number
let mapleader=","

" keymap
nmap <c-t> :terminal<CR>
tnoremap <Esc><Esc> <C-\><C-n>

execute pathogen#infect()

" ale
let ts_lint = ['eslint', 'tsserver', 'typecheck']
let g:ale_linters={'go': ['gofmt', 'golint', 'go vet', 'gopls'], 'javascript': ['standard'], 'typescript': ts_lint, 'javascript.jsx': ts_lint, 'typescriptreact': ts_lint, 'python': ['flake8', 'pylint', 'bandit'] }
let g:ale_fixers={'go': ['gofmt', 'goimports'], 'javascript': ['standard'], 'typescript': ['eslint', 'tslint'], 'javascript.jsx': ts_lint, 'typescriptreact': ['eslint', 'tslint'] }
let g:ale_python_pylint_use_global=1
let g:ale_javascript_standard_use_global=1

let g:ctrlp_max_files=50000000
let g:ctrlp_max_depth=400
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.yardoc\|node_modules\|dist\|tmp$',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$'
      \ }


" GO
"
let g:ale_go_bingo_executable = 'gopls'
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1

"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_types = 1
"
"let g:go_auto_sameids = 1
