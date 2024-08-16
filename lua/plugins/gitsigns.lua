local map = require('confs.utils').map


return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local gs = require('gitsigns')
    gs.setup({
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        -- Navigation
        map('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']h', bang = true })
          else
            gs.nav_hunk('next')
          end
        end, "Next hunk")

        map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[h', bang = true })
          else
            gs.nav_hunk('prev')
          end
        end, "Prev hunk")

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
        map('n', '<leader>hS', gs.stage_buffer, 'Stage buffer')
        map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
        map('n', '<leader>hR', gs.reset_buffer, 'Reset buffer')
        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, 'Stage hunk')
        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, 'Reset hunk')
        map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo stage hunk')
        map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
        map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Git blame')
        map('n', '<leader>tb', gs.toggle_current_line_blame, 'Toggle linewise git blame')
        map('n', '<leader>hd', gs.diffthis, 'Diff this')
        map('n', '<leader>hD', function() gs.diffthis('~') end, 'Diff this against last commit')
        map('n', '<leader>td', gs.toggle_deleted, "Toggle deleted")

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    })
  end
}
