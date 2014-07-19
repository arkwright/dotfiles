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

" Set the default font
set guifont=Monaco:h14

" Use my preferred color scheme.
set background=dark
colorscheme solarized

" Set desired diff colors for Solarized colorscheme.
highlight DiffAdd guibg=#094901
highlight DiffChange guibg=#073642
highlight DiffText guifg=#369be2 guibg=#195565
highlight DiffDelete guibg=#3e0201

" To make vim-gitgutter plugin compatible with Solarized colorscheme.
highlight clear SignColumn
highlight GitGutterAdd guibg=#002b36 guifg=#859900
highlight GitGutterChange guibg=#002b36 guifg=#657b83
highlight GitGutterDelete guibg=#002b36 guifg=#dc322f
highlight GitGutterChangeDelete guibg=#002b36 guifg=#dc322f

" Current line color
" hi CursorLine   guibg=gray18
" hi CursorColumn guibg=gray18

" Symfony 2's Twig templating framework is a port of Python's Jinja.
" So we can use Vim jinja syntax highlighting.
" Requires htmljinja plugin.
augroup jinja
  autocmd!
  autocmd BufRead,BufNewFile *.twig set filetype=htmljinja
augroup END

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
set relativenumber          " Display relative line numbers, rather than absolute ones. (Makes it easier to jump to an exact line, e.g., 17k, 26j.)
set nonumber                " Never use absolute line numbers.
set foldminlines=99999      " Disable code folding entirely. I hate that feature!
set laststatus=2            " Always show the status line, in every window/split.
set diffopt+=iwhite         " Ignore whitespace changes when diffing. This prevents excessive diff noise.
set diffopt+=filler         " Show filler lines, to keep the text synchronized with a window that has inserted lines at the same position.
set modelines=0             " According to Steve Losh, this prevents certain security exploits: http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines

" Never display absolute line numbers!
augroup nonumber
  autocmd!
  autocmd BufRead,BufNewFile * setlocal nonumber
augroup END

" Never display fold column!
augroup foldcolumn
  autocmd!
  autocmd BufEnter * setlocal foldcolumn=0
augroup END

let html_no_rendering=1 " Disable underlining of tabs in HTML documents.

let mapleader = ","     " Set the all-important <Leader> key

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

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
" by forcing Vim to clear and redraw the screen (<C-L>).
noremap u u<C-L>

" Easy redo by pressing U, to compliment u, which is Vim's default undo.
" Vim's default redo is Ctrl+r, which is a pain in the ass to reach.
" Vim's default U -- undo all changes on this single line -- is basically
" useless since you can just press u a bunch of times.
noremap U <C-r>

" ^ is a very difficult character to type, and a very useful command in Vim.
" Rather than trying to train accuracy when aiming for such a difficult
" target, I prefer using the easier mapping g0 instead. Recall that 0 moves
" to the first character on the line; g0 now moves to the first *non-blank*
" character, so it's a good mnemonic.
noremap g0 ^

" Since leader is mapped to comma, I need a replacement for comma, which
" performs an action opposite to semicolon. Solution: comma semicolon.
noremap <leader>; ,

" Enables easy line indenting by pressing > or <, instead of >> or <<.
nnoremap > >>
nnoremap < <<

" Preserves selection after (un-)indenting selected lines.
vnoremap > >gv
vnoremap < <gv

" Easier single and multi-line commenting with TComment plugin.
noremap  // :TComment<CR>
vnoremap // :TComment<CR>

" Pressing <Leader>. will clear the current search highlighting.
noremap <Leader>. :set hlsearch!<CR>

