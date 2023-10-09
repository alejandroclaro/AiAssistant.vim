" aiassistant.vim - AiAssistant.vim
" Author: Alejandro Claro

" Start up {{{

if exists("g:loaded_aiassistant") || &cp || v:version < 700
  finish
endif

let s:plugin_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import sys
from os.path import normpath, join
import vim
plugin_dir = vim.eval('s:plugin_dir')
lib_dir = normpath(join(plugin_dir, '..', 'lib'))
sys.path.insert(0, lib_dir)
import aiassistant
EOF

let g:loaded_aiassistant = 1

" }}}

" Primary functions {{{

function! s:chat()
  python3 aiassistant.chat()
endfunction

command! -bar AiChat call s:chat()

" }}}

