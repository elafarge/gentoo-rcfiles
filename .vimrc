

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'
Plugin 'lervag/vimtex'
Plugin 'chrisbra/csv.vim'
Plugin 'SirVer/ultisnips'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'altercation/vim-colors-solarized'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()

filetype plugin indent on

" Interface customisation

syntax on
set number

set background=dark
set mouse=a
set incsearch " Research begins and updates as you type
" set guifont=Ubuntu\ Mono:h11
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
hi Normal ctermbg=none

" Tagbar toggle on F8 --and opening at startup--
nmap <F6> :TagbarToggle<CR>
" execute 'TagbarOpen'
" autocmd VimEnter * nested :TagbarOpen
" autocmd BufEnter * nested :TagbarOpen

" Same for NERDTree
" let g:nerdtree_tabs_open_on_console_startup = 1
nmap <F5> :NERDTreeTabsToggle<CR>

" Automatic cd to Datadog's Project directory
" cd /Users/etiennelafarge/Documents/Projects

" Nice shortcut when doing a rebase (saves at least 2 seconds!!)
autocmd BufRead */git-rebase-todo execute ":%s/pick/squash/gc"

" Fugitive's Glog should open the quickfix window, same for Ggrep
autocmd QuickFixCmdPost *log* cwindow
autocmd QuickFixCmdPost *grep* cwindow

" Color highlightings
highlight ColorColumn ctermbg=235 guibg=#0f0d0d
let &colorcolumn="80,".join(range(100,999),",")

" Better tab navigation with finely crafted shortcuts
nnoremap <C-]> :tabnext<CR>
" nnoremap <C-[> :tabprevious<CR>
nnoremap <C-T> :tabnew<CR>

" Better window navigation with finely tuned shortcuts
nmap <silent> <S-h> :wincmd h<CR>
nmap <silent> <S-j> :wincmd j<CR>
nmap <silent> <S-k> :wincmd k<CR>
nmap <silent> <S-l> :wincmd l<CR>

" Better window resize with finely crafted shortcuts
nmap <silent> <C-l> :exe "vertical resize +5"<CR>
nmap <silent> <C-h> :exe "vertical resize -5"<CR>
nmap <silent> <C-j> :exe "resize +3"<CR>
nmap <silent> <C-k> :exe "resize -3"<CR>

" Let's use PyLint as a python linter for Syntastic & YouCompleteMe
let g:syntastic_python_checkers = ['pylint']

" If we have a .pylintrc file in the current directory let's tell pylint to
" use it !
if filereadable("./.pylintrc")
    let g:syntastic_python_pylint_args = '--rcfile=./.pylintrc'
end

" Indentation tweaks
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" UtilSnips configuration
let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/.vim/snippets"]
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsExpandTrigger="<Leader>S"
let g:UltiSnipsListSnippets="<Leader>L"

" YCM configuration
let g:EclimCompletionMethod="omnifunc"

" Shell escape for LatexMK
let g:vimtex_latexmk_options="--shell-escape"

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
