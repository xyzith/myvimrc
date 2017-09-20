set nocompatible
set splitright
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ai
set backup		" keep a backup file
set backupdir=$HOME/workspace/vimtmp/
set backspace=indent,eol,start
set list lcs=tab:\|\ 
set noerrorbells visualbell t_vb=

if has('mouse')
	set mouse=a
endif

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

colorscheme candycode

" Set lang
set fileencoding=utf-8
set enc=utf-8

" Tablabel
set guitablabel=%t

" Cov tab and space
function Stt(p1)
	execute "set tabstop=".a:p1
	set noexpandtab
	retab!
	execute "set tabstop=8"
	execute "set shiftwidth=8"
endfunction

function Tts(p1)
	execute "set tabstop=".a:p1
	execute "set shiftwidth=".a:p1
	set expandtab
	retab!
endfunction

" Cursor stuff
"set cursorline
set cursorcolumn

" syntax
autocmd GUIEnter * set visualbell t_vb=
autocmd BufEnter * :syntax sync fromstart
autocmd BufWritePost * :syntax sync fromstart
syntax sync minlines=1000
let c_minlines=1000

" My command
command! -nargs=1 Stt call Stt(<f-args>)
command! -nargs=1 Tts call Tts(<f-args>)
command! File execute "let @* = expand('%:t')"

" Leadeer key
noremap <Leader>j :set ft=javascript <CR>
noremap <Leader>h :set ft=html <CR>
noremap <Leader>c :set ft=css <CR>
noremap <Leader>z /{<CR>zfa}:noh<CR>
noremap <Leader>r :syntax sync fromstart <CR>

" Other source
so $VIM/_vimrc_win
so $VIM/_vimrc_ffn
so $VIM/_vimrc_automation
