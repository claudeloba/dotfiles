local dap = require("dap")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "::1",
  port = 8123,
  executable = {
    command = "C:\\Users\\whois\\AppData\\Local\\nvim-data\\mason\\packages\\js-debug-adapter\\js-debug-adapter.cmd",
  }
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
  }
end
