" The vimrc file.

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

" Show @@@ in the last line if it is truncated.
set display=truncate

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=a
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'liuchengxu/vista.vim'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {
            \ 'branch': 'release'
            \ }
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


if has('win32')
  set runtimepath+=~/.vim
  set shellslash
endif

if has('packages') && !has('win32unix') && !has('win32')
  packadd! matchit
endif

set hidden
set hlsearch
"set complete-=i
"set completeopt-=preview
"set completeopt+=longest
set cmdheight=2
set autoindent
set copyindent
" set softtabstop=4
set shiftwidth=4
set shiftround
set tabstop=4
set expandtab
set smarttab
set showmatch
"set bomb
"set fileencodings=ucs-bom,utf-8,ucs-2le
set fileencodings=ucs-bom,utf-8,latin1,big5
"set fileencodings=ucs-bom,utf-8,gb2312
"set fileencodings=ucs-2le
set encoding=utf-8
set termencoding=utf-8
set cinoptions=:0
set sessionoptions=blank,help,sesdir,tabpages,winsize
set updatetime=1000
set diffopt+=algorithm:patience,indent-heuristic
set title

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
"hi link CocHighlightText GruvboxBlueBold
"autocmd CursorHold * silent call CocActionAsync('highlight')

"syntax on

" Indent guide
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" vista
let g:vista_default_executive = 'coc'
let g:vista_sidebar_width = 40
nnoremap <F8> :Vista!!<CR>

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

" airline for Coc

" use error & warning count of diagnostics form coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" create a part for server status.
function! GetServerStatus()
  return get(g:, 'coc_status', '')
endfunction
call airline#parts#define_function('coc', 'GetServerStatus')
function! AirlineInit()
  let g:airline_section_a = airline#section#create(['coc'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" exclude overwrite statusline of list filetype
let g:airline_exclude_filetypes = ["list"]

" 'vim-airline/vim-airline-themes'
"let g:airline_solarized_bg='dark'
"let g:airline_theme='solarized'

" Denite/Unite
" Set the default matcher for all sources.
call denite#custom#source('_', 'matchers', ['matcher/regexp'])
"call denite#custom#source('grep', 'matchers', ['matcher/substring'])
" find all
"nnoremap <leader>fa :<C-u>Unite tab file_mru buffer<CR>
nnoremap <leader>fa :<C-u>Denite -mode=normal unite:tab file_mru<CR>
" find buffer directory
"nnoremap <leader>rb :<C-u>UniteWithBufferDir file_rec/async<CR>
" find current directory
"nnoremap <leader>fc :<C-u>Unite file<CR>
" recursive current directory
nnoremap <leader>fr :<C-u>DeniteProjectDir -mode=normal file/rec<CR>
call denite#custom#source('file/rec', 'max_candidates', 20000)
call denite#custom#source('file/rec', 'matchers', ['matcher/fuzzy'])
"nnoremap <leader>fr :<C-u>Unite file_rec/async<CR>
" git find
"nnoremap <leader>rg :<C-u>Unite file_rec/git<CR>
" find file
nnoremap <leader>ff :<C-u>Unite find<CR>
" grep
nnoremap <leader>gr :<C-u>DeniteProjectDir -mode=normal grep<CR>
call denite#custom#source('grep', 'converters', ['converter/abbr_word'])
call denite#custom#source('grep', 'max_candidates', 10000)
call denite#custom#source('grep', 'sorters', ['sorter/word'])
"nnoremap <leader>gr :<C-u>Unite grep -no-quit<CR>
" line for searching
nnoremap <leader>/ :<C-u>Denite -post-action=suspend line<CR>
"nnoremap <leader>/ :<C-u>Unite line -start-insert -no-quit<CR>
" jump
"nnoremap <leader>j :<C-u>Denite jump<CR>

" coc reference and definition
"nmap <leader>jd <Plug>(coc-definition)
"nmap <leader>ji <Plug>(coc-implementation)
"nmap <leader>jt <Plug>(coc-type-definition)
"nmap <leader>jr <Plug>(coc-references)
nnoremap <leader>jd :<C-u>call CocActionAsync('jumpDefinition',v:false)<cr>
nnoremap <leader>ji :<C-u>call CocActionAsync('jumpImplementation',v:false)<cr>
nnoremap <leader>jt :<C-u>call CocActionAsync('jumpTypeDefinition',v:false)<cr>
nnoremap <leader>jr :<C-u>call CocActionAsync('jumpReferences',v:false)<cr>
nnoremap <leader>ws :<C-u>CocList symbols<cr>

" show documentation in preview window
nnoremap <silent> <leader>xk :call CocActionAsync('doHover')<cr>

" Register ccls C++ lanuage server.
"let g:lsp_log_file = 'vim-lsp.log'
"let g:lsp_log_verbose = 1
if executable('ccls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'ccls',
    \ 'cmd': {server_info->['ccls']},
    \ 'root_uri': {
    \   server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(
    \     lsp#utils#get_buffer_path(),
    \     ['compile_commands.json', '.git/']
    \   ))
    \ },
    \ 'initialization_options': {
    \   'cache': {
    \     'directory': '.ccls-cache-lsp',
    \     'format': 'json',
    \     'hierarchicalPath': v:false,
    \     'retainInMemory': 1
    \   },
    \   'clang': {
    \     'excludeArgs': [
    \       '-mthumb-interwork',
    \       '-MF*'
    \     ],
    \     'extraArgs': [
    \       '-target arm-eabi',
    \       '--undefine-macro=__arm'
    \     ],
    \   },
    \   'highlight': {
    \     'lsRanges': v:true
    \   },
    \   'index': {
    \       'initialNoLinkage': v:true
    \   },
    \   'request': {
    \     'timeout': 5000
    \   },
    \   'workspaceSymbol': {
    \     'caseSensitivity': 1,
    \     'maxNum': 10000,
    \     'sort': v:true
    \   },
    \   'xref': {
    \     'maxNum': 20000
    \   }
    \ },
    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
    \ })

  " bases
  nnoremap <leader>xb :call CocLocations('ccls','$ccls/inheritance')<cr>
  " bases of up to 3 levels
  nnoremap <leader>xb :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
  " derived
  nnoremap <leader>xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
  " derived of up to 3 levels
  nnoremap <leader>xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

  " caller
  nnoremap <leader>xc :call CocLocations('ccls','$ccls/call')<cr>
  " callee
  nnoremap <leader>xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

  " $ccls/member
  " member variables / variables in a namespace
  nnoremap <leader>xm :call CocLocations('ccls','$ccls/member')<cr>
  " member functions / functions in a namespace
  nnoremap <leader>xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
  " nested classes / types in a namespace
  nnoremap <leader>xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

  nnoremap <leader>xv :call CocLocations('ccls','$ccls/vars')<cr>
  nnoremap <leader>xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>
endif

if executable('rg')
  " Ripgrep command on grep source
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--follow', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
elseif executable('ag')
  " Ag command on grep source
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--follow'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  "call denite#custom#source('grep', 'args', ['', '!', '!'])
endif

if executable('ag')
  " Change file/rec command.
  call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

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


" Only do this part when compiled with support for autocommands.
if has("autocmd")

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
