return {
  "echasnovski/mini.statusline",
  version = false,
  opts = {
    content = {
      active = function()
        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
        local git = MiniStatusline.section_git({ trunc_width = 40 })
        local diff = MiniStatusline.section_diff({ trunc_width = 75 })
        local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
        -- Custom filename function that handles multiple project patterns
        local filename = function()
          local path = vim.fn.expand("%:~")
          -- Define multiple project patterns to look for
          local project_patterns = {
            "/network_insights/",
            "/test_driven_rails/",
            "/thoughtbot/",
            "/agile_web_development_with_rails_8",
            -- Add more patterns as needed
          }
          -- Check each pattern and return path from the first match
          for _, pattern in ipairs(project_patterns) do
            local pos = path:find(pattern)
            if pos then
              return path:sub(pos + #pattern)
            end
          end
          -- If no pattern matches, return the full path
          return path
        end
        local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
        local location = function()
          local current_line = vim.fn.line(".")
          local total_lines = vim.fn.line("$")
          local current_col = vim.fn.col(".")
          local line_length = vim.fn.strdisplaywidth(vim.fn.getline("."))
          return string.format("%d|%d %d|%d", current_line, total_lines, current_col, line_length)
        end
        local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
        return MiniStatusline.combine_groups({
          { hl = mode_hl, strings = { mode } },
          { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
          "%<", -- Mark general truncate point
          { hl = "MiniStatuslineFilename", strings = { filename() } },
          "%=", -- End left alignment
          { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
          { hl = mode_hl, strings = { search, location() } }, -- Use the custom function
        })
      end,
    },
  },
  init = function()
    -- Define custom color for the filename section
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        -- Customize the filename section color
        vim.api.nvim_set_hl(0, "MiniStatuslineFilename", {
          fg = "#EE4B2B", -- Light blue (keeping your current color)
          bg = "#222222", -- Dark background (keeping your current color)
          bold = true, -- Not bold (keeping your current setting)
        })
        -- You might also want to make sure the file name stands out
        vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", {
          fg = "#82AAFF", -- Light blue for file info
          bg = "NONE",
        })
      end,
    })
    -- Apply the colors on startup
    vim.cmd("doautocmd ColorScheme")
  end,
}
