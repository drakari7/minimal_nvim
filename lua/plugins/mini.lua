return {
  {
    'echasnovski/mini.bracketed',
    opts = {
      diagnostic = {suffix = ''},
      buffer = {suffix = ''}
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
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },

  {
    'echasnovski/mini.ai',
    opts = {}
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
