require("config.lazy")

local o = vim.o
local g = vim.g
local fn = vim.fn
local api = vim.api
local cmd = vim.cmd
local opt = vim.opt
local map = vim.keymap.set

-- timeout
o.timeoutlen = 300

-- tab use 4 spaces
-- (auto)indent use 4 spaces
-- backspace use 4 spaces
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartcase = true
opt.ignorecase = true

-- jump to line start/end
map({ 'n', 'x', 'o' }, '<Leader>h', '^')
map({ 'n', 'x', 'o' }, '<Leader>l', '$')

-- copy/paste to system clipboard
map({ 'n', 'v' }, '<Leader>y', '"+y')
map({ 'n', 'v' }, '<Leader>p', '"+p')

if g.vscode then
    -- vscode commands references: https://code.visualstudio.com/api/references/commands
    local vscode = require("vscode")
    local action = vscode.action

    -- clear search highlight, close marker widget
    map('n', '<Leader>c', function()
        cmd.nohlsearch()
        action('closeMarkersNavigation')
    end)

    -- center screen and clear search highlight
    local function reveal_line(pos)
        action('revealLine', {
            args = { { lineNumber = fn.line('.') - 1, at = pos } }
        })
    end
    map('n', 'zz', function()
        reveal_line('center')
        cmd.nohlsearch()
    end)
    map('n', 'zt', function()
        reveal_line('top')
        cmd.nohlsearch()
    end)
    map('n', 'zb', function()
        reveal_line('bottom')
        cmd.nohlsearch()
    end)

    -- go to type definition
    map('n', 'gy', function()
        action('editor.action.goToTypeDefinition')
    end)

    -- go to previous problem/diagnostic
    map('n', ']d', function()
        action('editor.action.marker.next')
    end)
    -- go to next problem/diagnostic
    map('n', '[d', function()
        action('editor.action.marker.prev')
    end)
    -- somehow the nextInFiles/prevInFiles doesn't work well
    -- go to next problem/diagnostic in all files
    -- map('n', ']D', function()
    --     action('editor.action.marker.nextInFiles')
    -- end)
    -- go to previous problem/diagnostic in all files
    -- map('n', '[D', function()
    --     action('editor.action.marker.prevInFiles')
    -- end)
    -- code action
    map('n', '<leader>a', function()
        action('editor.action.quickFix')
    end)

    -- rename symbol
    map('n', '<Leader>r', function()
        action('editor.action.rename')
    end)

    -- save
    map('n', '<Leader>w', function()
        action('workbench.action.files.save')
    end)
    map('n', '<Leader><CR>', function()
        action('workbench.action.files.save')
    end)
else
    -- n-v: Normal, Visual use block
    -- i-c-ci-ve: Insert, Command-line Normal/Insert, Visual-exclude mode use ver25 (vertical bar)
    -- r-cr: Replace, Command-line Replace mode use block
    -- o: Operator-pending mode use hor20 (horizontal bar)
    -- blinkon0: Disable blinking
    opt.guicursor = {
        "n-v:block-blinkon0",
        "i-c-ci-ve:ver25-blinkon0",
        "r-cr:block-blinkon0",
        "o:hor20-blinkon0",
    }

    -- reset cursor when exit
    api.nvim_create_autocmd("VimLeave", {
        pattern = "*",
        callback = function()
            opt.guicursor = ""
            fn.chansend(vim.v.stderr, "\x1b[0 q")
        end,
    })

    -- clear search highlight
    map('n', '<Leader>c', function()
        cmd.nohlsearch()
    end)

    -- center screen and clear search highlight
    map('n', 'zz', function()
        cmd.normal('zz')
        cmd.nohlsearch()
    end)

    -- insert mode to normal mode
    map('i', 'jj', '<Esc>')
    map('i', 'jk', '<Esc>')
    map('i', 'kk', '<Esc>')
    map('i', '<M-n>', '<Esc>')

    -- save
    map('n', '<Leader>w', '<Cmd>w<CR>')
    map('n', '<Leader><CR>', '<Cmd>w<CR>')
end
