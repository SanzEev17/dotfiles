local options = {
  formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    lua = { "stylua" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
require("conform").setup(options)
