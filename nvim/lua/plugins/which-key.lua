local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
  }
}

function M.config()
   local wk = require("which-key")
   wk.setup {}
   wk.register({
      f = {
         name = "telescope"
      }, { prefix = "<leader>" }
   })
end

return M
