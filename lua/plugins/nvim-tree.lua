return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			renderer = {
				group_empty = true,
			},
		})
	end,
}
