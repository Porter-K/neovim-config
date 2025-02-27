return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencie = { "Telescope", "persistence", },
    config = function()
      local logo = [[
        ███╗  ██╗██╗   ██╗██╗███╗   ███╗
        ████╗ ██║██║   ██║██║████╗ ████║
        ██╔██╗██║██║   ██║██║██╔████╔██║
        ██║╚████║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║ ╚███║ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝  ╚══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      require('dashboard').setup {
        -- config
        theme = "doom",
        config = {
          header = vim.split(logo, "\n"), --your header
          center = {
            { action = "Telescope find_files",                           desc = " Find File",       icon = " ", key = "f" },
            { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
            { action = "lua require('persistence').load()",              desc = " Restore Session", icon = " ", key = "s" },
            { action = "Telescope projects",                             desc = " Open Project",    icon = " ", key = "p" },
            { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
}
