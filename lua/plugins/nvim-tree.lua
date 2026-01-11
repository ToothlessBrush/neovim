return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            hijack_netrw = true,
            view = {
                width = 30,
                side = "left",
            },
            update_focused_file = {
                enable = true,
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            renderer = {
                highlight_diagnostics = true,
            },
            git = {
                ignore = false,
            }
        })
    end,
}
