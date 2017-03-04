if !&compatible
  set nocompatible
endif
" reset augroup augroup MyAutoCmd
  autocmd!
augroup END

" setup dein
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif

"install plugins
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

"End dein Scripts-------------------------


set novisualbell
syntax on
set number
" set colorcolumn=80
set hidden
set history=100
filetype plugin indent on
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set hlsearch
set showmatch
"nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
"set listchars=eol:\ ,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:>\ ,trail:#,extends:>
"
set list
set clipboard=unnamedplus

" for dirvish and auto chdir
autocmd BufEnter * silent! lcd %:p:h

let mapleader=" "
map <leader>s :source ~/.vimrc<CR>
nnoremap <Leader><Leader> :e#<CR>

" tab
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>h gT<CR>
nnoremap <Leader>l gt<CR>
nnoremap tt :tabnew<CR>
nnoremap tw :tabclose<CR>
nnoremap tl gt<CR>
nnoremap th gT<CR>

" paste mode
nnoremap <Leader>p :set paste<CR>p<CR>:set nopaste<CR>
nnoremap <Leader>P :set paste<CR>P<CR>:set nopaste<CR>

" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

" auto pair
let g:AutoPairsMapSpace = 0


let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_auto_type_info = 1
set updatetime=100
setlocal omnifunc=go#complete#Complete
set completeopt-=preview
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']


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

" don't wait escape
set ttimeoutlen=0

" ruby
let g:syntastic_ruby_checkers=['rubocop', 'mri']

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'go', 'rust'] }

