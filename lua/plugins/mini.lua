return {
  {
    'echasnovski/mini.bracketed',
    opts = {
      diagnostic = { suffix = '' },
      buffer = { suffix = '' }
    }
  },

  {
    'echasnovski/mini.surround',
    opts = {
      mappings = {
        replace = 'sc', -- Replace surrounding
      },
      search_method = 'cover_or_next'
    }
  },

  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
    },
  },

  {
    'echasnovski/mini.ai',
    config = function()
      local gen_spec = require('mini.ai').gen_spec
      local treesitter = gen_spec.treesitter
      require('mini.ai').setup({
        custom_textobjects = {
          c = treesitter({ a = "@class.outer", i = "@class.inner" }),
          f = treesitter({ a = "@function.outer", i = "@function.inner" }),
          F = treesitter({ a = "@call.outer", i = "@call.inner" }),
          -- B = entire buffer
          B = function()
            local from = { line = 1, col = 1 }
            local to = {
              line = vim.fn.line('$'),
              col = math.max(vim.fn.getline('$'):len(), 1)
            }
            return { from = from, to = to }
          end
        }
      })
    end
  },

  {
    'echasnovski/mini.splitjoin',
    opts = {
      mappings = {
        toggle = 'gs'
      }
    },
  },
}
