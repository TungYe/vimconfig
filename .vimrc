" 131102: for vundle
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
set nocompatible " be iMproved
filetype off " required!
let iCanHazVundle=1
let vundle_readme=expand("~/.vim/bundle/vundle/README.md")
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" General Vim
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'loremipsum'
Plugin 'tpope/vim-surround'
" 'L9' is for 'FuzzyFinder'.
Plugin 'L9'
Plugin 'FuzzyFinder'
" 140130
Plugin 'DrawIt'
" 140201
Plugin 'tpope/vim-repeat'
Plugin 'ingo-library'
Plugin 'visualrepeat'
Plugin 'junegunn/vim-easy-align'

" For SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'

" C/C++
Plugin 'taglist.vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'brookhong/cscope.vim'
Plugin 'a.vim'

" 140130: Gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" 140204: Markdown
Plugin 'plasticboy/vim-markdown'

" 140216: Git
Plugin 'tpope/vim-fugitive'

" 150213: Vim-LaTeX
Plugin 'vim-latex/vim-latex'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-unimpaired'
"Plugin 'matchit.zip' " Avoid possible confusion
Plugin 'kana/vim-textobj-user' " Installed for dependency
Plugin 'kana/vim-textobj-lastpat' " Practical Vim Tip 84
Plugin 'bronson/vim-visual-star-search' " Practical Vim Tip 86
Plugin 'tangledhelix/vim-octopress'

if iCanHazVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif
filetype plugin indent on
" Setting up Vundle - the vim plugin bundler end

" General settings
"set nocompatible
set hlsearch " highlight search (Tip 50 in Practical Vim)
set incsearch " incremental search
set ignorecase smartcase " 140203: see usr_27.txt
"set linebreak " for soft word wrap
set smartindent
set expandtab " use whitespaces instead of tabs
set shiftwidth=4 " indent 4 space char
set tabstop=8
set softtabstop=4 " indent 4 space char
set textwidth=70
set encoding=utf-8
set history=200 " memory has become much cheaper

augroup textCompletion
  au!
  au Filetype html,mkd,markdown,text inoremap <buffer> (     ()<++><Left><Left><Left><Left><Left>
  au Filetype html,mkd,markdown,text inoremap <buffer> ((    (
  au Filetype html,mkd,markdown,text inoremap <buffer> ()    ()<++><Left><Left><Left><Left><Left>
  au Filetype html,mkd,markdown,text inoremap <buffer> [     []<++><Left><Left><Left><Left><Left>
  au Filetype html,mkd,markdown,text inoremap <buffer> [[    [
  au Filetype html,mkd,markdown,text inoremap <buffer> []    []<++><Left><Left><Left><Left><Left>
  au Filetype html,mkd,markdown,text inoremap <buffer> {     {}<++><Left><Left><Left><Left><Left>
  au Filetype html,mkd,markdown,text inoremap <buffer> {{    {
  au Filetype html,mkd,markdown,text inoremap <buffer> {}    {}<++><Left><Left><Left><Left><Left>
  au Filetype html,mkd,markdown,text inoremap <buffer> ''    ''<++><Left><Left><Left><Left><Left>
  au Filetype html,mkd,markdown,text inoremap <buffer> ""    ""<++><Left><Left><Left><Left><Left>
  au Filetype html,mkd,markdown,text inoremap <buffer> <     <<Left><Right>><++><Left><Left><Left><Left><Left>
  au Filetype html,mkd,markdown,text inoremap <buffer> <<    <

  au Filetype mkd,markdown inoremap <buffer> ``    ``<++><Left><Left><Left><Left><Left>
  au Filetype mkd,markdown inoremap <buffer> **    **<++><Left><Left><Left><Left><Left>
augroup END

augroup specIndent
  au!
  au Filetype tex,mkd,markdown,css,scss,html,javascript,vim setlocal shiftwidth=2
augroup END

" 131211
nnoremap <F3> :NERDTreeToggle<CR>
set pastetoggle=<F5> " Practical Vim Tip 63
nnoremap <F12> :TlistToggle<CR>
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Practical Vim Tip 34: Avoid cursors when rcl'g cmd from hist
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" C/C++ settings
" 131214:
" http://blog.wuwon.id.au/2011/10/vim-plugin-for-navigating-c-with.html
let g:clang_auto_select=1
let g:clang_complete_auto=0
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_periodic_quickfix=0
let g:clang_snippets=1
let g:clang_snippets_engine="clang_complete"
let g:clang_conceal_snippets=1
let g:clang_exec="clang"
let g:clang_user_options=""
let g:clang_auto_user_options="path, .clang_complete"
let g:clang_use_library=1
let g:clang_library_path="/usr/lib/"
let g:clang_sort_algo="priority"
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
let g:clang_debug=1
nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>
" C/C++ settings end

" LaTeX-Suite settings start
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat='pdf' " for beamer/word count/xelatex
"let g:Tex_CompileRule_pdf='pdflatex --shell-escape -interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode $*'
" 140713: TikZ pattern fill doesn't support XeLaTeX well, so switch
" back to pdflatex
"let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats='dvi,pdf'

" Set file and display encodings into UTF-8
" 131214: do them in modeline, which is specific to file and independent of system
"set fileencoding=utf-8
"set encoding=utf-8
" LaTeX-Suite settings end

" Gist settings start
let g:gist_get_multiplefile = 1
" Gist settings end

" Vim-easy-align settings start
" 140201: From the official 1-min guide
" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)
" Vim-easy-align settings end

" Vim Tmux Navigator settings start
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<CR>
" Vim Tmux Navigator settings end