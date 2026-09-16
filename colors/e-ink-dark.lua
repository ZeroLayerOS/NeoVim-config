--[[
  e-ink.nvim — dark variant
  loads the greyscale/everforest palette in "dark" mode and
  generates the syntax highlighting for it.
--]]

-- reset any existing highlighting / clear syntax, same as a classic
-- vimscript colorscheme would do
if vim.g.colors_name then
   vim.cmd("hi clear")
end
if vim.fn.exists("syntax_on") == 1 then
   vim.cmd("syntax reset")
end

-- palette.lua reads vim.o.background to decide which table to hand back,
-- so it must be set BEFORE requiring/generating the syntax
vim.o.background = "dark"
vim.g.colors_name = "e-ink-dark"

require("e-ink.syntax").generate_syntax()
