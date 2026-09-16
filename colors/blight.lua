-- Blight — inspired not by the black hole's glow, but by the dust
-- bowl earth Cooper leaves behind: warm dusty brown instead of pure
-- black, faded wheat and worn denim instead of neon amber/cyan, and
-- a soft periwinkle for the tesseract's geometry, kept quiet on purpose.

local c = {
  bg = "#1a1714", -- dust-storm brown, not pure black
  bg_dark = "#120f0d",
  fg = "#c4b8a8", -- dry wheat, soft not stark
  dim = "#5c5248", -- weathered wood
  dim_lt = "#786c5d",
  wheat = "#c9a54a", -- faded cornfield gold
  denim = "#5b7a8c", -- worn work-shirt blue
  tesseract = "#8899bb", -- library geometry, soft periwinkle
  barn = "#a8583c", -- old barn red
  page = "#e8ddc9", -- Murph's book page, warm off-white
  danger = "#b6543f",
  success = "#8a9a6b", -- sage, not neon green
  selection = "#332c22",
  line = "#242019",
  info = "#7f95a8",
}

local hl = vim.api.nvim_set_hl
local function link(from, to)
  hl(0, from, { link = to })
end

if vim.g.colors_name then
  vim.cmd("highlight clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "blight"

-- ============================================================
-- UI
-- ============================================================
hl(0, "Normal", { fg = c.fg, bg = c.bg })
hl(0, "NormalNC", { fg = c.dim, bg = c.bg })
hl(0, "NormalFloat", { fg = c.fg, bg = c.bg_dark })
hl(0, "FloatBorder", { fg = c.wheat, bg = c.bg_dark })
hl(0, "FloatTitle", { fg = c.page, bg = c.bg_dark, bold = true })

hl(0, "CursorLine", { bg = c.line })
hl(0, "CursorColumn", { bg = c.line })
hl(0, "LineNr", { fg = c.dim })
hl(0, "CursorLineNr", { fg = c.wheat, bold = true })
hl(0, "SignColumn", { fg = c.dim, bg = c.bg })

hl(0, "Visual", { bg = "#3d3120", fg = c.page })
hl(0, "Search", { fg = c.bg, bg = c.wheat })
hl(0, "IncSearch", { fg = c.bg, bg = c.barn, bold = true })
hl(0, "MatchParen", { fg = c.tesseract, bold = true, underline = true })

hl(0, "Pmenu", { fg = c.fg, bg = c.bg_dark })
hl(0, "PmenuSel", { fg = c.bg, bg = c.wheat, bold = true })
hl(0, "PmenuSbar", { bg = c.bg_dark })
hl(0, "PmenuThumb", { bg = c.dim })

hl(0, "WinSeparator", { fg = c.selection, bg = c.bg })
hl(0, "StatusLine", { fg = c.fg, bg = c.bg_dark, bold = true })
hl(0, "StatusLineNC", { fg = c.dim, bg = c.bg_dark })
hl(0, "TabLine", { fg = c.dim, bg = c.bg_dark })
hl(0, "TabLineSel", { fg = c.bg, bg = c.wheat, bold = true })
hl(0, "TabLineFill", { fg = c.dim, bg = c.bg_dark })

hl(0, "NonText", { fg = c.selection })
link("EndOfBuffer", "NonText")
hl(0, "Directory", { fg = c.denim })
hl(0, "Title", { fg = c.wheat, bold = true })

-- ============================================================
-- Syntax — denim-blue keywords (quiet, not shouting), wheat
-- functions (the one warm accent that earns attention), page-cream
-- strings (soft, readable), tesseract for anything structural.
-- ============================================================
hl(0, "Comment", { fg = c.dim, italic = true })
hl(0, "Statement", { fg = c.denim, bold = true })
link("Keyword", "Statement")
link("Conditional", "Statement")
link("Repeat", "Statement")
hl(0, "Function", { fg = c.wheat, bold = true })
hl(0, "Identifier", { fg = c.fg })
hl(0, "String", { fg = c.page })
link("Character", "String")
hl(0, "Type", { fg = c.dim_lt, italic = true })
hl(0, "Constant", { fg = c.tesseract })
link("Number", "Constant")
link("Boolean", "Constant")
hl(0, "Operator", { fg = c.dim_lt })
hl(0, "PreProc", { fg = c.denim })
hl(0, "Special", { fg = c.tesseract })
hl(0, "Underlined", { fg = c.denim, underline = true })
hl(0, "Error", { fg = c.page, bg = c.danger, bold = true })
hl(0, "Todo", { fg = c.bg, bg = c.wheat, bold = true })

-- ============================================================
-- Treesitter
-- ============================================================
link("@variable", "Identifier")
link("@function", "Function")
link("@keyword", "Statement")
link("@comment", "Comment")
link("@string", "String")
link("@type", "Type")
link("@constant", "Constant")
link("@number", "Number")
link("@boolean", "Boolean")
link("@operator", "Operator")
hl(0, "@punctuation.delimiter", { fg = c.dim_lt })
hl(0, "@punctuation.bracket", { fg = c.dim_lt })

-- ============================================================
-- Diagnostics / Diff / Spell
-- ============================================================
hl(0, "DiagnosticError", { fg = c.danger })
hl(0, "DiagnosticWarn", { fg = c.barn })
hl(0, "DiagnosticInfo", { fg = c.info })
hl(0, "DiagnosticHint", { fg = c.dim })
link("DiagnosticUnderlineError", "DiagnosticError")
link("DiagnosticUnderlineWarn", "DiagnosticWarn")

hl(0, "DiffAdd", { fg = c.bg, bg = c.success })
hl(0, "DiffChange", { fg = c.bg, bg = c.wheat })
hl(0, "DiffDelete", { fg = c.bg, bg = c.danger })
hl(0, "DiffText", { fg = c.bg, bg = c.tesseract, bold = true })

hl(0, "SpellBad", { sp = c.danger, undercurl = true })
hl(0, "SpellCap", { sp = c.tesseract, undercurl = true })
