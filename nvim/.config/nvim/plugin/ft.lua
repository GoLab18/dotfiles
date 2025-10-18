  vim.filetype.add {
    filename = {
      ['.env'] = 'sh',
      ['.envrc'] = 'sh',
    },
    pattern = {
      ['^%.env.*'] = 'sh',     -- matches .env, .env.local, etc.
      ['^%.envrc.*'] = 'sh',   -- matches .envrc, .envrc.local, etc.
    }
  }
