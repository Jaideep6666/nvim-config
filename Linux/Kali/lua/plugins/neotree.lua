return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        vim.keymap.set("n", "<leader>ft", ":Neotree filesystem reveal left<CR>")
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false;
                    visible = true,
                },
                follow_current_file = true,
                group_empty_dirs = true,
            },
        })
    end,
}
