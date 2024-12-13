let g:polyglot_disabled = ['vue', 'markdown']

set nocompatible

call plug#begin()

  Plug 'sheerun/vim-polyglot'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ThePrimeagen/harpoon'
  Plug 'nvim-telescope/telescope.nvim'  
  Plug 'tpope/tpope-vim-abolish'
  Plug 'Aasim-A/scrollEOF.nvim'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'voldikss/vim-floaterm'
  Plug 'itchyny/lightline.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'matze/vim-move'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'stevearc/oil.nvim'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'tribela/vim-transparent'
  " Plug 'tpope/vim-fugitive'
  " Plug 'nvim-tree/nvim-tree.lua'
  " Plug 'ryanoasis/vim-devicons'
  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Plug 'ap/vim-css-color'
  " Plug 'scrooloose/nerdtree'
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Plug 'echasnovski/mini.icons'
  " Plug 'junegunn/fzf'
  " Plug 'psliwka/vim-smoothie'
  " Plug 'kyazdani42/nvim-web-devicons'
  " theme "
  " Plug 'sickill/vim-monokai'
  " Plug 'morhetz/gruvbox'

call plug#end()

colorscheme catppuccin_mocha

nnoremap <SPACE> <Nop>
let mapleader=" "

"-- My keymap --"
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
nnoremap <S-n> :Oil<CR> :only<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0  

filetype plugin on

" floaterm
let g:floaterm_width = &columns
let g:floaterm_height =  25 
let g:floaterm_position = 'bottom'
let g:move_key_modifier = 'S'
let g:move_key_modifier_visualmode = 'S'

hi CocFloating ctermbg=Black

au FileType html let b:coc_root_patterns = ['.git', '.env', 'tailwind.config.js', 'tailwind.config.cjs']
au FileType vue let b:coc_root_patterns = ['.git', '.env', 'package.json', 'tsconfig.json', 'jsconfig.json', 'vite.config.ts', 'vite.config.js', 'vue.config.js', 'nuxt.config.ts']
let g:indentLine_char = '▏'

" termux api cliboard need termux:api.apk
au TextYankPost * call system('termux-clipboard-set &', @")
function Paste(p)
    let sysclip=system('termux-clipboard-get')
    if sysclip != @"
        let @"=sysclip
    endif
    return a:p
endfunction
noremap <expr> <C-p> Paste('p')
noremap <expr> <C-p> Paste('P')


lua << EOF
require('key_maps')
require('scrollEOF').setup()
require('oil_setup')
require('coc_setup')
