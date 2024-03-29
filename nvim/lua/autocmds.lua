vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open telescope when nvim is started with no arguments.",
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").find_files()
    end
  end,
})

vim.api.nvim_create_autocmd('ModeChanged', {
  desc = "Makes it so snippets don't mess up tab",
  pattern = '*',
  callback = function()
    if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
      and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require('luasnip').session.jump_active
    then
      require('luasnip').unlink_current()
    end
  end
})
