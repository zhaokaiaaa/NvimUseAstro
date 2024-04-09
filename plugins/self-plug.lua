return {
    { "nvim-telescope/telescope-file-browser.nvim", event = "BufEnter" },
    { "machakann/vim-highlightedyank", event = "BufEnter" },
    {
        --添加这个插件, 才能使用最新的AstroNvim
        "AstroNvim/astroui",
        lazy = false, -- disable lazy loading
        priority = 10000, -- load AstroUI first
        opts = {
            -- set configuration options  as described below
        }
    }
}
