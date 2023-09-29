return {
  {
    "folke/tokyonight.nvim",
    enabled = true,
    opts = { style = "moon" },
  },
  {
    "catppuccin/nvim",
    enabled = false,
  },
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "medium",
        transparent_background_level = 1,
      })
    end,
  },
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
