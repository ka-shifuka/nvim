set nocompatible

call plug#begin()
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ThePrimeagen/harpoon' 
  Plug 'nvim-telescope/telescope.nvim'  
  Plug 'itchyny/lightline.vim'
  Plug 'matze/vim-move'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'stevearc/oil.nvim'
  Plug 'HiPhish/rainbow-delimiters.nvim'
  Plug 'tribela/vim-transparent'
  Plug 'rose-pine/neovim', { 'as': 'rose-pine'}
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-context'
  Plug 'Aasim-A/scrollEOF.nvim'
  Plug 'itchyny/vim-gitbranch'

  Plug '$HOME/repository/presentation.nvim'
call plug#end()

nnoremap <SPACE> <Nop>
let mapleader = " "
let g:netrw_liststyle = 3
let g:netrw_banner = 0  

filetype plugin on

let g:move_key_modifier = 'S'
let g:move_key_modifier_visualmode = 'S'
let g:indentLine_setConceal = 0 

let g:coc_global_extensions = ['coc-json', 'coc-pairs']
"hi CocFloating ctermbg=DarkBlue
hi CocFloating ctermbg=Gray

set background=dark
let g:lightline = {
      \ 'colorscheme': 'rosepine',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \             [ '', 'fileencoding', '', '' ] ],
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B',
      \   'gitbranch': gitbranch#name()
      \ },
      \ }

lua << EOF
require('oil_setup')
require('coc_setup')

require('harpoon_setup')
require('treesitter_setup')
require('ibl_setup')
require('rosepine_setup')
require('telescope_setup')
require('rainbow_setup')
require('key_maps')
require('scrollEOF').setup()

-- require('present')
-- resprite v 1.25.2

vim.cmd("colorscheme rose-pine-dawn")
