return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local tree = require("nvim-tree").setup({})
		local harp = require("harpoon.mark")
		local api = require("nvim-tree.api")

		vim.keymap.set("n", "\\", vim.cmd.NvimTreeToggle)
	end,
}
