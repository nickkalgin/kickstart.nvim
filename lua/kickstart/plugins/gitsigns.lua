-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gl', '<cmd>LazyGit<cr>', desc = 'LazyGit Repo History' },
      { '<leader>gf', '<cmd>LazyGitFilterCurrentFile<cr>', desc = 'LazyGit File History' },
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next Git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous Git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>gs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git [s]tage hunk' })
        map('v', '<leader>gr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git [r]eset hunk' })
        -- normal mode
        map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Git [s]tage hunk' })
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Git [r]eset hunk' })
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Git [S]tage buffer' })
        map('n', '<leader>gu', gitsigns.stage_hunk, { desc = 'Git [u]ndo stage hunk' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Git [R]eset buffer' })
        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Git [p]review hunk' })
        map('n', '<leader>gb', gitsigns.blame, { desc = 'Git [b]lame' })
        map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Git [d]iff against index' })
        map('n', '<leader>gD', function()
          gitsigns.diffthis '@'
        end, { desc = 'Git [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle Git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle Git show [D]eleted' })
      end,
    },
  },
}
