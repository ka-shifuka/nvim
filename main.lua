local Plug = vim.fn["Plug#"]
vim.call("Plug#Begin")
Plug("nvim-lua/plenary.nvim")

Plug("neoclide/coc.nvim", { branch = "release" })
Plug("ThePrimeagen/harpoon")
Plug("nvim-telescope/telescope.nvim")
Plug("itchyny/lightline.vim")
Plug("matze/vim-move")
Plug("nvim-tree/nvim-web-devicons")
Plug("lukas-reineke/indent-blankline.nvim")
Plug("stevearc/oil.nvim")
Plug("tribela/vim-transparent")

vim.call("Plug#End")
