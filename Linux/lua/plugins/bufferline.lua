return {
    'akinsho/bufferline.nvim',
    config = function()
        vim.opt.termguicolors = true
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
    end
}
