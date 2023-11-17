-- 移动操作
--vim.api.nvim_set_keymap("n", "<C-l>", ":Vista<cr>", opts)
return {
    { "liuchengxu/vista.vim", event = "BufEnter" },
    { "universal-ctags/ctags", event = "BufEnter" },
}
