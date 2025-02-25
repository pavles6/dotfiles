return {
  "folke/snacks.nvim",
  opts = {
    previewers = {
      file = {
        max_size = 1024 * 256,
      },
    },
    explorer = {
      follow_file = true,
      hidden = true,
    },
    picker = {
      sources = {
        files = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
