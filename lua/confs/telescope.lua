local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup{
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

-- Keybindings
local map = require('confs.utils').map

map('n', '<leader>ff', builtin.find_files, 'Find files')
map('n', '<leader>fb', builtin.buffers, 'Buffers')
map('n', '<leader>fh', builtin.help_tags, 'Help tags')
map('n', '<leader>fa', telescope.extensions.aerial.aerial, 'Aerial symbols')
map('n', '<leader>fl', builtin.lsp_document_symbols, 'Document Symbols [LSP]')
map('n', '<leader>fo', builtin.vim_options, 'Vim options')
map('n', '<leader>fv', nvim_config_files, 'Nvim config directory')
map('n', '<leader>fs', find_scripts, 'Scripts directory')
map('n', '<leader>fc', builtin.current_buffer_fuzzy_find, 'Current buffer search')
map('n', '<leader>fg', function () builtin.live_grep{path_display='tail'} end, 'Live grep')
map('n', '<leader>fw', function () builtin.grep_string{initial_mode="normal"} end, 'Grep word under cursor')
map('n', '<leader>fr', function () builtin.resume{initial_mode="normal"} end, 'Resume last picker')
