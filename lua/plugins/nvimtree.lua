-- return {}

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {'<leader>nn', function () require('nvim-tree.api').tree.toggle() end, desc = 'NvimTree toggle'},
    {'<leader>nf', function () require('nvim-tree.api').tree.focus() end, desc = 'NvimTree focus'},
    {'<leader>nr', function () require('nvim-tree.api').tree.reload() end, desc = 'NvimTree refresh'},
  },
  opts = {
    disable_netrw = true,
    renderer = {
      indent_markers = {
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
    },

    update_cwd  = false,
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    view = {
      -- width = math.floor(vim.o.columns * 0.2),
      side = 'left',
    },
    git = {
      enable = false,
    },
    filters = {
      dotfiles = true,
      custom = {
        '__pycache__',
      }
    },
  }
}
