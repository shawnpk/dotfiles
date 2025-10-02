return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>t", group = "Terminal", mode = { "n", "v" } },

      -- Helper group with sort command
      { "<leader>h", group = "Helpers", icon = "⚙️", mode = "v" },
      { "<leader>hs", ":sort<CR>", desc = "Sort selected lines", icon = "⇄", mode = "v" },

      -- Copilot-chat with function approach to avoid underline
      {
        "<leader>cc",
        function()
          require("which-key").show({ keys = "<leader>cc", loop = false })
        end,
        desc = "copilot-chat",
        icon = { color = "blue", icon = "🤖" },
      },
      { "<leader>cco", ":CopilotChatOpen<CR>", desc = "CopilotChat Open", icon = { color = "green", icon = "📂" } },
      { "<leader>ccc", ":CopilotChatClose<CR>", desc = "CopilotChat Close", icon = { color = "red", icon = "⛔" } },
      {
        "<leader>ccm",
        ":CopilotChatModels<CR>",
        desc = "CopilotChat Models",
        icon = { color = "yellow", icon = "🧠" },
      },
      {
        "<leader>ccl",
        function()
          local name = vim.fn.input("Load chat: ")
          if name ~= "" then
            vim.cmd("CopilotChatLoad " .. name)
          end
        end,
        desc = "CopilotChat Load",
        icon = { color = "cyan", icon = "📥" },
      },
      {
        "<leader>ccp",
        ":CopilotChatPrompts<CR>",
        desc = "CopilotChat Prompts",
        icon = { color = "purple", icon = "💬" },
      },
      {
        "<leader>ccr",
        ":CopilotChatReset<CR>",
        desc = "CopilotChat Reset",
        icon = { color = "orange", icon = "🔄" },
      },
      {
        "<leader>ccs",
        function()
          local name = vim.fn.input("Save chat as: ")
          if name ~= "" then
            vim.cmd("CopilotChatSave " .. name)
          end
        end,
        desc = "CopilotChat Save",
        icon = { color = "blue", icon = "💾" },
      },
      {
        "<leader>cct",
        ":CopilotChatToggle<CR>",
        desc = "CopilotChat Toggle",
        icon = { color = "yellow", icon = "🔀" },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
