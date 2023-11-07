local config = function()
	local theme = require("lualine.themes.nightfox")
	local lazy_status = require("lazy.status")

	-- set bg transparency in all modes
	theme.normal.c.bg = nil
	-- theme.insert.c.bg = nil
	-- theme.visual.c.bg = nil
	-- theme.replace.c.bg = nil
	-- theme.command.c.bg = nil

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
		},
		tabline = {
			--  section = {
			-- lualine_a = { "mode" },
			lualine_b = { "buffers" },
			-- lualine_x ={{
			--          lazy_status.updates,
			--          cond = lazy_status.has_updates,
			--          color = { fg = "#ff9e64" },
			--        }, { "encoding", "fileformat", "filetype" }},
			-- lualine_y = { "progress" },
			-- lualine_z = { "location" },
		},
		--	},
		sections = {
			lualine_a = { "mode" },
			lualine_x = {
				{
					lazy_status.updates,
					cond = lazy_status.has_updates,
					color = { fg = "#ff9e64" },
				},
				{ "encoding", "fileformat", "filetype" },
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	})
	--
	-- require('lualine').setup()
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
