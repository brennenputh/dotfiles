local M = {
  "akinsho/bufferline.nvim",
  lazy = true,
  event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  dependencies = {
    {
      "famiu/bufdelete.nvim",
    },
  },
}
function M.config()
  require("bufferline").setup {
    options = {
      close_command = "Bdelete! %d",       -- can be a string | function, see "Mouse actions"
      right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
        }
      },
      separator_style = "slant",            -- | "thick" | "thin" | { 'any', 'any' },
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,

      show_buffer_close_icons = false,
      show_close_icon = false,

      enforce_regular_tabs = true,

    },
  }
end

return M
