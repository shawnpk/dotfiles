local map = vim.keymap.set

-- Copilot Chat keybindings using double letters under <leader>c
-- Pattern: CopilotChatOpen -> <leader>cco (taking capital letters from command)
map("n", "<leader>cco", ":CopilotChatOpen<CR>", { desc = "CopilotChat Open" })
map("n", "<leader>ccr", ":CopilotChatReset<CR>", { desc = "CopilotChat Reset" })
map("n", "<leader>ccm", ":CopilotChatModels<CR>", { desc = "CopilotChat Models" })
map("n", "<leader>ccp", ":CopilotChatPrompts<CR>", { desc = "CopilotChat Prompts" })

-- Save and Load with input prompts (CopilotChatSave -> ccs, CopilotChatLoad -> ccl)
map("n", "<leader>ccs", function()
  local name = vim.fn.input("Save chat as: ")
  if name ~= "" then
    vim.cmd("CopilotChatSave " .. name)
  end
end, { desc = "CopilotChat Save" })

map("n", "<leader>ccl", function()
  local name = vim.fn.input("Load chat: ")
  if name ~= "" then
    vim.cmd("CopilotChatLoad " .. name)
  end
end, { desc = "CopilotChat Load" })

-- Visual mode bindings for chat with selection
map("v", "<leader>cco", ":CopilotChatOpen<CR>", { desc = "CopilotChat Open with selection" })

-- Quick chat toggle (CopilotChatToggle -> cct)
map("n", "<leader>cct", ":CopilotChatToggle<CR>", { desc = "CopilotChat Toggle" })

-- Close chat (CopilotChatClose -> ccc)
map("n", "<leader>ccc", ":CopilotChatClose<CR>", { desc = "CopilotChat Close" })

-- Configuration to ensure these appear in which-key menu
-- Add this to your which-key plugin configuration or create a separate plugin file
return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    -- Ensure the existing opts.spec table exists
    if not opts.spec then
      opts.spec = {}
    end

    -- Add our Copilot Chat group to the spec
    -- Try different approaches to avoid the underline:

    -- Clean group approach without icon to preserve normal display
    table.insert(opts.spec, {
      { "<leader>cc", group = "copilot-chat" },
    })

    -- Alternative: Back to simple group without icon
    -- table.insert(opts.spec, {
    --   { "<leader>cc", group = "copilot-chat" },
    -- })

    return opts
  end,
}
