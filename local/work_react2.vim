" gf suffix
set suffixesadd=.js,.jsx,

function! SearchFromProjectRoot()
	let l:rootDir = finddir('.git/..', expand('%:p:h').';')
	execute "vim \/".expand('<cword>')."\/j ".l:rootDir."/src/**"
endfunction
noremap <Leader>s :call SearchFromProjectRoot()<CR> 

" fg alias path resolve
function! Inex()
	let l:rootDir = finddir('.git/..', expand('%:p:h').';')
	if v:fname =~? '^utils'
		return substitute(v:fname,'utils',l:rootDir.'/src/utils','')
	elseif v:fname =~? '^configs'
		return substitute(v:fname,'configs',l:rootDir.'/src/configs','')
	elseif v:fname =~? '^libs'
		return substitute(v:fname,'libs',l:rootDir.'/src/libs','')
	elseif v:fname =~? '^locales'
		return substitute(v:fname,'locales',l:rootDir.'/src/locales','')
	elseif v:fname =~? '^lottUtils'
		return substitute(v:fname,'lottUtils',l:rootDir.'/node_modules/lott-js/src','')
	elseif v:fname =~? '^actions'
		return substitute(v:fname,'actions',l:rootDir.'/src/ducks/actions','')
	elseif v:fname =~? '^actionType'
		return substitute(v:fname,'actionType',l:rootDir.'/src/ducks//ducks/constants/actionType.js','')
	elseif v:fname =~? '^common'
		return substitute(v:fname,'common',l:rootDir.'/src/components/common','')
	elseif v:fname =~? '^b1'
		return substitute(v:fname,'b1',l:rootDir.'/src/components/b1','')
	elseif v:fname =~? '^trad'
		return substitute(v:fname,'trad',l:rootDir.'/src/components/trad','')
	elseif v:fname =~? '^end'
		return substitute(v:fname,'end',l:rootDir.'/src/components/end','')
	elseif v:fname =~? '^reducders'
		return substitute(v:fname,'reducders',l:rootDir.'/src/ducks/reducders.js','')
	elseif v:fname =~? '^messages'
		return substitute(v:fname,'messages',l:rootDir.'/src/messages','')
	elseif v:fname =~? '^hoc'
		return substitute(v:fname,'hoc',l:rootDir.'/src/components/common/hoc','')
	elseif v:fname =~? '^widgets'
		return substitute(v:fname,'widgets',l:rootDir.'/src/components/common/widgets','')
	elseif v:fname =~? '^images'
		return substitute(v:fname,'images',l:rootDir.'/src/images','')
	elseif v:fname =~? '^media'
		return substitute(v:fname,'media',l:rootDir.'./src/media','')
	endif
	return v:fname
endfunction

set inex=Inex()


