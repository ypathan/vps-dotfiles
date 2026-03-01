vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.g.have_nerd_font = true
-- Make line numbers default
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.mouse = "a"

vim.opt.showmode = false
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

vim.o.tabstop = 4      -- A TAB character looks like 4 spaces
vim.o.expandtab = false -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
vim.opt.wrap = false

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cmdheight = 1


vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.laststatus = 3
vim.opt.statusline = "[%{fnamemodify(getcwd(), ':t')}] - %f"

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 0
vim.opt.swapfile = false

-- remove ~ from blank lines
vim.opt.fillchars = 'eob: '

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" } }, {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})


vim.cmd("colorscheme slate")

-- keymaps

vim.api.nvim_set_keymap('v', '<C-Down>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-Up>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>bg", function()
  if vim.o.background == "light" then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
end, { noremap = true, desc = "Toggle background light/dark" })

vim.keymap.set("n", "<leader>rr", "<cmd>checktime<CR>", { noremap = true })
vim.keymap.set("n", "<leader>rn", "<cmd>lua = vim.lsp.buf.rename()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fm", "<cmd>lua = vim.lsp.buf.format()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tt", "<cmd>TypstPreview<CR>", { noremap = true })
vim.keymap.set("n", "gr", "<cmd>lua = vim.lsp.buf.references()<CR>", { noremap = true })
vim.keymap.set("n", "gd", "<cmd>lua = vim.lsp.buf.definition()<CR>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<cmd>lua = vim.lsp.buf.signature_help()<CR>", { noremap = true })
vim.keymap.set("n", "<C-c>", "<cmd>lua = vim.lsp.buf.code_action()<CR>", { noremap = true })
