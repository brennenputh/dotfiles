local M = {
  "kyazdani42/nvim-tree.lua",
  lazy = true,
  cmd = {
    "NvimTreeToggle", "NvimTreeOpen"
  }
}

function M.config()
  -- local tree_cb = require("nvim-tree.config").nvim_tree_callback
  require("nvim-tree").setup {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      git = {
         enable = true,
         ignore = false,
         timeout = 500
      },
    update_focused_file = {
      enable = true,
      update_root = true,
      update_cwd = true
    },
    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "󰌵",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      width = 30,
      side = "left",
    },
  }
end

return M
