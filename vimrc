" Pathogen (easy Vim plugin management)
call pathogen#infect()
call pathogen#helptags()

" This must be first, because it changes other options as a side effect.
set nocompatible

" Must be called before defining any mappings, or else YankStack mappings will not work.
call yankstack#setup()

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
set clipboard=unnamed       " Sets default register to be * register, which is the system clipboard. So Cmd+C and y are now the same thing; Cmd+V and p are now the same thing! Compatible with YankStack.
set guicursor+=n-v:blinkon0 " Disable cursor blinking (blinkon0) in normal (n) and visual (v) modes, but not in insert (i; omitted) mode.
set virtualedit=block       " Enable selection of empty columns when using visual-block selection mode.
set relativenumber          " Display relative line numbers, rather than absolute ones. (Makes it easier to jump to an exact line, e.g., 17k, 26j.)
set nonumber                " Never use absolute line numbers.
set laststatus=2            " Always show the status line, in every window/split.
set diffopt+=iwhite         " Ignore whitespace changes when diffing. This prevents excessive diff noise.
set diffopt+=filler         " Show filler lines, to keep the text synchronized with a window that has inserted lines at the same position.
set modelines=0             " According to Steve Losh, this prevents certain security exploits: http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
set lazyredraw              " Prevents the screen from being redrawn while executing macros, registers and other commands that have not been typed.
set wildmenu                " Enables hints for command completion on the command line.
set splitright              " When opening a new split window, prefer the right side.
set nosplitbelow            " When opening a new split window, prefer the top.
set noswapfile              " Disable swap files. They're not very useful.
set hidden                  " Make a buffer hidden when it is abandoned (no associated window), modified, and unsaved.

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

let html_no_rendering=1    " Disable underlining of tabs in HTML documents.

let mapleader = " "  " Set the all-important <Leader> key

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
set smartindent
set number        " Turn on line numbers
set guioptions-=T " Turn off the toolbar at the top of MacVim
set shiftwidth=2  " Number of spaces to use for each level of auto indent.
set tabstop=2     " Number of spaces that a tab should represent. :retab uses this value, which is why I set it to be the same as shiftwidth.
set expandtab     " Always expand tabs to spaces.
set nowrap        " Disable word-wrap for long lines of text.

" F5 toggles NERDTree
nnoremap <F5> :NERDTreeToggle<CR>

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
nnoremap u u<C-L>
xnoremap u u<c-l>

" easy redo by pressing u, to compliment u, which is vim's default undo.
" vim's default redo is ctrl+r, which is a pain in the ass to reach.
" Vim's default U -- undo all changes on this single line -- is basically
" useless since you can just press u a bunch of times.
nnoremap U <C-r>

" ^ is a very difficult character to type, and a very useful command in Vim.
" Rather than trying to train accuracy when aiming for such a difficult
" target, I prefer using the easier mapping g0 instead. Recall that 0 moves
" to the first character on the line; g0 now moves to the first *non-blank*
" character, so it's a good mnemonic.
nnoremap g0 ^
xnoremap g0 ^

" Enables easy line indenting by pressing > or <, instead of >> or <<.
nnoremap > >>
nnoremap < <<

" Preserves selection after (un-)indenting selected lines.
xnoremap > >gv
xnoremap < <gv

" Easier single and multi-line commenting with TComment plugin.
nnoremap // :TComment<CR>
xnoremap // :TComment<CR>

"Pressing <Leader><leader> will clear the current search highlighting.
nnoremap <leader><leader> :set hlsearch!<CR>
xnoremap <leader><leader> :<C-u>set hlsearch!<CR>gv

