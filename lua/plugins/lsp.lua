return {
    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        config = function(_, _)
            -- System-installed clangd (not managed by Mason)
            vim.lsp.config['clangd'] = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                    "--header-insertion-decorators",
                    "--pch-storage=memory",
                    "--offset-encoding=utf-16",
                },
                init_options = {
                    compilationDatabasePath = "build",
                },
                filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
            }
            vim.lsp.enable('clangd')
        end,
    },
    -- Mason
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "ts_ls",
                    "glsl_analyzer",
                    "wgsl_analyzer",
                    "gdscript",
                },
                automatic_enable = true,
            })

            -- Custom config for lua_ls
            vim.lsp.config['lua_ls'] = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            }

            -- Custom config for ts_ls
            vim.lsp.config['ts_ls'] = {
                filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                }
            }

            -- GDScript LSP config
            vim.lsp.config['gdscript'] = {
                filetypes = { "gd", "gdscript", "gdscript3" },
            }
        end,
    },
}
