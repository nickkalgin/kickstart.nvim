return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        separator_style = 'slant',
        right_mouse_command = function(n)
          Snacks.bufdelete(n)
        end,
      },
    }
  end,
}
