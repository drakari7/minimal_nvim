require'nvim-treesitter.configs'.setup {
  -- One of "all", or a list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    additional_vim_regex_highlighting = false,
  },

  -- Extension from vim-matchup plugin
  matchup = {
    enable = true,
    -- disable = {"c", "cpp"} -- list of languages to disable
    -- disable_virtual_text = false,
    -- include_match_words = true,
  }
}
