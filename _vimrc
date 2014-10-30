"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Personal VIMRC Settings. Might not work on other versions.
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"#######################################################################################################
"Note - The mydiff function was not working and is hence removed.
"Better method given below:
"Download the GnuWin32 diff package from
"http://gnuwin32.sourceforge.net/packages/diffutils.htm (select Complete package, except sources Setup).   
"Then install it in a suitable location such as C:\Users\username\vim\ 
"Once done, add the following to the PATH under System Variables - C:\Users\username\vim\vim74;C:\Users\username\vim\GnuWin32\bin
"The first part lets you run vim/gvim from command prompt, and the second part makes the binaries in the GnuWin32 folder visible 
"to the OS.
"#######################################################################################################

"Make vim not compatible with Vi
set nocompatible

"source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"Filetype and pathogen settings
execute pathogen#infect()
syntax on
filetype plugin indent on
set nu
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
set autoindent
set smartindent
set ruler
set vb
set noerrorbells
set noshowmode 
set showcmd
set mouse=a
set history=1000
set undolevels=1000
set wildmenu
set backspace=2
set backspace=indent,eol,start
set autochdir
"important settings for line wrapping
"do not remove these two lines below.
set textwidth=170
set formatoptions-=t
"important settings for line wrapping
"do not remove these two lines above.

"NEVER EVER SET nowrap. It will mess things up.
"

"Damian Conway's plugins - does not seem to work with Centos (7.2) vim.
"Make the color column visible only when the line actually crosses over.
"Keep mum otherwise.
set colorcolumn=0
call matchadd('ColorColumn', '\%81v', 100)

"set encodings
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
scriptencoding utf-8

"------------------
"Personal Mappings
let mapleader = "-"
let localmapleader = "\\" 
"Move lines down
nnoremap <leader> ddp
"Move lines up
nnoremap _ ddkP
inoremap jk <esc>
"------------------
iabbrev recieve receive
iabbrev percieve perceive
iabbrev clariion CLARiiON
iabbrev vmax Symmetrix VMAX
iabbrev serail Serial No:

"Set swap, backup and undo directories.
"NOTE - You have to create these yourself. Vim will NOT create them automatically.
"Set swapfiles directory
set directory=%HOMEPATH%\\vim\\vimswap//

"Set backup files directory
set backupdir=%HOMEPATH%\\vim\\vimbkup//

"Set undo directory
set undodir=%HOMEPATH%\\vim\\vimundo//

"Set listchars for a few things
set listchars=tab:>>

"Set command to clear registers.
function! ClearRegisters()
	let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
	let i=0
	while (i<strlen(regs))
		exec 'let @'.regs[i].'=""'
		let i=i+1
	endwhile
endfunction
"end of function to clear registers
command! ClearRegisters call ClearRegisters()
"Set $ to appear when you choose cw etc.
set cpoptions+=$

"Set Virtual Edit 
"This lets you move around a lot better.
"set virtualedit=all 

"Following key map shows/removes search match highlight when <F3> is pressed.
nnoremap <F3> :set hlsearch!<CR>

nnoremap <F8> :NeoComplCacheEnable<CR>

"Search visually selected text"
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy/<C-R><C-R>=substitute(
			\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy?<C-R><C-R>=substitute(
			\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>    


"Painful setting forcing you to use h j k l only in NORMAL Mode"
no <Down> <Nop>
no <Up> <Nop>
no <left> <Nop>
no <Right> <Nop>

"Painful settings disabling the arrow keys in INSERT mode" 
ino <Down> <Nop>
ino <Up> <Nop>
ino <left> <Nop>
ino <Right> <Nop>
"Disable Menu, Scroll and Title Bar
"set guioptions=M
"set guioptions-=T
set guioptions-=r

"Colorschemes/status lines etc.
set t_Co=512
set background=light
colorscheme lucius

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [File\ Type=%Y]\ [Line=%l,\ Char=%v]\ [%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ [Buffer#\ %-1.3n]
set guifont=Consolas\ for\ Powerline\ FixedD:h11

set laststatus=2

"Syntastic Settings 
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_check_on_open=1
let g:syntastic_enable_balloons=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_highlighting=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_enable_perl_checker=1
let g:syntastic_perl_lib_path=['C:\Strawberry\perl\lib']
let g:syntastic_perl_checkers=['perl']
let g:syntastic_aggregate_errors=1
let g:syntastic_id_checkers=1
let g:syntastic_python_checkers=['python', 'pyflakes']
"Enable below in case you want the error line highlighted
"highlight SyntasticErrorLine guibg=#6D6968 
"highlight SyntasticWarningLine guibg=#6D6968 
"Sytanstic Error Signs"
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol="Ē"
let g:syntastic_warning_symbol="Ŵ"
"End of Syntastic Settings

"NeoComplCache Settings
"cd ~/.vim/bundle;git clone -https://github.com/Shougo/neocomplcache.vim 

let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 0
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"====================
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
"cd ~/.vim/bundle; git clone  https://github.com/c9s/perlomni.vim

" old vim-powerline symbols
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline_section_b = '⭠'
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.warning = 'ψ'

