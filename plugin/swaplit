" plugin/swaplit.vim

if exists('g:loaded_swaplit')
	finish
endif
let g:loaded_swaplit = 1
  
" Load the autoload functions
runtime autoload/swaplit.vim

" Define a command to display split numbers and swap splits
command! -nargs=* Swaplit call swaplit#Swaplit(<f-args>)
