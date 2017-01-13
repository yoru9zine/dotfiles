set novisualbell
syntax on
filetype on
set number
" set colorcolumn=80
set hidden
set history=100
filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set hlsearch
set showmatch
"nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:>\ ,trail:#,extends:>
set list
set clipboard=unnamedplus

" for dirvish and auto chdir
autocmd BufEnter * silent! lcd %:p:h

let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
nnoremap <Leader><Leader> :e#<CR>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neocomplete.vim')
call dein#add('907th/vim-auto-save')
call dein#add('justinmk/vim-dirvish')
call dein#add('tpope/vim-surround')
call dein#add('jiangmiao/auto-pairs')
call dein#add('glidenote/memolist.vim')
call dein#add('ctrlpvim/ctrlp.vim')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" golang setup ---------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" autosave
let g:auto_save = 1  " enable AutoSave on Vim startup


" memolist
let g:memolist_path = "~/memo"
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
