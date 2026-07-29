local map = vim.keymap.set

map("n", "<S-o>", ":Oil<cr>")
map("n", "<S-i>", ":CocList extensions<cr>")
map("n", "th", ":Telescope harpoon marks<cr>")
map("n", "r", ":redraw<cr> :noh<cr>")
map("n", "<C-c>", "<ESC>")
map("x", "<C-c>", "<ESC>")

map("n", "<leader>v", ":Format<cr>")
map("n", "<leader>j", ":Telescope find_files<cr>")

-- Harpoon
map("n", "<leader>m", ":lua require(\"harpoon.mark\").add_file()<cr>")
map("n", "<leader>h", ":lua require(\"harpoon.ui\").toggle_quick_menu()<cr>")
map("n", "<leader>o", ":lua require(\"harpoon.ui\").select_menu_item()<cr>")
map("n", "<leader>n", ":lua require(\"harpoon.ui\").nav_next()<cr>")
map("n", "<leader>b", ":lua require(\"harpoon.ui\").nav_prev()<cr>")

-- map("n", "<leader>u", ":lua require(\"undotree\").toggle()<cr>")

map("i", "<C-k>", "/***/ <Left><Left><Left>")
map("n", "<leader>d", "\"_d")
map("x", "<leader>d", "\"_d")
map("n", "<leader>y", "\"y")
map("x", "<leader>y", "\"y")
map("n", "<leader>p", "\"p")
map("x", "<leader>p", "\"p")
map("n", "x", "\"_x")
map("n", "j", "gj")
map("n", "k", "gk")

map("n", "<C-j>", "10gj")
map("n", "<C-k>", "10gk")
map("v", "<C-j>", "10gj")
map("v", "<C-k>", "10gk")

local is_number_mode = true
local function change_number_mode()
    if is_number_mode then
        vim.opt.number = false
        vim.opt.relativenumber = false
        is_number_mode = false
        return
    end
    is_number_mode = true
    vim.opt.number = true
    vim.opt.relativenumber = true
end
map("n", "<C-n>", change_number_mode)

vim.api.nvim_create_user_command("Fig", function(args)
    vim.cmd(":r!figlet -f slant " .. "\"" .. args.args .. "\"")
end, { nargs = 1 })
vim.api.nvim_create_user_command("Figsm", function(args)
    vim.cmd(":r!figlet -f smslant " .. "\"" .. args.args .. "\"")
end, { nargs = 1 })

vim.api.nvim_create_user_command("Wrap", function(_)
    vim.cmd(":set wrap")
end, { nargs = 0 })
vim.api.nvim_create_user_command("NoWrap", function(_)
    vim.cmd(":set nowrap")
end, { nargs = 0 })

local function m()
    vim.cmd(":r!printf \"--- \"")
    vim.api.nvim_input("$")
end

local function n()
    vim.cmd(":r!printf \"local graphics = love.graphics\"")
end

map("n", "<leader>kk", m)
map("n", "<leader>kg", n)

-- vim.api.nvim_create_user_command("MiniMap", function(_)
--     vim.cmd("lua MiniMap.toggle()")
-- end, { nargs = 0 })
