return {
    {
        'mrcjkb/rustaceanvim',
        lazy = false,
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    settings = {
                        ['rust-analyzer'] = {
                            -- Option 1: Check all targets (recommended)
                            checkOnSave = true,
                            cargo = {
                                allTargets = true,
                            }

                            -- Option 2: Just hide inactive code warnings (faster)
                            -- diagnostics = {
                            --     disabled = { "inactive-code" },
                            -- },
                        },
                    },
                },
                -- Uncomment if you want inlay hints
                -- on_attach = function(_, bufnr)
                --     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                -- end
            }
        end
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    }
}
