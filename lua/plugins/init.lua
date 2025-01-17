local function open_nvim_tree(data)
  local is_directory = vim.fn.isdirectory(data.file) == 1

  if is_directory then
    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
  else
    local parent_dir = vim.fn.fnamemodify(data.file, ":h")
    vim.cmd.cd(parent_dir)
  end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        -- disable  tab
        ["<Tab>"] = function(callback)
          callback()
        end,

        ["<S-Tab>"] = function(callback)
          callback()
        end,
      },
    },
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

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
  {
    "github/copilot.vim",
    cmd = "Copilot",
    lazy = false,
  },

  -- Install dressing to create popups for other plugins
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- Install notify for notifications for other plugins
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
    end,
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
    config = function()
      require "configs.iron"
    end,
    lazy = false,
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    opts = {
      rocks = { "magick" },
    },
    lazy = false,
  },
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    opts = {},
    lazy = false,
  },
}
