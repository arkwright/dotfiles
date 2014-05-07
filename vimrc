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

set lines=62 columns=197 " Default lines and columns for work iMac and home monitor. Ensures that Vim window is the correct size on startup.

" Disable code folding entirely. I hate that feature!
set foldminlines=99999

" Display relative line numbers in all buffers, rather than absolute ones.
" Makes it easier to jump to an exact line, e.g., 17k, 26j.
set relativenumber
au BufReadPost * set relativenumber

:let html_no_rendering=1 " Disable underlining of tabs in HTML documents.

:let mapleader = ","     " Set the all-important <Leader> key

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
:set number              " Turn on line numbers
set guioptions-=T        " Turn off the toolbar at the top of MacVim
set shiftwidth=2         " Number of spaces to use for each level of auto indent.
set expandtab            " Always expand tabs to spaces.
:set nowrap              " Disable word-wrap for long lines of text.

" F5 toggles NERDTree
map  <F5> :NERDTreeToggle ~/vim_project_link<CR>
imap <F5> <Esc>:NERDTreeToggle ~/vim_project_link<CR>

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

" Tab creates 2 spaces, instead of a tab.
imap <TAB> <SPACE><SPACE>

" Easy redo by pressing U, to compliment u, which is Vim's default undo.
" Vim's default redo is Ctrl+r, which is a pain in the ass to reach.
" Vim's default U -- undo all changes on this single line -- is basically
" useless since you can just press u a bunch of times.
noremap U <C-r>

" Since leader is mapped to comma, I need a replacement for comma, which
" performs an action opposite to semicolon. Solution: comma semicolon.
noremap <leader>; ,

" Enables easy line indenting by pressing > or <, instead of >> or <<.
:nnoremap > >>
:nnoremap < <<

" Preserves selection after (un-)indenting selected lines.
:vnoremap > >gv
:vnoremap < <gv

" Easier single and multi-line commenting with TComment plugin.
noremap  // :TComment<CR>
vnoremap // :TComment<CR>

" Make it easy to edit these files.
command CHEAT execute ":e ~/projects/textfiles/cheatsheet.txt"
command VIMRC execute ":e ~/.vimrc"
command NGINXCONF execute ":e /usr/local/etc/nginx/nginx.conf"
command SOMEDAYMAYBE execute ":e ~/projects/textfiles/somedaymaybe.txt"
command SYSTEM execute ":e ~/projects/textfiles/system.txt"
command TODO execute ":e ~/projects/textfiles/todo.txt"
command WORK execute ":e ~/projects/textfiles/work.txt"
command NOTEPAD execute ":e ~/projects/textfiles/notepad.txt"

" :W should invoke :w, because I always type :W by accident!
command W execute ":w"

" Write mode for easier writing. Wrap lines automatically.
command WRITE execute ":set wrap|:set linebreak"

" Code mode for reverting to coding after writing. Disable line wrapping.
command CODE execute ":set nowrap|:set nolinebreak"

" Pressing <Leader>. will clear the current search highlighting.
map <Leader>. :set hlsearch!<CR>

" Make it easy to escape from insert mode and save in one step, and I also prefer my cursor to stay in place when exiting insert mode.
imap jk <Esc>:w<CR>l
" Disabling these because whenever I activate caps lock in insert mode, I end
" up forgetting to turn it off. I then type JK to exit insert mode, but caps
" lock is still enabled, so my Vim normal mode commands are now uppercase
" variants, which causes a huge clusterfuck during subsequent typing.
" imap jK <Esc>:w<CR>l
" imap Jk <Esc>:w<CR>l
" imap JK <Esc>:w<CR>l

" Make it easy to save. Just press s!
noremap s <Esc>:w<CR>

" Bind Tab to Ctrl+N to make word autocompletion easier. Now it works like
" Bash path name autocompletion.
imap <Tab> <C-n>

" When pressing # or *, enable search highlighting if it is currently
" disabled! I always turn it off for convenience and then forget to turn it
" back on again! Also, prevent auto-skipping ahead to the next instance of the word;
" that shit is just annoying.
map # #:set hlsearch<CR>N
map * *:set hlsearch<CR>N

" Invoke Command-T with <Leader>t.
map <Leader>t :CommandT<Esc>

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

" When enter is pressed, Command-T should open files in a new tab.
let g:CommandTAcceptSelectionTabMap='<CR>'

" Fix VCSCommand mappings. They conflict with my enjoyable <leader>c mapping.
let VCSCommandMapPrefix = '<leader>\'

" Set the current working directory to whatever project I'm currently working on.
:cd ~/vim_project_link

" Use :CC to flush Command-T's cache (so that it can detect new files).
command CC execute ":CommandTFlush"

" PHP syntax checking bound to <leader>php
map <leader>php :w !php -l %<CR>

" JS synax checking bound to <leader>js
map <leader>js :w !jsl -nologo -nofilelisting -nocontext -nosummary -process %<CR>

