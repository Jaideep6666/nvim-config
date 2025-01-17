return {
	"github/copilot.vim",
	config = function()
        -- -- GitHub Copilot Keymaps
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>(copilot-next)", { silent = true })
        vim.api.nvim_set_keymap("i", "<C-h>", "<Plug>(copilot-previous)", { silent = true })
        vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>(copilot-dismiss)", { silent = true })
        --
	end,
}
