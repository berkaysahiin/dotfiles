-- To add a theme, add one row to the table.
local ACTIVE = "gruber-darker"

local THEMES = {
  ["gruber-darker"] = "blazkowolf/gruber-darker.nvim",
}

local specs = {}
for name, repo in pairs(THEMES) do
  specs[#specs + 1] = {
    repo,
    lazy = false,
    priority = 1000,
    enabled = name == ACTIVE,
    config = function()
      require("colorschemes." .. name).setup()
    end,
  }
end

return specs
