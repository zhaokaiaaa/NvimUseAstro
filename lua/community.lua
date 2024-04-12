-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.colorscheme.kanagawa-nvim" },
    --命令行补全插件
    { import = "astrocommunity/completion/cmp-cmdline/" },
    { import = "astrocommunity/motion/flash-nvim" },
    { import = "astrocommunity.utility.noice-nvim" },
    { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
    --为 Markdown 文件生成目录
    { 'mzlogin/vim-markdown-toc', ft = "markdown" },
    -- 自动表格创建器和格式化程序
    { 'dhruvasagar/vim-table-mode', ft = "markdown" },
    -- 照片
    { 'img-paste-devs/img-paste.vim', ft = "markdown" },
    -- import/override with your plugins folder
}
