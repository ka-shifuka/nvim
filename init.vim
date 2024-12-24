set nocompatible
call plug#begin()

  " Plug 'sheerun/vim-polyglot'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ThePrimeagen/harpoon'
  Plug 'nvim-telescope/telescope.nvim'  
  Plug 'Aasim-A/scrollEOF.nvim'
  Plug 'voldikss/vim-floaterm'
  Plug 'itchyny/lightline.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'matze/vim-move'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'stevearc/oil.nvim'
  Plug 'tribela/vim-transparent'
  Plug 'HiPhish/rainbow-delimiters.nvim'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

colorscheme catppuccin_mocha 

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

let g:floaterm_width = &columns
let g:floaterm_height =  25 
let g:floaterm_position = 'bottom'
let g:move_key_modifier = 'S'
let g:move_key_modifier_visualmode = 'S'

let g:indentLine_setConceal = 0 

let g:coc_global_extensions = ['coc-json', 'coc-prettier', 'coc-emmet', 'coc-tsserver', 'coc-pairs', 'coc-clangd', '@yaegassy/coc-tailwindcss3', '@yaegassy/coc-volar', 'coc-css']
hi CocFloating ctermbg=DarkBlue

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
au FileType html let b:coc_root_patterns = ['.git', '.env', 'tailwind.config.js', 'tailwind.config.cjs']
au FileType vue let b:coc_root_patterns = ['.git', '.env', 'package.json', 'tsconfig.json', 'jsconfig.json', 'vite.config.ts', 'vite.config.js', 'vue.config.js', 'nuxt.config.ts']

let g:indentLine_char = '▏'

let g:lightline = {
      \ 'colorscheme': 'ayu_mirage',
      \ }

lua << EOF
require('key_maps')
require('oil_setup')
require('coc_setup')
require('harpoon_setup')
require('treesitter_setup')
