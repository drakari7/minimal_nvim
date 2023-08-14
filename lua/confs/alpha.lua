-- local alpha = require('alpha')
-- local dashboard = require('alpha.themes.dashboard')
-- local startify = require('alpha.themes.startify')
--
-- startify.section.header.val = {
--     [[                                   __                ]],
--     [[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
--     [[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
--     [[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
--     [[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
--     [[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
-- }
-- startify.section.top_buttons.val = {
--     startify.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
-- }
-- disable MRU
-- startify.section.mru.val = { { type = "padding", val = 0 } }

-- disable MRU cwd
-- startify.section.mru_cwd.val = { { type = "padding", val = 0 } }

-- disable nvim_web_devicons
-- startify.nvim_web_devicons.enabled = false
-- startify.nvim_web_devicons.highlight = false
-- startify.nvim_web_devicons.highlight = 'Keyword'

-- ignore filetypes in MRU

-- startify.mru_opts.ignore = function(path, ext)
--     return
--             (string.find(path, "COMMIT_EDITMSG"))
--         or  (vim.tbl_contains(default_mru_ignore, ext))
-- end

-- alpha.setup(startify.config)


--------------------------------------------------------
-- Startify section (to be removed after migrating to alpha)
vim.g.startify_change_to_dir = 1
vim.g.startify_lists = {
  { type = 'bookmarks', header = { '   Bookmarks' } },
  { type = 'sessions',  header = { '   Sessions' } },
  { type = 'files',     header = { '   Files' } },
  { type = 'dir',       header = { '   Files ' .. vim.fn.getcwd() } },
  { type = 'commands',  header = { '   Commands' } },
}

vim.g.startify_bookmarks = {
  { cv = '~/.config/nvim/init.lua' },
  { ca = '~/prod-config/subprojects/product_config/product_config_all.toml' },
  { cg = '~/prod-config/subprojects/product_config/generators/generate_product_config.py' },
  { sc = '~/prod-config/crypto_prod.main.py' },
  { mc = '~/master-config/crypto.beta.py' },
  { ac = '~/alpha-config/crypto_alpha.alpha.py' },
  { cq = '~/crypto/subprojects/config/prod.crypto_quoting.py' },
  { cs = '~/crypto/subprojects/config/dev.shreyash.py' },
  { mf = '~/scripts/my_funcs.sh' },
  { no = '~/notes/index.norg' },
  { sp = '~/notes/scratchpad.md' },
  { al = '~/.config/zsh/aliasrc' },
  { zrc = '~/.config/zsh/.zshrc' },
  { ss = '~/.ssh/config' },
  { gc = '~/.gitconfig' },
  { tc = '~/random/colo_test_env/test.cpp' },
  { tp = '~/random/test.py' },
  { tb = '~/random/test.sh' },
  { tm = '~/.config/tmux/tmux.conf' },
}
