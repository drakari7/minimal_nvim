return {
  "mrcjkb/rustaceanvim",
  version = "^9",
  lazy = false,
  init = function()
    vim.g.rustaceanvim = {
      server = {
        cmd = function ()
          local toolchain = vim.fn.trim(vim.fn.system("rustup which rust-analyzer"))
          return { toolchain }
        end,
      }
    }
  end
}
