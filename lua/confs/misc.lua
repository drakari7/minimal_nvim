-- Miscellaneous plugin setups and keybindings

-- Call simple plugin setups
require('neodev').setup()
require('Comment').setup()
require('indent_blankline').setup ({
  -- show_current_context = true
})

vim.g.indent_blankline_filetype_exclude = {'norg'}
