# Neovim 配置介绍

==========================

## 快捷键

### 基础快捷键

|     快捷键      |                  行为                  |
|:------------:|:------------------------------------:|
|      J       |                  5j                  |
|      K       |                  5k                  |
|      W       |                  5w                  |
|      B       |                  5b                  |
|      gh      |                 到行首                  |
|      g;      |                 到行尾                  |
|      ,;      |              插入模式下行尾增加;              |
|      ga      | last changed in current buffer(file) |
|    `C-h`     |               插入模式下左移                |
|    `C-l`     |               插入模式下右移                |
|    `C-j`     |               插入模式下下移                |
|    `C-k`     |               插入模式下上移                |
|     `Up`     |               命令栏靠近底部                |
|    `Down`    |               命令栏远离底部                |
|    `Left`    |                左侧栏变窄                 |
|   `Right`    |                左侧栏变宽                 |
|  `leader`A   |              Select All              |
|  `leader`Y   |               Copy All               |
|  `leader`P   |          Paste From CopyAll          |
|  `leader`i   |            Insert after (            |
|  `leader`q   |             close buffer             |
| ctrl+shift+u |                转为大小写                 |
|  `leader`vi  |             快速打开vimrc文件              |
|  `leader`vs  |             重新加载vimrc文件              |
|  `leader`tu  |               New tab                |
|    ctrl+s    |                 save                 |
|  `leader`wj  |        Cursor to below window        |
|  `leader`wk  |         Cursor to up window          |
|  `leader`wh  |        Cursor to left window         |
|  `leader`wl  |        Cursor to right window        |
|  `leader`wq  |            Quit and Save             |
|      sj      |   split below and go to this split   |
|      sk      |    split up and go to this split     |
|      sh      |   split left and go to this split    |
|      sl      |   split right and go to this split   |

### 插件

- telescope/telescope-file-browser

  |          命令          |   快捷键   |         行为          |
    | :--------------------: | :--------: | :-------------------: |
  |  Telescope find_files  | `leader`ff |       Find File       |
  |  Telescope live_grep   | `leader`fw |       Find Word       |
  |   Telescope oldfiles   | `leader`fr | Recently opened files |
  | Telescope file_browser | `leader`fb |     File Browser      |
  |    Telescope marks     | `leader`fm |      File Marks       |
  |   Telescope jumplist   | `leader`fj |  Telescope jump list  |

- nvim-tree

  |      命令      |  快捷键   |        行为        |
    | :------------: | :-------: | :----------------: |
  | NvimTreeToggle | `leader`e | open/close browser |

- markdown相关

  |             命令              |  快捷键   |             行为             |
    | :---------------------------: | :-------: | :--------------------------: |
  | mdip#MarkdownClipboardImage() |  Ctrl-p   |      粘贴剪切板中的图片      |
  |        MarkdownPreview        |    ,r     |           开启预览           |
  |      MarkdownPreviewStop      |    ,rs    |           关闭预览           |
  |         GenTocMarked          |   ,gtc    |           生成目录           |
  |           UpdateToc           |   ,utc    |           更新目录           |
  |        TableModeToggle        |    ,tm    |          表格格式化          |
  |                               |    zr     |   降低整个缓冲区的折叠级别   |
  |                               |    zR     |         打开所有折叠         |
  |                               |    zm     |   增加整个缓冲区的折叠级别   |
  |                               |    zM     |         一路折叠一切         |
  |                               |    za     |     打开你光标所在的折叠     |
  |                               |    zA     | 递归地打开你的光标所在的折叠 |
  |                               |    zc     |      关闭光标所在的折叠      |
  |                               |    zC     |    递归关闭光标所在的折叠    |
  |             Vista             | Ctrl-Al-l |           开启目录           |