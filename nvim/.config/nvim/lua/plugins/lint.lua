return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            lua = { "luacheck" },
            go = { "golangcilint" },
            python = { "flake8" },
            javascript = { "eslint_d", "eslint", stop_after_first = true },
            javascriptreact = { "eslint_d", "eslint", stop_after_first = true },
            typescript = { "eslint_d", "eslint", stop_after_first = true },
            typescriptreact = { "eslint_d", "eslint", stop_after_first = true },
            html = { "htmlhint" },
            css = { "stylelint" },
            php = { "phpstan", "php" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function() lint.try_lint() end,
        })

        vim.keymap.set("n", "<leader>l", function() lint.try_lint() end, { desc = "Lints current file" })
    end,
}
