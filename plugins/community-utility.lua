return {
    { import = "astrocommunity.utility.noice-nvim" },
    {
        "folke/noice.nvim",
        enable = not vim.g.neovide,
        opts = {
            presets = {
                lsp_doc_border = true,
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                        },
                    },
                    view = "mini",
                },
                -- { filter = { event = "msg_show", find = "AutoSave: saved at%s" }, opts = { skip = true } },
                { filter = { event = "notify", find = "No information available" }, opts = { skip = true } },
                { filter = { event = "msg_show", find = "DB: Query%s" }, opts = { skip = true } },
            },
        },
    },
}
