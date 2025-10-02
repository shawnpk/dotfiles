-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Make quickfix list modifiable

-- Clear quickfix list
vim.keymap.set("n", "<leader>qc", function()
  vim.fn.setqflist({})
end, { desc = "Clear quickfix list" })

-- Override Telescope's <C-q> to open Trouble instead of regular quickfix
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function(event)
    local function send_to_trouble(prompt_bufnr)
      local actions = require("telescope.actions")
      actions.send_to_qflist(prompt_bufnr)
      actions.close(prompt_bufnr)
      vim.schedule(function()
        vim.cmd("cclose") -- Close regular quickfix that opens
        require("trouble").open("quickfix")
      end)
    end

    -- Override <C-q> in both insert and normal mode
    vim.keymap.set("i", "<C-q>", send_to_trouble, { buffer = event.buf })
    vim.keymap.set("n", "<C-q>", send_to_trouble, { buffer = event.buf })
  end,
})

-- Close quickfix and open Trouble quickfix in one command
vim.keymap.set("n", "<leader>xs", function()
  vim.cmd("cclose")
  require("trouble").open("quickfix")
end, { desc = "Close quickfix and open Trouble" })
