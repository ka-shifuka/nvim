require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = {    -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    float = {
        transparent = false,       -- enable transparent floating windows
        solid = false,             -- use solid styling for floating windows, see |winborder|
    },
    term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false,           -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,         -- percentage of the shade to apply to the inactive window
    },
    no_italic = true,              -- Force no italic
    no_bold = true,                -- Force no bold
    no_underline = false,          -- Force no underline
    styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },   -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
    color_overrides = {
        latte = {
            -- Menyesuaikan warna dasar (Background & Text) ala Rosé Pine (Dawn flavor)
            rosewater = "#ce1719",
            flamingo = "#b4637a",
            pink = "#d7827e",
            mauve = "#907aa9",
            red = "#b4637a",
            maroon = "#b4637a",
            peach = "#ea9d34",
            yellow = "#d79921", -- atau #ea9d34
            green = "#286983",
            teal = "#56949f",
            sky = "#56949f",
            sapphire = "#286983",
            blue = "#286983",
            lavender = "#907aa9",

            -- UI & Background (Rosé Pine Dawn equivalent)
            text = "#575279",
            subtext1 = "#615988",
            subtext0 = "#797593",
            overlay2 = "#9893a5",
            overlay1 = "#b9b5bc",
            overlay0 = "#cecacd",
            surface2 = "#dedcdb",
            surface1 = "#dfdad9",
            surface0 = "#f2e9e1",

            base = "#faf4ed",   -- Background utama Rosé Pine Dawn
            mantle = "#f4ede8", -- Background panel/sidebar
            crust = "#ebe5df",  -- Background paling gelap/border
        }
    },
    custom_highlights = {},
    auto_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin-nvim"
