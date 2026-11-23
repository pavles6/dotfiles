return {
  { "mason-org/mason.nvim",           enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },
  { "neovim/nvim-lspconfig",          enabled = false },
  { "windwp/nvim-ts-autotag",         enabled = false }, -- ~20ms net | HTML/JSX tag autoclose
  { "akinsho/bufferline.nvim",        enabled = false }, -- 10.25ms   | buffer tabline
  { "folke/noice.nvim",               enabled = false }, --  5.48ms   | fancy cmdline/messages UI
  { "folke/flash.nvim",               enabled = false }, --  4.96ms   | s/S jump motions
  { "folke/trouble.nvim",             enabled = false }, -- instead of the g: var, if you want it gone
}
