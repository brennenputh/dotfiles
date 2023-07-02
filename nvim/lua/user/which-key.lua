local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
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
