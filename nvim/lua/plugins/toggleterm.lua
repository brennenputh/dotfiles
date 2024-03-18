local M = {
   "akinsho/toggleterm.nvim",
   event = "VeryLazy"
}

function M.config()
   local status_ok, toggleterm = pcall(require, "toggleterm")
   if not status_ok then
      return
   end

   toggleterm.setup {
      size = function(term)
         return vim.o.columns * 0.4
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
   }

   function _G.set_terminal_keymaps()
       local opts = { noremap = true }
       -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
   end

   vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
end

return M
