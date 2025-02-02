
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'cmake', 'latex', 'markdown'},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