" Align selected lines on = signs.
map <leader>a= :Align =<CR>

" Align selected lines on => PHP array key/value arrows.
map <leader>a=> :Align =><CR>

" Align selected lines on { and } signs (good for lining up CSS).
map <leader>acss :Align { }<CR>

" Align selected lines on colons.
map <leader>a: :Align :<CR>

" Easy VCSVimDiff diffing.
map <Leader>dd :VCSVimDiff<CR>

" Easy vimdiff getting, putting, updating and navigation.
map <Leader>dg :diffget<CR>
map <Leader>dp :diffput<CR>
map <Leader>du :diffupdate<CR>
map <Leader>dn ]czz
map <Leader>dN [czz

" An easier way to move the cursor between split windows.
map <leader>w <C-w><C-w>

" An easier way to change letter case.
map <leader>c ~

" Removes all lines containing only whitespace from the current buffer. Asks
" for confirmation for each match. (Vim's { and } commands will not stop on
" lines that contain whitespace, so it is useful to clear pointless whitespace
" from all files.)
map <leader>s :%s/^\s\+$//c<CR>

" Move tabs left and right easily.
map <D-[> :call MoveTabLeft()<CR>
map <D-]> :call MoveTabRight()<CR>
function MoveTabLeft()
  let tabnum = tabpagenr()

  if (tabnum != 1)
    execute "tabm " . (tabnum - 2)
  endif
endfunction
function MoveTabRight()
  let tabnum = tabpagenr()

  execute "tabm " . tabnum
endfunction

" Easy Command-up and Command-down increment/decrement of integer under the cursor.
noremap <D-Up> <C-a>
noremap <D-Down> <C-x>

" K is a generally useless command for me. Therefore, use it to split the
" current line before the cursor!
noremap K i<CR><Esc>

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

" A function similar to PHP's trim().
" Removes leading and trailing whitespace from a string.
function! Trim(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

" Invoke Zencoding plugin with Ctrl+z.
let g:user_zen_expandabbr_key = '<c-z>'

" To fix colors in vim-gitgutter plugin.
highlight clear SignColumn

" ag.vim plugin uses the H key as a shortcut within the quickfix window to open
" the selected file silently in a new horizontal split. This conflicts with my
" preferred use of H as a means of moving the cursor up 10 lines. Since the
" ag.vim plugin does not support shortcut remapping, I have commented out line
" 81 of ~/.vim/bundle/ag/autoload/ag.vim to disable that shortcut.
" A pull request is pending which will introduce shortcut remapping:
" https://github.com/rking/ag.vim/pull/49





























" " Enhance cib so that it works like ci', i.e., it will skip ahead to the next
" " set of parentheses on the line, unless currently inside a set of parentheses.
" noremap cib :call SuperCib()<CR>
" 
" function SuperCib()
"   let currentLine = getline(".")
"   let cursorIndex = col(".") - 1
"   let firstOpeningParenIndex = stridx(currentLine, "(")
"   let lastClosingParenIndex  = strridx(currentLine, ")")
" 
"   if firstOpeningParenIndex > cursorIndex
"     normal f(di)
"     startinsert
"     return
"   endif
" 
"   if lastClosingParenIndex < cursorIndex
"     normal F)di)
"     startinsert
"     return
"   endif
" 
"   normal di)
"   startinsert
"   return
" endfunction














" Experimentation
"
" map <Leader>na :call GetNextActions2()<CR>
" 
" function GetNextActions()
"   let next_actions = []
"   let all_lines = getline(0, "$")
"   let num_lines = len(all_lines)
"   let i = 1
" 
"   for line in all_lines
"     let line = Trim(line)
"     let linestart = strpart(line, 0, 2)
" 
"     if linestart == "->"
"       let action = { "bufnr": bufnr("%"), "lnum": i, "text": strpart(line, 3) }
"       let next_actions = next_actions + [action]
"     endif
" 
"     let i = i + 1
"   endfor
" 
"   let result = setqflist(next_actions, "r")
" 
"   execute "cw"
" endfunction
" 
" function GetNextActions2()
"   let next_actions = []
"   let all_lines = getline(0, "$")
"   let num_lines = len(all_lines)
"   let i = 1
" 
"   for line in all_lines
"     let line = Trim(line)
"     let linestart = strpart(line, 0, 2)
" 
"     if linestart == "->"
"       let action = strpart(line, 3)
"       let next_actions = next_actions + [action]
"     endif
" 
"     let i = i + 1
"   endfor
" 
"   " Position cursor at beginning of document for subsequent search
"   call cursor(1, 0)
" 
"   " Get the line number where 'NEXT ACTIONS' is first found. Accept a match at
"   " the cursor position Do not move the cursor.
"   let next_actions_line = search("NEXT ACTIONS", "cn")
" 
"   if next_actions_line > 0
"     append(next_actions_line, "test")
"   endif
" 
"   " echo next_actions
" endfunction
