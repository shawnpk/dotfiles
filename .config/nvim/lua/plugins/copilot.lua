return {
  "zbirenbaum/copilot.lua",
  lazy = false,
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = true },
      panel = {
        enabled = true,
        accept = "<Tab>",
      },
    })
  end,
}
