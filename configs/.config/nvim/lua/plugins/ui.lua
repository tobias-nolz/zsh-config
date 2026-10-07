return {
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "iceberg_dark",
        section_separators = { left = "\u{e0d2}", right = "\u{e0d4}" },
        component_separators = { left = "\u{e0d2}", right = "\u{e0d4}" },
        globalstatus = true,
      },
      tabline = {
        lualine_a = { "buffers" },
        lualine_z = { "tabs" },
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
