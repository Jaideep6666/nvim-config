return {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("colorizer").setup({
            filetypes = { "*" },
            user_default_options = {
                RGB      = true; -- #RGB hex codes
                RRGGBB   = true; -- #RRGGBB hex codes
                names    = true; -- "blue" or "red"
                RRGGBBAA = true; -- #RRGGBBAA hex codes
                rgb_fn   = true; -- CSS rgb() and rgba()
                hsl_fn   = true; -- CSS hsl() and hsla()
                css      = true; -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn   = true; -- Enable all CSS *functions*: rgb_fn, hsl_fn
                tailwind = true; -- Enable tailwind colors
                mode     = "background"; -- Available: foreground | background | virtualtext
            },
        })
    end
}
