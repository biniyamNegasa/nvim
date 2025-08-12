return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          -- Disable Mason to prevent issues with multiple Ruby versions
          mason = false,

          -- Use `mise x` to run the ruby-lsp executable
          -- This ensures the correct Ruby version and environment are used
          cmd = { "mise", "x", "--", "ruby-lsp" },
        },
      },
    },
  },
}
