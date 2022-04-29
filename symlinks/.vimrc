" neobundle.vim
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

  " My Bundles here:
  " Refer to |:NeoBundle-examples|.
  " Note: You don't set neobundle setting in .gvimrc!

  " core plugins
  NeoBundle 'gmarik/Vundle.vim' " Vundle itself
  " NeoBundle 'bling/vim-airline' " bottom bar + tabs
  NeoBundle 'vim-airline/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'
  NeoBundle 'edkolev/tmuxline.vim' " I'm still not sure about what it really does
  NeoBundle 'bling/vim-bufferline' " Show buffer in command bar

  " color schemes and code highlighting
  NeoBundle 'danielwe/base16-vim' " Vim colors
  NeoBundle 'vim-ruby/vim-ruby' " Ruby highlighting
  " NeoBundle 'jelera/vim-javascript-syntax' " JavaScript highlighting
  " NeoBundle 'kchmck/vim-coffee-script' " CoffeeScript highlighting
  " NeoBundle 'skammer/vim-css-color' " CSS highlighting
  " NeoBundle 'hail2u/vim-css3-syntax' " Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
  " NeoBundle 'cakebaker/scss-syntax.vim' " SCSS highlighting
  " NeoBundle 'groenewege/vim-less' " vim syntax for LESS (dynamic CSS)
  " NeoBundle 'slim-template/vim-slim' " Slim highlighting
  NeoBundle 'gregsexton/MatchTag' " Vim's MatchParen for HTML tags
  NeoBundle 'scrooloose/syntastic' " syntax analyzer

  " file navigation/search
  NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
  \     'windows' : 'tools\\update-dll-mingw',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'linux' : 'make',
  \     'unix' : 'gmake',
  \    },
  \ } " Interactive command execution in Vim.
  NeoBundle 'Shougo/unite.vim' " Unite and create user interfaces
  NeoBundle 'Shougo/vimshell.vim' " Powerful shell implemented by vim.
  NeoBundle 'Shougo/vimfiler.vim' " Powerful file explorer implemented by Vim script
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'Shougo/neopairs.vim'

  NeoBundle 'junkblocker/unite-codesearch'
  NeoBundle 'junkblocker/unite-tasklist'
  NeoBundle 'jlanzarotta/bufexplorer' " search for files that have been changed
  NeoBundle 'rking/ag.vim' " search for a pattern through the directories (need to install the_silver_searcher)
  NeoBundle 'majutsushi/tagbar' " Vim NeoBundle that displays tags in a window, ordered by scope
  NeoBundle 'skwp/greplace.vim'

  " utils
  NeoBundle 'sjl/gundo.vim' " keep tracking of all undos
  NeoBundle 'tpope/vim-fugitive' " Vim + Git
  NeoBundle 'tpope/vim-surround' " edit what's surrounding a snippet of code
  NeoBundle 'tpope/vim-abolish' " find/replace on steroids
  NeoBundle 'tomtom/tcomment_vim' " comment code
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'tpope/vim-endwise' " close 'if', 'def' etc
  NeoBundle 'vasconcelloslf/vim-interestingwords' " Like Sublime Highlight Words
  NeoBundle 'vim-scripts/PreserveNoEOL' " Prevent remove EOL in Final Lines
  NeoBundle 'terryma/vim-multiple-cursors' " Multi Cursors Like Sublime
  NeoBundle 'mattn/emmet-vim' " Emmet =]
  " NeoBundle 'sentientmonkey/vim-flog' " Vim Flog Plugin
  NeoBundle 'terryma/vim-smooth-scroll' " Make scrolling in Vim more pleasant
  NeoBundle 'MattesGroeger/vim-bookmarks' " Vim bookmark plugin
  NeoBundle 'Raimondi/delimitMate' " Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
  NeoBundle 'Lokaltog/vim-easymotion' " Vim motions on speed!
  " NeoBundle 'Yggdroot/indentLine' " A vim plugin to display the indention levels with thin vertical lines
  NeoBundle 'compactcode/open.vim' " Open files that were found by an external command.
  NeoBundle 'vim-scripts/SQLUtilities' " SQL utilities - Formatting, generate - columns lists, procedures for databases
  NeoBundle 'vim-scripts/Align' " Help folks to align text, eqns, declarations, tables, etc
  NeoBundle 'chrisbra/csv.vim' " A Filetype plugin for csv files
  NeoBundle 'mhinz/vim-hugefile' " Speed up loading of large files.
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'mattn/webapi-vim'
  NeoBundle 'blueyed/vim-diminactive'
  NeoBundle 'fatih/vim-go'
  " NeoBundle 'KabbAmine/zeavim.vim'
  " NeoBundle 'wakatime/vim-wakatime'

  " Snippets
  " NeoBundle 'tomtom/tlib_vim'
  " NeoBundle 'MarcWeber/vim-addon-mw-utils'
  " NeoBundle 'garbas/vim-snipmate'
  " NeoBundle 'honza/vim-snippets'

call neobundle#end()

" load files in vimrc.d
for f in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor

" load all plugins config files
for f in split(glob('~/.vim/vimrc.plugins/*.vim'), '\n')
    exe 'source' f
endfor

NeoBundleCheck
