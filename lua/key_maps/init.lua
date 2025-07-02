-- [[ editor options ]]
local opt = vim.opt

vim.g.editorconfig = true

opt.number = true
opt.relativenumber = true
opt.compatible = false
opt.backup = false
opt.swapfile = false
opt.autoread = true
opt.cursorline = true
opt.lazyredraw = true
opt.updatetime = 300
opt.tabstop = 4
opt.shiftwidth = 4
opt.scrolloff = 6
opt.guicursor = "n-v-i-c:block"

-- indentations
opt.breakindent = true
opt.linebreak = true
opt.breakindentopt = "shift:2"

-- color
opt.termguicolors = true

-- keymaps
local map = vim.keymap.set

map("n", "<S-o>", ":Oil<cr>")
map("n", "<S-i>", ":CocList extensions<cr>")
map("n", "th", ":Telescope harpoon marks<cr>")
map("n", "r", ":redraw<cr> :noh<cr>")
map("n", "<C-c>", "<ESC>")
map("x", "<C-c>", "<ESC>")

map("n", "<leader>v", ":Format<cr>")
map("n", "<leader>t", ":Telescope find_files<cr>")

-- Harpoon
map("n", "<leader>m", ":lua require(\"harpoon.mark\").add_file()<cr>")
map("n", "<leader>h", ":lua require(\"harpoon.ui\").toggle_quick_menu()<cr>")
map("n", "<leader>o", ":lua require(\"harpoon.ui\").select_menu_item()<cr>")
map("n", "<leader>n", ":lua require(\"harpoon.ui\").nav_next()<cr>")
map("n", "<leader>b", ":lua require(\"harpoon.ui\").nav_prev()<cr>")

map("i", "<C-k>", "/***/ <Left><Left><Left>")
map("n", "<leader>d", "\"_d")
map("x", "<leader>d", "\"_d")
map("n", "<leader>y", "\"+y")
map("x", "<leader>y", "\"+y")
map("n", "<leader>p", "\"+p")
map("x", "<leader>p", "\"+p")
map("n", "x", "\"_x")
map("n", "j", "gj")
map("n", "k", "gk")
-- map("n", "<C-j>", ")")
-- map("n", "<C-k>", "(")
-- map("v", "<C-j>", ")")
-- map("v", "<C-k>", "(")

map("n", "<C-j>", "10gj")
map("n", "<C-k>", "10gk")
map("v", "<C-j>", "10gj")
map("v", "<C-k>", "10gk")

local upWordState = false
function changeL()
    local mode = vim.api.nvim_get_mode().mode
    if upWordState and mode == "n" then
        vim.cmd(":normal w<CR>")
        upWordState = false
    elseif not upWordState and mode == "n" then
        vim.cmd(":normal e<CR>")
        upWordState = true
    else
        vim.cmd(":normal! l")
    end
end

local state = true
function chnumber()
    if state then
        vim.opt.number = false
        vim.opt.relativenumber = false
        state = false
        return
    end
    state = true
    vim.opt.number = true
    vim.opt.relativenumber = true
end

map("n", "<C-n>", chnumber)
