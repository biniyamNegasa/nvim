return {
  {
    { "mason-org/mason.nvim", version = "^1.0.0" }, -- explicit v1 lock
    { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" }, -- same here
    opts = {
      -- This is just MY config, adjust for your needs
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
