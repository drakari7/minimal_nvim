local map = require('confs.utils').map

return {
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        show_buffer_close_icons = false,
        move_wraps_at_ends = true,
        custom_filter = function (buf, buf_nums)
          return vim.bo[buf].filetype ~= "qf"
        end
      }
    },

    init = function ()
      local bufferline = require('bufferline')
      for idx=1,9 do
        map('n', '<leader>'..idx, function () bufferline.go_to(idx) end, 'Goto buffer '..idx)
      end

      map('n', ']b', function() bufferline.cycle(1)  end, 'Next buffer')
      map('n', '[b', function() bufferline.cycle(-1) end, 'Prev buffer')
      map('n', '<leader>bn', function() bufferline.move(1)  end, 'Move buffer next')
      map('n', '<leader>bN', function() bufferline.move(-1) end, 'Move buffer prev')
      map('n', '<leader>bp', '<cmd>BufferLineTogglePin<CR>', 'Pin buffer')
      map('n', '<leader>bs', function() bufferline.sort_by('directory') end, 'Sort buffers by directory')
    end
  }
}
