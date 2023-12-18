local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}

function M.config()
  local configs = require("nvim-treesitter.configs")

  configs.setup({
      ensure_installed = { "c", "cpp", "java", "bash", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "javascript", "html", "python" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autopairs = { enable = true },
    })
end

return M
