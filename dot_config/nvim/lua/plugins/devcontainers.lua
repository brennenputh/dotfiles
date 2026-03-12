local M = {
	"https://codeberg.org/esensar/nvim-dev-container",
	dependencies = "nvim-treesitter/nvim-treesitter",
  config = function ()
    require('devcontainer').setup {
      container_runtime = "podman"
    }
  end
}

return M
