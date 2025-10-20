return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()

            require("nvim-dap-virtual-text").setup({
                commented = true,
            })

            vim.fn.sign_define("DapBreakpoint", {
                text = "",
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            })

            vim.fn.sign_define("DapBreakpointRejected", {
                text = "",
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            })

            vim.fn.sign_define("DapStopped", {
                text = "→",
                texthl = "DiagnosticSignWarn",
                linehl = "Visual",
                numhl = "DiagnosticSignWarn",
            })

            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end

            vim.keymap.set("n", "<leader>du", dapui.toggle)

            vim.keymap.set("n", "<F5>", dap.continue)
            vim.keymap.set("n", "<F10>", dap.step_over)
            vim.keymap.set("n", "<F11>", dap.step_into)
            vim.keymap.set("n", "<F12>", dap.step_out)
            vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<Leader>B", dap.set_breakpoint)
            vim.keymap.set(
                "n",
                "<Leader>lp",
                function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end
            )
            vim.keymap.set("n", "<Leader>dr", dap.repl.open)
            vim.keymap.set("n", "<Leader>dl", dap.run_last)
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            local dappy = require("dap-python")

            dappy.setup()

            vim.keymap.set("n", "<leader>dn", dappy.test_method)
            vim.keymap.set("n", "<leader>df", dappy.test_class)
            vim.keymap.set("v", "<leader>ds", dappy.debug_selection)
        end,
    },
}
