require("config.lazy")

-- tab use 4 spaces
-- (auto)indent use 4 spaces
-- backspace use 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- jump to line start/end
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

-- clear search highlight
vim.keymap.set('n', '<Leader>h', '<Cmd>nohlsearch<CR>', { silent = true })

-- copy/paste to system clipboard
vim.keymap.set({ 'n', 'v' }, '<Leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<Leader>p', '"+p')

if vim.g.vscode then
    -- vscode commands references: https://code.visualstudio.com/api/references/commands
    local vscode = require("vscode")

    local function reveal_line(pos)
        vscode.action('revealLine', {
            args = { { lineNumber = vim.fn.line('.') - 1, at = pos } }
        })
    end

    -- center screen and clear search highlight
    vim.keymap.set('n', 'zz', function()
        reveal_line('center')
        vim.cmd.nohlsearch()
    end)
    vim.keymap.set('n', 'zt', function()
        reveal_line('top')
        vim.cmd.nohlsearch()
    end)
    vim.keymap.set('n', 'zb', function()
        reveal_line('bottom')
        vim.cmd.nohlsearch()
    end)

    -- save
    vim.keymap.set('n', '<Leader>w', function()
        vscode.action('workbench.action.files.save')
    end)
    vim.keymap.set('n', '<Leader><CR>', function()
        vscode.action('workbench.action.files.save')
    end)
else
    -- n-v: Normal, Visual use block
    -- i-c-ci-ve: Insert, Command-line Normal/Insert, Visual-exclude mode use ver25 (vertical bar)
    -- r-cr: Replace, Command-line Replace mode use block
    -- o: Operator-pending mode use hor20 (horizontal bar)
    -- blinkon0: Disable blinking
    vim.opt.guicursor = {
        "n-v:block-blinkon0",
        "i-c-ci-ve:ver25-blinkon0",
        "r-cr:block-blinkon0",
        "o:hor20-blinkon0",
    }

    -- reset cursor when exit
    vim.api.nvim_create_autocmd("VimLeave", {
        pattern = "*",
        callback = function()
            vim.opt.guicursor = ""
            vim.fn.chansend(vim.v.stderr, "\x1b[0 q")
        end,
    })

    -- insert mode to normal mode
    vim.keymap.set('i', 'jj', '<Esc>')
    vim.keymap.set('i', 'jk', '<Esc>')
    vim.keymap.set('i', 'kk', '<Esc>')
    vim.keymap.set('i', '<M-n>', '<Esc>')

    -- center screen and clear search highlight
    vim.keymap.set('n', 'zz', 'zz<Cmd>nohlsearch<CR>', { silent = true })

    -- save
    vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>')
    vim.keymap.set('n', '<Leader><CR>', '<Cmd>w<CR>')
end
