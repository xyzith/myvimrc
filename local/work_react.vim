" gf suffix
set suffixesadd=.js

function! SearchCwordFromProjectRoot()
	call SearchFromProjectRoot(expand('<cword>'))
endfunction

function! SearchVisualFromProjectRoot()
	let [line_start, column_start] = getpos("'<")[1:2]
	let [line_end, column_end] = getpos("'>")[1:2]
	if line_start != line_end
		return
	endif
	let l:line=getline('.')
	let l:visualText = strpart(l:line, column_start - 1, column_end - column_start)
	call SearchFromProjectRoot(l:visualText)
endfunction

function! SearchFromProjectRoot(word)
	let l:rootDir = finddir('.git/..', expand('%:p:h').';')
	execute "vim \/".a:word."\/j ".l:rootDir."/src/**"
endfunction

vnoremap <Leader>s :call SearchVisualFromProjectRoot()<CR> 
nnoremap <Leader>s :call SearchCwordFromProjectRoot()<CR>
command! -nargs=1 Sfp call SearchFromProjectRoot(<f-args>)

" fg alias path resolve
function! Inex()
	let l:rootDir = finddir('.git/..', expand('%:p:h').';')
	echo v:fname
	if v:fname =~? '^/'
		return substitute(v:fname,'/',l:rootDir.'/src/','')
	elseif v:fname =~? '^store'
		return substitute(v:fname,'store',l:rootDir.'/src/store.js','')
	elseif v:fname =~? '^utils'
		return substitute(v:fname,'utils',l:rootDir.'/src/utils','')
	elseif v:fname =~? '^libs'
		return substitute(v:fname,'libs',l:rootDir.'/src/libs','')
	elseif v:fname =~? '^actions'
		return substitute(v:fname,'actions',l:rootDir.'/src/actions','')
	elseif v:fname =~? '^reducders'
		return substitute(v:fname,'reducders',l:rootDir.'/src/reducders','')
	elseif v:fname =~? '^images'
		return substitute(v:fname,'images',l:rootDir.'/src/images','')
	elseif v:fname =~? '^lottUtils'
		return substitute(v:fname,'lottUtils',l:rootDir.'/workspace/lott-js/src','')
	elseif v:fname =~? '^locales'
		return substitute(v:fname,'locales',l:rootDir.'/src/locales','')
	elseif v:fname =~? '^configs'
		return substitute(v:fname,'configs',l:rootDir.'/src/configs','')
	elseif v:fname =~? '^widgets'
		return substitute(v:fname,'widgets',l:rootDir.'/src/widgets','')
	elseif v:fname =~? '^messages'
		return substitute(v:fname,'messages',l:rootDir.'/src/messages','')
	elseif v:fname =~? '^common'
		return substitute(v:fname,'common',l:rootDir.'/src/components/common','')
	elseif v:fname =~? '^lotto-vn-common'
		return substitute(v:fname,'lotto-vn-common',l:rootDir.'/workspace/lotto-vn-common/src','')
	endif
	return v:fname
endfunction

set inex=Inex()


