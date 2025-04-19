vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")
if os.getenv("XDG_SESSION_DESKTOP") == "Hyprland" then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) 
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- For sign columns
    vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" }) -- For vertical splits
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" }) -- For line numbers
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" }) -- For the cursor line
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" }) -- Cursor line numbers
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" }) -- For empty lines
end
vim.g.plain_mode = true


function ToggleTheme()
    if vim.g.plain_mode then
        vim.cmd("set background=light") -- Light mode helps keep contrast
        vim.cmd("colorscheme default")  -- Use the default colorscheme
        vim.cmd("TSDisable highlight")  -- Fully disable Treesitter highlights
        vim.cmd("set syntax=off")       -- Disable syntax highlighting

        for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
            vim.api.nvim_set_hl(0, group, { fg = "white", bg = "none" }) -- Transparent background
        end
        vim.g.plain_mode = false

    else
        vim.o.background = "dark"
        vim.cmd.colorscheme = "gruvbox"
        vim.g.plain_mode = true
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) 
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- For sign columns
		vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" }) -- For vertical splits
		vim.api.nvim_set_hl(0, "LineNr", { bg = "none" }) -- For line numbers
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" }) -- For the cursor line
		vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" }) -- Cursor line numbers
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" }) -- For empty lines
    end
end

-- vim.api.nvim_set_keymap("n", "<leader>tp", ":lua ToggleTheme()<CR>", { noremap = true, silent = true })
-- for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
--     vim.api.nvim_set_hl(0, group, { fg = "white", bg = "none" }) -- Transparent background
-- end
-- vim.o.background = "dark"
