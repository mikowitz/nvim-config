local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("mikowitz.lsp.handlers").on_attach,
    capabilities = require("mikowitz.lsp.handlers").capabilities,
  }

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("mikowitz.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "elixirls" then
    local elixir_opts = require("mikowitz.lsp.settings.elixirls")
    opts = vim.tbl_deep_extend("force", elixir_opts, opts)
  end

  server:setup(opts)
end)
