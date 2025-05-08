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
            actions = {
                open_file = {
                    quit_on_open = true, -- 🚀 this closes the tree after selecting a file
                },
            },
        })

        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    end,
}
