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
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-mocha",
        },
    },
}
