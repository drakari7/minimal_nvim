local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local utils = require('confs.utils')

telescope.setup{
  defaults = {
    prompt_prefix = "   ",
    results_title = false,
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.9,
      preview_width = 0.47,
    },

    file_ignore_patterns = {"__pycache__/", },
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      }
    },

    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    }
  },
}
-- Extensions
telescope.load_extension('fzf')
-- telescope.load_extension('aerial')

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

local function find_files_from_git_root()
  local opts = {}
  if utils.is_git_repo() then
    opts = {
      cwd = utils.get_git_root(),
    }
  end
  builtin.find_files(opts)
end

local function live_grep_from_git_root()
  local opts = {path_display={'tail'}}
  if utils.is_git_repo() then
    opts = vim.tbl_extend("keep", opts, {cwd=utils.get_git_root()})
  end
  builtin.live_grep(opts)
end


-- Keybindings
local map = utils.map
map('n', '<leader>ff', find_files_from_git_root, 'Find files')
map('n', '<leader>fg', live_grep_from_git_root, 'Live grep')
map('n', '<leader>fb', builtin.buffers, 'Buffers')
map('n', '<leader>fh', builtin.help_tags, 'Help tags')
map('n', '<leader>fa', telescope.extensions.aerial.aerial, 'Aerial symbols')
map('n', '<leader>fl', builtin.lsp_document_symbols, 'Document Symbols [LSP]')
map('n', '<leader>fo', builtin.vim_options, 'Vim options')
map('n', '<leader>fv', nvim_config_files, 'Nvim config directory')
map('n', '<leader>fs', find_scripts, 'Scripts directory')
map('n', '<leader>fc', builtin.current_buffer_fuzzy_find, 'Current buffer search')
map('n', '<leader>fw', function() builtin.grep_string{initial_mode="normal"} end, 'Grep word under cursor')
map('n', '<leader>fr', function() builtin.resume{initial_mode="normal"} end, 'Resume last picker')

-- Git
map('n', '<leader>gc', builtin.git_commits, 'Git commits')
