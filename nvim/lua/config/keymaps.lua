vim.g.mapleader =' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd =true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth =4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.cmd('set relativenumber')
vim.cmd('set number')

vim.cmd([[set clipboard=unnamedplus]])


-- Function to toggle between header and main file
function toggle_header_source()
        local file_extension = vim.fn.expand("%:e") -- Get current file extension
        local file_name = vim.fn.expand("%:t:r") -- Get current file name without extension

        local new_file_name

        if file_extension == "hpp" then
                new_file_name = file_name .. ".cpp"
        elseif file_extension == "cpp" then
                new_file_name = file_name .. ".hpp"
        else
                print("Toggle not supported for this file type")
                return
        end

        local new_file_path = vim.fn.expand("%:p:h") .. "/" .. new_file_name
        vim.cmd("e " .. new_file_path)
end

-- Set key mappings
vim.api.nvim_set_keymap("n", "<F4>", [[:lua toggle_header_source()<CR>]], { noremap = true, silent = true })

-- Define a function to split the window vertically
function SplitVertical()
  vim.cmd('vsplit')
end

function SplitH()
    vim.cmd('split')
end

function WarningSolver()
    vim.lsp.buf.code_action()
end

vim.api.nvim_set_keymap('n', '<Space>w', ':lua WarningSolver()<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<Space>|', ':lua SplitH()<CR>', {noremap=true, silent=true})

-- Map the function to the keybinding
vim.api.nvim_set_keymap('n', '<Space>v', ':lua SplitVertical()<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<Space>ac', ':!arduino-cli compile --fqbn esp32:esp32:esp32 %<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>au', ':!arduino-cli upload -p /dev/ttyUSB0 --fqbn esp32:esp32:esp32 %<CR>', { noremap = true })
--
--vim.keymap('n', '<leader>h', ':nohlsearch<CR>')
