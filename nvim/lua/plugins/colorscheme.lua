local M = {
  "catppuccin/nvim",
   name = 'catppuccin',
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    -- flavour = "auto" -- will respect terminal's background
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    color_overrides = {
      mocha = {
        base= "#1c1917",
        crust= "#1c1917",
        mantle= "#1a1715",
        blue= "#22d3ee",
        green= "#86efac",
        flamingo= "#D6409F",
        lavender= "#DE51A8",
        pink= "#f9a8d4",
        red= "#fda4af",
        maroon= "#f87171",
        mauve= "#D19DFF",
        text= "#E8E2D9",
        sky= "#7ee6fd",
        yellow= "#fde68a",
        rosewater= "#f4c2c2",
        peach= "#fba8c4",
        teal= "#4fd1c5"
      }
    },
    custom_highlights = {},
    integrations = {
        cmp = true,
        dap = true,
        dap_ui = true,
        treesitter = true,
        telescope = true,
        mason = true,
        which_key = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  })

  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
