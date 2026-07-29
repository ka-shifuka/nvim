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
opt.scrolloff = 12
opt.sidescrolloff = 20
opt.guicursor = "n-v-i-c:block"

-- indentations
opt.breakindent = true
opt.linebreak = true
opt.breakindentopt = "shift:2"
opt.wrap = false
opt.foldmethod = "indent"
-- opt.foldlevelstart = 99

-- color
opt.termguicolors = true
