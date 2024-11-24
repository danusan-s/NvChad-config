-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

-- Open NVDash when nvim is started with no arguments
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     if #vim.fn.argv() == 0 then
--       vim.cmd "Nvdash"
--     elseif vim.fn.isdirectory(vim.fn.expand "%:p") == 1 then
--       vim.cmd "NvimTreeToggle"
--     end
--   end,
-- })

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,
  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "  Open explorer", keys = "e", cmd = ":e .<CR>" },
    { txt = "󱥚  Themes", keys = "t", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "?", cmd = "NvCheatsheet" },
    { txt = "󰄨  Receive contest files", keys = "c", cmd = ":CompetiTest receive contest<CR>" },
    { txt = "Quit ?", keys = "q", cmd = ":q!" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

return M
