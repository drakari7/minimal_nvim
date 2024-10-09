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

buf_map('n', '<leader>sl', function()
  local colo = "/home/shreyash/crypto_options/colo"
  local lib64 = colo .. "/dist-gcc/lib64"
  local typings = colo .. "/typings"
  vim.env.PYTHONPATH = append_path(vim.env.PYTHONPATH, lib64)
  vim.env.PYTHONPATH = append_path(vim.env.PYTHONPATH, typings)
  vim.env.LD_LIBRARY_PATH = append_path(vim.env.LD_LIBRARY_PATH, lib64)
  vim.cmd("LspRestart")
  print("Sourced " .. lib64)
end, 'Source lib64')

buf_map('n', '<leader>se', function()
  local colo = "/home/shreyash/crypto_options/colo"
  local clients = colo .. "/subprojects/crypto_clients/python"
  vim.env.PYTHONPATH = append_path(vim.env.PYTHONPATH, clients)
  vim.cmd("LspRestart")
  print("Sourced " .. clients)
end, 'Source exchange_clients')

buf_map('n', '<leader>sc', function()
  local colo = "/home/shreyash/crypto_options/colo"
  local subprojects = colo .. "/subprojects/"
  vim.env.PYTHONPATH = append_path(vim.env.PYTHONPATH, subprojects)
  vim.cmd("LspRestart")
  print("Sourced " .. subprojects)
end, 'Source subprojects')

-- Auto inserts an f at the start of string if you insert a { character
-- Disabled because it's not that good
-- vim.api.nvim_create_augroup("py-fstring", { clear = true })
-- vim.api.nvim_create_autocmd("InsertCharPre", {
--   pattern = { "*.py" },
--   group = "py-fstring",
--   callback = function(opts)
--     -- Only run if f-string escape character is typed
--     if vim.v.char ~= "{" then
--       return
--     end
--
--     -- Get node and return early if not in a string
--     local node = vim.treesitter.get_node()
--
--     if node:type() ~= "string" then
--       node = node:parent()
--     end
--
--     if node:type() ~= "string" then
--       return
--     end
--
--     -- Get parent string node and its range
--     local row, col, _, _ = vim.treesitter.get_node_range(node:parent())
--     col = col + 1
--
--     -- Return early if string is already a format string
--     local first_char = vim.api.nvim_buf_get_text(opts.buf, row, col, row, col + 1, {})[1]
--     if first_char == "f" then
--       return
--     end
--
--     -- Otherwise, make the string a format string
--     vim.api.nvim_input("<Esc>m'" .. row + 1 .. "gg" .. col + 1 .. "|if<Esc>`'la")
--   end,
-- })
