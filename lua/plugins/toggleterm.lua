return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local Terminal = require("toggleterm")
		local dir = vim.fn.getcwd()

		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { desc = desc })
		end

		local conda_env = function(direction)
			local size
			if direction == "vertical" then
				size = 80
			else
				size = 15
			end
			local user_env = vim.fn.input("Enviroment: ")
			Terminal.exec("conda activate " .. user_env, 1, size, dir, direction)
		end

		map("<M-h>", function()
			Terminal.toggle(1, 15, vim.fn.expand("%:p:h"), "horizontal")
		end, "toggle and untoggle horizontal terminal")

		map("<M-v>", function()
			Terminal.toggle(1, 80, vim.fn.expand("%:p:h"), "vertical")
		end, "toggle and untoggle vertical terminal")

		map("<M-c>h", function()
			conda_env("horizontal")
		end, "toggle and untoggle vertical terminal")

		map("<M-c>v", function()
			conda_env("vertical")
		end, "toggle and untoggle vertical terminal")
	end,
}
