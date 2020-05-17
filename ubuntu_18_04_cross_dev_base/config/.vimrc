" 1.options
	set number
	set cc=81
	set hls
	set history=200
	set ignorecase
	set incsearch
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set noexpandtab
"   set ff=unix
	syntax on
	
	set autoindent
	set smartindent
	set cursorline
	set ts=4
"	set expandtab
" 2.auto cmd
	"autocmd BufWritePost * call system("ctags -R")
" 3.map
	map g 1G
" 4.taglist
	let Tlist_Show_One_File=1
	let Tlist_Exit_OnlyWindow=1
	
" 5.wm
	let g:winManagerWindowLayout='FileExplorer|TagList'
	let g:bufExplorerMaxHeight=40
	"let g:defaultExplorer = 0
	nmap wm :WMToggle<cr>
" 6. Cscope
	if has("cscope")
		set csprg=/usr/bin/cscope
		set cscopequickfix=s-,c-,d-,i-,t-,e-
		set csto=0
		set cst
		set nocsverb
		" add any database in current directory
		if filereadable("cscope.out")
		    cs add cscope.out
		" else add database pointed to by environment
		elseif $CSCOPE_DB != ""
		    cs add $CSCOPE_DB
		endif
		set csverb
	endif
	nmap <C-[>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-[>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-[>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-[>d :scs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <Tab> :bn<CR>
	nmap <F8> :buffers<CR>
	:command -nargs=+ F :cs find f <args><CR>
" 7. Buffer
	let g:miniBufExplMapCTabSwitchBufs = 1
	"let g:miniBufExplorerMoreThanOne=0
" 8. c/h
	nnoremap <silent> <F12> :A<CR>
"9. auto-complete
	"filetype plugin indent on
	"set completeopt=longest,menu
