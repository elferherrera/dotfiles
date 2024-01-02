local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

-- Split line in words
local function split_line(line)
  local words = {}
  for word in line:gmatch("%a+") do
    table.insert(words, word)
  end
  return words
end

local function get_rust_features()
  local rust_env = os.getenv("RUST_FEATURES")

  if rust_env == nil then
    rust_env = ""
  end
  return split_line(rust_env)
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"}
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ["rust-analyzer"] = {
        cargo = {
            features = get_rust_features()
            },
        },
    },
})
