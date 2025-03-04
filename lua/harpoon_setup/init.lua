require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 35,
  },
})

require("telescope").load_extension('harpoon')
