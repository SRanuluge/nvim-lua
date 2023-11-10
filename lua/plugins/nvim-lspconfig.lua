local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	--- configure html server
	lspconfig["html"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- configure typescript server with plugin
	lspconfig["tsserver"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- configure css server
	lspconfig["cssls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- configure tailwindcss server
	lspconfig["tailwindcss"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- configure svelte server
	lspconfig["svelte"].setup({
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)

			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = { "*.js", "*.ts" },
				callback = function(ctx)
					if client.name == "svelte" then
						client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
					end
				end,
			})
		end,
	})

	-- configure prisma orm server
	lspconfig["prismals"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- configure graphql language server
	lspconfig["graphql"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
	})

	-- configure emmet language server
	lspconfig["emmet_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
	})

	-- configure python server
	lspconfig["pyright"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- docker
	lspconfig["dockerls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- bash
	lspconfig["bashls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "sh" },
	})

	-- php
	lspconfig["phpactor"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "php" },
	})

	-- configure lua server (with special settings)
	lspconfig["lua_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = config,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
}
