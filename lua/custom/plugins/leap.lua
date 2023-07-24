return {
  'ggandor/leap.nvim',
  lazy = false,
  dependecies = {
    'tpope/vim-repeat',
  },
  config = function ()
    require('leap').add_default_mappings()
    require('leap').setup({
    })
  end
}
