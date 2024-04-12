--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
        opts.highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
        }
    end,
}
