local M ={
  "folke/trouble.nvim",
  lazy = true,
  cmd = {
    "Trouble", "TroubleToggle", "TroubleClose", "TroubleRefresh",
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

return M
