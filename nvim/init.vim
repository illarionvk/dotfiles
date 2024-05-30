set backspace=indent,eol,start    " Intuitive backspacing.

" Case-insensitive searching but case-sensitive if expression contains a capital letter.
" Highlight matches as you type.
" Highlight matches.
set ignorecase smartcase incsearch hlsearch

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

" Softtabs, 2 spaces
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

" Don't syntax color lines that are too long, to prevent slowdowns
set synmaxcol=300

" Highlight special characters
set encoding=utf-8
set list listchars=tab:»·,trail:·,nbsp:·

" Speed up things a bit
set nocursorline
set nocursorcolumn
set norelativenumber
set scrolljump=5
set ttyfast
syntax sync minlines=256

if exists('g:vscode')
  " === VSCode extension

  " Emulate vim-commentary
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

  " Quicker window movement
  nnoremap <silent> <C-j> :<C-u>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
  xnoremap <silent> <C-j> :<C-u>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
  nnoremap <silent> <C-k> :<C-u>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
  xnoremap <silent> <C-k> :<C-u>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
  nnoremap <silent> <C-h> :<C-u>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
  xnoremap <silent> <C-h> :<C-u>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
  nnoremap <silent> <C-l> :<C-u>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
  xnoremap <silent> <C-l> :<C-u>call VSCodeNotify('workbench.action.focusRightGroup')<CR>

  nnoremap <silent> <leader>f :<C-u>call VSCodeCall('editor.action.formatDocument')<CR>
  nnoremap <silent> <leader><Space> :<C-u>call VSCodeNotify('workbench.action.quickOpen')<CR>

  " Emulate vim-vinegar behavior with vscode-advanced-open-file extension
  nnoremap - :<C-u>call VSCodeNotify('extension.advancedOpenFile')<CR>
else
  " === Ordinary neovim

  " Quicker window movement
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-h> <C-w>h
  nnoremap <C-l> <C-w>l

  set wildmenu                      " Enhanced command line completion.
  set wildmode=list:longest         " Complete files like a shell.

  set number                        " Show line numbers.
  set ruler                         " Show cursor position.

  " Map <Esc> to fd
  imap fd <Esc>
endif
