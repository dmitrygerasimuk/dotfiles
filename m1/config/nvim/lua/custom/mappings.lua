local M = {}

-- In order to disable a default keymap, use
-- Your custom mappings
M.abc = {

n= {
    ["<leader>dos"] = { "<cmd> e ++enc=cp866<CR>", "OPEN USING CP866" },
}
}
--[[ 
--M.hex = {

    n={
    ["<F5>"] = { "<cmd> HexToggle<CR>", "TOGGLE HEX VIEW" },
  }
} 
--]]
--
return M
