-- [[ editor options ]]
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.compatible = false
opt.backup = false
opt.swapfile = false
opt.autoread = true
opt.scrolloff = 8

-- indentations
opt.breakindent = true

-- color
opt.termguicolors = true

-- keymaps
local map = vim.keymap.set

map('n', '<S-C>', ':CocCommand')
map('n', '<C-o>', ':Oil<cr>')
map('n', '<S-i>', ':CocList extensions<cr>')
map('n', '<C-x>', ':q!<cr>')
map('n', '<ESC>', ':q<cr>')
map('n', '<S-r>', ':%s/')
map('n', 'wf', ':Format<cr>')
map('n', 'ww', ':w<cr>')
map('n', 'pp', ':Prettier<CR>')
map('n', 't', ':Telescope find_files<CR>')

map('n', '<leader>m', ':lua require("harpoon.mark").add_file()<CR>')
map('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
map('n', '<leader>i', ':lua require("harpoon.ui").select_menu_item()<CR>')
map('n', '<leader>n', ':lua require("harpoon.ui").nav_next()<CR>')
map('n', '<leader>b', ':lua require("harpoon.ui").nav_prev()<CR>')
map('n', '<leader>t', ':tabnew<CR>:Telescope find_files<CR>')

map('i', '<C-k>', '/***/ <Left><Left><Left>')
map('n', '<leader>d', '"_d')
map('x', '<leader>d', '"_d')
map('n', 'x', '"_x')
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('n', '<C-j>', '10gj')
map('n', '<C-k>', '10gk')
map('v', '<C-j>', '10gj')
map('v', '<C-k>', '10gk')
map('n', 'l', 'e')
map('n', 'h', 'b')
