return {
  'nvimdev/guard.nvim',
  dependencies = {
    'nvimdev/guard-collection',
  },
  config = function()
    if vim.env.USER == 'foat' then
      local ft = require('guard.filetype')
      ft('python'):fmt('black')
          :append('isort')
      require('guard').setup({
        fmt_on_save = false,
        lsp_as_default_formatter = false,
      })
    end
  end
}
