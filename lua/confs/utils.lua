local M = {}

function M.map(mode, lhs, rhs, description, opts)
  local options = {desc = description}
  if opts then
    options = vim.tbl_extend("keep", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

return M
