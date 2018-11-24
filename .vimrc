" brew install macvim --with-lua --override-system-vim
" ln -Fs `find /usr/local -name "MacVim.app"` /Applications/MacVim.app

" Vundle
set nocompatible
filetype off " Required for Vundle init. Can be overridden later.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'DirDiff.vim'
Plugin 'vim-formation', { 'pinned': 1 }
Plugin 'airblade/vim-gitgutter'
" Plugin 'arkwright/vim-irregular'
Plugin 'arkwright/vim-manhunt'
Plugin 'arkwright/vim-radar'
Plugin 'arkwright/vim-whiplash'
Plugin 'arkwright/vim-whiteboard'
Plugin 'elzr/vim-json'
Plugin 'flazz/vim-colorschemes'
Plugin 'gregsexton/gitv'
Plugin 'haya14busa/incsearch.vim'
" Plugin 'haya14busa/vim-operator-flashy'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-textobj-function'
Plugin 'kana/vim-textobj-user'
" Using a forked custom version of vim-prettier because the latest
" vim-prettier is incompatible with versions of Prettier < 1.9.  It will
" insert warnings into the top of any file that is prettified. :-(
" Plugin 'arkwright/vim-prettier'
" Using instead of 'vim-scripts/YankRing.vim'.
" This version removes the macro (@) mapping.
" YankRing breaks macros which include searches (/?),
" causing them to hang indefinitely.
Plugin 'skwp/yankring.vim' 
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sgur/vim-textobj-parameter'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/unite.vim'
Plugin 'sjl/gundo.vim'
Plugin 'suan/vim-instant-markdown'
Plugin 'szw/vim-dict'
Plugin 'ternjs/tern_for_vim'
Plugin 'thinca/vim-textobj-function-javascript'
Plugin 'tmhedberg/matchit'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'wellle/targets.vim'
Plugin 'whatyouhide/vim-textobj-xmlattr'
Plugin 'wincent/command-t'
Plugin 'Julian/vim-textobj-variable-segment'
call vundle#end()
filetype plugin indent on

" This must come before any :highlight commands to enable them to work.
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" =========================================
" Options
" =========================================

set autoindent
set clipboard=unnamed       " Sets default register to be * register, which is the system clipboard. So Cmd+C and y are now the same thing; Cmd+V and p are now the same thing!
set completeopt-=preview    " Disable preview window when auto-completing.
set cursorline              " Turn on highlighting of current line.
set diffopt+=filler         " Show filler lines, to keep the text synchronized with a window that has inserted lines at the same position.
set diffopt+=iwhite         " Ignore whitespace changes when diffing. This prevents excessive diff noise.
set diffopt+=vertical       " Prefer vertical diff splits in Fugitive and elsewhere.
set encoding=utf-8          " Necessary to show Unicode glyphs
set expandtab               " Always expand tabs to spaces.
set guicursor+=n-v:blinkon0 " Disable cursor blinking (blinkon0) in normal (n) and visual (v) modes, but not in insert (i; omitted) mode.
set guioptions-=T           " Turn off the toolbar at the top of MacVim
set hidden                  " Make a buffer hidden when it is abandoned (no associated window), modified, and unsaved.
set history=50              " Keep 50 lines of command line history
set ignorecase              " Searches should be case-insensitive by default
set incsearch               " Do incremental searching
set laststatus=2            " Always show the status line, in every window/split.
set lazyredraw              " Prevents the screen from being redrawn while executing macros, registers and other commands that have not been typed.
set modelines=0             " According to Steve Losh, this prevents certain security exploits: http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
set nonumber                " Never use absolute line numbers.
set nosplitbelow            " When opening a new split window, prefer the top.
set noswapfile              " Disable swap files. They're not very useful.
set nowrap                  " Disable word-wrap for long lines of text.
set number                  " Turn on line numbers
set relativenumber          " Display relative line numbers, rather than absolute ones. (Makes it easier to jump to an exact line, e.g., 17k, 26j.)
set ruler                   " Show the cursor position all the time
set shiftwidth=2            " Number of spaces to use for each level of auto indent.
set showcmd                 " Display incomplete commands
set smartindent
set splitright              " When opening a new split window, prefer the right side.
set tabstop=2               " Number of spaces that a tab should represent. :retab uses this value, which is why I set it to be the same as shiftwidth.
set undolevels=200          " Keep 200 undo levels in history
set virtualedit=block       " Enable selection of empty columns when using visual-block selection mode.
set wildignore+=*.svn       " Prevent vim and its plugins from ever displaying or working with SVN files.
set wildmenu                " Enables hints for command completion on the command line.
set visualbell t_vb=        " Disable bells (e.g. beeping on Esc press).

