" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

if has('win32')
  set runtimepath+=~/.vim
  set shellslash
endif

"
" vundle begin
"
filetype off

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'airblade/vim-gitgutter'
"Plugin 'hari-rangarajan/CCTree'
Plugin 'gtags.vim'
Plugin 'hewes/unite-gtags'
if has('lua')
  Plugin 'jeaye/color_coded'
endif
Plugin 'lyuts/vim-rtags'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'nathanaelkane/vim-indent-guides'
if !has('win32unix') && !has('win32')
  Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'gerw/vim-HiLinkTrace'



" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" vundle end
"

if has('packages') && !has('win32unix') && !has('win32')
  packadd! matchit
endif

" allow backspacing over everything in insert mode
"set backspace=indent,eol,start

" if has("vms")
"   set nobackup	" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file
" endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch
"set complete-=i
set completeopt-=preview
"set completeopt+=longest
" set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
"set wildmenu
"set bomb
"set fileencodings=ucs-bom,utf-8,ucs-2le
set fileencodings=ucs-bom,utf-8,latin1,big5
"set fileencodings=ucs-bom,utf-8,gb2312
"set fileencodings=ucs-2le
set encoding=utf-8
set termencoding=utf-8
set cinoptions=:0
set mouse=nvc
set sessionoptions=blank,help,sesdir,tabpages,winsize
set updatetime=1000

if has("gui_running")
  set guioptions+=a
  " No menu bar
  set guioptions-=m
  " No toolbar
  set guioptions-=T
  set guifont=Courier_New:h10:cANSI
  set guitablabel=%{GuiTabLabel()}
  set guitabtooltip=%F
endif

" ctags files including.
" set tags+=$PWD/tags
"set tags+=~/ctags/ms_sdk_win_v71_inc.tags

" Additional include pathes.
"set path+=~/projects/uniform_module_test/common/include

" set colorscheme
"colorscheme shefiro
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

syntax on

" Indent guide
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" cscope
if executable('gtags-cscope')
  set cscopetag
  set cscopeprg=gtags-cscope
endif

if filereadable('GTAGS')
  cscope add GTAGS
endif
if filereadable('../GTAGS')
  cscope add ../GTAGS
endif

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <F8> :TagbarToggle<CR>


" 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

let g:airline_extensions = [ 'branch', 'tabline', 'tagbar' ]

let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ 't'  : 'T',
            \ }

" Custom tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'

" 'vim-airline/vim-airline-themes'
"let g:airline_solarized_bg='dark'
"let g:airline_theme='solarized'

" Unite
" find all
nnoremap <leader>fa :<C-u>Unite tab file_mru buffer<CR>
" find buffer directory
"nnoremap <leader>rb :<C-u>UniteWithBufferDir file_rec/async<CR>
" find current directory
nnoremap <leader>fc :<C-u>Unite file<CR>
" recursive current directory
"nnoremap <leader>rc :<C-u>Unite file_rec/async<CR>
" git find
nnoremap <leader>rg :<C-u>Unite file_rec/git<CR>
" find file
nnoremap <leader>ff :<C-u>Unite find<CR>
" grep
nnoremap <leader>gr :<C-u>Unite grep -no-quit<CR>
" gtags reference and definition
nnoremap <leader>c :<C-u>Unite gtags/context<CR> 
nnoremap <leader>nqc :<C-u>Unite gtags/context -no-quit<CR> 
nnoremap <leader>d :<C-u>Unite gtags/def<CR> 
nnoremap <leader>nqd :<C-u>Unite gtags/def -no-quit<CR> 
nnoremap <leader>ggr :<C-u>Unite gtags/grep<CR> 
" rtags
let g:rtagsUseDefaultMappings = 0
noremap <Leader>ri :call rtags#SymbolInfo()<CR>
"noremap <Leader>rj :call rtags#JumpTo(g:SAME_WINDOW)<CR>
"noremap <Leader>rJ :call rtags#JumpTo(g:SAME_WINDOW, { '--declaration-only' : '' })<CR>
noremap <Leader>rS :call rtags#JumpTo(g:H_SPLIT)<CR>
noremap <Leader>rV :call rtags#JumpTo(g:V_SPLIT)<CR>
noremap <Leader>rT :call rtags#JumpTo(g:NEW_TAB)<CR>
noremap <Leader>rp :call rtags#JumpToParent()<CR>
"noremap <Leader>rf :call rtags#FindRefs()<CR>
noremap <Leader>rF :call rtags#FindRefsCallTree()<CR>
noremap <Leader>rn :call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
"noremap <Leader>rs :call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <Leader>rr :call rtags#ReindexFile()<CR>
"noremap <Leader>rl :call rtags#ProjectList()<CR>
noremap <Leader>rw :call rtags#RenameSymbolUnderCursor()<CR>
noremap <Leader>rv :call rtags#FindVirtuals()<CR>
noremap <Leader>rb :call rtags#JumpBack()<CR>
noremap <Leader>rC :call rtags#FindSuperClasses()<CR>
noremap <Leader>rc :call rtags#FindSubClasses()<CR>
noremap <Leader>rd :call rtags#Diagnostics()<CR>
nnoremap <leader>rf :<C-u>Unite rtags/references<CR> 
nnoremap <leader>nqrf :<C-u>Unite rtags/references -no-quit<CR> 
nnoremap <leader>rs :<C-u>Unite rtags/symbol<CR> 
nnoremap <leader>nqrs :<C-u>Unite rtags/symbol -no-quit<CR> 
nnoremap <leader>rl :<C-u>Unite rtags/project<CR> 
nnoremap <leader>rj :<C-u>Unite rtags/definitions<CR> 
nnoremap <leader>rJ :<C-u>Unite rtags/declarations<CR> 
if has("autocmd")
  autocmd FileType python nnoremap <buffer> <leader>rj :<C-u>YcmCompleter GoTo<CR> 
  autocmd FileType python nnoremap <buffer> <leader>rf :<C-u>YcmCompleter GoToReferences<CR> 
