return {
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require('onedark').setup {
                style = 'light'
            }
            require('onedark').load()
        end,
        -- lazy = true,
        cond = not vim.g.vscode,
    },
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
        lazy = true,
        cond = not vim.g.vscode,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        opts = {},
        -- config = function()
        --     vim.cmd.colorscheme('tokyonight-day')
        -- end,
        -- lazy = true,
        cond = not vim.g.vscode,
    },
}
