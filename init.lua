local Plug = vim.fn["plug#"]
vim.call("plug#begin")
Plug("nvim-lua/plenary.nvim")

Plug("ThePrimeagen/harpoon")
Plug("nvim-telescope/telescope.nvim")
Plug("itchyny/lightline.vim")
Plug("matze/vim-move")
Plug("nvim-tree/nvim-web-devicons")
Plug("lukas-reineke/indent-blankline.nvim")
Plug("stevearc/oil.nvim")
Plug("tribela/vim-transparent")
Plug("Aasim-A/scrollEOF.nvim")
Plug("itchyny/vim-gitbranch")
Plug("jbgutierrez/vim-better-comments")
Plug("AlessandroYorba/Sierra")
Plug("kepano/flexoki-neovim")
Plug("romus204/tree-sitter-manager.nvim")

Plug("neoclide/coc.nvim", { branch = "release" })
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug("rose-pine/neovim", { as = "rose-pine" })
vim.call("plug#end")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

vim.g.move_key_modifier = "S"
vim.g.move_key_modifier_visualmode = "S"
vim.g.indentLine_setConceal = 0

vim.g.coc_global_extensions = { "coc-json", "coc-pairs" }
vim.api.nvim_set_hl(0, "CocFloating", { ctermbg = "Gray" })
-- vim.api.nvim_set_hl(0, "CocFloating", { ctermbg = "DarkBlue" })

vim.g.loaded_clipboard_provider = 1
vim.opt.background = "dark"
vim.opt.clipboard = ""

vim.g.lightline = {
    colorscheme = "rosepine",
    active = {
        right = {
            { "lineinfo" },
            { "percent" },
            { "",        "fileencoding", "", "" },
        },
        left = {
            { "mode", "paste" },
            { "icon", "gitbranch", "readonly", "filename", "modified" },
        },
    },
    component = {
        icon = "",
    },
    component_function = {
        gitbranch = "gitbranch#name",
    },
}

require("rose-pine-setup")
require("catppuccin-setup")
vim.cmd("colorscheme rose-pine-dawn")

require("telescope-setup")
require("harpoon-setup")
require("coc-setup")
require("ibl-setup")
require("oil-setup")
require("scrollEOF").setup()
require("tree-sitter-manager").setup()

require("keymaps")
-- resprite v 1.25.2
