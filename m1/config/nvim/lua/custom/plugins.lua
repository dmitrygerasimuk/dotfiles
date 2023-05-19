
local plugins = {

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {  "p00f/clangd_extensions.nvim",},
  --[[
  {  "RaafatTurki/hex.nvim" ,
    ft={"obj","binary","OBJ"},
    config = function()
      require 'hex'.setup {

  -- cli command used to dump hex data
  dump_cmd = 'xxd -g 1 -u',

  -- cli command used to assemble from hex data
  assemble_cmd = 'xxd -r',
  -- function that runs on BufReadPre to determine if it's binary or not
  is_buf_binary_pre_read = function()
    -- logic that determines if a buffer contains binary data or not
    -- must return a bool
  end,

  -- function that runs on BufReadPost to determine if it's binary or not
  is_buf_binary_post_read = function()
    -- logic that determines if a buffer contains binary data or not
    -- must return a bool
  end,
}
      },
  --]]

}
return plugins
