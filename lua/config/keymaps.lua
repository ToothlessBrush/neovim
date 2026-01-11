-- Centralized Keymaps Configuration

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", function()
    require("telescope.builtin").find_files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
    require("telescope.builtin").live_grep()
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>fb", function()
    require("telescope.builtin").buffers()
end, { desc = "Find buffers" })

vim.keymap.set("n", "<leader>fh", function()
    require("telescope.builtin").help_tags()
end, { desc = "Help tags" })

vim.keymap.set("n", "<leader>th", ":Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })

-- NvimTree keymaps
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- DAP (Debug Adapter Protocol) keymaps
vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
end, { desc = "DAP Continue" })

vim.keymap.set("n", "<F1>", function()
    require("dap").step_over()
end, { desc = "DAP Step Over" })

vim.keymap.set("n", "<F2>", function()
    require("dap").step_into()
end, { desc = "DAP Step Into" })

vim.keymap.set("n", "<F3>", function()
    require("dap").step_out()
end, { desc = "DAP Step Out" })

vim.keymap.set("n", "<Leader>b", function()
    require("dap").toggle_breakpoint()
end, { desc = "DAP Toggle Breakpoint" })

vim.keymap.set("n", "<Leader>B", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP Conditional Breakpoint" })

vim.keymap.set("n", "<Leader>dr", function()
    require("dap").repl.open()
end, { desc = "DAP REPL" })

vim.keymap.set("n", "<Leader>du", function()
    require("dapui").toggle()
end, { desc = "Toggle DAP UI" })
