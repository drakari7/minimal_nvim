local buf_map = require('confs.utils').buf_map
buf_map('n', '<leader>rr', ':w<CR>:!python3 %<CR>', 'Execute file')
buf_map('n', '<leader>pr', '^yt<space>oprint(<C-r>")<ESC>', 'Print variable')
buf_map('n', '<leader>di', 'viwoF,d', 'Delete import')
buf_map('n', '<leader>oi', '<cmd>PyrightOrganizeImports<CR>', 'Organize imports')

buf_map('n', '<leader>ib', function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local boilerplate = {
    "async def main():",
    "    pass",
    "",
    'if __name__ == "__main__":',
    '    asyncio.run(main())'
  }
  vim.api.nvim_buf_set_text(0, row - 1, 0, row - 1, 0, boilerplate)
end, 'Insert asyncio boilerplate')

local function append_path(var, path_to_append)
  local res = var and var or ""
  return res .. ":" .. path_to_append
end

buf_map('n', '<leader>sc', function()
  local colo = "/home/shreyash/crypto_options/colo"
  local lib64 = colo .. "/dist-gcc/lib64"
  local typings = colo .. "/typings"
  vim.env.PYTHONPATH = append_path(vim.env.PYTHONPATH, lib64)
  vim.env.PYTHONPATH = append_path(vim.env.PYTHONPATH, typings)
  vim.env.LD_LIBRARY_PATH = append_path(vim.env.LD_LIBRARY_PATH, lib64)
  -- vim.lsp.stop_client(vim.lsp.get_clients())
  -- vim.lsp.start_client(vim.lsp.get_clients())
  -- print(vim.inspect(vim.lsp.get_clients()))
  print("Sourced " .. lib64)
end, 'Source lib64')


buf_map('n', '<leader>gf', ":w<CR>:!black -l 120 %<CR>", "Format file with Black")
-- buf_map('v', '<leader>gf', function()
--   -- Need to leave visual mode as that updates the '< and '> mark values
--   require('confs.utils').leave_visual_mode()
--   local vstart = vim.fn.getpos("'<")
--   local vend = vim.fn.getpos("'>")
--   local lstart = vstart[2]
--   local lend = vend[2]
--
--   local command = "black " .. vim.fn.expand('%') .. " --line-ranges " .. lstart .. "-" .. lend
--   -- local output = vim.fn.system(command)
--   -- print(output)
--
--   local command = {
--     "black",
--     vim.fn.expand('%'),
--     -- "--line-ranges",
--     -- lstart .. "-" .. lend
--   }
--   print(vim.inspect(command))
--
--   local on_exit = function(obj)
--     print(obj.code)
--     print(obj.signal)
--     print(obj.stdout)
--     print(obj.stderr)
--   end
--   vim.system(command, {}, on_exit):wait()
--   print("echo")
-- end, 'Black Format')
