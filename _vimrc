set nocompatible
set splitright
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ai
set backup		" keep a backup file
set backspace=indent,eol,start
set list lcs=tab:\|\ ,trail:-
autocmd GUIEnter * set noerrorbells visualbell t_vb=
set formatoptions=tcqj
set noerrorbells visualbell t_vb=
set modelines=0
set nomodeline

" bufdo hidden buffers

set hidden

" set ttyfast

set wildmenu
set wildmode=full,list:longest

let skip_default_vim=1
set viminfo=""

set mouse=c

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
			\ | wincmd p | diffthis
endif

" Fix wide char
set ambiwidth=double

" Set lang
set fileencoding=utf-8
set enc=utf-8

" Tablabel
set guitablabel=%t

" Cov tab and space
set smarttab
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
set cursorline
set cursorcolumn

" disable cursorline in diffmode
" autocmd FilterWritePre * if &diff | set nocursorline | endif

" Font
"set guifont=Fira\ Code\ Retina:h12
set guifont=Fira_Code_Retina\ 18

" syntax
autocmd BufReadPost * :syntax sync fromstart
autocmd BufWritePost * :syntax sync fromstart
autocmd FileType * :syntax sync fromstart

" My command
command! -nargs=1 Stt call Stt(<f-args>)
command! -nargs=1 Tts call Tts(<f-args>)
command! Filename execute "let @+ = expand('%:t')"
set autochdir

" quickfix buffer
set switchbuf=vsplit

" Leadeer key
noremap <Leader>z /{<CR>zfa}:noh<CR>
noremap <Leader>r :syntax sync fromstart <CR>
noremap <Leader>' bi'<ESC>ea'<ESC>
noremap <Leader>" bi"<ESC>ea"<ESC>
noremap <Leader>} bi{ <ESC>ea }<ESC>

" Other source
if has('unix')
	execute "so ".g:rc_path."_vimrc_linux"
else
	execute "so ".g:rc_path."_vimrc_win"
endif

execute "so ".g:rc_path."_vimrc_eslint"

" project local source
let s:rootDir = finddir('.git/..', expand('%:p:h').';')
let s:localrc = s:rootDir."/.vimrc"
if filereadable(s:localrc)
	execute "so ".s:localrc
endif


" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
