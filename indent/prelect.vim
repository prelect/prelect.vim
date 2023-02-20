setlocal nolisp
setlocal autoindent
setlocal indentexpr=PrelectIndent(v:lnum)

function! PrelectIndent(lnum)
	let prevlnum = prevnonblank(a:lnum-1)
	if prevlnum == 0
		" top of file
		return 0
	endif

	" grab the previous and current line, stripping comments.
	let prevl = substitute(getline(prevlnum), '//.*$', '', '')
	let thisl = substitute(getline(a:lnum), '//.*$', '', '')
	let previ = indent(prevlnum)

	let prevlnum = prevnonblank(v:lnum - 1) " Get number of last non-blank line
	let ind = previ

	if prevl =~ '[({]\s*$'
		" previous line opened a block
		let ind += shiftwidth()
	endif

	if thisl =~ '^\s*[)}]'
		" this line closed a block
		let ind -= shiftwidth()
	endif

	return ind
endfunction
