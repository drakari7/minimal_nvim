return {
  'akinsho/toggleterm.nvim',
  opts = {
    open_mapping = [[<c-\>]],
    direction = 'float',
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
      border = "curved",
      -- width = <value>,
      -- height = <value>,
      -- row = <value>,
      -- col = <value>,
      -- winblend = 3,
      -- zindex = <value>,
      -- title_pos = 'left' | 'center' | 'right', position of the title of the floating window
    },
    highlights = {

    },
  }
}
