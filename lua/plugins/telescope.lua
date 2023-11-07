local mapkey = require("util.keymapper").mapkey

local config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	telescope.setup({
		defaults = {
			mappingis = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<C-q>"] = "send_selected_to_qflist",
					["<C-l>"] = "actions.open_qflist",
				},
			},
		},
		pickers = {
			-- find_files = {
			-- 	theme = "dropdown",
			-- 	previewer = true,
			-- 	hidden = true,
			-- },
			live_grep = {
				theme = "dropdown",
				previewer = false,
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		mapkey("<leader>fk", "Telescope keymaps", "n"),
		mapkey("<leader>fh", "Telescope help_tags", "n"),
		mapkey("<leader>ff", "Telescope find_files", "n"),
		mapkey("<leader>fg", "Telescope live_grep", "n"),
		mapkey("<leader>fb", "Telescope buffers", "n"),
	},
}
