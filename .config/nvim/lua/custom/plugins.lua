local plugins = {
    {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
    },
    keys = {
        { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
},

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
-- {
--     "NvChad/nvterm",
--     config = function()
--       require("nvterm").setup({
--         terminals = {
--           shell = '"C:/Program Files/Git/bin/bash.exe"', -- Use double quotes for the path
--           type_opts = {
--             float = {
--               relative = 'editor',
--               row = 0.3,
--               col = 0.25,
--               width = 0.5,
--               height = 0.4,
--               border = "single",
--             },
--             horizontal = { location = "rightbelow", split_ratio = 0.3 },
--             vertical = { location = "rightbelow", split_ratio = 0.5 },
--           },
--         },
--         behavior = {
--           autoclose_on_quit = {
--             enabled = false,
--             confirm = true,
--           },
--           close_on_exit = true,
--           auto_insert = true,
--         },
--       })
--
--       -- Set additional shell options
--       vim.o.shell = '"C:/Program Files/Git/bin/bash.exe"'
--       vim.o.shellcmdflag = '-c'
--       vim.o.shellquote = ''
--       vim.o.shellxquote = ''
--     end,
--   },

{
    "tpope/vim-surround",
    event = "BufRead",
},
  { "prisma/vim-prisma" },
  { "nvim-neotest/nvim-nio" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "typescript",
        "javascript",
        "html",
        "css",
        "c",
        "c_sharp",
        "go",
        "json",
        "yaml",
        "tsx",
        "graphql",
        "bash",
        "scss",
        "svelte",
        "yaml",
        "dockerfile",
        "sql",
        "scss",
        "python",
        "vim",
        "vimdoc",
        "java",
        "markdown"
      }
    end,
  },
  { "windwp/nvim-ts-autotag" ,
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact", "html" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "https://tpope.io/vim/fugitive.git"
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
     "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  {
    "ggandor/leap.nvim",
    enabled = true,
    keys = {
      { "<M-å>", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "<M-Å>", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    vim.keymap.del({ "n", "x", "o" }, "s")
    vim.keymap.del({ "n", "x", "o" }, "S")
    end,
    },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb"
      }
    }
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/AppData/Local/nvim-data/mason/packages/debugpy/venv/bin/Scripts/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    ft = "go",
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()  -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true;
      vim.g.copilot_assume_mapped = true;
      vim.g.copilot_tab_fallback = "";
    -- The mapping is set to other key, see custom/lua/mappings
    -- or run <leader>ch to see copilot mapping section
    end
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "debugpy",
        "mypy",
        "pyright",
        "prisma-language-server",
        "codelldb",
        "eslint-lsp",
        "js-debug-adapter",
        "prettierd",
        "typescript-language-server",
        "tailwindcss-language-server"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins
