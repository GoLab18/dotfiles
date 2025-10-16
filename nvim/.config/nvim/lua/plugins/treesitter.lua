return {
  'nvim-treesitter/nvim-treesitter',
--  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "sc",
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "html",
        "python"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