" Make it easy to escape from insert mode and save in one step, and I also
" prefer my cursor to stay in place when exiting insert mode.  This command
" used to be defined in this way: inoremap jk <Esc>:w<CR>l I had to change it
" to `^ from l because the l motion at the end was breaking my macros.
inoremap jk <Esc>`^

" Also make it easy to escape from command-line mode.
" <C-c> must be used in place of <Esc> for this mapping because Vim treats
" <Esc> in command-line mode as if it were <CR>
" As per: http://vim.wikia.com/wiki/Avoid_the_escape_key
cnoremap jk <C-c>

" Disable command line mode escape to train muscle memory.
cnoremap <Esc> <nop>

" Disable visual mode escape to retrain muscle memory. Use vv instead.
vnoremap <Esc> <nop>

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
inoremap <S-Tab> <C-p>

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
let g:CommandTAcceptSelectionMap='<C-CR>'

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
noremap <leader><leader>php :w !php -l %<CR>

" JS synax checking bound to <leader><leader>js
noremap <leader><leader>js :w !jsl -nologo -nofilelisting -nocontext -nosummary -process %<CR>

" Align selected lines on = signs.
noremap <leader>a= :Align =<CR>

" Align selected lines on => PHP array key/value arrows.
noremap <leader>a=> :Align =><CR>

" Align selected lines on { and } signs (good for lining up CSS).
noremap <leader>acss :Align { }<CR>

" Align selected lines on colons.
noremap <leader>a: :Align :<CR>

" Easier replay of previous macro in q register.
" From: http://hashrocket.com/blog/posts/8-great-vim-mappings
nnoremap Q @q
vnoremap Q :normal @q<CR>

" Easy way to diff the current two splits.
command! Diffthese :execute 'normal! :diffthis<CR><C-w>w:diffthis<CR><C-w>w'

" Easy vimdiff getting, putting, updating and navigation.
noremap <Leader>dg :diffget<CR>
noremap <Leader>dp :diffput<CR>
noremap <Leader>du :diffupdate<CR>
noremap <Leader>dn ]czz
noremap <Leader>dN [czz
noremap <Space> ]czz
noremap <S-Space> [czz

" An easier way to change letter case.
" After changing case, move cursor left to stay on the character being changed.
noremap <leader>c ~h

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

" Treat J and K keys as fast incremental cursor up/down.
" But not in visual mode, because I keep typing VJ when I want Vj.
nnoremap K 5k
vnoremap K <nop>
nnoremap J 5j
vnoremap J <nop>

" Easy movement between splits.
" nnoremap <leader>w <c-w><c-w> " Temporarily disabled to try to force myself to use g-[hjkl].
nnoremap gh <c-w>h
nnoremap gj <c-w>j
nnoremap gk <c-w>k
nnoremap gl <c-w>l

" Easy joining of lines.
nnoremap <leader>j J
vnoremap <leader>j J

" Gundo plugin mapping.
nnoremap <leader>u :GundoToggle<CR>

" Invoke Zencoding plugin with Ctrl+z.
let g:user_zen_expandabbr_key = '<c-z>'

" Easy Ag searching for the word under the cursor, or the current visual
" selection, by pressing _. Just press [Enter] to execute the search.
" Restricting search via file type is easy. After pressing -, just type, e.g.,
" '-G css' to search through CSS files. Searches open in a new tab so that the
" file the search term is copied from is not hidden.
nnoremap _ yiw:tabnew<CR>:Ag <c-r>"
vnoremap _ y:tabnew<CR>:Ag <c-r>"

" Disable Ag quickfix and location list mappings.
let g:ag_apply_lmappings = 0
let g:ag_apply_qmappings = 0

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

" Default Whiplash project when loading Vim.
augroup vim_enter
  autocmd!
  autocmd VimEnter * Whiplash vim-irregular
augroup END

" Manhunt plugin configuration.
" let g:manhunt_command_name = 'Manhunt'
" let g:manhunt_default_mode = 'working'
" let g:manhunt_diff_align   = 'center'
let g:manhunt_key_next_diff = '<Space>'
let g:manhunt_key_previous_diff = '<S-Space>'
" let g:manhunt_key_select_left_version = 'L'
" let g:manhunt_key_select_next_version = 'j'
" let g:manhunt_key_select_previous_version = 'k'
" let g:manhunt_key_select_right_version = 'R'
" let g:manhunt_key_select_version = '<CR>'

" Easy diffing with Manhunt.
noremap <Leader>dd :Manhunt<CR>

" Syntastic plugin configuration.
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" :SyntasticToggleMode toggles Syntastic OFF the first time is is called, unless we force Syntastic ot default to 'passive' mode.
let g:syntastic_mode_map = { 'mode': 'passive' }
" Tell Syntastic to ignore `tidy` HTML syntax checker messages which contain any of the following strings.
let g:syntastic_html_tidy_quiet_messages = { 'regex': [
\'proprietary attribute',
\'is not recognized!',
\'discarding unexpected',
\'<form> lacks "action" attribute',
\'<input> attribute .\{-\} lacks value',
\] }
" Increase the default number of errors that tidy will display, because 6 is
" just not enough for an AngularJS file riddled with invalid elements and
" attributes.
let g:syntastic_html_tidy_args = '--show-errors 1000'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args = "--config ~/.jshintrc" "js_hint_options_are_here:  http://www.jshint.com/docs/options/

" Make Syntastic easier to use with a simple toggle command.
" Closes location list automatically when Syntastic is toggled off.
command! Lint execute "lcl | SyntasticToggleMode"
nnoremap <leader>l :Lint<CR>

" Allow up/down movements and <CR> in quickfix window to preview
" the file under the cursor, instead of jumping to it immediately.
" <C-w>p jumps to the previous (last accessed) window.
" augroup quickfix_preview
"   autocmd!
"   autocmd BufWinEnter quickfix nnoremap <buffer> <CR> <CR>zz<C-w>p
"   autocmd BufWinEnter quickfix nnoremap <buffer> j j<CR>zz<C-w>p 
"   autocmd BufWinEnter quickfix nnoremap <buffer> k k<CR>zz<C-w>p
" augroup END

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

" " JavaScript function text object.
" " Inspired by: https://gist.github.com/stoeffel/dfd86fd956b38ef35e69
" function! s:SelectJavaScriptFunction()
"   execute "normal! ]}%?function\<CR>v/{\<CR>%"
" endfunction
" " vnoremap af :<C-U>:call <SID>SelectJavaScriptFunction()<CR>
" " onoremap af :call <SID>SelectJavaScriptFunction()<CR>
" 
" augroup javascript_text_objects
"   autocmd!
"   autocmd FileType javascript :vnoremap af :<C-U>silent! :call <SID>SelectJavaScriptFunction()<CR>
"   autocmd FileType javascript :onoremap af :silent! :call <SID>SelectJavaScriptFunction()<CR>
" augroup END

" Fix put functionality so that it does not overwrite the unnamed register
" when in visual mode.
" function! s:Shotput2(cmd)
"   let l:old = getreg('"')
"   execute "normal " . a:cmd
"   call setreg('"', l:old)
" endfunction
" let g:yankring_paste_n_bkey = ''
" let g:yankring_paste_n_akey = ''
" let g:yankring_paste_v_key  = ''
" let g:yankring_paste_v_bkey = ''
" let g:yankring_paste_v_akey = ''
" vnoremap p :call <SID>Shotput2('p')<CR>
" vnoremap P :call <SID>Shotput2('P')<CR>



" =========================================
" Commands
" =========================================

" Make it easy to edit these files.
command! CHEAT execute ":e ~/projects/textfiles/cheatsheet.txt"
command! VIMRC execute ":e ~/projects/dotfiles/vimrc"
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
command! WORK execute ":set lines=88 columns=363"
WORK " Default to WORK environment.

" Wrap current line in console.log("");
command! Log execute "normal! Iconsole.log(\"\<ESC>A\");\<ESC>hhh"

" Removes unnecessary whitespace from otherwise blank lines in the
" current file. This is necessary to allow { and } commands to jump
" intuitively to the beginning/end of paragraphs.
command! -range=% Clearblank <line1>,<line2>:global/^\s*$/normal 0D

" Removes unnecessary whitespace from otherwise blank lines in the
" current file. This is necessary to allow { and } commands to jump
" intuitively to the beginning/end of paragraphs.
command! -range=% Delblank <line1>,<line2>:global/^\s*$/d

" Splits the current line or a range of lines by the pattern supplied,
" To split the current line into new lines at each semicolon:
" :Split ;
command! -range -nargs=1 Split <line1>,<line2>:substitute/\v<args>/\r/g

" Reverses the order of all lines in the file, or the selected range.
command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl
