return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {

        function (server_name) -- default handler
            require("lspconfig")[server_name].setup {}
        end,
        -- Add dedicated handlers here:
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      { "ms-jpq/coq_nvim", branch = "coq" },
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
    },
    init = function()
      vim.g.coq_settings = {
        auto_start = true,
      }
    end,
  },
  {
    "ms-jpq/coq_nvim",
  },
}
