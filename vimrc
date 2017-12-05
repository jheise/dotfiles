"----- pridkett's .vimrc file
"----- designed for vim 5.3
"----- october 10th, 1998

"----- all of this stuff should also be performed
"----- remember to include it in your .Xdefaults file
"----- it requires the pixmap slate.xpm for the menus

" Vim*useSchemes: all
" Vim*sgiMode: true
" Vim*useEnhancedFSB: true
" Vim*foreground: Wheat
" Vim*background: #000020
" Vim*menuBar*backgroundPixmap: ~/graphics/slate.xpm
" Vim*menuForeground: Wheat
" Vim*menuBackground: #2f4f4f
" Vim*scrollbarWidth: 12
" Vim*scrollForeground: #3f6262
" Vim*scrollBackground: #2f4f4f
" Vim*font: fixed



"----- set up the stuff for color highlighing in an xterm
"if &term =~ "xterm"
 if has("terminfo")
  set t_Co=16
  set t_Sf=[3%p1%dm
  set t_Sb=[4%p1%dm
  set t_vb=
 else
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
  set t_vb=
 endif
"endif

"----- only turn on syntax highlighting of there are more than one color
	syntax on
"----- don't don't out in insert mode
set noinsertmode
"----- allow us to backspace before an insert
set backspace=2
"---- spaces, not tabs
set expandtab
"----- tabs are to be set at 4 spaces
set tabstop=4
"----- set shift witdh to be 4 spaces
set sw=4
"----- show the ruler for editing
set ruler
"----- turn off the mouse in the xterm
set mouse=
"----- show the command in the status line
set showcmd
"----- you need digraphs for uumlauts
" set digraph
"

set autoindent"----- always have a status line
set laststatus=2

"----- have java highlight our functions
let java_highlight_functions=1

"------ this clears out the old colors before we begin
highlight Constant    NONE
highlight Delimiter   NONE
highlight Directory   NONE
highlight Error       NONE
highlight ErrorMsg    NONE
highlight Identifier  NONE
highlight LineNr      NONE
highlight ModeMsg     NONE
highlight MoreMsg     NONE
highlight Normal      NONE
highlight NonText     NONE
highlight PreProc     NONE
highlight Question    NONE
highlight Search      NONE
highlight Special     NONE
highlight SpecialKey  NONE
highlight Statement   NONE
highlight StatusLine  NONE
highlight Title       NONE
highlight Todo        NONE
highlight Type        NONE
highlight Visual      NONE
highlight WarningMsg  NONE
"----- these are the new superior colors
"highlight Comment     term=bold ctermfg=5 ctermbg=0 guifg=#FF005F guibg=gray
highlight Comment     term=bold ctermfg=5 guifg=#FF005F guibg=gray
highlight Constant    term=underline ctermfg=6 guifg=#FF2f8f
highlight Delimiter   term=bold cterm=bold ctermfg=1 gui=bold guifg=Red
highlight Directory   term=bold ctermfg=DarkBlue guifg=Blue
highlight Error       term=standout cterm=bold ctermbg=1 ctermfg=1 gui=bold guifg=red
highlight ErrorMsg    term=standout cterm=bold ctermfg=1 gui=bold guifg=red
highlight Identifier  term=underline ctermfg=3 guifg=yellow3
highlight LineNr      term=underline cterm=bold ctermfg=3 guifg=Brown
highlight ModeMsg     term=bold cterm=bold ctermfg=3 ctermbg=1 guifg=yellow2 guibg=red
highlight MoreMsg     term=bold cterm=bold ctermfg=2 gui=bold guifg=Green
highlight NonText     term=bold ctermfg=2 guifg=green3
"highlight Normal      ctermfg=white ctermbg=black guifg=white guibg=black
highlight Normal      ctermfg=white guifg=white
highlight PreProc     term=underline ctermfg=14 guifg=cyan
highlight Question    term=standout cterm=bold ctermfg=2 gui=bold guifg=Green
highlight Search      term=reverse ctermbg=2 guibg=Yellow
highlight Special     term=bold ctermfg=5 guifg=SlateBlue
highlight SpecialKey  term=bold ctermfg=DarkBlue guifg=Blue
highlight Statement   term=bold ctermfg=2 gui=bold guifg=green3
highlight StatusLine  term=reverse cterm=bold ctermfg=3 ctermbg=4 guifg=wheat guibg=#2f4f4f
highlight StatusLineNC term=bold ctermfg=3 ctermbg=2 guifg=#071f1f guibg=#5f9f9f
highlight Title       term=bold cterm=bold ctermfg=4 gui=bold guifg=Blue
highlight Todo        term=bold ctermfg=red ctermbg=yellow guifg=red guibg=yellow1 gui=bold
highlight Type        term=underline cterm=bold ctermfg=3 guifg=yellow3 gui=bold
highlight Visual      term=reverse cterm=bold ctermfg=6 ctermbg=5 guifg=yellow guibg=blue
highlight WarningMsg  term=standout cterm=bold ctermfg=1 ctermbg=4 guifg=Red
" turn on highlighting for whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"match ExtraWhitespace /\s\+$\| \+\ze\t/
"match ExtraWhitespace /[^\t]\zs\t\+/
"match ExtraWhitespace /^\t*\zs \+/

":match
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

"edit my .vimrc file
map ,v :e ~/.vimrc
"update the system settings from my vimrc file
map ,u :source ~/.vimrc

"----- test the auto commands
" set verbose=9

"----- change make so it runs javac when we have java programs being edited
autocmd BufRead BufNewFile *.java set makeprg=javac\ %
"----- set up the error format for vim, this works for javac
autocmd BufRead BufNewFile *.java set errorformat=\"%f\"\\\,\ line\ %l.%c:%m\,\ %f:%l:%m
"----- make it recognize tcsh resource files
autocmd BufReadPost *tcshrc* source $VIM/syntax/csh.vim
"----- also make sure it knows mlvwm resource files
autocmd BufReadPost *mlvwmrc* source $VIM/syntax/mlvwm.vim
"------ all of this stuff allows me to write gzipped files natively...cool eh?
autocmd BufRead *.gz set bin|%!gunzip
autocmd BufRead *.gz set nobin
autocmd BufWritePre *.gz %!gzip
autocmd BufWritePre *.gz set bin
autocmd BufWritePost *.gz undo|set nobin
autocmd FileReadPost *.gz set bin|'[,']!gunzip
autocmd FileReadPost set nobin
" autocmd BufNewFile,BufRead *.pp set filetype=puppet

"----- instructions for VIM on processing this file
" vim:ts=3
"source ~/.vim/plugin/puppet.vim
"source ~/.vim/plugin/snipMate.vim

"turn on snipMate
":filetype plugin on

"call pathogen#infect()
" setup neobundle
"if &compatible
"    set nocompatible
"endif

"set runtimepath+=~/.vim/bundle/neobundle.vim/

"call neobundle#begin(expand('~/.vim/bundle/'))
"NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'fatih/vim-go'
"NeoBundle 'vim-syntastic/syntastic'
"NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'tpope/commentary'
"call neobundle#end()
"filetype plugin indent on
"NeoBundleCheck
"let g:neobundle#types#git#default_protocol = 'git'

"---- start vimplug
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'Valloric/YouCompleteMe'
" Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"--- rebind control-c
map <C-c> gcc <CR>
vmap <C-c> gc

"--- airline
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
