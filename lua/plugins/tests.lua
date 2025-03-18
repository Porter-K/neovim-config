return {
	{
		"vim-test/vim-test",
		dependencies = { "preservim/vimux" },
		keys = {
			{ "<leader>tt", ":TestNearest<CR>", mode = "n" },
			{ "<leader>tT", ":TestFile<CR>", mode = "n" },
			{ "<leader>ta", ":TestSuite<CR>", mode = "n" },
			{ "<leader>tl", ":TestLast<CR>", mode = "n" },
			{ "<leader>tg", ":TestVisit<CR>", mode = "n" },
		},
	},
}
