require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "javascript" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    enable = true,
  },
}


