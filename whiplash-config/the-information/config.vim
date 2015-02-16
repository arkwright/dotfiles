" Put your project-specific Vimscript configuration here!
"
" Remember that this file will not be executed unless it is located in
" a folder with the same name as the project name which you provide to
" Whiplash when invoking the :Whiplash command.

" Ignore huge directories full of files, so that Command-T is nice and fast.
set wildignore+=*/app/bower_components
set wildignore+=*/app/bower_components/**
set wildignore+=*/node_modules/
set wildignore+=*/node_modules/**
set wildignore+=*/www/
set wildignore+=*/www/**
set wildignore+=*/dist/
set wildignore+=*/dist/**

WhiplashCopyFile .agignore
