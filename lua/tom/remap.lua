vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.api.nvim_set_keymap('n', '<leader>c', ':call codeium#Chat()<CR>', { noremap = true })


----------------Nvim Tree-----------------------------------------------------
---callback-def---

local api = require("nvim-tree.api")

local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file
    api.node.open.edit()
    -- Close the tree if file was opened
    api.tree.close()
  end
end

-- open as vsplit on current node
local function vsplit_preview()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file as vsplit
    api.node.open.vertical()
  end

  -- Finally refocus on tree if it was lost
  api.tree.focus()
end

---gobal---
vim.api.nvim_set_keymap("n", "<C-a>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})

---on-atttach---
vim.keymap.set("n", "l", edit_or_open, {desc = "Edit Or Open"})
vim.keymap.set("n", "L", vsplit_preview, {desc = "Vsplit Preview"})
vim.keymap.set("n", "h", api.tree.close, {desc = "Close"})
vim.keymap.set("n", "H", api.tree.collapse_all, {desc = "Collapse All"})
