" Pathogen (easy Vim plugin management)
call pathogen#infect()
call pathogen#helptags()

" This must be first, because it changes other options as a side effect.
set nocompatible

" This must come before any :highlight commands to enable them to work.
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Use my preferred color scheme.
colorscheme slate

" Set desired diff colors.
highlight DiffAdd guibg=DarkGreen
highlight DiffChange guibg=DarkBlue
highlight DiffText guibg=Orange
highlight DiffDelete guibg=DarkRed

" Current line color
hi CursorLine   guibg=gray18
hi CursorColumn guibg=gray18

" Set the default font
set guifont=Monaco:h12

" Symfony 2's Twig templating framework is a port of Python's Jinja.
" So we can use Vim jinja syntax highlighting.
" Requires htmljinja plugin.
au BufRead,BufNewFile *.twig set filetype=htmljinja

set encoding=utf-8          " Necessary to show Unicode glyphs
set history=50              " Keep 50 lines of command line history
set undolevels=200          " Keep 200 undo levels in history
set ruler                   " Show the cursor position all the time
set showcmd                 " Display incomplete commands
set incsearch               " Do incremental searching
set ignorecase              " Searches should be case-insensitive by default
set wildignore+=*.svn       " Prevent vim and its plugins from ever displaying or working with SVN files.
set cursorline              " Turn on highlighting of current line.
set clipboard=unnamed       " Sets default register to be * register, which is the system clipboard. So Cmd+C and y are now the same thing; Cmd+V and p are now the same thing! Compatible with yankring.
set guicursor+=n-v:blinkon0 " Disable cursor blinking (blinkon0) in normal (n) and visual (v) modes, but not in insert (i; omitted) mode.
set virtualedit=block       " Enable selection of empty columns when using visual-block selection mode.

" Disable code folding entirely. I hate that feature!
set foldminlines=99999

" Display relative line numbers in all buffers, rather than absolute ones.
" Makes it easier to jump to an exact line, e.g., 17k, 26j.
autocmd BufReadPost * set relativenumber
autocmd BufReadPost * set nonumber
set relativenumber
set nonumber

let html_no_rendering=1 " Disable underlining of tabs in HTML documents.

let mapleader = ","     " Set the all-important <Leader> key

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Set desired syntax highlighting colors.
highlight PreProc guibg=Grey15

" Set desired diff syntax highlighting colors.
highlight DiffAdd guibg=DarkGreen
highlight DiffChange guibg=OrangeRed
highlight DiffText guibg=Orange
highlight DiffDelete guibg=DarkRed

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
endif 

set autoindent
set number        " Turn on line numbers
set guioptions-=T " Turn off the toolbar at the top of MacVim
set shiftwidth=2  " Number of spaces to use for each level of auto indent.
set expandtab     " Always expand tabs to spaces.
set nowrap        " Disable word-wrap for long lines of text.

" F5 toggles NERDTree
noremap  <F5> :NERDTreeToggle<CR>
inoremap <F5> <Esc>:NERDTreeToggle<CR>

" NERDTree defaults to showing hidden files.
let NERDTreeShowHidden=1

" Enable all colors for NERDTree
let NERDChristmasTree=1

" Force NERDTree to default to this width (in columns)
let NERDTreeWinSize=50

" Tell NERDTree to ignore display of SVN files.
let NERDTreeIgnore=['\.svn$', '\.svn/']

" Force NERDTree to use pretty arrows
let NERDTreeDirArrows=1

" By default, NERDTree uses ? as the help key.
" But ? is the default Vim key for backwards text search.
" Not good. So I have re-mapped NERDTree help to <Leader>? 
" For me, searching backwards in NERDTree is by far the more common use case
" for ?.
let NERDTreeMapHelp='<Leader>?'

" Vim 7.4 has a defect which causes relative line numbers to display
" incorrectly when undoing a line deletion. This can be easily fixed
" by moving the cursor after undoing.
noremap u ukj

" Easy redo by pressing U, to compliment u, which is Vim's default undo.
" Vim's default redo is Ctrl+r, which is a pain in the ass to reach.
" Vim's default U -- undo all changes on this single line -- is basically
" useless since you can just press u a bunch of times.
noremap U <C-r>

" Since leader is mapped to comma, I need a replacement for comma, which
" performs an action opposite to semicolon. Solution: comma semicolon.
noremap <leader>; ,