endif " has("autocmd")
" line for searching
nnoremap <leader>/ :<C-u>Unite line -start-insert -no-quit<CR> 

if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden --case-sensitive'
  let g:unite_source_grep_recursive_opt=''
  let g:unite_source_rec_async_command=[ 'ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '' ]
  "let g:unite_source_find_command='ag'
  "let g:unite_source_find_default_opts='--follow --nocolor --nogroup --hidden'
  "let g:unite_source_find_default_expr='-g ""'
endif

if executable('find')
  let g:unite_source_find_default_opts='-L'
  if has('win32')
    let g:unite_source_find_default_expr="-name \"'*'\""
  else
    let g:unite_source_find_default_expr="-name '*'"
  endif
endif

if executable('gtags-cscope')
  " specify your project path as key.
  " '_' in key means default configuration.
  let g:unite_source_gtags_project_config = {
\   '_': {
\     'treelize': 0
\   },
\ }
  "let g:unite_source_gtags_project_config = {
\   '_': {
\     'treelize': 0
\   },
\   '/home/sid/repo_wiced/staging/Wiced-SDK/20719-B1_Bluetooth_Disable/': {
\     'treelize': 0,
\     'through_all_tags': 1,
\     'gtags_libpath': [
\       '/home/sid/repo_wiced/staging/Wiced-SDK/common/apps/',
\       '/home/sid/repo_wiced/staging/Wiced-SDK/common/include/',
\       '/home/sid/repo_wiced/staging/Wiced-SDK/common/libraries/',
\     ]
\   },
\   '/home/sid/repo_wiced/staging/Wiced-SDK/20739-B1_Bluetooth_ZigBee/': {
\     'treelize': 0,
\     'gtags_libpath': [
\       '/home/sid/repo_wiced/staging/Wiced-SDK/common/include/'
\     ]
\   },
\   '/home/sid/repo_wiced/staging/Wiced-SDK/common/client_control/source/': {
\     'treelize': 0,
\     'gtags_libpath': [
\       '/home/sid/repo_wiced/staging/Wiced-SDK/common/include/'
\     ]
\   }
\ }
  "let g:unite_source_gtags_project_config['/home/sid/repo_wiced/staging/Wiced-SDK/common/client_control/source'] = {
\   'gtags_libpath': ['/usr/include/', '/home/foo/include/']
\   }
endif

" tagbar
let g:tagbar_sort = 0
"let g:tagbar_show_linenumbers = 2


" Mapping

" Shell style command-line editing.
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" Match current command-line from the history.
"cnoremap <C-P> <UP>
"cnoremap <C-N> <DOWN>

" Tab page
set tabpagemax=39
set showtabline=2	" Always show the tab line.
nnoremap <silent> <C-N> :tabn<CR>
nnoremap <silent> <C-P> :tabp<CR>
nnoremap :te :tabe


" Options for YouCompleteMe
" Uncomment to disable YouCompleteMe
"let g:loaded_youcompleteme = 1
if exists('g:loaded_youcompleteme') == 0
"    let g:ycm_python_binary_path = '/mingw64/bin/python2'
"    let g:ycm_path_to_python_interpreter = '/mingw64/bin/python2'
"  let g:ycm_always_populate_location_list = 1
"  let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_confirm_extra_conf = 0
  let g:ycm_complete_in_comments = 1
  let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
endif


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
"map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType xml setlocal ts=2 sw=2
  autocmd FileType xsd setlocal ts=2 sw=2

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

  " autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  " autocmd InsertLeave * if pumvisible() == 0|pclose|endif

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set laststatus=2
if has("statusline")
  set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}%k%y\ %-14.(%l/%L,%c%V%)\ %P
endif " has("statusline")

" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''

  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor

  " Append the tab number
  let label .= v:lnum . ' '

  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name, ":.")
  endif
  let label .= name

  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  if (wincount > 1)
      let label .= ' ' . wincount
  endif

  return label
endfunction
