if !exists('*DiffW')
	function DiffW()
		let opt = ""
			if &diffopt =~ "icase"
				let opt = opt . "-i "
			endif
			if &diffopt =~ "iwhite"
				let opt = opt . "-w " " vim uses -b by default
			endif
			silent execute "!diff -a --binary " . opt .
				\ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
	endfunction
endif

function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

if !exists('*DockSendSass')
	function DockSendSass()
	  let filePath = substitute(expand("%:p"), ".scss$", ".css", "i")
	  silent exec "!sass " . expand("%:p") . " " . filePath

	  let appleScript = "-e \"on run argv\r
	    \set filePath to POSIX path of item 1 of argv\r
	    \set fileName to POSIX file filePath\r
	    \ignoring application responses\r
	      \tell app \\\"Transmit\\\" to open fileName\r
	    \end ignoring\r
	  \end run\""

	  silent exec "!osascript " . appleScript . " \"" . filePath . "\""
	  echo "File " . filePath . " sent to Transmit." 
	endfunction
endif

if !exists('*DockSendPo')
	function DockSendPo()
	  let filePath = substitute(expand("%:p"), ".po$", ".mo", "i")
	  silent exec "!msgfmt -o " . filePath . " " . expand("%:p")

	  let appleScript = "-e \"on run argv\r
	    \set filePath to POSIX path of item 1 of argv\r
	    \set fileName to POSIX file filePath\r
	    \ignoring application responses\r
	      \tell app \\\"Transmit\\\" to open fileName\r
	    \end ignoring\r
	  \end run\""

	  silent exec "!osascript " . appleScript . " \"" . filePath . "\""
	  echo "File " . filePath . " sent to Transmit." 
	endfunction
endif

if !exists('*InsertCurrentTimestamp')
	function! InsertCurrentTimestamp()
		execute "normal! a\<C-R>=strftime(\"%s\")\<CR>"
	endfunction
endif
