return {
  -- Telescope
  'nvim-telescope/telescope.nvim', --File finder and grep
  dependencies = {
    'nvim-lua/plenary.nvim',
    'jvgrootveld/telescope-zoxide',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')
    local utils = require('confs.utils')

    telescope.setup({
      defaults = {
        prompt_prefix = "   ",
        results_title = false,
        layout_strategy = 'horizontal',
        layout_config = {
          width = 0.9,
          preview_width = 0.47,
        },

        file_ignore_patterns = { "__pycache__/", },
        mappings = {
          i = {
            ["<m-j>"] = actions.move_selection_next,
            ["<m-k>"] = actions.move_selection_previous,
          },
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

      extensions = {
        zoxide = {
          mappings = {
            ["<C-g>"] = {
              keepinsert = true,
              action = function(selection)
                builtin.live_grep({
                  cwd = selection.path,
                  path_display = { 'tail' },
                  disable_coordinates = true,
                })
              end
            }
          }
        }
      }
    })

    -- Extensions
    telescope.load_extension('fzf')
    telescope.load_extension('zoxide')

    local find_in_dir = function(dir, title)
      builtin.find_files({
        cwd = dir,
        prompt_title = title
      })
    end

    local function find_files_from_git_root()
      local opts
      if utils.is_git_repo() then
        opts = { cwd = utils.get_git_root() }
      end
      builtin.find_files(opts or {})
    end

    local function live_grep_from_git_root()
      local opts = {
        path_display = { 'tail' },
        disable_coordinates = true
      }
      if utils.is_git_repo() then
        opts = vim.tbl_extend("keep", opts, { cwd = utils.get_git_root() })
      end
      builtin.live_grep(opts)
    end


    -- Keybindings
    local map = utils.map
    map('n', '<leader>ft', builtin.builtin, 'Telescope Pickers')
    map('n', '<leader>ff', find_files_from_git_root, 'Find files')
    map('n', '<leader>fg', live_grep_from_git_root, 'Live grep')
    map('n', '<leader>fb', builtin.buffers, 'Buffers')
    map('n', '<leader>fh', builtin.help_tags, 'Help tags')
    map('n', '<leader>fl', builtin.lsp_document_symbols, 'Document Symbols [LSP]')
    map('n', '<leader>fo', builtin.vim_options, 'Vim options')
    map('n', '<leader>fc', builtin.current_buffer_fuzzy_find, 'Current buffer search')

    map('n', '<leader>fw', function() builtin.grep_string({ initial_mode = "normal" }) end, 'Grep word under cursor')
    map('n', '<leader>fr', function() builtin.resume({ initial_mode = "normal" }) end, 'Resume last picker')

    map('n', '<leader>fv', function() find_in_dir("~/.config/nvim", "Nvim Config Files") end, 'Nvim config directory')
    map('n', '<leader>fs', function() find_in_dir("~/scripts", "My Scripts") end, 'Scripts directory')

    map('n', '<leader>ji', telescope.extensions.zoxide.list, "Zoxide cd")

    -- Git
    map('n', '<leader>gc', builtin.git_commits, 'Git commits')
  end
}
