syn match prelectSpecial	/</
syn match prelectSpecial	/>/
syn match prelectSpecial	/\[/
syn match prelectSpecial	/\]/

syn match prelectSpecial	/<-/
syn match prelectSpecial	/\./
syn match prelectSpecial	/:/
syn match prelectSpecial	/\v\*{1,3}(\))@!/

syn match prelectBoolean	/\v!!?(\()@!/

syn match prelectNumber	/\v([ \(\)\{\}\[\]\n])@<=[\-]?(([1-9]\d*[eE][+\-]?\d+)|[1-9]\d*|0)(\.((\d*[Ee][+\-]?\d+)|\d+))?([ \(\)\{\}\[\]\n])@=/
syn match prelectNumber	/\v([ \(\)\{\}\[\]\n])@<=[\-]?0\d+([ \(\)\{\}\[\]\n])@=/
syn match prelectNumber	/\v([ \(\)\{\}\[\]\n])@<=[\-]?0[xX][1-9a-fA-F][0-9a-fA-F]*([ \(\)\{\}\[\]\n])@=/

syn match prelectKeyword	/\v(\>\>|\>\>\>|_|_>|_^|_^^|_^^^)(\()@=/

syn match prelectIdentifier /\v([ \n\r\t\[\]\(\)\{\}\<\>\@\.])@<=([^ _\n\r\t0-9\(\)\{\}\[\]\<\>\*:\-\!\/`])([^ \n\r\t\(\)\{\}\[\]\<\>\*:\!\/`])*/

syn match prelectType	/\v(\@{1,3}|\#\#?|\&|\$)([\#\&\$\@(])@!/
syn match prelectType	/\v\@([^\(\)\{}\@<>:\n ])+/

syn match prelectIdentifier	/\v(\@)@<![^{.( \@a-z0-9]+(\()@=/
syn match prelectIdentifier	/\v(\@)@<!\@(\()@=/

syn region prelectString start=/`/ skip=/\v\\./ end=/`/ oneline contains=prelectInterWrap
syn region prelectInterWrap start="\v(\\)@<!\{\s*" end="\v\s*\}" contained containedin=prelectString contains=prelectIdentifier

syn match prelectSpecial	/{/
syn match prelectSpecial	/}/

syn match prelectComment	/\/\/.*/
syn region prelectComment	start=/\/\*/ end=/\*\//

hi def link prelectInterpolated Special
hi def link prelectSpecial	Special
hi def link prelectBoolean	Boolean
hi def link prelectNumber	Number
hi def link prelectIdentifier	Identifier
hi def link prelectType	Type
hi def link prelectKeyword	Keyword
hi def link prelectString	String
hi def link prelectComment	Comment

" lisp rainbow parentheses

syn cluster all contains=prelectComment,prelectSpecial,prelectBoolean,prelectNumber,prelectFloat,prelectType,prelectIdentifier,prelectString,prelectInterWrap,prelectKeyword,prelectComment

syn region lispParen0 matchgroup=hlLevel0 start="(" end=")" skip="|.\{-}|" contains=@all,lispParen1
syn region lispParen1 contained matchgroup=hlLevel1 start="(" end=")" skip="|.\{-}|" contains=@all,lispParen2
syn region lispParen2 contained matchgroup=hlLevel2 start="(" end=")" skip="|.\{-}|" contains=@all,lispParen3
syn region lispParen3 contained matchgroup=hlLevel3 start="(" end=")" skip="|.\{-}|" contains=@all,lispParen4
syn region lispParen4 contained matchgroup=hlLevel4 start="(" end=")" skip="|.\{-}|" contains=@all,lispParen5
syn region lispParen5 contained matchgroup=hlLevel5 start="(" end=")" skip="|.\{-}|" contains=@all,lispParen6
syn region lispParen6 contained matchgroup=hlLevel6 start="(" end=")" skip="|.\{-}|" contains=@all,lispParen7
syn region lispParen7 contained matchgroup=hlLevel7 start="(" end=")" skip="|.\{-}|" contains=@all,lispParen8
syn region lispParen8 contained matchgroup=hlLevel8 start="(" end=")" skip="|.\{-}|" contains=@all,lispParen9
syn region lispParen9 contained matchgroup=hlLevel9 start="(" end=")" skip="|.\{-}|" contains=@all,lispParen0

if &bg == "dark"
	hi def hlLevel0 ctermfg=red		guifg=red1
	hi def hlLevel1 ctermfg=yellow	guifg=orange1
	hi def hlLevel2 ctermfg=green	guifg=yellow1
	hi def hlLevel3 ctermfg=cyan	guifg=greenyellow
	hi def hlLevel4 ctermfg=magenta	guifg=green1
	hi def hlLevel5 ctermfg=red		guifg=springgreen1
	hi def hlLevel6 ctermfg=yellow	guifg=cyan1
	hi def hlLevel7 ctermfg=green	guifg=slateblue1
	hi def hlLevel8 ctermfg=cyan	guifg=magenta1
	hi def hlLevel9 ctermfg=magenta	guifg=purple1
else
	hi def hlLevel0 ctermfg=red		guifg=red3
	hi def hlLevel1 ctermfg=darkyellow	guifg=orangered3
	hi def hlLevel2 ctermfg=darkgreen	guifg=orange2
	hi def hlLevel3 ctermfg=blue	guifg=yellow3
	hi def hlLevel4 ctermfg=darkmagenta	guifg=olivedrab4
	hi def hlLevel5 ctermfg=red		guifg=green4
	hi def hlLevel6 ctermfg=darkyellow	guifg=paleturquoise3
	hi def hlLevel7 ctermfg=darkgreen	guifg=deepskyblue4
	hi def hlLevel8 ctermfg=blue	guifg=darkslateblue
	hi def hlLevel9 ctermfg=darkmagenta	guifg=darkviolet
endif

if &bg == "dark"
	hi def hlLevel0 ctermfg=red         guifg=red1
	hi def hlLevel1 ctermfg=yellow      guifg=orange1
	hi def hlLevel2 ctermfg=green       guifg=yellow1
	hi def hlLevel3 ctermfg=cyan        guifg=greenyellow
	hi def hlLevel4 ctermfg=magenta     guifg=green1
	hi def hlLevel5 ctermfg=red         guifg=springgreen1
	hi def hlLevel6 ctermfg=yellow      guifg=cyan1
	hi def hlLevel7 ctermfg=green       guifg=slateblue1
	hi def hlLevel8 ctermfg=cyan        guifg=magenta1
	hi def hlLevel9 ctermfg=magenta     guifg=purple1
else
	hi def hlLevel0 ctermfg=red         guifg=red3
	hi def hlLevel1 ctermfg=darkyellow  guifg=orangered3
	hi def hlLevel2 ctermfg=darkgreen   guifg=orange2
	hi def hlLevel3 ctermfg=blue        guifg=yellow3
	hi def hlLevel4 ctermfg=darkmagenta guifg=olivedrab4
	hi def hlLevel5 ctermfg=red         guifg=green4
	hi def hlLevel6 ctermfg=darkyellow  guifg=paleturquoise3
	hi def hlLevel7 ctermfg=darkgreen   guifg=deepskyblue4
	hi def hlLevel8 ctermfg=blue        guifg=darkslateblue
	hi def hlLevel9 ctermfg=darkmagenta guifg=darkviolet
endif
