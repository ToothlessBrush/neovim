return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        -----------------------------------------------------------------------
        -- Auto-detect LLDB adapter
        -----------------------------------------------------------------------
        local lldb_cmd = vim.fn.executable("lldb-vscode") == 1 and "lldb-vscode"
            or (vim.fn.executable("lldb-dap") == 1 and "lldb-dap" or nil)

        if not lldb_cmd then
            vim.notify("No lldb-vscode or lldb-dap found in PATH", vim.log.levels.ERROR)
        else
            dap.adapters.lldb = {
                type = "executable",
                command = lldb_cmd,
                name = "lldb",
            }
        end

        -----------------------------------------------------------------------
        -- Configurations
        -----------------------------------------------------------------------
        dap.configurations.rust = {
            {
                name = "Rust: launch (debug build)",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }

        dap.configurations.c = {
            {
                name = "C: launch with LLDB",
                type = "lldb",
                request = "launch",
                program = function() return vim.fn.input("Program: ", vim.fn.getcwd() .. "/", "file") end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }
        dap.configurations.cpp = dap.configurations.c

        -----------------------------------------------------------------------
        -- Keymaps
        -----------------------------------------------------------------------
        vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "DAP Continue" })
        vim.keymap.set("n", "<F1>", function() dap.step_over() end, { desc = "DAP Step Over" })
        vim.keymap.set("n", "<F2>", function() dap.step_into() end, { desc = "DAP Step Into" })
        vim.keymap.set("n", "<F3>", function() dap.step_out() end, { desc = "DAP Step Out" })
        vim.keymap.set("n", "<Leader>b", function() dap.toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })
        vim.keymap.set("n", "<Leader>B", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "DAP Conditional Breakpoint" })
        vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end, { desc = "DAP REPL" })

        -----------------------------------------------------------------------
        -- DAP-UI integration with bigger boxes
        -----------------------------------------------------------------------
        local ok, dapui = pcall(require, "dapui")
        if ok then
            dapui.setup({
                layouts = {
                    {
                        elements = {
                            "scopes",
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        size = 80, -- width of left panel (default 40)
                        position = "left",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 30, -- height of bottom panel (default 10)
                        position = "bottom",
                    },
                },
                controls = {
                    enabled = true,
                    element = "repl",
                },
            })

            dap.listeners.after.event_initialized["dapui_autoopen"]  = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_autoclose"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_autoclose"]     = function() dapui.close() end

            vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointCondition",
                { text = "◆", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointRejected",
                { text = "✖", texthl = "DiagnosticSignHint", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped",
                { text = "→", texthl = "DiagnosticSignInfo", linehl = "Visual", numhl = "" })

            vim.keymap.set("n", "<Leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })
        else
            vim.notify("nvim-dap-ui not found; UI panels disabled", vim.log.levels.WARN)
        end
    end,
}
