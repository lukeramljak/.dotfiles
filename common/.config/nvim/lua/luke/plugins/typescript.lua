return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    keys = {
      {
        '<leader>co',
        '<cmd>:TSToolsOrganizeImports<CR>',
        desc = 'Organise Imports',
      },
      {
        '<leader>cR',
        '<cmd>:TSToolsRemoveUnused<CR>',
        desc = 'Remove Unused Imports',
      },
    },
    opts = {
      settings = {
        expose_as_code_action = 'all',
        jsx_close_tag = {
          enable = true,
          filetypes = { 'javascriptreact', 'typescriptreact' },
        },
      },
    },
  },
}
