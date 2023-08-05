return {
  'Shatur/neovim-session-manager',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  config = function()
    require('session_manager').setup {
      autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir,
      autosave_ignore_dirs = {'~/', '/', '~/Desktop', '~/Developer', '~/Downloads'}
    }

    local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {})

    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = 'SessionLoadPost',
      group = config_group,
      callback = function()
        require('nvim-tree.api').tree.toggle(false, true)
      end,
    })
  end
}
