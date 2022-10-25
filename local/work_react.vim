" gf suffix
set suffixesadd=.js

function! SearchFromProjectRoot()
	let l:rootDir = finddir('.git/..', expand('%:p:h').';')
	execute "vim \/".expand('<cword>')."\/j ".l:rootDir."/src/**"
endfunction

function! SearchVisualFromProjectRoot()
	let l:rootDir = finddir('.git/..', expand('%:p:h').';')
	let [line_start, column_start] = getpos("'<")[1:2]
	let [line_end, column_end] = getpos("'>")[1:2]
	if line_start != line_end
		return
	endif
	let l:line=getline('.')
	let l:visualText = strpart(l:line, column_start - 1, column_end - column_start)
	execute "vim \/".escape(l:visualText, '\')."\/j ".l:rootDir."/src/**"
endfunction

vnoremap <Leader>s :call SearchVisualFromProjectRoot()<CR> 
nnoremap <Leader>s :call SearchFromProjectRoot()<CR> 

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


