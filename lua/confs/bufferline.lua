require 'bufferline'.setup(
  {
    options = {
      -- numbers = function (opts)
        --   return string.format('%s', opts.ordinal)
        -- end,
        -- mappings = true,
        -- max_name_length = 18,
        -- max_prefix_length = 15, -- prefix used when a buffer is deduplicated
        -- tab_size = 18,
        -- diagnostics = "nvim_lsp",
        -- show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = true,
        -- show_tab_indicators = true,
        -- persist_buffer_sort = true,
        -- separator_style = "thin",
      }
  }
)


-- TODO: Move to lua later
vim.cmd([[
nnoremap <leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent>]b :BufferLineCycleNext<CR>
nnoremap <silent>[b :BufferLineCyclePrev<CR>
]])
