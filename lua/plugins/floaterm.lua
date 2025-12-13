return {
  "voldikss/vim-floaterm",
  init = function()
    -- Disable default keymaps of Floaterm
    vim.g.floaterm_keymap_new = "<C-t>"
    vim.g.floaterm_keymap_prev = "<C-p>"
    vim.g.floaterm_keymap_next = "<C-n>"
    vim.g.floaterm_keymap_toggle = "<C-/>"
    vim.g.floaterm_keymap_hide = "<Esc><Esc>"
  end,
}
