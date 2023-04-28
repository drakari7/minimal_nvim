local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
   layout_strategy = 'horizontal',
    layout_config = {
        preview_width = 0.55,
    },
    -- path_display = { shorten = 2 },
    prompt_prefix = "   ",
    results_title = false,
    file_ignore_patterns = {
      "__pycache__/",
    },
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      }
    }
  },
}

-- Loading extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

local M = {}

function M.nvim_config_files()
    require('telescope.builtin').find_files{
        cwd = "~/.config/nvim",
        prompt_title = "Nvim Config Files",
    }
end

function M.find_scripts()
    require('telescope.builtin').find_files{
        cwd = "~/scripts",
        prompt_title = "My Scripts",
    }
end

return M
