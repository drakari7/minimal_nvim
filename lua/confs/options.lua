-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Basic options
opt.number = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false
opt.mouse = ""
opt.clipboard = "unnamedplus"

-- Wrap
opt.wrap = true
opt.whichwrap = ""
opt.breakindent = true
opt.linebreak = true
opt.showbreak = "  > "

-- Format options
opt.formatoptions = "c,r,j"

-- Tabs and indentation
opt.autoindent = true
opt.cindent = true
opt.expandtab = true
opt.shiftround = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- File format
opt.fileformats = {'unix', 'dos'}
opt.fileencoding = "utf-8"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Popup menu options
opt.pumheight = 15

-- Scrolloff and splits
opt.scrolloff = 20
opt.sidescrolloff = 20
opt.splitbelow = true
opt.splitright = true

-- List chars
opt.list = true
opt.listchars = {
  eol='¬',
  tab='»·',
  trail='·',
  extends='<',
  precedes='>',
  conceal='┊',
  nbsp='␣',
}

-- Miscellaneous
opt.termguicolors = true
