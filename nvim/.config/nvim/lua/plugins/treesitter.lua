return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup()

            local langs = {
                "lua",
                "vim",
                "vimdoc",
                "bash",
                "javascript",
                "typescript",
                "html",
                "css",
                "python",
                "json",
                "jsonc",
                "go",
                "gomod",
                "gosum",
                "gotmpl",
                "goctl",
                "gowork",
                "templ",
                "java",
                "javadoc",
                "c",
                "cpp",
                "yaml",
                "toml",
                "diff",
                "markdown",
            }

            require("nvim-treesitter").install(langs)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = langs,
                callback = function()
                    -- syntax highlighting, provided by Neovim
                    vim.treesitter.start()

                    -- folds, provided by Neovim
                    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

                    -- indentation, provided by nvim-treesitter
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
