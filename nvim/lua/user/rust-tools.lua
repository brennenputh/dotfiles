local M = {
   "simrat39/rust-tools.nvim",
   lazy = false
}

function M.config()
   local rt = require('rust-tools')

   rt.setup({
      tools = {
         runnables = {
            use_telescope = true
         },
         inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = ""
         }
      },
     server = {
         on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
         end,
     },
   })
end

return M
