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
vim.keymap.set("i", "<C-H>", "<C-W>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
