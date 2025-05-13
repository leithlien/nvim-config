return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"cssls",
				"tailwindcss",
				"html",
				"jsonls",
				"eslint",
				"pyright",
			},
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(client, bufnr)
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("LspFormat", { clear = true }),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
		end

		local servers = {
			"ts_ls",
			"cssls",
			"tailwindcss",
			"html",
			"jsonls",
			"eslint",
			"pyright",
		}

		for _, server in ipairs(servers) do
			vim.lsp.config(server, {
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end
	end,
}
