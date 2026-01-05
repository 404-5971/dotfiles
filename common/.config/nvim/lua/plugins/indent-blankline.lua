return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			char = "│",
			highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			},
		},
		scope = {
			enabled = false,
		},
	},
	config = function(_, opts)
		-- setup colors to match VS Code's rainbow indentation
		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75", blend = 30 })
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B", blend = 30 })
		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF", blend = 30 })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66", blend = 30 })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379", blend = 30 })
		vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD", blend = 30 })
		vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2", blend = 30 })

		require("ibl").setup(opts)
	end,
}
