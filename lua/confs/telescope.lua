local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

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
-- Extensions
telescope.load_extension('fzf')
telescope.load_extension('aerial')

-- Custom pickers
local function nvim_config_files()
  builtin.find_files{
    cwd = "~/.config/nvim",
    prompt_title = "Nvim Config Files",
  }
end

local function find_scripts()
  builtin.find_files{
    cwd = "~/scripts",
    prompt_title = "My Scripts",
  }
end

-- TODO: Add descriptions to all keybindings for which key
-- Keybindings
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', function () builtin.live_grep{path_display='tail'} end)
vim.keymap.set('n', '<leader>fw', function () builtin.grep_string{initial_mode="normal"} end)
vim.keymap.set('n', '<leader>bf', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fr', function () builtin.resume{initial_mode="normal"} end)
vim.keymap.set('n', '<leader>fa', telescope.extensions.aerial.aerial)
vim.keymap.set('n', '<leader>fl', builtin.lsp_document_symbols)
vim.keymap.set('n', '<leader>fo', builtin.vim_options)
vim.keymap.set('n', '<leader>fv', nvim_config_files)
vim.keymap.set('n', '<leader>fs', find_scripts)
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find)

