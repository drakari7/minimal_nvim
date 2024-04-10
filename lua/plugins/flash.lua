
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    backdrop = false,
  },
  -- keys = {
  --   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  --   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  --   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  -- },
}

-- TODO: flash config file if i re enable flash
-- local flash = require('flash')
-- flash.setup()

-- local map = require('confs.utils').map

-- map('n', 's', flash.jump, 'Flash')
-- map('n', 'S', flash.treesitter, 'Flash Treesitter')
-- map('o', 'r', flash.remote, 'Remote Flash')
-- map('o', 'R', flash.treesitter_search, 'Treesitter Search')
-- map('c', '<c-s>', flash.toggle, 'Toggle Flash Search')
