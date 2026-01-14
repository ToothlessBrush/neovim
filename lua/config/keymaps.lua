-- diagnostic
vim.keymap.set('n', "<leader>d", vim.diagnostic.open_float, { desc = "show diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

-- lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto references" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help (insert)" })

-- navigation
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Move to bottom split" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Move to top split" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Move to right split" })

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

-- disable arrow keys
vim.keymap.set('n', '<left>', '<cmd>echo "ARROW KEYS ARE BANNED"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "ARROW KEYS ARE BANNED"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "ARROW KEYS ARE BANNED"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "ARROW KEYS ARE BANNED"<CR>')
vim.keymap.set('i', '<left>', '<cmd>echo "ARROW KEYS ARE BANNED"<CR>')
vim.keymap.set('i', '<right>', '<cmd>echo "ARROW KEYS ARE BANNED"<CR>')
vim.keymap.set('i', '<up>', '<cmd>echo "ARROW KEYS ARE BANNED"<CR>')
vim.keymap.set('i', '<down>', '<cmd>echo "ARROW KEYS ARE BANNED"<CR>')



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
