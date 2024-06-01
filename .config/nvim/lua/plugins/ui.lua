return {
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      dofile(vim.g.base46_cache .. "nvimtree")
      require "configs.nvim-tree"
    end,
  },

  -- UI for file modification
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  -- Toggle comments in files
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require "configs.comment"
    end,
  },

  -- Better looking dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require "configs.alpha"
    end,
  },
}
