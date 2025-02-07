vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.guicursor = ""
vim.g.mapleader = " "
vim.keymap.set("v", "<C-c>", '"+y', {noremap = true, silent = true})
vim.keymap.set("n", "<C-v>", '"+p', {noremap = true, silent = true})
