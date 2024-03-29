local M = {
  "kyazdani42/nvim-tree.lua",
  lazy = true,
  cmd = {
    "NvimTreeToggle", "NvimTreeOpen"
  }
}

local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)
  end

function M.config()
  -- local tree_cb = require("nvim-tree.config").nvim_tree_callback
  require("nvim-tree").setup {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    on_attach = my_on_attach;

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

    -- Git integration
    git = {
       enable = true,
       ignore = false,
       timeout = 500
    },

    -- project.nvim integration
    update_focused_file = {
      enable = true,
      update_root = true,
      update_cwd = true
    },
  }
end

return M
