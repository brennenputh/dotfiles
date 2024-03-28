local M = {
   "nvim-telescope/telescope.nvim",
   lazy = true,
   commit = "6213322",
   event = "Bufenter",
   cmd = { "Telescope" },
   dependencies = {
      {
         "nvim-lua/plenary.nvim",
         lazy = true
      },
      {
         "ahmedkhalf/project.nvim",
         commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
      }
   },
}

M.opts = {
   defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "truncate" },
      file_ignore_patterns = { ".git/", "node_modules" },
   }
}

function M.config()
  local project = require "project_nvim"
  project.setup {

    -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
    detection_methods = { "pattern" },

    -- patterns used to detect root dir, when **"pattern"** is in detection_methods
    patterns = { ".git", "Makefile", "package.json", "build.gradle" },
  }

  local telescope = require "telescope"
  telescope.load_extension "projects"
end

return M
