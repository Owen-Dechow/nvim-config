local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {});
vim.keymap.set('n', '<leader>fgf', builtin.git_files, {});
vim.keymap.set('n', '<leader>gr', builtin.live_grep, {});
