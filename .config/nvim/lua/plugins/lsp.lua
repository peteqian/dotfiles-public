return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {

        -- 🟦 Angular & TypeScript
        "angular-language-server",
        "typescript-language-server",
        "prettier",

        -- 🎨 Tailwind & CSS
        "tailwindcss-language-server",
        "css-lsp",

        -- 📄 Markdown
        "marksman", -- LSP
        "prettier", -- formatter

        -- 🐍 Python
        "pyright", -- LSP
        "black", -- formatter

        -- 🦀 Rust
        "rust-analyzer", -- LSP
        "rustfmt", -- formatter

        -- 🐚 Shell
        "shfmt", -- formatter

        -- 🌙 Lua
        "stylua", -- formatter
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(keys, {
        {
          "gd",
          function()
            -- DO NOT RESUSE WINDOW
            require("telescope.builtin").lsp_definitions({ reuse_win = false })
          end,
          desc = "Goto Definition",
          has = "definition",
        },
      })
    end,
  },
}
