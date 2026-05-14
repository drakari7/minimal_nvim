return {
  {
    'windwp/nvim-autopairs',
    dependencies = {"hrsh7th/nvim-cmp"},
    event = "InsertEnter",
    config = function ()
      require("nvim-autopairs").setup()

      -- Add brackets when functions/methods are selected in nvim-cmp.
      -- pcall so it no-ops when cmp is disabled (blink handles this via accept.auto_brackets).
      pcall(function()
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end)
    end
  }
}
