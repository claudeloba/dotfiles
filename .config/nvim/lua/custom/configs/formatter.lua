local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettier
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier
    },
    json = {
      require("formatter.filetypes.json").prettier
    },
    css = {
      require("formatter.filetypes.css").prettier
    },
    html = {
      require("formatter.filetypes.html").prettier
    },
    markdown = {
      require("formatter.filetypes.markdown").prettier
    },
    lua = {
      require("formatter.filetypes.lua").lua_format
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt
    },
    go = {
      require("formatter.filetypes.go").gofmt
    },
    yaml = {
      require("formatter.filetypes.yaml").prettier
    },
    toml = {
      require("formatter.filetypes.toml").prettier
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}


vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock"
})

return M
