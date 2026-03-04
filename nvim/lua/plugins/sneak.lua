return {
    "justinmk/vim-sneak",
    event = "VeryLazy",
    init = function()
        local g = vim.g
        local api = vim.api
        local cmd = vim.cmd

        -- use smartcase and ignorecase
        g["sneak#use_ic_scs"] = 1

        -- disable sneak-s and sneak-S
        vim.keymap.set({ 'n', 'x' }, '<Plug>(Disable-Sneak-s)', '<Plug>Sneak_s')
        vim.keymap.set({ 'n', 'x' }, '<Plug>(Disable-Sneak-S)', '<Plug>Sneak_S')

        -- disable highlight
        api.nvim_set_hl(0, "Sneak", { link = "None" })
        api.nvim_set_hl(0, "SneakScope", { link = "None" })
        api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                api.nvim_set_hl(0, 'Sneak', { link = 'None' })
                api.nvim_set_hl(0, 'SneakScope', { link = 'None' })
            end,
        })
        api.nvim_create_autocmd("User", {
            pattern = "SneakLeave",
            callback = function()
                cmd("highlight clear Sneak")
                cmd("highlight clear SneakCurrent")
                cmd("highlight clear SneakScope")
            end,
        })
    end,
    keys = {
        { "f", "<Plug>Sneak_f", mode = { "n", "x", "o" }, desc = "Sneak Forward to" },
        { "F", "<Plug>Sneak_F", mode = { "n", "x", "o" }, desc = "Sneak Backward to" },
        { "t", "<Plug>Sneak_t", mode = { "n", "x", "o" }, desc = "Sneak Forward till" },
        { "T", "<Plug>Sneak_T", mode = { "n", "x", "o" }, desc = "Sneak Backward till" },
    },
}
