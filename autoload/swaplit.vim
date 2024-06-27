" autoload/swaplit.vim

let s:original_statuslines = {}

function! swaplit#Swaplit(...)
	" Display split numbers
	let l:args = a:000
	if len(l:args) == 0
		for i in range(1, winnr('$'))
			let s:original_statuslines[i] = getwinvar(i, '&statusline')
			call setwinvar(i, '&statusline', 'Split '.i)
		endfor
		redraw

		" Schedule to close the display after 3 seconds
		call timer_start(3000, 'swaplit#RestoreSplitNumbers')
	elseif len(l:args) == 2
		let l:split1 = l:args[0]
		let l:split2 = l:args[1]
		if l:split1 <= l:split2
			call swaplit#SwapSplits(l:split1, l:split2+1)
		else
			call swaplit#SwapSplits(l:split2, l:split1+1)
		endif
	else
		echo "Invalid number of arguments"
	endif
endfunction

function! swaplit#RestoreSplitNumbers(timer)
	" Restore the split status lines
	for i in range(1, winnr('$'))
		if has_key(s:original_statuslines, i)
			call setwinvar(i, '&statusline', s:original_statuslines[i])
		endif
	endfor
	redraw
endfunction

function! swaplit#SwapSplits(split1, split2)
	" Get the buffer numbers of the splits
	let l:buf1 = winbufnr(a:split1)
	" Get the window positions
	let l:win1 = win_getid(a:split1)

	" Create temporary splits to preserve dimensions
	execute a:split1 . 'wincmd w'
	execute 'vnew'
	let l:temp1 = win_getid()
	execute 'buffer ' . l:buf1

	let l:buf2 = winbufnr(a:split2)
	let l:win2 = win_getid(a:split2)

	" Swap the buffers
	call win_gotoid(l:temp1)
	execute 'buffer ' . l:buf2

	call win_gotoid(l:win2)
	execute 'buffer ' . l:buf1

	" Restore the original splits
	let l:win3 = win_getid(a:split1+1)
	call win_gotoid(l:win3)
	execute 'close'
endfunction
