local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities


require('lspconfig').clangd.setup{
capabilities = capabilities,
on_attach = on_attach,
}

require("clangd_extensions").setup  {
    server = {
            cmd = { "clangd",
                    "--query-driver='/Users/dmitry/open-watcom-v2/build/binbuild/bwcc'",
                    },
             on_attach = on_attach,
              capabilities = capabilities},
    -- bunch of other stuff for clangd_extentions customisation
}
