return {
    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Lua LSP
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            vim.g.lspconfig_skip_setup = { "rust-analyzer" }

            -- Other servers
            lspconfig.pyright.setup({})
            lspconfig.glsl_analyzer.setup({})
            -- Enhanced Clangd for embedded development
            lspconfig.clangd.setup({
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
                    "--query-driver=/usr/bin/arm-none-eabi-*", -- Important for cross-compilation
                },
                init_options = {
                    compilationDatabasePath = "build", -- Where your compile_commands.json is
                    fallbackFlags = {
                        "-std=c11",
                        "-Wall",
                        "-Wextra",
                        "-I/usr/arm-none-eabi/include",
                        "-DSTM32F411xE",
                    },
                },
                filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
                root_dir = lspconfig.util.root_pattern(
                    "compile_commands.json",
                    "compile_flags.txt",
                    ".git",
                    "CMakeLists.txt"
                ),
            })

            -- TypeScript LSP - try both names
            lspconfig.ts_ls.setup({
                -- Explicit TypeScript/JavaScript file types
                filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
                -- Additional settings
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                },
            })
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
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "ts_ls", -- Changed from "tsserver" to "ts_ls"
                "clangd",
                "glsl_analyzer",
            },
        },
    },
}
