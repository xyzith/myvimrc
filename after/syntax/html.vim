" Vim syntax file
" Language:	ffntmpl (Templates hl for Friend Finder Inc)
" Maintainer:	ttang.tw
" Last Change:	2016.3.14
" Version:	0.92
"
" Not working very well. Perl codes highlight in the tags are broken, but I don't know how to fix it.
" Please rename this file to html.vim, css.vim, javascript.vim, xslt.vim
" and put it into ~/.vim/after/syntax/ (linux) or $VIM/vimfiles/after/syntax/ {win} folder.
 
syn cluster ffntest contains=javaScriptStringD,javaScriptStringS,javaScriptRegexpString,htmlString,cssStringQ,cssStringQQ,xmlString,htmlBold,htl,htmlBold,htmlBoldUnderline,htmlBoldItalic,htmlBoldUnderlineItalic,htmlBoldItalicUnderline,htmlUnderline,htmlUnderlineBold,htmlUnderlineItalic,htmlUnderlineItalicBold,htmlUnderlineBoldItalic,htmlItalic,htmlItalicBold,htmlItalicBoldUnderline,htmlItalicUnderline,htmlItalicUnderlineBold,htmlLeadingSpace,htmlLink,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,htmlHead,htmlTitle,cssFontDescriptorFunction,cssURL,ffnother,ffnperl

syn region ffnother matchgroup=PreProc start="\[cron " end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[data_url " end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[def" end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[extern " end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[field " end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[inc " end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[initsub " end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[log " end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[parse " end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[psub " end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[text " end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[text_js " end="\]" containedin=@ffntest
syn region ffnother matchgroup=PreProc start="\[var " end="\]" containedin=@ffntest

" Temporary disabled
" syn include @ffnPerl $VIMRUNTIME/syntax/perl.vim
syn region ffnperl matchgroup=PreProc start="\[perl " end="\]" contains=@ffnperl containedin=@ffntest
syn region ffnperl matchgroup=PreProc start="\[gsub " end="\]" contains=@ffnperl containedin=@ffntest
syn region ffnperl matchgroup=PreProc start="\[if " end="\]" contains=@ffnperl containedin=@ffntest
syn region ffnperl matchgroup=PreProc start="\[else" end="\]" contains=@ffnperl containedin=@ffntest
syn region ffnperl matchgroup=PreProc start="\[elseif " end="\]" contains=@ffnperl containedin=@ffntest
syn region ffnperl matchgroup=PreProc start="\[endif" end="\]" contains=@ffnperl containedin=@ffntest

syn region ffnComment start="\[--" end="--\]" contains=ffnTODO containedin=@ffntest
syn keyword ffnTODO TODO XXX FIXME TBD contained
hi link ffnother function
" Temporary hl perl code as function
hi link ffnperl function
hi link ffnComment Comment
hi link ffnTODO TODO
