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
  Plug 'ThePrimeagen/vim-be-good'
call plug#end()

nnoremap <SPACE> <Nop>
let mapleader = " "
let g:netrw_liststyle = 3
let g:netrw_banner = 0  

let g:rainbow_delimiters = {
    \ 'strategy': {
        \ '': rainbow_delimiters#strategy.global,
    \ },
    \ 'query': {
        \ '': 'rainbow-delimiters',
    \ },
    \ 'priority': {
        \ '': 110,
    \ },
    \ 'highlight': [
        \ 'RainbowDelimiterBlue',
        \ 'RainbowDelimiterCyan',
        \ 'RainbowDelimiterGreen',
        \ 'RainbowDelimiterViolet',
        \ 'RainbowDelimiterYellow',
        \ 'RainbowDelimiterOrange',
        \ 'RainbowDelimiterRed',
    \ ],
    \ }

filetype plugin on

let g:move_key_modifier = 'S'
let g:move_key_modifier_visualmode = 'S'
let g:indentLine_setConceal = 0 

let g:coc_global_extensions = ['coc-json', 'coc-pairs']
hi CocFloating ctermbg=LightBlue

set background=light
let g:lightline = {
      \ 'colorscheme': 'rosepine',
      \ }

lua << EOF
require('oil_setup')
require('coc_setup')
require('harpoon_setup')
require('treesitter_setup')
require('ibl_setup')
require('rosepine_setup')
require('telescope_setup')
require('key_maps')

vim.cmd("colorscheme rose-pine-dawn")
