local nvimtree = require "nvim-tree"

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup {
  git = {
    enable = true,
    ignore = false,
  },

  filters = {
    dotfiles = false,
    custom = {
      "node_modules",
      "^.git$",
    },
  },

  renderer = {
    root_folder_label = false,
    highlight_git = true,
    highlight_opened_files = "none",
    group_empty = true,

    indent_markers = {
      enable = true,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "󰄱",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
  log = {
    enable = true,
    truncate = true,
    types = {
      diagnostics = true,
      git = true,
      profile = true,
      watcher = true,
    },
  },
}
