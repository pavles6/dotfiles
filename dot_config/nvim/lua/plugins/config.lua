-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
	{
		"saghen/blink.cmp",
		opts = {
			keymap = {
				preset = "enter",
				["<C-f>"] = { "select_and_accept", "accept" },
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			pickers = {
				defaults = {
					preview = {
						filesize_limit = 0.1,
					},
				},
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },

				lua = { "stylua" },
				python = { "ruff" },
				sh = { "shfmt" },
			},
		},
	},
}
