return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "slant",
      },
    })
    vim.keymap.set("n", "<leader>n", ":BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<leader>p", ":BufferLineCyclePrev<CR>")
    vim.keymap.set("n", "<leader>mb", ":BufferLinePick<CR>")
    vim.keymap.set("n", "<leader>cb", ":BufferLinePickClose<CR>")
  end,
}

