syntax match prelectSpecial	/,/
syntax match prelectSpecial	/</
syntax match prelectSpecial	/>/
syntax match prelectSpecial	/{/
syntax match prelectSpecial	/}/
syntax match prelectSpecial	/\[/
syntax match prelectSpecial	/\]/
syntax match prelectSpecial	/\v\(/
syntax match prelectSpecial	/\v\)/

syntax match prelectSpecial	/->/
syntax match prelectSpecial	/<-/
syntax match prelectKeyword	/_/
syntax match prelectSpecial	/\./

syntax match prelectBoolean	/\v!!?(\()@!/

syntax match prelectNumber	/\c\<\%(\d\+\%(e[+-]\=\d\+\)\=\|0b[01]\+\|0o\o\+\|0x\%(\x\|_\)\+\)n\=\>/
syntax match prelectNumber	/\c\<\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%(e[+-]\=\d\+\)\=\>/

syntax match prelectFloat	/\c\<\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%(e[+-]\=\d\+\)\=\>/

syntax match prelectType	/\v\@[a-zA-Z][a-zA-Z0-9_]*>(\s*\()@!/
syntax match prelectType	/\v(\<\s*)@<=(\&|##|#|\$)(\s*\>\s*(\{|\())@=/
syntax match prelectType	/\v(\<\s*)@<!(\&|##|#|\$)([a-zA-Z][a-zA-Z0-9_]*>[^\(|^\{])@=/
syntax match prelectType	/@@/
syntax match prelectType	/@@@/

syntax match prelectIdentifier	/\v(\-\>\s*)@<=[a-zA-Z][a-zA-Z0-9_]*/
syntax match prelectIdentifier	/\v(\-\>\s*)@<![a-zA-Z][a-zA-Z0-9_]*>(\(|\{)@!/

syntax region prelectInterpolation	start=/\v(\\)@<!\{\{/  end=/}}/ contains=prelectIdentifier
syntax region prelectString	start=/`/  skip=/\v(\\`|\{\{)/  end=/`/ contains=prelectInterpolation

syntax match prelectFunction	/\v([a-zA-Z][a-zA-Z0-9_]*)(\()@=/

syntax match prelectConditional	/\v\|(\()@=/
syntax match prelectConditional	/\v\>\=(\()@=/
syntax match prelectConditional	/\v\>(\()@=/
syntax match prelectConditional	/\v\<\=(\()@=/
syntax match prelectConditional	/\v\<(\()@=/
syntax match prelectConditional	/\v\~(\()@=/
syntax match prelectConditional	/\v\=(\()@=/
syntax match prelectConditional	/\v\=\=(\()@=/
syntax match prelectConditional	/\v\=\=\=(\()@=/
syntax match prelectConditional	/\v\?(\()@=/

syntax match prelectOperator	/\v\$\$(\()@=/
syntax match prelectOperator	/\v\?\?(\()@=/
syntax match prelectOperator	/\v\%\%(\()@=/
syntax match prelectOperator	/\v\#\#(\()@=/
syntax match prelectOperator	/\v\@(\()@=/
syntax match prelectOperator	/\v\!(\()@=/
syntax match prelectOperator	/\v\#(\()@=/
syntax match prelectOperator	/\v\$(\()@=/
syntax match prelectOperator	/\v\^(\()@=/
syntax match prelectOperator	/\v\&\&(\()@=/
syntax match prelectOperator	/\v\&(\()@=/
syntax match prelectOperator	/\v\*\*(\()@=/
syntax match prelectOperator	/\v\*(\()@=/
syntax match prelectOperator	/\v\-\-(\()@=/
syntax match prelectOperator	/\v\-(\()@=/
syntax match prelectOperator	/\v\+\+(\()@=/
syntax match prelectOperator	/\v\+(\()@=/
syntax match prelectOperator	/\v\/(\()@=/

syntax match prelectException	/\v\>\>\>?(\()@=/
syntax match prelectException	/\v_\>(\()@=/
syntax match prelectException	/\v_\^(\()@=/
syntax match prelectException	/\v_\^\^(\()@=/
syntax match prelectException	/\v_\^\^\^(\()@=/

syntax match prelectKeyword	/\v(\s)@<=\&(\s+\w)@=/
syntax match prelectKeyword	/\v(\s)@<=\<\&(\s+\w)@=/
syntax match prelectKeyword	/\v(\s)@<=\<\&\>(\s+\w)@=/
syntax match prelectKeyword	/\v(\s)@<=\<\<\&(\s+\w)@=/
syntax match prelectKeyword	/\v(\s)@<=\&\>\>(\s+\w)@=/
syntax match prelectKeyword	/\v(\s)@<=\<\<\&\>\>(\s+\w)@=/
syntax match prelectKeyword	/\v(\s)@<=\>\&\<(\s+\w)@=/

syntax match prelectKeyword	/\v(\s)@<=\%\<\&(\s+\w)@=/
syntax match prelectKeyword	/\v(\s)@<=\%\<\&\>(\s+\w)@=/
syntax match prelectKeyword	/\v(\s)@<=\%\<\<\&(\s+\w)@=/
syntax match prelectKeyword	/\v(\s)@<=\%\&\>\>(\s+\w)@=/
syntax match prelectKeyword	/\v(\s)@<=\%\<\<\&\>\>(\s+\w)@=/
syntax match prelectKeyword	/\v(\s)@<=\%\>\&\<(\s+\w)@=/

syntax match prelectKeyword	/\v(\s)@<=\?\?(\s+)@=/
syntax match prelectKeyword	/\v(\s)@<=\&\&(\s+)@=/
syntax match prelectKeyword	/\v(\s)@<=\%\%(\s+)@=/
syntax match prelectKeyword	/\v(\s)@<=\|\|(\s+)@=/

syntax match prelectComment	/\/\/.*/
syntax region prelectComment	start=/\/\*/ end=/\*\//

highlight default link prelectSpecial	Special
highlight default link prelectBoolean	Boolean
highlight default link prelectNumber	Number
highlight default link prelectFloat	Float
highlight default link prelectType	Type
highlight default link prelectIdentifier	Identifier
highlight default link prelectInterpolation	Special
highlight default link prelectString	String

highlight default link prelectFunction	Function
highlight default link prelectConditional	Function
highlight default link prelectOperator	Function

highlight default link prelectException	Exception
highlight default link prelectKeyword	Keyword

highlight default link prelectComment	Comment
