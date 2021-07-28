source ~/.vimrc.settings
source ~/.vimrc.keymap

"--------------------------------------
" set encoding, line feed
"--------------------------------------
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp,ucs-bom,latin1
"if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
"    set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp,ucs-bom,latin1
"endif
set fileformats=unix,dos,mac

"--------------------------------------
" vimdiff's color
"--------------------------------------
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

"--------------------------------------
"
"--------------------------------------
set history=200
set mouse=n

"--------------------------------------
" undo option
"--------------------------------------
if has('persistent_undo')
  set undodir=./.vimundo,~/.vim/vimundo
  set undofile
  "set undodir=./.vimundo,~/.vimundo
  "augroup vimrc-undofile
  "  autocmd!
  "  autocmd BufReadPre ~/* setlocal undofile
  "augroup END
endif

"--------------------------------------
" script's make command
"--------------------------------------
"autocmd BufRead,BufNewFile *.sh setfiletype bash
autocmd Filetype sh setlocal makeprg=bash\ %
autocmd BufRead,BufNewFile *.py setfiletype python
autocmd Filetype python setlocal makeprg=python3\ %
autocmd BufRead,BufNewFile *.d setfiletype d
autocmd Filetype d setlocal makeprg=rdmd\ -unittest\ %
autocmd BufRead,BufNewFile *.lisp setfiletype lisp
autocmd Filetype lisp setlocal makeprg=clisp\ %
autocmd BufRead,BufNewFile *.hs setfiletype haskell
autocmd Filetype haskell setlocal makeprg=runghc.sh\ %
autocmd BufRead,BufNewFile *.java setfiletype java
autocmd Filetype java setlocal makeprg=runjava.sh\ %
autocmd BufRead,BufNewFile *.html setfiletype html
autocmd BufRead,BufNewFile *.js setfiletype javascript
autocmd BufRead,BufNewFile *.rs setfiletype rust
autocmd Filetype rust setlocal makeprg=cargo\ run

"--------------------------------------
" Set colorscheme
"--------------------------------------
"highlight NonText guibg=none guifg=LightMagenta
"highlight SpecialKey guibg=none guifg=LightMagenta
"highlight Search guibg=none guifg='NONE'
"set cursorline
"highlight Normal term=none cterm=none ctermbg=white ctermfg=black
"highlight StatusLine term=none cterm=none ctermfg=black ctermbg=gray
"highlight CursorLine term=none cterm=none ctermfg=black ctermbg=lightgray
"highlight Comment ctermfg=LightCyan


"--------------------------------------
" Writing vim command
"   :read !ls /usr/share/vim/vim74/colors/ | sed 's/ +/\n/g' | awk -F'.' '/.*\.vim/{print "\"colorscheme " $1}'
colorscheme badwolf
"colorscheme goodwolf
"colorscheme twilight
"colorscheme molokai
"colorscheme desert

"--------------------------------------
"
"--------------------------------------
set wildmenu wildmode=list:full
syntax on


set nocompatible	" Use Vim defaults (much better!)
set backspace=indent,eol,start		" allow backspacing over everything in insert mode


set backup		" keep a backup file
set backupdir=~/bak


set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=200		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

"" Only do this part when compiled with support for autocommands
"if has("autocmd")
"  augroup redhat
"  autocmd!
"  " In text files, always limit the width of text to 78 characters
"  autocmd BufRead *.txt set tw=78
"  " When editing a file, always jump to the last cursor position
"  autocmd BufReadPost *
"  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
"  \   exe "normal! g'\"" |
"  \ endif
"  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
"  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
"  " start with spec file template
"  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
"  augroup END
"endif
"if has("cscope") && filereadable("/usr/bin/cscope")
"   set csprg=/usr/bin/cscope
"   set csto=0
"   set cst
"   set nocsverb
"   " add any database in current directory
"   if filereadable("cscope.out")
"      cs add cscope.out
"   " else add database pointed to by environment
"   elseif $CSCOPE_DB != ""
"      cs add $CSCOPE_DB
"   endif
"   set csverb
"endif

"" Switch syntax highlighting on, when the terminal has colors
"" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
"endif

filetype plugin on
"filetype plugin indent on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

"--------------------------------------
" swap file
"--------------------------------------
augroup swapchoice-readonly
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
augroup END

"--------------------------------------
" display
"--------------------------------------
set pumheight=10

"--------------------------------------
" Key mapping
"--------------------------------------
imap <Nul> <C-p>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <c-@>o :silent .w !xargs cygstart_file_path.sh<CR>
nnoremap <c-@>r :.w !bash<CR>
nnoremap <C-@>@ :make!<CR>
nnoremap <C-@>ma :make! all<CR>

"--------------------------------------
" neobundle
"--------------------------------------
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

NeoBundle 'easymotion/vim-easymotion'

call neobundle#end()

