vim.loader.enable()
--------------------------------------------------------------
-- Sourcing config files
-----------------------------------------------------------
require('confs.options')
require('confs.keybindings')
require('confs.lazy')

-- Kill xsel on leaving an instance of neovim
vim.api.nvim_create_autocmd("VimLeave", {
  group = vim.api.nvim_create_augroup("KillXSel", { clear = true }),
  callback = function()
    os.execute("killall xsel")
  end
})
