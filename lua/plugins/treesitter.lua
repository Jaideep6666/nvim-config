return {"nvim-treesitter/nvim-treesitter", build=":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "java",
                "cpp",
                "c",
                "python",
                "javascript",
                "c_sharp",
                "html",
                "css",
                "json",
                "typescript",
                "vue",
            },

            highlight = { enable = true },

        })
    end

}
