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
Plug("mbbill/undotree")
Plug("atiladefreitas/dooing")

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
--vim.api.nvim_set_hl(0, "CocFloating", { ctermbg = "DarkBlue" })

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
    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
    multiwindow = false,      -- Enable multiwindow support.
    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = "outer",     -- Which context lines to discard if `max_lines` is exceeded. Choices: "inner", "outer"
    mode = "cursor",          -- Line used to calculate context. Choices: "cursor", "topline"
    -- Separator between context and content. Should be a single character string, like "-".
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20,     -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
require("dooing").setup({
    -- Core settings
    save_path = vim.fn.stdpath("data") .. "/dooing_todos.json",
    pretty_print_json = false,     -- Pretty-print JSON output (requires jq or python)

    -- Timestamp settings
    timestamp = {
        enabled = true,     -- Show relative timestamps (e.g., @5m ago, @2h ago)
    },

    -- Interface style (see "Modern UI" below). Opt-in: the default keeps the
    -- original look, so updating never changes your interface.
    ui = {
        style = "modern",             -- "classic" | "modern"
        sections = true,               -- group top-level todos under status headings
        priority_bar = true,           -- colored marker instead of coloring the whole row
        tree_connectors = true,        -- draw ├─ / └─ / │ guides for nested tasks
        note_preview = true,           -- first line of a todo's notes, dimmed, beneath it
        progress = true,               -- progress bar in the title, summary in the footer
        compact_quick_keys = true,     -- single strip instead of the tall quick keys panel
        section_titles = {
            in_progress = "IN PROGRESS",
            pending = "PENDING",
            done = "DONE",
        },
        icons = {
            priority_bar = "▎",
            overdue = "󰀦",
            progress_on = "▰",
            progress_off = "▱",
        },
    },

    -- Window settings
    window = {
        -- Size of the floating window; may also be a function returning a
        -- table with these keys (see "Adaptive Window Size" below)
        dimensions = {
            width = 55,          -- Width of the floating window
            height = 20,         -- Height of the floating window
        },
        border = 'rounded',      -- Border style: 'single', 'double', 'rounded', 'solid'
        zindex = 50,             -- Base z-index for floating windows (uses zindex to zindex+5)
        position = 'center',     -- Window position: 'right', 'left', 'top', 'bottom', 'center',
        -- 'top-right', 'top-left', 'bottom-right', 'bottom-left'
        padding = {
            top = 1,
            bottom = 1,
            left = 2,
            right = 2,
        },
    },

    -- To-do formatting
    formatting = {
        pending = {
            icon = "○",
            format = { "icon", "notes_icon", "text", "due_date", "ect" },
        },
        in_progress = {
            icon = "◐",
            format = { "icon", "text", "due_date", "ect" },
        },
        done = {
            icon = "✓",
            format = { "icon", "notes_icon", "text", "due_date", "ect" },
        },
    },

    quick_keys = true,     -- Quick keys window

    notes = {
        icon = "📓",
    },

    scratchpad = {
        syntax_highlight = "markdown",
    },

    -- Per-project todos
    per_project = {
        enabled = true,                       -- Enable per-project todos
        default_filename = "dooing.json",     -- Default filename for project todos
        auto_gitignore = false,               -- Auto-add to .gitignore (true/false/"prompt")
        on_missing = "prompt",                -- What to do when file missing ("prompt"/"auto_create")
        auto_open_project_todos = false,      -- Auto-open project todos on startup if they exist
    },

    -- Nested tasks
    nested_tasks = {
        enabled = true,                          -- Enable nested subtasks
        indent = 2,                              -- Spaces per nesting level
        retain_structure_on_complete = true,     -- Keep nested structure when completing tasks
        move_completed_to_end = true,            -- Move completed nested tasks to end of parent group
        inherit_priority = false,                -- Inherit parent priorities and skip the priority prompt
    },

    -- Due date notifications
    due_notifications = {
        enabled = true,        -- Enable due date notifications
        on_startup = true,     -- Show notification on Neovim startup
        on_open = true,        -- Show notification when opening todos
    },

    -- Keymaps
    keymaps = {
        toggle_window = "<leader>l",             -- Toggle global todos
        open_project_todo = "<leader>tD",         -- Toggle project-specific todos
        show_due_notification = "<leader>tN",     -- Show due items window
        new_todo = "i",
        create_nested_task = "o",        -- Create nested subtask under current todo
        toggle_todo = "x",
        delete_todo = "d",
        delete_completed = "D",
        close_window = "q",
        undo_delete = "u",
        add_due_date = "H",
        remove_due_date = "r",
        toggle_help = "?",
        toggle_tags = "t",
        toggle_priority = "<Space>",
        clear_filter = "c",
        edit_todo = "e",
        edit_tag = "e",
        edit_priorities = "p",
        delete_tag = "d",
        search_todos = "/",
        add_time_estimation = "T",
        remove_time_estimation = "R",
        import_todos = "I",
        export_todos = "E",
        remove_duplicates = "<leader>D",
        open_todo_scratchpad = "<leader>p",
        refresh_todos = "f",
    },

    calendar = {
        language = "en",
        start_day = "sunday",     -- or "monday"
        icon = "",
        keymaps = {
            previous_day = "h",
            next_day = "l",
            previous_week = "k",
            next_week = "j",
            previous_month = "H",
            next_month = "L",
            select_day = "<CR>",
            close_calendar = "q",
        },
    },


    -- Priority settings
    priorities = {
        {
            name = "important",
            weight = 4,
        },
        {
            name = "urgent",
            weight = 2,
        },
    },
    priority_groups = {
        high = {
            members = { "important", "urgent" },
            color = nil,
            hl_group = "DiagnosticError",
        },
        medium = {
            members = { "important" },
            color = nil,
            hl_group = "DiagnosticWarn",
        },
        low = {
            members = { "urgent" },
            color = nil,
            hl_group = "DiagnosticInfo",
        },
    },
    hour_score_value = 1 / 8,
    done_sort_by_completed_time = false,
})


require "keymaps"
