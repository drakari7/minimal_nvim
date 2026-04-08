vim.loader.enable()
--------------------------------------------------------------
-- Sourcing config files
-----------------------------------------------------------
require('confs.options')
require('confs.keybindings')
require('confs.lazy')

vim.o.background = 'light'
vim.cmd([[colorscheme gruvbox]])