let html_no_rendering = 1   " Disable underlining of tabs in HTML documents.
let mapleader = ' '         " Set the all-important <Leader> key

" =========================================
" Font and Color Scheme
" =========================================

" Set the default font
set guifont=Monaco:h14

" Use my preferred color scheme.
set background=dark
colorscheme solarized

" Set desired diff colors for Solarized colorscheme.
highlight DiffAdd                  guibg=#094901
highlight DiffChange               guibg=#073642
highlight DiffText   guifg=#369be2 guibg=#195565
highlight DiffDelete               guibg=#3e0201

" To make vim-gitgutter plugin compatible with Solarized colorscheme.
highlight clear SignColumn
highlight GitGutterAdd          guifg=#859900 guibg=#002b36
highlight GitGutterChange       guifg=#657b83 guibg=#002b36
highlight GitGutterDelete       guifg=#dc322f guibg=#002b36
highlight GitGutterChangeDelete guifg=#dc322f guibg=#002b36

" Make first cursor fairly bright, so it stands out against search matches.
highlight Cursor guibg=#CCCCCC

" =========================================
" Autocommands
" =========================================

" Never display absolute line numbers!
augroup nonumber
  autocmd!
  autocmd BufEnter * setlocal nonumber
augroup END

" Never display fold column!
augroup foldcolumn
  autocmd!
  autocmd BufEnter * setlocal foldcolumn=0
augroup END

" Treat JSS files just like JS files, because they are!
augroup jss
  autocmd!
  autocmd BufNewFile,BufRead *.jss set filetype=javascript
augroup END

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

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
let g:CommandTAcceptSelectionSplitMap='<C-s>'

" Remap Command-T shortcut for opening files in a vertical split.
let g:CommandTAcceptSelectionVSplitMap='<C-v>'

" When enter is pressed, Command-T should open files in a new tab.let
let g:CommandTAcceptSelectionTabMap='<CR>'

" Use Vim's current working directory as Command-T root.
let g:CommandTTraverseSCM = 'pwd'

" Use :CC to flush Command-T's cache (so that it can detect new files).
command! CC execute ":CommandTFlush"

" Easier replay of previous macro in q register.
" From: http://hashrocket.com/blog/posts/8-great-vim-mappings
nnoremap Q @q
xnoremap Q :normal @q<CR>

" Easy way to diff the current two splits.
command! Diffthese :execute 'normal! :diffthis<CR><C-w>w:diffthis<CR><C-w>w'

" Easy vimdiff getting, putting, updating and navigation.
nnoremap <Leader>du :diffupdate<CR>

" Move tabs left and right easily.
nnoremap <D-[> :tabmove -1<CR>
nnoremap <D-]> :tabmove +1<CR>

" Easy selection of the previously pasted text via viP.
xnoremap iP `[o`]

" Easy sorting of current indentation level.
nmap <leader>s vii:sort<CR>
xmap <leader>s :sort<CR>

" Easy move up to previous line at next lower indentation.
" Useful for 'stepping up' through nested statements.
" Adapted from: https://www.reddit.com/r/vim/comments/2tqvp0/is_there_a_motion_for_up_one_indent_level/
function! UpByIndent()
    " Pushes the starting cursor position on to the jumplist.
    normal! mz`z

    normal! ^

    let l:startColumn = col('.')
    let l:col = l:startColumn

    while l:col >= l:startColumn
        normal! k^

        if getline('.') =~# '\v\C^\s*$'
            continue
        elseif col('.') <= 1
            return
        else
            let l:col = col('.')
        endif
    endwhile
endfun

nnoremap - :call UpByIndent()<CR>
xnoremap - :call UpByIndent()<CR>

" Easy move down to next line at next lower indentation.
" Useful for 'stepping down' through nested statements.
" Adapted from: https://www.reddit.com/r/vim/comments/2tqvp0/is_there_a_motion_for_up_one_indent_level/
function! DownByIndent()
    " Pushes the starting cursor position on to the jumplist.
    normal! mz`z

    normal! ^

    let l:startColumn = col('.')
    let l:col = l:startColumn

    while l:col >= l:startColumn
        normal! j^

        if getline('.') =~# '\v\C^\s*$'
            continue
        elseif col('.') <= 1
            return
        else
            let l:col = col('.')
        endif
    endwhile
