return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "night" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "python" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
      end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "echasnovski/mini.nvim",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
    keys = {
      {"n", "<leader>qs", function() require("persistence").load() end, desc = "Load current directory session",},
	    {"n", "<leader>qS", function() require("persistence").select() end, desc = "Select session",},
	    {"n", "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Load last session",},
      {"n", "<leader>qd", function() require("persistence").stop() end, desc = "Stop persistence, don't save session on exit",},
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "numToStr/FTerm.nvim",
    config = function()
      vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
      vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    end,
  },
}
