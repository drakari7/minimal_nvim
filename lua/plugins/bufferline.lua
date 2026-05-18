return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-mini/mini.icons' },
  opts = {
    options = {
      show_buffer_close_icons = false,
      move_wraps_at_ends = true,
      custom_filter = function(buf, _)
        return vim.bo[buf].filetype ~= "qf"
      end,
    },
  },
  keys = function()
    local bufferline = require('bufferline')

    local keys = {
      { ']b',         function() bufferline.cycle(1) end,                  desc = 'Next buffer' },
      { '[b',         function() bufferline.cycle(-1) end,                 desc = 'Prev buffer' },
      { '<leader>bn', function() bufferline.move(1) end,                   desc = 'Move buffer next' },
      { '<leader>bN', function() bufferline.move(-1) end,                  desc = 'Move buffer prev' },
      { '<leader>bp', '<cmd>BufferLineTogglePin<CR>',                      desc = 'Pin buffer' },
      { '<leader>bs', function() bufferline.sort_by('directory') end,      desc = 'Sort buffers by directory' },
    }

    for idx = 1, 9 do
      table.insert(keys, { '<leader>' .. idx, function() bufferline.go_to(idx) end, desc = 'Goto buffer ' .. idx })
    end

    return keys
  end,
}