endfun
nnoremap + :call DownByIndent()<CR>
xnoremap + :call DownByIndent()<CR>

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

" Copy filename and filepath quick shortcuts.
nnoremap <leader>yfn :CopyFilename<CR>
xnoremap <leader>yfn :CopyFilename<CR>
nnoremap <leader>yp :CopyPath<CR>
xnoremap <leader>yp :CopyPath<CR>
nnoremap <leader>yap :CopyAbsolutePath<CR>
xnoremap <leader>yap :CopyAbsolutePath<CR>
nnoremap <leader>yfp :CopyFilepath<CR>
xnoremap <leader>yfp :CopyFilepath<CR>
nnoremap <leader>yafp :CopyAbsoluteFilepath<CR>
xnoremap <leader>yafp :CopyAbsoluteFilepath<CR>

" Anki flashcard "create cloze deletion from visual mode selection" macro.
xnoremap <leader>x c{{c1::"::}}hi

" Whiplash plugin configuration.
let g:WhiplashProjectsDir = '~/projects/'
let g:WhiplashConfigDir = '~/projects/whiplash-config/'
let g:WhiplashCommandName = 'Wh'

" Default Whiplash project when loading Vim.
augroup vim_enter
  autocmd!
  autocmd VimEnter * Wh dotfiles
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
let g:syntastic_javascript_checkers = ['eslint']      " npm install -g eslint; npm install -g babel-eslint; npm install -g eslint-plugin-react
" let g:syntastic_javascript_eslint_exec = '$(npm bin)/eslint' " Configured in whiplash-config.
let g:syntastic_json_checkers = ['jsonlint']          " npm install -g jsonlint

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

" Search for the contents of the current line within the current file.
" Ignore leading/trailing punctuation (except underscore), whitespace.
" Ignore internal punctuation (except underscore).
function! FindALine()
    let l:text = getline('.')
    let l:text = substitute(l:text, "\\v^\\W+", "", "g")
    let l:text = substitute(l:text, "\\v\\W+$", "", "g")
    let l:text = substitute(l:text, "\\v\\/", "\\\\/", "g")

    execute 'normal! $/\c' . l:text . ''
endfun
nnoremap g<CR> :call FindALine()<CR>

" Basic implementation of "go to definition" for ES modules.
nnoremap g? *:tabedit %ggn/from$hhgfgg:nohl

" =========================================
" Commands
" =========================================

" Make it easy to edit these files.
command! HOSTS execute ":e /etc/hosts"
command! VIMRC execute ":e ~/.vimrc"
command! SYSTEM execute ":e ~/projects/textfiles/system.txt"
command! TODO execute ":e ~/projects/work/todo.txt"

" Make it easier to call these commands.
command! GS :Gstatus
command! NTF :NERDTreeFind

" Dual cheatsheets for better organization.
function! s:Cheatsheet()
  if filereadable(expand('~/projects/cheatsheet/cheatsheet.txt')) > 0
    vsplit ~/projects/cheatsheet/cheatsheet.txt
  endif

  if filereadable(expand('~/projects/work/textfiles/cheatsheet.txt')) > 0
    vsplit ~/projects/work/textfiles/cheatsheet.txt
  endif
endfunction
command! CHEAT :call s:Cheatsheet()

" :W should invoke :w, because I always type :W by accident!
command! W execute ":w"

" Removes unnecessary whitespace from otherwise blank lines in the
" current file. This is necessary to allow { and } commands to jump
" intuitively to the beginning/end of paragraphs.
command! -range=% Clearblank <line1>,<line2>:global/^\s*$/normal 0D

" Copy current file name and file path to clipboard.
command! CopyFilename         :let @* = expand('%:t') | echo 'Copied to clipboard: ' . @*
command! CopyPath             :let @* = expand('%:h') | echo 'Copied to clipboard: ' . @*
command! CopyAbsolutePath     :let @* = expand('%:p:h') | echo 'Copied to clipboard: ' . @*
command! CopyFilepath         :let @* = expand('%') | echo 'Copied to clipboard: ' . @*
command! CopyAbsoluteFilepath :let @* = expand('%:p') | echo 'Copied to clipboard: ' . @*

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

" Pretty-print XML in the current buffer.
" From: http://stackoverflow.com/questions/16090869/how-to-pretty-print-xml-from-the-command-line
command! XmlPrettyPrint :%!xmllint --format %

" A convenience command for initiating and formatting a Goyo session for
" comfortable replying to someone else's message. This command assumes that
" the other user's message has already been copied into the default register.
command! Reply :tabnew | :Goyo | execute "normal o\<CR>===\<CR>\<CR>\<Esc>pggi"

" Easy creation of Github Pull Request for current branch against master.
function! s:GithubPullRequest()
  let l:placeholderRegex = '\v\C\{0\}'
  let l:httpsDomainRegex = '\v\Chttps:\/\/\zs[^\/]+\ze\/.+'
  let l:httpsRepoRegex   = '\v\Chttps:\/\/.+\/\zs.+\/.+\ze\.git'
  let l:sshDomainRegex   = '\v\C^.+\@\zs[^:\/]+\ze'
  let l:sshRepoRegex     = '\v\C^.+\@.[^:\/]+:\zs[^.]+\ze\.git'
  let l:urlTemplate      = system('echo $VIM_GITHUB_PR_URL')
  let l:remotes          = system('cd ' . expand('%:p:h') . '; git remote -v')
  let l:branch           = substitute(system('cd ' . expand('%:p:h') . '; git symbolic-ref --short -q HEAD'), '\v[\r\n]', '', 'g')
  let l:urlTemplate      = 'https://{domain}/{repo}/compare/{branch}?expand=1'

  if match(l:remotes, 'https') !=# -1
    let l:domain = matchstr(l:remotes, l:httpsDomainRegex)
    let l:repo   = matchstr(l:remotes, l:httpsRepoRegex)
  else
    let l:domain = matchstr(l:remotes, l:sshDomainRegex)
    let l:repo   = matchstr(l:remotes, l:sshRepoRegex)
  endif

  if l:domain ==# '' || l:repo ==# ''
    echoe 'Could not determine Git repo name for current file!'
  endif

  let l:prUrl = l:urlTemplate
  let l:prUrl = substitute(l:prUrl, '\v\C\{domain\}', l:domain, '')
  let l:prUrl = substitute(l:prUrl, '\v\C\{repo\}', l:repo, '')
  let l:prUrl = substitute(l:prUrl, '\v\C\{branch\}', l:branch, '')

  silent exec "!open '" . shellescape(l:prUrl, 1) . "'"
endfunction
command! PR :call s:GithubPullRequest()

" Easy searching for documentation based on keyword via Google.
function! s:Search(feelingLucky, prefix)
  let l:query = expand('<cword>')
  let l:searchTerm = a:prefix . '%20' . l:query

  let l:feelingLuckyParam = ''

  if a:feelingLucky !=# '!'
    let l:feelingLuckyParam = '\&btnI'
  end

  let l:searchUrl = 'https://www.google.ca/search?q=' . l:searchTerm . l:feelingLuckyParam

  echo l:searchUrl

  silent exec "!open '" . shellescape(l:searchUrl, 1) . "'"
endfunction
command! -bang -range -nargs=* Search :call s:Search('<bang>', '<args>')

" Copy current line to top of file.
command! -range C :let s:startLine = line('.') | <line1>,<line2>:copy 0 | :execute "normal! " . (s:startLine + 1 + (<line2> - <line1>)) . "G"
command! -range T <line1>,<line2>:C

" Move current line to top of file.
command! -range M :let s:startLine = line('.') | <line1>,<line2>:move 0 | :execute "normal! " . (s:startLine + 1 + (<line2> - <line1>)) . "G"

" Search for ES Module imports featuring the current file name
command! Imported :Ag "from.+" . (expand('%:t:r'))

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
command! -nargs=0 -bar Qfargs execute 'args ' . QuickfixFilenames()

" Easy importing of checklists.
function! ExpandChecklistUnderCursor()
  normal! yiW

  let l:CHECKLIST_NAME_REGEX = '\v\@\zs[a-zA-Z0-9_-]+\ze'
  let l:CHECKLIST_FILE_DIRECTORY = '~/projects/work/textfiles/checklists/'

  let l:token = getreg('0')

  let l:name = matchstr(l:token, l:CHECKLIST_NAME_REGEX)

  let l:filePath = expand(l:CHECKLIST_FILE_DIRECTORY . l:name . '*')

  if filereadable(l:filePath)
    execute 'read ' . l:filePath
    .-1delete
  end
endfun
nnoremap <leader>c@ :call ExpandChecklistUnderCursor()<CR>

function! ToggleCheckmark()
  let l:CHECKMARK = '✓'
  let l:UNCHECKED_SYMBOLS_REGEX = '\v[\*\-\=]'

  let l:characterAboveCursor = matchstr(getline(line('.') - 1), '\%' . col('.') . 'c.')
  let l:characterUnderCursor = matchstr(getline(line('.')), '\%' . col('.') . 'c.')
  let l:characterBelowCursor = matchstr(getline(line('.') + 1), '\%' . col('.') . 'c.')

  if l:characterUnderCursor !=# l:CHECKMARK
    execute 'normal r' . l:CHECKMARK
  else
    if match(l:characterBelowCursor, l:UNCHECKED_SYMBOLS_REGEX) ># -1
      execute 'normal r' . l:characterBelowCursor
    elseif match(l:characterAboveCursor, l:UNCHECKED_SYMBOLS_REGEX) ># -1
      execute 'normal r' . l:characterAboveCursor
    else
      execute 'normal r*'
    end
  end
endfun
nnoremap <leader>cc :call ToggleCheckmark()<CR>

" Easy way to run Prettier on the current file.
command! P %!../node_modules/.bin/prettier --stdin

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
" Add the following environment variable to your shell configuration to enable JIRA ticket support:
" export VIM_JIRA_URL=https://your-jira-domain-goes-here.com/browse/{0}
function! BrowserOpen()
  let l:line = getline('.')
  let l:urlRegex = '\v\C[a-z]*:\/\/[^ >,;)]*'

  let l:uri = matchstr(l:line, l:urlRegex)

  if l:uri != ""
    silent exec "!open '" . shellescape(l:uri, 1) . "'"
    return
  endif

  let l:jiraRegex = '\v\C[A-Z]+-\d+'
  let l:jiraUrlPlaceholderRegex = '\v\C\{0\}'

  let l:jiraTicket = matchstr(l:line, l:jiraRegex)

  if l:jiraTicket != ""
    let l:jiraUrl = system('echo $VIM_JIRA_URL')
    let l:jiraUrl = substitute(l:jiraUrl, l:jiraUrlPlaceholderRegex, l:jiraTicket, 'g')
    silent exec "!open '" . shellescape(l:jiraUrl, 1) . "'"
    return
  endif

  echo "No URI or JIRA ticket number found in line."
endfunction
nnoremap gx :call BrowserOpen()<CR>
xnoremap gx :call BrowserOpen()<CR>

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

" Easy insertion of blank lines above or below the cursor line.
" Like unimpaired.vim.
nnoremap [<Space> mzO<Esc>`z
nnoremap ]<Space> mzo<Esc>`z

" =========================================
" Ag.vim
" =========================================

" Disable Ag quickfix and location list mappings.
let g:ag_apply_lmappings = 0
let g:ag_apply_qmappings = 0

" Default to literal (non-regex) searches.
let g:ag_prg="ag --vimgrep --multiline --nogroup --hidden"

" =========================================
" Deoplete
" =========================================
let g:deoplete#enable_at_startup = 1

" =========================================
" vim-easy-align
" =========================================

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" =========================================
" vim-formation
" =========================================

let g:formationSplitType = 'vertical'
nnoremap <leader>ga :Formation all<CR>
nnoremap <leader>gr :Formation component<CR>
nnoremap <leader>gc :Formation container<CR>
nnoremap <leader>gi :Formation index<CR>
nnoremap <leader>gm :Formation mock<CR>
nnoremap <leader>gs :Formation css<CR>
nnoremap <leader>gt :Formation test<CR>

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
let g:goyo_height = 95
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
" incsearch.vim
" =========================================

" Consistent n and N direction.
let g:incsearch#consistent_n_direction = 1

" Basic incsearch mappings. Also, for navigation purpaoes (which is my most
" common use case for the search commands), a literal text search (invoked via
" the \V switch) is a more convenient default.
map /  <Plug>(incsearch-forward)\V
map ?  <Plug>(incsearch-backward)\V
map g/ <Plug>(incsearch-stay)\V

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
" vim-fugitive
" =========================================

" :Gcommit is incompatible with git pre-commit hooks.  "-C %:p:h" replicates
" :Gcommit behavior of committing to the repo that the current buffer's file
" resides within. Without this, the Vim current directory would be used, which
" could be problematic when multiple project directories are being juggled.
"
" See: http://vi.stackexchange.com/questions/2544/how-to-manage-fugitive-commit-with-a-git-pre-commit-hook
"
" <args> is necessary to allow the passing of arbitrary git CLI arguments from
" the Vim command line to git.
"
" Typical usage: :Commit -m "commit message"
command! -nargs=* Commit !git -C %:p:h commit <args>

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
" vim-prettier
" =========================================

" let g:prettier#autoformat = 0
"
" augroup prettier
"   autocmd!
"   autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue 
" augroup END

" =========================================
" Neocomplete
" =========================================

" Activates Neocomplete.
let g:neocomplete#enable_at_startup = 1

" Lock (disable) Neocomplete in files ending with the following extensions. I
" do this mostly because it's annoying to have the completion popup constantly
" appear while writing.
let g:neocomplete#lock_buffer_name_pattern = '\v(\.((txt)|(md)|(markdown)|(mkd)|(git)))|(COMMIT_EDITMSG)$'

" Toggle Neocomplete on/off.
" This is useful when writing comments on code, to temporarily shut up the
" completion popup.
command! NT execute ":NeoCompleteToggle"

" =========================================
" Neosnippet
" =========================================

" 'Installing the default snippets is optional.
" If you choose not to install them, you must set [this].'
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

" Location of snippet files.
let g:neosnippet#snippets_directory = '~/projects/dotfiles/snippets/'

" Mappings for triggering expansion of snippets.
" The imap one will insert a tab if there is no valid snippet to complete.
" The tab triggers Neocomplete completion, which enables me to use 'jk' as a
" universal completion shortcut.
imap <expr> jk neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"
smap jk <Plug>(neosnippet_expand_or_jump)

" =========================================
" NERDTree
" =========================================

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

" Disable default K and J mappings, because they conflict with my custom
" down-five-lines and up-five-lines mappings.
let NERDTreeMapJumpFirstChild=''
let NERDTreeMapJumpLastChild=''

" F5 toggles NERDTree
nnoremap <F5> :NERDTreeToggle<CR>

" =========================================
" Radar
" =========================================

" Radar plugin configuration.
" let g:radar_command_name = 'Ra'

" =========================================
" Whiteboard
" =========================================
let g:whiteboard_command_name = 'Repl'
let g:whiteboard_default_interpreter = 'javascript'
let g:whiteboard_temp_directory = '/tmp/'
let g:whiteboard_interpreters = {}
let g:whiteboard_interpreters.javascript = { 'extension': 'js', 'command': 'node --use_strict --harmony' }

" =========================================
" YankRing
" =========================================

let g:yankring_replace_n_pkey = '<D-P>'

" =========================================
" Unite
" =========================================
let g:unite_enable_auto_select = 0

function! WhiplashGetProjectNames()
  let l:projectNames = system("ls -FP " . '~/projects/')

  " Remove trailing / characters from directory names.
  let l:projectNames = substitute(l:projectNames, '/', '', 'g')

  " Remove trailing @ characters from symbolic links.
  " We are assuming that all symbolic links point to directories.
  let l:projectNames = substitute(l:projectNames, '@', '', 'g')

  " Split into List.
  let l:projects = split(l:projectNames, '\n')

  return l:projects
endfunction

let s:whiplash_source = {
\   "name" : "whiplash",
\   "description" : "Change whiplash projects.",
\   "action_table" : {
\     "whiplash" : {
\       "is_selectable": 0
\     },
\   },
\   "default_action" : "whiplash"
\}

function! s:whiplash_source.action_table.whiplash.func(candidate)
    execute 'Wh ' . a:candidate.word
endfunction

function! s:whiplash_source.gather_candidates(args, context)
  let items = WhiplashGetProjectNames()

  return map(items, '{
\   "word" : v:val
\ }')
endfunction

call unite#define_source(s:whiplash_source)
unlet s:whiplash_source

nnoremap <leader>p :Unite -start-insert -winheight=35 -direction=botright -prompt=> whiplash<CR>