" I prefer my cursor to stay in place when exiting insert mode.  This command
" used to be defined in this way: inoremap jk <Esc>:w<CR>l I had to change it
" to `^ from l because the l motion at the end was breaking my macros.
inoremap <Esc> <Esc>`^

" Make it easy to save. Just press s!
nnoremap s <Esc>:w<CR>

" Make it easy to use Tim Pope's surround plugin from visual mode.
" This must use map, rather than noremap, in order to work.
xmap s S

" Bind Tab to Ctrl+N to make word autocompletion easier. Now it works like
" Bash path name autocompletion.
inoremap <Tab> <C-n>
inoremap <S-Tab> <C-p>

" When pressing # or *, enable search highlighting if it is currently
" disabled! I always turn it off for convenience and then forget to turn it
" back on again! Also, prevent auto-skipping ahead to the next instance of the word;
" that shit is just annoying.
nnoremap # #:set hlsearch<CR>N
nnoremap * *:set hlsearch<CR>N
xnoremap # #:<C-u>set hlsearch<CR>N
xnoremap * *:<C-u>set hlsearch<CR>

" Invoke Command-T with <Leader>t.
nnoremap <Leader>t :CommandT<Esc>

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

" Use Vim's current working directory as Command-T root.
let g:CommandTTraverseSCM = 'pwd'

" Fix VCSCommand mappings. They conflict with my enjoyable <leader>c mapping.
let VCSCommandMapPrefix = '<leader>\'

" Use :CC to flush Command-T's cache (so that it can detect new files).
command! CC execute ":CommandTFlush"

" PHP syntax checking bound to <leader>php
" nnoremap <leader><leader>php :w !php -l %<CR>

" JS synax checking bound to <leader><leader>js
" nnoremap <leader><leader>js :w !jsl -nologo -nofilelisting -nocontext -nosummary -process %<CR>

" Align selected lines on = signs.
xnoremap <leader>a= :Align =<CR>

" Align selected lines on => PHP array key/value arrows.
xnoremap <leader>a=> :Align =><CR>

" Align selected lines on { and } signs (good for lining up CSS).
xnoremap <leader>acss :Align { }<CR>

" Align selected lines on colons.
xnoremap <leader>a: :Align :<CR>

" Easier replay of previous macro in q register.
" From: http://hashrocket.com/blog/posts/8-great-vim-mappings
nnoremap Q @q
xnoremap Q :normal @q<CR>

" Easy way to diff the current two splits.
command! Diffthese :execute 'normal! :diffthis<CR><C-w>w:diffthis<CR><C-w>w'

" Easy vimdiff getting, putting, updating and navigation.
nnoremap <Leader>du :diffupdate<CR>

" An easier way to change letter case.
" In normal mode, after changing case, move cursor left to stay on the character being changed.
nnoremap <leader>c ~h
xnoremap <leader>c ~

" Move tabs left and right easily.
nnoremap <D-[> :<C-u>call MoveTabLeft()<CR>
nnoremap <D-]> :<C-u>call MoveTabRight()<CR>
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
nnoremap gp `[v`]

" Treat J and K keys as fast incremental cursor up/down.
" But not in visual mode, because I keep typing VJ when I want Vj.
nnoremap K 5k
xnoremap K 5k
nnoremap J 5j
xnoremap J 5j

" Easy movement between splits.
" nnoremap <leader>w <c-w><c-w> " Temporarily disabled to try to force myself to use g-[hjkl].
nnoremap gh <c-w>h
nnoremap gj <c-w>j
nnoremap gk <c-w>k
nnoremap gl <c-w>l

" Easy joining of lines, with and without added spaces.
nnoremap <leader>j J
xnoremap <leader>j J
nnoremap <leader>J :.+1left<CR>gJ
xnoremap <leader>J :<C-u>'<+1,'>left<CR>gvgJ

" Easy Ag searching for the word under the cursor, or the current visual
" selection, by pressing _. Just press [Enter] to execute the search.
" Restricting search via file type is easy. After pressing -, just type, e.g.,
" '-G css' to search through CSS files. Searches open in a new tab so that the
" file the search term is copied from is not hidden.  The :<C-u> for the
" normal mode mapping is necessary to force Vim to open the new tab and render
" its empty buffer before entering command-line mode with the pre-filled :Ag
" command.
nnoremap _ yiw:<C-u>tabnew<CR>:Ag <c-r>"
xnoremap _ y:<C-u>tabnew<CR>:Ag <c-r>"

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
" let g:WhiplashCommandName = 'Wh'

" Default Whiplash project when loading Vim.
augroup vim_enter
  autocmd!
  autocmd VimEnter * Whiplash dotfiles
augroup END

" Manhunt plugin configuration.
" let g:manhunt_command_name = 'Manhunt'
let g:manhunt_default_mode = 'pair'
" let g:manhunt_diff_align   = 'center'
let g:manhunt_key_next_diff = ']c'
let g:manhunt_key_previous_diff = '[c'
" let g:manhunt_key_select_left_version = 'L'
" let g:manhunt_key_select_next_version = 'j'
" let g:manhunt_key_select_previous_version = 'k'
" let g:manhunt_key_select_right_version = 'R'
" let g:manhunt_key_select_version = '<CR>'

" Easy diffing with Manhunt.
nnoremap <Leader>dd :Manhunt<CR>

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
\'lacks "src" attribute',
\] }
" Increase the default number of errors that tidy will display, because 6 is
" just not enough for an AngularJS file riddled with invalid elements and
" attributes.
let g:syntastic_html_tidy_args = '--show-errors 1000'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args = "--config ~/.jshintrc" "js_hint_options_are_here:  http://www.jshint.com/docs/options/
let g:syntastic_json_checkers = ['jsonlint']                    " npm install -g jsonlint

" Make Syntastic easier to use with a simple toggle command.
" Closes location list automatically when Syntastic is toggled off.
command! Lint execute "lcl | SyntasticToggleMode"
nnoremap <leader>L :Lint<CR>

" Allow up/down movements and <CR> in quickfix window to preview
" the file under the cursor, instead of jumping to it immediately.
" <C-w>p jumps to the previous (last accessed) window.
" augroup quickfix_preview
"   autocmd!
"   autocmd BufWinEnter quickfix nnoremap <buffer> <CR> <CR>zz<C-w>p
"   autocmd BufWinEnter quickfix nnoremap <buffer> j j<CR>zz<C-w>p
"   autocmd BufWinEnter quickfix nnoremap <buffer> k k<CR>zz<C-w>p
" augroup END

" =========================================
" Commands
" =========================================

" Make it easy to edit these files.
command! CHEAT execute ":e ~/projects/dotfiles/textfiles/cheatsheet.txt"
command! HOSTS execute ":e /etc/hosts"
command! VIMRC execute ":e ~/projects/dotfiles/vimrc"
command! SOMEDAYMAYBE execute ":e ~/projects/textfiles/somedaymaybe.txt"
command! SYSTEM execute ":e ~/projects/textfiles/system.txt"
command! TODO execute ":e ~/projects/work/todo.txt"

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

" Removes unnecessary whitespace from otherwise blank lines in the
" current file. This is necessary to allow { and } commands to jump
" intuitively to the beginning/end of paragraphs.
command! -range=% Clearblank <line1>,<line2>:global/^\s*$/normal 0D

" Deletes lines which contain only whitespace.
command! -range=% Delblank <line1>,<line2>:global/^\s*$/d

" Removes unnecessary whitespace from the end of lines in the range.
command! -range=% Deltrailing <line1>,<line2>substitute/\v\s*$//g | normal! <C-o>

" Splits the current line or a range of lines by the pattern supplied,
" To split the current line into new lines at each semicolon:
" :Split ;
command! -range -nargs=1 Split <line1>,<line2>:substitute/\v<args>/\r/g

" Reverses the order of all lines in the file, or the selected range.
command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl

" Removes duplicate lines from the range.
command! -bar -range=% Unique <line1>,<line2>!uniq

" Pretty-print JSON in the current buffer.
" Will return an error if the JSON is malformed.
" From: http://pascalprecht.github.io/2014/07/10/pretty-print-json-in-vim/
command! JsonPrettyPrint :%!python -m json.tool

" A convenience command for initiating and formatting a Goyo session for
" comfortable replying to someone else's message. This command assumes that
" the other user's message has already been copied into the default register.
command! Reply :tabnew | :Goyo | execute "normal o\<CR>===\<CR>\<CR>\<Esc>pggi"

"""
" Make it easy to open or diff a doppleganger file in a similar project.
"
" @param    boolean    diff    If true, diff the two files.
"""
function! s:Doppleganger(diff)
  let l:dopplegangers = [['mobilefe', 'tabletfe'], ['mobilenative', 'tabletnative']]

  let l:currentFileName = expand('%:p')

  let l:find    = ''
  let l:replace = ''

  for [first, second] in l:dopplegangers
    if stridx(l:currentFileName, first) ># -1
      let l:find    = first
      let l:replace = second
      break
    elseif stridx(l:currentFileName, second) ># -1
      let l:find    = second
      let l:replace = first
      break
    endif
  endfor

  if l:find !=# ''   &&   l:replace !=# ''
    let l:otherFileName = substitute(l:currentFileName, l:find, l:replace, '')

    execute 'vnew ' . l:otherFileName

    if a:diff ==# 1
      windo diffthis
      normal! ]czz
    endif

    execute "normal! \<C-w>\<C-w>"
  endif
endfunction
command! Doppleganger :call s:Doppleganger(0)
command! DopplegangerDiff :call s:Doppleganger(1)

"""
" Make it easy to view a git log for the current repo.
"""
function! s:Gitlog()
  let l:numCommits = 100
  let l:gitLogCmd  = 'git log -n ' . l:numCommits . ' --name-only --pretty=format:''\%n\%s\%n================================================\%nAuthor: \%an\%nDate:   \%ci\%nCommit: \%H\%n------------------------------------------------'''

  tabnew

  execute 'silent! read !' . l:gitLogCmd

  normal! gg
  normal! 2dd

  setlocal buftype=nofile
  setlocal bufhidden=hide

  " <CR> opens current file in new tab.
  nnoremap <buffer> <CR> <C-w>gf
endfunction
command! Gitlog :call s:Gitlog()

" Populate argument list with all files currently in the quickfix list.
" From: http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim/5686810#5686810
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()

function! FixAngularDeclaration()
  " Collapse entire Angular header into a single line.
  " Join lines.
  " ^M is <CR> key.
  normal! 0v/\v\{:join!

  " Exit visual mode.
  execute "normal! \<Esc>"

  " Remove all whitespace.
  silent! substitute/\s//g

  " Line break before every period.
  silent! substitute/\v\./\r./g

  " Delete ,function( and everything after.
  silent! substitute/\vfunction.*$//g

  " Add a space after every comma.
  silent! substitute/\v,/, /g

  " Delete trailing whitespace.
  silent! substitute/\v\s$//g

  " Copy dependency injection line.
  normal! YP

  " Move down one line.
  normal! j

  " Preserving indentation, replace .controller( stuff with function( and
  " appropriate whitepspae.
  " ^[ is <Esc> key.
  normal! Rfunction
  normal! l
  normal! vt[
  execute "normal! r "
  normal! f[
  normal! r(

  " Remove trailing comma, if any.
  silent! substitute/\v,$//

  " Add traling parenthesis.
  normal! A)

  " Remove commas from function() line, transforming strings into arguments.
  " Preserve whitespace appropriately.
  silent! substitute/\v',/, /g
  silent! substitute/\v'/ /g

  " Add opening brace for function on line below.
  normal! o{
endfunction
command! -nargs=0 FixAngularDeclaration call FixAngularDeclaration()

" =========================================
" Mappings
" =========================================

" Faster closing of current file/tab.
nnoremap <leader>w :q<CR>

" Make it easier to open the file under the cursor in new tab.
nnoremap <leader>gf <C-w>gf
xnoremap <leader>gf <C-w>gf

" Easy access to :only Ex command. I use it all the time.
nnoremap <leader>o :only<CR>

" Delete all trailing whitespace on the current line.
nnoremap d<space> :s/\v\s*$//<CR>g_

" Faster, easier centering of the current line.
nnoremap <leader>z zz

" Find any URL on the current line, and open it in a web browser.
" Adapted from: http://stackoverflow.com/questions/9458294/open-url-under-cursor-in-vim-with-browser
function! HandleURL()
  let l:uri = matchstr(getline('.'), '[a-z]*:\/\/[^ >,;)]*')

  if l:uri != ""
    silent exec "!open '" . shellescape(l:uri, 1) . "'"
  else
    echo "No URI found in line."
  endif
endfunction
nnoremap gx :call HandleURL()<CR>
xnoremap gx :call HandleURL()<CR>

" Wrap current line in console.log();
nnoremap <leader>ll Iconsole.log(<ESC>A);<ESC>0f(l
" Wrap current line in console.log('');
nnoremap <leader>l' Iconsole.log('<ESC>A');<ESC>0f(ll
" Wrap current line in console.log("");
nnoremap <leader>l" Iconsole.log("<ESC>A");<ESC>0f(ll
" If visual selection, wrap in console.log() and place on new line beneath.
xnoremap <leader>ll "zyoconsole.log(<C-r>z);<ESC>F(l
" If visual selection, wrap in console.log('') and place on new line beneath.
xnoremap <leader>l' "zyoconsole.log('<C-r>z');<ESC>F(ll
" If visual selection, wrap in console.log("") and place on new line beneath.
xnoremap <leader>l" "zyoconsole.log("<C-r>z");<ESC>F(ll

" Make backspace actually work as backspace in select mode.
snoremap <BS> a<BS>

" & is synonym for :&, which repeats the previous :substitute command but does
" not re-use its flags. :&& does re-use the flags, which is the more intuitive
" functionality. So, call :&& whenever I press &, and also make it repeatable
" (within normal mode) via Tim Pope's repeat.vim plugin.
"
" repeat.vim instructions via Drew Neil:
" http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/ 
nnoremap <Plug>RepeatSubsituteWithFlags :&&<CR>:call repeat#set("\<Plug>RepeatSubsituteWithFlags")<CR>
nmap & <Plug>RepeatSubsituteWithFlags
xnoremap & :&&<CR>

" For navigation purpaoes (which is my most common use case for the search
" commands), a literal text search (invoked via the \V switch) is convenient.
nnoremap / /\V
nnoremap ? ?\V
xnoremap / /\V
xnoremap ? ?\V

" Easy insertion of blank lines above or below the cursor line.
" Like unimpaired.vim.
nnoremap [<Space> mzO<Esc>`z
nnoremap ]<Space> mzo<Esc>`z

" =========================================
" Git Gutter
" =========================================

" Disable key mappings.
let g:gitgutter_map_keys = 0

" =========================================
" gitv
" =========================================

" Truncate commit subjects, where necessary, so that the whole line will fit
" in one screen width.
let g:Gitv_TruncateCommitSubjects = 1

" =========================================
" Goyo
" =========================================

let g:goyo_width = 80
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
function! s:GoyoBeforeCallback()
  set wrap
  set linebreak
  set nocursorline
  nnoremap j gj
  xnoremap j gj
  nnoremap k gk
  xnoremap k gk
endfunction
function! s:GoyoAfterCallback()
  set nowrap
  set nolinebreak
  set cursorline
  nunmap j
  xunmap j
  nunmap k
  xunmap k
endfunction
let g:goyo_callbacks = [function('s:GoyoBeforeCallback'), function('s:GoyoAfterCallback')]

" =========================================
" Gundo
" =========================================

" Easier command for toggling Gundo.
command! Gundo :GundoToggle

" =========================================
" vim-instant-markdown
" =========================================

" Only refresh on the following events: no keys have been pressed for a while; a while after you leave insert mode; you save the file being edited.
let g:instant_markdown_slow = 1

" =========================================
" Lightline
" =========================================

let g:lightline = {}
let g:lightline.colorscheme = 'solarized'
let g:lightline.component = {}
let g:lightline.component.fugitive = '%{exists("*fugitive#head")?fugitive#head():""}'
let g:lightline.component.whiplash = '%{g:WhiplashCurrentProject}'
let g:lightline.component_visible_condition = {}
let g:lightline.component_visible_condition.fugitive = '(exists("*fugitive#head") && ""!=fugitive#head())'
let g:lightline.active = {}
let g:lightline.active.left = [['mode', 'paste'], ['whiplash'], ['fugitive'], ['readonly', 'filename', 'modified']]
let g:lightline.active.right = [['lineinfo'], ['percent'], ['fileencoding'], ['bufnum']]

" =========================================
" vim-javascript
" =========================================

" Disables JSDoc syntax highlighting.
let g:javascript_ignore_javaScriptdoc = 1

" =========================================
" vim-json
" =========================================

" Disable key mappings.
let g:vim_json_syntax_conceal = 0    " Disable syntax concealing (i.e. :setlocal conceallevel=0)

" =========================================
" Radar
" =========================================

" Radar plugin configuration.
" let g:radar_command_name = 'Ra'

" =========================================
" Snipmate
" =========================================

" Dictionary which contains other Snipmate options.
let g:snipMate = {}

" A string inserted when no match for a trigger is found.
" Set it to the empty string to prevent anything from being inserted.
let g:snipMate['no_match_completion_feedkeys_chars'] = ''

" Trigger snippet or move to next snippet placeholder.
imap jk <Plug>snipMateNextOrTrigger
smap jk <Plug>snipMateNextOrTrigger

" Jump to the previous tab stop, if it exists. Use in both insert and select modes.
" I have to use uppercase KJ becuase if I use lowercase kj, then snippets such
" as 'link' cannot be activated smoothly, because to active them I would
" normally enter 'linkjk', but Snipmate picks up on the 'lin[kj]k' part,
" and screws up my typing.
imap KJ <Plug>snipMateBack
smap KJ <Plug>snipMateBack

" =========================================
" Whiteboard
" =========================================
let g:whiteboard_command_name = 'Repl'
let g:whiteboard_default_interpreter = 'javascript'
let g:whiteboard_temp_directory = '/tmp/'
let g:whiteboard_interpreters = {}
let g:whiteboard_interpreters.javascript = { 'extension': 'js', 'command': 'node --use_strict --harmony' }

" =========================================
" Yankstack
" =========================================

" Disable YankStack default key bindings.
let g:yankstack_map_keys = 0

" These mappings must be defined using 'nmap' (not 'nnoremap') in order to work.
nmap <D-p> <Plug>yankstack_substitute_older_paste
nmap <D-P> <Plug>yankstack_substitute_newer_paste
