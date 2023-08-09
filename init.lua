vim.loader.enable()
vim.cmd([[
colorscheme gruvbox
source ~/.config/nvim/after/colors.vim
source ~/.config/nvim/after/telescope_theme.vim
]])
--------------------------------------------------------------
-- Sourcing config files
-----------------------------------------------------------

require('confs.options')
require('confs.keybindings')

require('confs.packer')
require('confs.aerial')
require('confs.tree_sitter')
require('confs.lsp_config')
require('confs.autopairs')
require('confs.cmp')
require('confs.gitsigns')
require('confs.which_key')
require('confs.nvimtree')
require('confs.lualine')
require('confs.toggleterm')
require('confs.luasnip')
require('confs.bufferline')
require('confs.telescope')
require('confs.colorizer')
require('confs.mini')
require('confs.alpha')
require('confs.flash')
-- require('confs.orgmode')
require('confs.neorg')
require('confs.misc')


-- Kill xsel on leaving an instance of neovim
vim.api.nvim_create_autocmd("VimLeave", {
    group = vim.api.nvim_create_augroup("KillXSel", {clear=true}),
    callback =  function()
        os.execute("killall xsel")
    end
})

