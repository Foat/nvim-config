return {
  'Shatur/neovim-session-manager',
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function()
    require('session_manager').setup {
      autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
      autosave_ignore_dirs = {'~/', '/', '~/Desktop', '~/Developer', '~/Downloads'}
    }

    local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {})

    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = "SessionLoadPost",
      group = config_group,
      callback = function()
        local bufferDeleteLoaded, bufferDelete = pcall(require, 'bufdelete')
        require('nvim-tree.api').tree.toggle(false, true)
        local buffer_filter = function(buf)
          if vim.api.nvim_buf_is_valid(buf) and not vim.api.nvim_buf_get_option(buf, 'buflisted')
          then
            return true
          end
          return false
        end
        -- close unlisted buffers
        local unlistedBuffers = vim.tbl_filter(buffer_filter, vim.api.nvim_list_bufs())
        for _, buf in pairs(unlistedBuffers) do
          if bufferDeleteLoaded then
            bufferDelete.bufwipeout(buf, true)
          end
        end
        -- close floating windows
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local config = vim.api.nvim_win_get_config(win)
          if config.relative ~= '' then
            vim.api.nvim_win_close(win, false)
          end
        end
      end,
    })
  end
}
