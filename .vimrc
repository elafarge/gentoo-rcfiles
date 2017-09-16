"
" My portable vimrc, with my favorite plugins for Python, Go and DevOps work
" (Terraform, Yaml editing...)
"
" Etienne Lafarge <etienne.lafarge@gmail.com
"

call plug#begin('~/.vim/plugged')

" Essentials
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'lifepillar/vim-solarized8'

" Colorschemes and themes
Plug 'crusoexia/vim-monokai'
Plug 'altercation/vim-colors-solarized'
Plug 'yuttie/hydrangea-vim'
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim'

" Apparently cool but I should dive deeper into them at some point
Plug 'SirVer/ultisnips'

" Show off plug ins (that also help coding actually)
Plug 'airblade/vim-gitgutter'

" Language plugins
Plug 'chrisbra/csv.vim'
Plug 'scrooloose/syntastic'
Plug 'marijnh/tern_for_vim'
Plug 'lervag/vimtex'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'suan/vim-instant-markdown'
Plug 'kylef/apiblueprint.vim'
Plug 'atweiden/vim-uzbl'

" Cool tools for noobs I should get rid of at some point
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'

" No idea what the fuck it is
Plug 'mileszs/ack.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'scrooloose/nerdcommenter'

call plug#end()

filetype plugin indent on

" Interface customisation

set number
set t_Co=256

set mouse=a
set incsearch " Research begins and updates as you type
set hlsearch
set background=dark
let g:solarized_use16 = 16
colorscheme solarized
syntax on

" Tagbar toggle on F8 --and opening at startup--
nmap <F6> :TagbarToggle<CR>
" execute 'TagbarOpen'
" autocmd VimEnter * nested :TagbarOpen
" autocmd BufEnter * nested :TagbarOpen

" Same for NERDTree
" let g:nerdtree_tabs_open_on_console_startup = 1
nmap <F5> :NERDTreeToggle<CR>

" Nice shortcut when doing a rebase (saves at least 2 seconds!!)
autocmd BufRead */git-rebase-todo execute ":%s/pick/squash/gc"

" Fugitive's Glog should open the quickfix window, same for Ggrep
autocmd QuickFixCmdPost *log* cwindow
autocmd QuickFixCmdPost *grep* cwindow

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

let g:vimtex_view_general_viewer = "zathura"
let g:vimtex_view_method = "zathura"

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Silver searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" Fatih fatih fatih
let g:go_autodetect_gopath = 0
let g:go_fmt_command = "goimports"
autocmd BufWritePost *.go GoLint

" Racer
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Home printer configuration
set pdev=ATNPrinter

" Powerline config
let g:airline_powerline_fonts = 1

" Terraform format on save
autocmd BufWritePost *.tf TerraformFmt
