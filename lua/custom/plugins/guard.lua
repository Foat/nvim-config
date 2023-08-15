return {
  'nvimdev/guard.nvim',

  config = function()
    if vim.loop.os_uname().sysname == 'Darwin' then
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
