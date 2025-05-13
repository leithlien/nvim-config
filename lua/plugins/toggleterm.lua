-- ~/nvim/lua/slydragonn/plugins/toggleterm.lua

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 10,
			open_mapping = [[<F7>]],
			shading_factor = 2,
			direction = "float",
			float_opts = {
				border = "curved",
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		vim.keymap.set("n", "<leader>1", ":ToggleTerm 1<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>2", ":ToggleTerm 2<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>3", ":ToggleTerm 3<CR>", { noremap = true, silent = true })
		vim.keymap.set("t", "<leader>q", [[<C-\><C-n>]], opts)
	end,
}
