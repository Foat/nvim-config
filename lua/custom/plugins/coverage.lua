return {
  'andythigpen/nvim-coverage',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-neotest/neotest',
  },
  config = function()
    require("coverage").setup({
      commands = true,
      lang = {
      },
    })
  end,
}
