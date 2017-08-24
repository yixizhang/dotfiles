" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Highlight current line
set cursorline

" Redraw only when we need to.
set lazyredraw

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" prettier format
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd BufWritePre *.js :normal gggqG

" unfold by default
set foldlevel=99

" supertab configs
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" basics
set number

" syntax
filetype plugin indent on
autocmd Filetype html setlocal ts=2 sw=2
autocmd FileType javascript setlocal ts=2 sw=2
autocmd FileType yaml setlocal ts=2 sw=2
autocmd FileType python setlocal ts=4 sw=4
autocmd BufNewFile,BufRead *.json set ft=javascript

" mitigate ale/syntastic conflict warning
let g:ale_emit_conflict_warnings = 0

" plugins
call plug#begin('~/.vim/plugged')

Plug 'davidhalter/jedi-vim'
" supertab
Plug 'ervandew/supertab'
" yaml
Plug 'pearofducks/ansible-vim'
" whitespace
Plug 'itspriddle/vim-stripper'
" lint
Plug 'vim-syntastic/syntastic'
" command-t
Plug 'wincent/command-t', {
\   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
\ }

call plug#end()

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "--rcfile=$HOME/dotfiles/.pylintrc"

" command-t
let g:CommandTFileScanner = "git"
nnoremap <Leader>e :CommandT<CR>
nnoremap <Leader>b :CommandTBuffer<CR>
