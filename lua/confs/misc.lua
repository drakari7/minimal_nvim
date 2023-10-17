-- Miscellaneous plugin setups and keybindings

-- Call simple plugin setups
require('neodev').setup()
require('Comment').setup()
require('ibl').setup({
  exclude = { filetypes = { 'norg', 'help' } },
  scope = { enabled = false },
})
