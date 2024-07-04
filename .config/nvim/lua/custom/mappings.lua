local M = {}

M.general = {
  n = {
    ["<C-x>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
["<leader>tx"] = {"<cmd>lua require('trouble').toggle()<CR>", "Toggle Trouble"},
    ["<leader>tw"] = {"<cmd>lua require('trouble').toggle('workspace_diagnostics')<CR>", "Toggle Workspace Diagnostics"},
    ["<leader>td"] = {"<cmd>lua require('trouble').toggle('document_diagnostics')<CR>", "Toggle Document Diagnostics"},
    ["<leader>tq"] = {"<cmd>lua require('trouble').toggle('quickfix')<CR>", "Toggle Quickfix"},
    ["<leader>tl"] = {"<cmd>lua require('trouble').toggle('loclist')<CR>", "Toggle Loclist"},
    ["<leader>tr"] = {"<cmd>lua require('trouble').toggle('lsp_references')<CR>", "Toggle LSP References"},
    ["<C-c>"] = {"<Esc>", "Escape"},
    ["<leader>pv"] = {"<cmd> vs <CR>", "Open a vertical split window"},
    ["<leader>ww"] = {"<cmd> w! <CR>", "Save the current file"},
    ["<leader>wq"] = {"<cmd> wq! <CR>", "Write-Quit the current file"},
    ["<leader>qa"] = {"<cmd> qa! <CR>", "Quit the current file"},
    ["<S-Up>"] = {"<cmd>m .-2<CR>", "Move line up"},
    ["<S-Down>"] = {"<cmd>m .+1<CR>", "Move line down"},
    ["<C-n>"] = {"<cmd>NvimTreeToggle<CR>"},
    ["<leader>sh"] = {"<cmd>:set hls ic<CR>", "Highlight search"},
    ["<leader>sn"] = {"<cmd>:set nohls<CR>", "No highlight search"},
    ["<leader>pp"] = {"o<esc>\"+p", "Paste from system clipboard"},
    ["<leader>pa"] = {"ea <esc>p", "Paste from system clipboard"},
    ["<leader>pb"] = {"a <esc>p", "Paste from system clipboard"},
    ["<leader>yy"] = {"yiw", "Yank inside word"},
    ["<leader>yf"] = {"ggVGy", "Copy the whole file"},
    ["<leader>df"] = {"gg _ dG", "Delete the whole file"},
  },
  v = {
    ["<C-c>"] = {"<Esc>", "Escape"},
    ["<S-Up>"] = {":m '<-2<CR>gv=gv", "Move line up"},
    ["<S-Down>"] = {":m '>+1<CR>gv=gv", "Move line down"},
    ["<leader>pd"] = {"\"_dP", "Delete current selection to void register, then paste from system clipboard"},
  },
  i = {
    ["<C-c>"] = {"<Esc>", "Escape"},
    ["<S-Up>"] = {"<cmd>m .-2<CR>", "Move line up"},
    ["<S-Down>"] = {"<cmd>m .+1<CR>", "Move line down"}
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require("dap-go").debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function ()
        require("dap-go").debug_last()
      end,
      "Debug go test"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function ()
        require("dap-python").test_method()
      end,
    }
  }
}

M.copilot = {
  i = {
    ["öä"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      "Copilot Accept",
       {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    },
    -- map jk to copilot cancel
    ["öö"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Previous'](), '')
      end,
      "Copilot Previous",
      {noremap=true}
    },
    ["ää"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Next'](), '')
      end,
      "Copilot Next",
      {noremap=true}
    },
    ["äö"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Dismiss'](), '')
      end,
      "Copilot Cancel",
      {noremap=true}
    },
  },
  -- Adding a global mapping for opening Copilot panel
  n = {
    ["<leader>gp"] = {
      function()
        vim.cmd("Copilot panel")
      end,
      "Open Copilot Panel",
      {noremap = true, silent = true}
    },
  }
}
-- Add a global setting to disable default tab mapping for Copilot
M.leap = {
  n = {
    ["å"] = {
      function()
        require('leap').leap { forward = true }
      end,
      "Leap forward",
      { noremap = true, silent = true }
    },
    ["Å"] = {
      function()
        require('leap').leap { backward = true }
      end,
      "Leap backward",
      { noremap = true, silent = true }
    },
  },
  v = {
    ["å"] = {
      function()
        require('leap').leap { forward = true }
      end,
      "Leap forward",
      { noremap = true, silent = true }
    },
    ["Å"] = {
      function()
        require('leap').leap { backward = true }
      end,
      "Leap backward",
      { noremap = true, silent = true }
    },
  },
  i = {
    ["å"] = {
      function()
        require('leap').leap { forward = true }
      end,
      "Leap forward",
      { noremap = true, silent = true }
    },
    ["Å"] = {
      function()
        require('leap').leap { backward = true }
      end,
      "Leap backward",
      { noremap = true, silent = true }
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

return M
