-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
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
    "saghen/blink.cmp",
    event = function(_, event)
      return vim.tbl_filter(function(e) return e ~= "CmdlineEnter" end, event)
    end,
    opts = {
      keymap = {
        ["<C-f>"] = { "select_and_accept", "fallback" },
      },
    },
  },
}
