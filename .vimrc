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

Plug 'gruvbox-community/gruvbox'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'junegunn/fzf', {
            \ 'dir': '~/.fzf',
            \ 'do': './install --all'
            \ }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'majutsushi/tagbar'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {
            \ 'branch': 'release'
            \ }
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'Shougo/neomru.vim'
Plug 'skywind3000/asyncrun.vim'
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
nnoremap <silent> <F8> :Vista!!<CR>

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

" asyncrun
let g:asyncrun_open = 20
noremap <silent> <F6> :AsyncRun make build<cr>
noremap <silent> <F9> :call asyncrun#quickfix_toggle(g:asyncrun_open)<cr>

" FZF
let g:fzf_history_dir = '~/.cache/fzf-history'
" find all
nnoremap <silent> <leader>fa :<C-u>Windows<CR>
" recursive current directory
nnoremap <silent> <leader>fr :<C-u>call fzf#run(fzf#wrap({'dir': g:WorkspaceFolders[-1]}))<CR>
" grep
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always '.(<bang>0 ? '--no-ignore ' : '').shellescape(<q-args>), 1,
            \   fzf#vim#with_preview({'dir': g:WorkspaceFolders[-1], 'options': []}, 'right:40%', 'f8'))
nnoremap <leader>gr :<C-u>Rg 

" line for searching
nnoremap <silent> <leader>/ :<C-u>call fzf#vim#buffer_lines({'options': ['--exact', '--no-sort', '--preview', '~/.vim/scripts/fzf-preview.sh '.expand('%').' {}']})<CR>

" coc reference and definition
nmap <silent> <F12> <Plug>(coc-definition)
"nmap <silent> <leader>ji <Plug>(coc-implementation)
"nmap <silent> <leader>jt <Plug>(coc-type-definition)
"nmap <silent> <leader>jr <Plug>(coc-references)
nnoremap <silent> <leader>jd :<C-u>call CocActionAsync('jumpDefinition',v:false)<cr>
nnoremap <silent> <leader>ji :<C-u>call CocActionAsync('jumpImplementation',v:false)<cr>
nnoremap <silent> <leader>jt :<C-u>call CocActionAsync('jumpTypeDefinition',v:false)<cr>
nnoremap <silent> <leader>jr :<C-u>call CocActionAsync('jumpReferences',v:false)<cr>
nnoremap <silent> <leader>ws :<C-u>CocList symbols<cr>

" show documentation in preview window
nnoremap <silent> <leader>xk :call CocActionAsync('doHover')<cr>

" trigger completion.
inoremap <silent><expr> <C-j> coc#refresh()

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
    \     'directory': '',
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
    \       'initialNoLinkage': v:true,
    \       'onChange': v:true
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
  nnoremap <silent> <leader>xb :call CocLocations('ccls','$ccls/inheritance')<cr>
  " bases of up to 3 levels
  nnoremap <silent> <leader>xb :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
  " derived
  nnoremap <silent> <leader>xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
  " derived of up to 3 levels
  nnoremap <silent> <leader>xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

  " caller
  nnoremap <silent> <leader>xc :call CocLocations('ccls','$ccls/call')<cr>
  " callee
  nnoremap <silent> <leader>xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

  " $ccls/member
  " member variables / variables in a namespace
  nnoremap <silent> <leader>xm :call CocLocations('ccls','$ccls/member')<cr>
  " member functions / functions in a namespace
  nnoremap <silent> <leader>xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
  " nested classes / types in a namespace
  nnoremap <silent> <leader>xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

  nnoremap <silent> <leader>xv :call CocLocations('ccls','$ccls/vars')<cr>
  nnoremap <silent> <leader>xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>
endif

" tagbar
let g:tagbar_sort = 0
"let g:tagbar_show_linenumbers = 2

" Shell style command-line editing.
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

" Match current command-line from the history.
cnoremap <C-P> <UP>
cnoremap <C-N> <DOWN>

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
