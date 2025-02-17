local function term_nav(dir)
  ---@param self snacks.terminal
  return function(self)
    return self:is_floating() and '<c-' .. dir .. '>' or vim.schedule(function()
      vim.cmd.wincmd(dir)
    end)
  end
end

return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    explorer = { enabled = true },
    terminal = {
      -- your terminal configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      win = {
        keys = {
          nav_k = { '<C-k>', term_nav 'k', desc = 'Go to Upper Window', expr = true, mode = 't' },
        },
      },
    },
  },
  keys = {
    {
      '<leader>T',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<leader>E',
      function()
        Snacks.explorer()
      end,
      desc = 'File Explorer',
    },
  },
}
