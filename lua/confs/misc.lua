-- Miscellaneous plugin setups and keybindings

-- Call simple plugin setups
require('leap').add_default_mappings()
require('Comment').setup()
require('neodev').setup()
require('nvim-surround').setup()
require('indent_blankline').setup {
  -- show_current_context = true
}
