local M = {
   "saecki/crates.nvim",
   dependencies = {
      {
         "nvim-lua/plenary.nvim"
      }
   }
}

function M.config()
   require('crates').setup()
end

return M
