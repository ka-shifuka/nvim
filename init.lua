local Plug = vim.fn["plug#"]
vim.call("plug#begin")
Plug("nvim-lua/plenary.nvim")

Plug("neoclide/coc.nvim", { branch = "release" })

Plug("nvim-treesitter/nvim-treesitter-context")
Plug("romus204/tree-sitter-manager.nvim")
Plug("lukas-reineke/indent-blankline.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-tree/nvim-web-devicons")
Plug("Aasim-A/scrollEOF.nvim")
Plug("ThePrimeagen/harpoon")
Plug("itchyny/lightline.vim")
Plug("itchyny/vim-gitbranch")
Plug("stevearc/oil.nvim")
Plug("nat-418/boole.nvim")
Plug("matze/vim-move")

Plug("tribela/vim-transparent")
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
-- Set custom foreground and background colors for inlay hints
vim.api.nvim_set_hl(0, "CocInlayHint", { fg = "#d7827e", bg = "NONE" })
vim.api.nvim_set_hl(0, "CocFloating", { ctermbg = "Gray" })
-- vim.api.nvim_set_hl(0, "CocFloating", { ctermbg = "DarkBlue" })

vim.g.loaded_clipboard_provider = 1
vim.opt.background = "dark"
vim.opt.clipboard = ""

vim.filetype.add({
    pattern = {
        ['.*/%.github[%w/]+workflows[%w/]+.*%.ya?ml'] = 'yaml.github',
    },
})

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
        icon = "",
        -- icon = "",
    },
    component_function = {
        gitbranch = "gitbranch#name",
    },
}

require "rose-pine-setup"
vim.cmd "colorscheme rose-pine-dawn"

require "options"

require "telescope-setup"
require "harpoon-setup"
require "coc-setup"
require "ibl-setup"
require "oil-setup"

require("scrollEOF").setup()
require("tree-sitter-manager").setup()
require("boole").setup({
    mappings = {
        increment = "<C-a>",
        decrement = "<C-x>"
    },
    -- User defined loops
    additions = {
        { "Foo", "Bar" },
        { "tic", "tac", "toe" }
    },
    allow_caps_additions = {
        { "enable", "disable" }
        -- enable → disable
        -- Enable → Disable
        -- ENABLE → DISABLE
    }
})
require("treesitter-context").setup {
    enable = true,          -- Enable this plugin (Can be enabled/disabled later via commands)
    multiwindow = false,    -- Enable multiwindow support.
    max_lines = 0,          -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0,  -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = "outer",   -- Which context lines to discard if `max_lines` is exceeded. Choices: "inner", "outer"
    mode = "cursor",        -- Line used to calculate context. Choices: "cursor", "topline"
    -- Separator between context and content. Should be a single character string, like "-".
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20,   -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

require "keymaps"
