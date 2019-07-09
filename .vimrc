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

"dein Scripts-----------------------------

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "Plugin 'gtags.vim'
  "Plugin 'hewes/unite-gtags'
  call dein#add('jackguo380/vim-lsp-cxx-highlight', {
              \ 'merged': 0
              \ })
  "if has('lua')
  "  call dein#add('jeaye/color_coded', {
  "            \ 'merged': 0
  "            \ })
  "endif
  call dein#add('liuchengxu/vista.vim', {
              \ 'merged': 0
              \ })
  "Plugin 'lyuts/vim-rtags'
  call dein#add('majutsushi/tagbar')
  call dein#add('morhetz/gruvbox')
  "Plugin 'nathanaelkane/vim-indent-guides'
  call dein#add('neoclide/coc.nvim', {
              \ 'merged': 0,
              \ 'build': './install.sh nightly'
              \ })
  call dein#add('powerman/vim-plugin-AnsiEsc', {
              \ 'merged': 0
              \ })
  call dein#add('prabirshrestha/async.vim', {
              \ 'merged': 0
              \ })
  call dein#add('prabirshrestha/vim-lsp', {
              \ 'merged': 0
              \ })
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
  "if !has('win32unix') && !has('win32')
  "  Plugin 'Valloric/YouCompleteMe'
  "endif
  call dein#add('Shougo/denite.nvim', {
              \ 'merged': 0
              \ })
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/unite.vim', {
              \ 'merged': 0
              \ })
  "call dein#add('Shougo/vimproc.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

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
set completeopt-=preview
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

" gtags reference and definition
"nnoremap <leader>c :<C-u>Unite gtags/context<CR>
"nnoremap <leader>nqc :<C-u>Unite gtags/context -no-quit<CR>
"nnoremap <leader>d :<C-u>Unite gtags/def<CR>
"nnoremap <leader>nqd :<C-u>Unite gtags/def -no-quit<CR>
"nnoremap <leader>ggr :<C-u>Unite gtags/grep<CR>

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
nnoremap <leader>xk :call CocActionAsync('doHover')<cr>

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
