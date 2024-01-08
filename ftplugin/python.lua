local buf_map = require('confs.utils').buf_map
buf_map('n', '<leader>rr', ':w<CR>:!python3 %<CR>', 'Execute file')
buf_map('n', '<leader>pr', '^yt<space>oprint(<C-r>")<ESC>', 'Print variable')
buf_map('n', '<leader>di', 'viwoF,d', 'Delete import')

buf_map('n', '<leader>ib', function ()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local boilerplate = {
    "async def main():",
    "    pass",
    "",
    'if __name__ == "__main__":',
    '    asyncio.run(main())'
  }
  vim.api.nvim_buf_set_text(0, row-1, 0, row-1, 0, boilerplate)
end, 'Insert asyncio boilerplate')
