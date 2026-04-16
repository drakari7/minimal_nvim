local buf_map = require('confs.utils').buf_map
buf_map('n', '<leader>rr', ':w<CR>:!cargo run<CR>', 'Execute file')

buf_map("n", "gra", function() vim.cmd.RustLsp("codeAction") end, "Code Action")
buf_map("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, "Hover")

vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = 0,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
