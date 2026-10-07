return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                st1000 = false,
                st1003 = false,
                st1021 = false,
              },
            },
          },
        },
      },
    },
  },
}
