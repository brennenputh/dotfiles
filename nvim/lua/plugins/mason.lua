local M = {
   "williamboman/mason.nvim",
   lazy = false,
   dependencies = {
      {
         "williamboman/mason-lspconfig.nvim",
         lazy = false
      }
   }
}

function M.config() 
  require("mason").setup {}
end

return M