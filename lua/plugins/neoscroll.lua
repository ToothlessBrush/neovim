return {
    "karb94/neoscroll.nvim",
    config = function()
        require('neoscroll').setup({
            mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb' },
        })

        local neoscroll = require('neoscroll')
        local keymap = {
            ["<C-n>"] = function() neoscroll.ctrl_d({ duration = 250 }) end,
            ["<C-p>"] = function() neoscroll.ctrl_u({ duration = 250 }) end,
        }
        local modes = { 'n', 'v', 'x' }
        for key, func in pairs(keymap) do
            vim.keymap.set(modes, key, func)
        end
    end,
}
