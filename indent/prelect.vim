setlocal nolisp
setlocal indentexpr=PrelectIndent(v:lnum)

function! PrelectIndent(lnum)

	let prevlnum = prevnonblank(v:lnum - 1) " Get number of last non-blank line
	let result = 0

	if getline(prevlnum) =~ '<$'
		let result += 1 " If last line opened a block: indent one level
	endif
	if getline(v:lnum) =~ '^\s*>'
		let result -= 1 " If current line closes a block: dedent one level
	endif

	if getline(prevlnum) =~ '($'
		let result += 1 " If last line opened a block: indent one level
	endif
	if getline(v:lnum) =~ '^\s*)'
		let result -= 1 " If current line closes a block: dedent one level
	endif

	if getline(prevlnum) =~ '{$'
		let result += 1 " If last line opened a block: indent one level
	endif
	if getline(v:lnum) =~ '^\s*}'
		let result -= 1 " If current line closes a block: dedent one level
	endif

	if getline(prevlnum) =~ '\[$'
		let result += 1 " If last line opened a block: indent one level
	endif
	if getline(v:lnum) =~ '^\s*\]'
		let result -= 1 " If current line closes a block: dedent one level
	endif

	" Get indentation level of last line and add new contribution
	return (prevlnum > 0) * indent(prevlnum) + result * shiftwidth()

endfunction
