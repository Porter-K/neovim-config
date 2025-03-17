return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall" },
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		ft = { "typescript", "javascript", "lua", "c", "cpp" },
		config = function()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({

				function(server_name) -- default handler
					require("lspconfig")[server_name].setup({})
				end,
				-- Add dedicated handlers here:
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						on_init = function(client)
							if client.workspace_folders then
								local path = client.workspace_folders[1].name
								if
									path ~= vim.fn.stdpath("config")
									and (
										vim.loop.fs_stat(path .. "/.luarc.json")
										or vim.loop.fs_stat(path .. "/.luarc.jsonc")
									)
								then
									return
								end
							end

							client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
								runtime = {
									-- Tell the language server which version of Lua you're using
									-- (most likely LuaJIT in the case of Neovim)
									version = "LuaJIT",
								},
								-- Make the server aware of Neovim runtime files
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME,
										-- Depending on the usage, you might want to add additional paths here.
										"${3rd}/luv/library",
										-- "${3rd}/busted/library",
									},
									-- or pull in all of 'runtimepath'.
									-- NOTE: this is a lot slower and will cause issues when working on your own configuration
									-- (see https://github.com/neovim/nvim-lspconfig/issues/3189)
									-- library = vim.api.nvim_get_runtime_file("", true)
								},
							})
						end,
						settings = {
							Lua = {},
						},
					})
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		ft = { "typescript", "javascript", "lua", "c", "cpp" },
		dependencies = {
			{ "ms-jpq/coq_nvim", branch = "coq" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = "shut-up",
			}
		end,
	},
}
