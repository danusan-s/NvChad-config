local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  vim.cmd.cd(data.file)

  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "c",
        "cpp",
        "java",
        "javascript",
        "typescript",
        "markdown",
        "markdown_inline",
      },
    },
  },

  -- Install competitest for easy testing for codeforces
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require "configs.competitest"
    end,
    lazy = true,
    cmd = "CompetiTest",
  },

  -- Install obsession to save nvim states with tmux ressurect
  "tpope/vim-obsession",

  -- Copilot to do autocompletion
  "github/copilot.vim",

  -- Install dressing to create popups for other plugins
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- Install notify for notifications for other plugins
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
  },

  -- Practice vim motions
  {
    "theprimeagen/vim-be-good",
    lazy = true,
    cmd = "VimBeGood",
  },

  -- Install hardtime to prevent bad habits
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    lazy = false,
    keys = {
      { "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"' },
      { "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"' },
    },
    opts = {},
    cmd = "Hardtime",
    config = function()
      require "configs.hardtime"
    end,
  },

  {
    "declancm/cinnamon.nvim",
    config = function()
      require("cinnamon").setup()
    end,
    lazy = true,
  },

  {
    "Vigemus/iron.nvim",
    config = function() end,
    lazy = true,
  },
}
