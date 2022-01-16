require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'bash',
    'dockerfile',
    'go',
    'gomod',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'python',
    'rust',
    'toml',
    'typescript',
    'vim',
    'yaml',
  },
})