" Make it easier to enter visual block mode.
noremap <leader>v <C-v>
" Make it impossible to enter visual block mode in the old way. (To retrain
" muscle memory.)
noremap <C-v> <nop>

" Enables easy line indenting by pressing > or <, instead of >> or <<.
nnoremap > >>
nnoremap < <<

" Preserves selection after (un-)indenting selected lines.
vnoremap > >gv
vnoremap < <gv

" Easier single and multi-line commenting with TComment plugin.
noremap  // :TComment<CR>
vnoremap // :TComment<CR>

" Make it easy to edit these files.
command! CHEAT execute ":e ~/projects/textfiles/cheatsheet.txt"
command! VIMRC execute ":e ~/.vimrc"
command! NGINXCONF execute ":e /usr/local/etc/nginx/nginx.conf"
command! SOMEDAYMAYBE execute ":e ~/projects/textfiles/somedaymaybe.txt"
command! SYSTEM execute ":e ~/projects/textfiles/system.txt"
command! TODO execute ":e ~/projects/textfiles/todo.txt"
command! NOTEPAD execute ":e ~/projects/textfiles/notepad.txt"

" :W should invoke :w, because I always type :W by accident!
command! W execute ":w"

" Write mode for easier writing.
command! WRITE execute ':Goyo'

" Code mode for reverting to coding after writing.
command! CODE execute  ':Goyo'

" Work mode sets up Vim for use at home.
" Vim window is resized to fit laptop monitor.
command! HOME execute ":set lines=62 columns=203"

" Work mode sets up Vim for use at work.
" Vim window is resized to fit external monitor.
command! WORK execute ":set lines=88 columns=289"

" Default to WORK environment.
WORK

" Pressing <Leader>. will clear the current search highlighting.
noremap <Leader>. :set hlsearch!<CR>

" Make it easy to escape from insert mode and save in one step,
" and I also prefer my cursor to stay in place when exiting insert mode.
" This command used to be defined in this way: inoremap jk <Esc>:w<CR>l
" I had to change it because the 'l' motion at the end was breaking my macros.
" More specifically, 'j' motions were not respected in macros if they followed
" my 'jk' mapping.
inoremap jk <Esc>`^

" Disabling these because whenever I activate caps lock in insert mode, I end
" up forgetting to turn it off. I then type JK to exit insert mode, but caps
" lock is still enabled, so my Vim normal mode commands are now uppercase
" variants, which causes a huge clusterfuck during subsequent typing.
" inoremap jK <Esc>`^:w<CR>
" inoremap Jk <Esc>`^:w<CR>
" inoremap JK <Esc>`^:w<CR>

" Make it easy to save. Just press s!
noremap s <Esc>:w<CR>

" Bind Tab to Ctrl+N to make word autocompletion easier. Now it works like
" Bash path name autocompletion.
inoremap <Tab> <C-n>

" When pressing # or *, enable search highlighting if it is currently
" disabled! I always turn it off for convenience and then forget to turn it
" back on again! Also, prevent auto-skipping ahead to the next instance of the word;
" that shit is just annoying.
noremap # #:set hlsearch<CR>N
noremap * *:set hlsearch<CR>N

" Invoke Command-T with <Leader>t.
noremap <Leader>t :CommandT<Esc>

" Increase number of files the Command-T will index.
" If you're wondering why Command-T won't find certain files, make this number bigger.
let g:CommandTMaxFiles=50000

" Show the best match at the bottom of the Command-T window.
" It's easier to see it that way.
let g:CommandTMatchWindowReverse = 1

" Remap the standard Command-T file open command.
let g:CommandTAcceptSelectionMap='<S-CR>'

" Remap Command-T shortcut for opening files in a horizontal split.
let g:CommandTAcceptSelectionSplitMap='<C-h>'

" Remap Command-T shortcut for opening files in a vertical split.
let g:CommandTAcceptSelectionVSplitMap='<C-v>'

" When enter is pressed, Command-T should open files in a new tab.let
let g:CommandTAcceptSelectionTabMap='<CR>'

" Fix VCSCommand mappings. They conflict with my enjoyable <leader>c mapping.
let VCSCommandMapPrefix = '<leader>\'

" Use :CC to flush Command-T's cache (so that it can detect new files).
command! CC execute ":CommandTFlush"

" PHP syntax checking bound to <leader>php
noremap <leader>php :w !php -l %<CR>

