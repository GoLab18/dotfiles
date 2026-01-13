return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            lua = { "luacheck" },
            go = { "golangcilint" },
            python = { "flake8" },
            javascript = { "eslint_d", "eslint" },
            javascriptreact = { "eslint_d", "eslint" },
            typescript = { "eslint_d", "eslint" },
            typescriptreact = { "eslint_d", "eslint" },
            html = { "htmlhint" },
            php = { "phpstan", "php" },
            cpp = { "clangtidy" },
            cmake = { "cmake_lint" },
            java = { "checkstyle" },
            kotlin = { "ktlint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function() lint.try_lint() end,
        })

        vim.keymap.set("n", "<leader>l", function() lint.try_lint() end, { desc = "Lints current file" })
    end,
}
