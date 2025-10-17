return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require'mason'.setup {}
    end
  },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'lua_ls',
        'gopls',
        'java_language_server'
      }
    },
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig'
    }
  }
}
