
vim.api.nvim_set_hl(0, 'LineNr', { fg = "#72D667", bold = true })

local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.wrap = false

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 10

opt.autoindent = true

opt.signcolumn = "yes"

opt.cursorline = true
