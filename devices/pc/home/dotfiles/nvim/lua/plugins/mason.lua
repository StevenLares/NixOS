-- REMOVE THIS LINE TO ACTIVATE THIS FILE
if true then return {} end 

-- Customize Mason
-- TODO: At some point, remove Mason and all LSP's it installed in favor of Nix devShells
-- They are: nil, nix-fmt, just-lsp, just-lsp, 

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
