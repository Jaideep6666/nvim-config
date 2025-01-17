require("settings")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim

require("lazy").setup("plugins")


vim.cmd.colorscheme("rose-pine-dawn")
vim.keymap.set("v", "<C-c>", '"+y', {noremap = true, silent = true})
vim.keymap.set("n", "<C-v>", '"+p', {noremap = true, silent = true})
vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) 
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- For sign columns
vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" }) -- For vertical splits
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" }) -- For line numbers
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" }) -- For the cursor line
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" }) -- Cursor line numbers
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" }) -- For empty lines
-- vim.o.guifont = "JetBrainsMono Nerd Font:h12" -- Replace with your preferred font and size
