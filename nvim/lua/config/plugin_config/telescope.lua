local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<SPACE><SPACE>', builtin.oldfiles, {})
vim.keymap.set('n', '<SPACE>fg', builtin.live_grep, {})
vim.keymap.set('n', '<SPACE>fh', builtin.help_tags, {})