" JS synax checking bound to <leader>js
noremap <leader>js :w !jsl -nologo -nofilelisting -nocontext -nosummary -process %<CR>

" Align selected lines on = signs.
noremap <leader>a= :Align =<CR>

" Align selected lines on => PHP array key/value arrows.
noremap <leader>a=> :Align =><CR>

" Align selected lines on { and } signs (good for lining up CSS).
noremap <leader>acss :Align { }<CR>

" Align selected lines on colons.
noremap <leader>a: :Align :<CR>

" Easy VCSVimDiff diffing.
noremap <Leader>dd :VCSVimDiff<CR>

" Easy vimdiff getting, putting, updating and navigation.
noremap <Leader>dg :diffget<CR>
noremap <Leader>dp :diffput<CR>
noremap <Leader>du :diffupdate<CR>
noremap <Leader>dn ]czz
noremap <Leader>dN [czz

" An easier way to move the cursor between split windows.
noremap <leader>w <C-w><C-w>

" An easier way to change letter case.
noremap <leader>c ~

" An easier way to center the window on the current line.
noremap <CR> zz

" Removes all lines containing only whitespace from the current buffer. Asks
" for confirmation for each match. (Vim's { and } commands will not stop on
" lines that contain whitespace, so it is useful to clear pointless whitespace
" from all files.)
noremap <leader>s :%s/^\s\+$//c<CR>

" Move tabs left and right easily.
noremap <D-[> :call MoveTabLeft()<CR>
noremap <D-]> :call MoveTabRight()<CR>
function! MoveTabLeft()
  let tabnum = tabpagenr()

  if (tabnum != 1)
    execute "tabm " . (tabnum - 2)
  endif
endfunction
function! MoveTabRight()
  let tabnum = tabpagenr()

  execute "tabm " . tabnum
endfunction

" Easy selection of the previously pasted text.
" (We have to prevent YankRing from clobbering this mapping.)
nnoremap gp `[v`]
let g:yankring_paste_using_g = 0

" Change default yankring cycle backwards/forwards through pasted text shortcut from
" Ctrl+p to Command+p, and from Ctrl+n to Command+Shift+p.
let g:yankring_replace_n_pkey = '<D-p>'
let g:yankring_replace_n_nkey = '<D-P>'

" Treat H and L keys as fast incremental cursor up/down.
noremap H 10k0
noremap L 10j0

" Gundo plugin mapping.
nnoremap <leader>u :GundoToggle<CR>

" Invoke Zencoding plugin with Ctrl+z.
let g:user_zen_expandabbr_key = '<c-z>'

" To fix colors in vim-gitgutter plugin.
highlight clear SignColumn

" Easy Ag searching for the word under the cursor by pressing -. Just press [Enter] to execute the search.
" Restricting search via file type is easy. After pressing -, just type, e.g., '-G css' to search through
" CSS files. Searches open in a new tab so that the file the search term is copied from is not hidden.
noremap _ yiw:tabnew<CR>:Ag <c-r>"

" ag.vim plugin uses the H key as a shortcut within the quickfix window to open
" the selected file silently in a new horizontal split. This conflicts with my
" preferred use of H as a means of moving the cursor up 10 lines. Since the
" ag.vim plugin does not support shortcut remapping, I have commented out line
" 81 of ~/.vim/bundle/ag/autoload/ag.vim to disable that shortcut.
" A pull request is pending which will introduce shortcut remapping:
" https://github.com/rking/ag.vim/pull/49

" Whiplash plugin configuration.
let g:WhiplashProjectsDir = '~/projects/'
" let g:WhiplashConfigDir = '~/projects/dotfiles/whiplash-config/'
" let g:WhiplashCommandName = 'Project'

" Default to mobilefe project when loading Vim.
autocmd VimEnter * Whiplash mobilefe

" Goyo plugin configuration.
" https://github.com/junegunn/goyo.vim
let g:goyo_width = 80
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
function! s:GoyoBeforeCallback()
  set wrap
  set linebreak
  set norelativenumber
  set textwidth=80
  set formatoptions=tca
  noremap j gj
  noremap k gk
endfunction
function! s:GoyoAfterCallback()
  set nowrap
  set nolinebreak
  set relativenumber
  set textwidth=78
  set formatoptions=croql
  unmap j
  unmap k
endfunction
let g:goyo_callbacks = [function('s:GoyoBeforeCallback'), function('s:GoyoAfterCallback')]
