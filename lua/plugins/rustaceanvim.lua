return {
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false,   -- This plugin is already lazy
        -- init = function()
        --     vim.g.rustaceanvim = {
        --         on_attach = function(_, bufnr)
        --             vim.lsp.inlay_hint.enable(true, bufnr)
        --         end
        --     }
        -- end
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    }
}
