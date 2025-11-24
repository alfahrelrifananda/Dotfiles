vim.opt.mouse = 'a'
vim.opt.keymodel = 'startsel,stopsel'
vim.opt.selectmode = 'mouse,key'

vim.opt.whichwrap:append("<,>,[,]")
vim.keymap.set('v', '<C-c>', '"+y<Esc>', { desc = 'Copy' })
vim.keymap.set('n', '<C-x>', '"+dd', { desc = 'Cut line' })
vim.keymap.set('i', '<C-x>', '<Esc>"+ddi', { desc = 'Cut line' })
vim.keymap.set('v', '<C-x>', '"+d', { desc = 'Cut selection' })
vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = 'Paste from clipboard' })
vim.keymap.set('c', '<C-v>', '<C-r>+', { desc = 'Paste in command mode' })
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all' })
vim.keymap.set('n', '<C-z>', 'u', { desc = 'Undo' })
vim.keymap.set('n', '<C-y>', '<C-r>', { desc = 'Redo' })
vim.keymap.set('i', '<C-z>', '<C-o>u', { desc = 'Undo' })
vim.keymap.set('i', '<C-y>', '<C-o><C-r>', { desc = 'Redo' })

vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.number = true
