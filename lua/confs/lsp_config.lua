require('neodev').setup() -- Must be included before lspconfig.setup
require('mason').setup()
require('mason-lspconfig').setup {
  automatic_installation = true,
}

-- ['─', '│', '─', '│', '┌', '┐', '┘', '└']
local border = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}


-- TODO: check if its possible to simplify this
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
}

-- Change diagnostic settings

-- TODO: This can probably be removed by using native lsp techniques
-- lsp_signature options and settings
local lsp_signature_cfg = {
  bind = true,
  doc_lines = 7,
  floating_window = false,
  fix_pos = true,
  hint_enable = true,
  hint_prefix = "> ",
  hint_scheme = "String",
  hi_parameter = "Search",
  max_height = 3,
  max_width = 40,
  handler_opts = {
    border = "rounded"
  },
}

local float_table = { float = { border = "rounded" } }
local map = require('confs.utils').map

-- TODO: Look into replacing this with lsp saga
vim.diagnostic.config({ signs = false, underline = true })
map('n', '[d', function() vim.diagnostic.goto_prev(float_table) end, 'Prev diagnostic')
map('n', ']d', function() vim.diagnostic.goto_next(float_table) end, 'Next diagnostic')
map('n', '<leader>dl', vim.diagnostic.setloclist, 'Populate diagnostics in loclist')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    map('n', 'gd', vim.lsp.buf.definition, 'Goto definition', opts)
    map('n', 'gr', '<cmd>Telescope lsp_references initial_mode=normal<CR>', 'LSP references', opts)
    map('n', 'K', vim.lsp.buf.hover, 'Hover', opts)
    map({ 'n', 'v' }, 'gf', vim.lsp.buf.format, 'LSP Format', opts)
    map('n', '<leader>sr', vim.lsp.buf.rename, 'Rename symbol', opts)
    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code action', opts)

    map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add workspace folder', opts)
    map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder', opts)
    map('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, 'List workspace folders', opts)

    map('n', '<leader>ls', '<cmd>LspStop<CR>', 'Stop LSP', opts)
    map('n', '<leader>lr', '<cmd>LspRestart<CR>', 'Restart LSP', opts)
  end,
})

local function on_attach(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil -- Disable semantic highlighting for now
  require('lsp_signature').on_attach(lsp_signature_cfg)   -- Attach lsp signature
end

local servers = {
  "pyright",
  "clangd",
  "bashls",
  "lua_ls",
  -- "vimls",
  -- "tsserver",
  -- "texlab",
  -- "gopls",
  -- "html",
  -- "cssls",
}

-- capabilities from nvim cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup({
    on_attach = on_attach,
    single_file_support = true,
    capabilities = capabilities,
    handlers = handlers,
  })
end
