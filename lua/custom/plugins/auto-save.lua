return {
  'okuuva/auto-save.nvim',
  config = function()
    require('auto-save').setup {
      debounce_delay = 5000,
    }
  end,
}
