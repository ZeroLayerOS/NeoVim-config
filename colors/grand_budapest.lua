-- The Grand Budapest Hotel — Wes Anderson's Pastel Pink, Royal Purple & Gold
-- Muted hotel lobby backgrounds, concierge gold accents, and vibrant velvet purples.

local c = {
  bg = "#1c1518", -- Velvet dark mahogany base
  bg_dark = "#2d233e", -- Royal purple background for floats & inactive tabs
  bg_light = "#4a1c3d", -- Deep magenta selection / elevated surface
  fg = "#fceee9", -- Soft pastel cream foreground
  fg_dim = "#e3d1c4", -- Muted vintage bone text
  sage = "#889d9d", -- Soft slate green for comments
  sky = "#ee7192", -- Mendl's box pink for keywords & statements
  leaf = "#83997c", -- Olive uniform green for functions
  peach = "#bacaca", -- Pastel blue-grey for strings
  honey = "#d4a359", -- Concierge brass gold for constants & numbers
  lavender = "#a3487f", -- Muted lobby magenta for types & data structures
  coral = "#d9436e", -- Crimson accent / errors
  moss = "#4f614a", -- Deep lobby carpet green for diff additions
  dawn = "#f0cb85", -- Bright gold warning highlight
  mist = "#6c538a", -- Royal purple for operators & brackets
  bloom = "#fceee9", -- Pale cream highlight for visual focus
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
vim.g.colors_name = "grand_budapest"

-- ============================================================
-- UI Elements
-- ============================================================
hl(0, "Normal", { fg = c.fg, bg = c.bg })
hl(0, "NormalNC", { fg = c.fg_dim, bg = c.bg })
hl(0, "NormalFloat", { fg = c.fg, bg = c.bg_dark })
hl(0, "FloatBorder", { fg = c.sky, bg = c.bg_dark })
hl(0, "FloatTitle", { fg = c.honey, bg = c.bg_dark, bold = true })

hl(0, "CursorLine", { bg = c.bg_dark })
hl(0, "CursorColumn", { bg = c.bg_dark })
hl(0, "LineNr", { fg = c.fg_dim })
hl(0, "CursorLineNr", { fg = c.honey, bold = true })
hl(0, "SignColumn", { fg = c.fg_dim, bg = c.bg })

hl(0, "Visual", { bg = c.bg_light, fg = c.bloom })
hl(0, "Search", { fg = c.bg, bg = c.honey })
hl(0, "IncSearch", { fg = c.bg, bg = c.coral, bold = true })
hl(0, "MatchParen", { fg = c.honey, bold = true, underline = true })

hl(0, "Pmenu", { fg = c.fg, bg = c.bg_dark })
hl(0, "PmenuSel", { fg = c.bg, bg = c.sky, bold = true })
hl(0, "PmenuSbar", { bg = c.bg_dark })
hl(0, "PmenuThumb", { bg = c.fg_dim })

hl(0, "WinSeparator", { fg = c.bg_light, bg = c.bg })
hl(0, "StatusLine", { fg = c.fg, bg = c.bg_dark, bold = true })
hl(0, "StatusLineNC", { fg = c.fg_dim, bg = c.bg_dark })
hl(0, "TabLine", { fg = c.fg_dim, bg = c.bg_dark })
hl(0, "TabLineSel", { fg = c.bg, bg = c.sky, bold = true })
hl(0, "TabLineFill", { fg = c.fg_dim, bg = c.bg_dark })

hl(0, "NonText", { fg = c.bg_dark })
link("EndOfBuffer", "NonText")
hl(0, "Directory", { fg = c.sky })
hl(0, "Title", { fg = c.honey, bold = true })

-- ============================================================
-- Syntax Highlighting
-- ============================================================
hl(0, "Comment", { fg = c.sage, italic = true })
hl(0, "Statement", { fg = c.sky, bold = true })
link("Keyword", "Statement")
link("Conditional", "Statement")
link("Repeat", "Statement")

hl(0, "Function", { fg = c.leaf, bold = true })
hl(0, "Identifier", { fg = c.fg })
hl(0, "String", { fg = c.peach })
link("Character", "String")

hl(0, "Type", { fg = c.lavender, italic = true })
hl(0, "Constant", { fg = c.honey })
link("Number", "Constant")
link("Boolean", "Constant")

hl(0, "Operator", { fg = c.mist })
hl(0, "PreProc", { fg = c.sky })
hl(0, "Special", { fg = c.coral })
hl(0, "Underlined", { fg = c.sky, underline = true })
hl(0, "Error", { fg = c.bloom, bg = c.coral, bold = true })
hl(0, "Todo", { fg = c.bg, bg = c.honey, bold = true })

-- ============================================================
-- Treesitter Integration
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
hl(0, "@punctuation.delimiter", { fg = c.mist })
hl(0, "@punctuation.bracket", { fg = c.mist })

-- ============================================================
-- Diagnostics / Diff / Spell
-- ============================================================
hl(0, "DiagnosticError", { fg = c.coral })
hl(0, "DiagnosticWarn", { fg = c.dawn })
hl(0, "DiagnosticInfo", { fg = c.sky })
hl(0, "DiagnosticHint", { fg = c.fg_dim })
link("DiagnosticUnderlineError", "DiagnosticError")
link("DiagnosticUnderlineWarn", "DiagnosticWarn")

hl(0, "DiffAdd", { fg = c.fg, bg = c.moss })
hl(0, "DiffChange", { fg = c.bg, bg = c.honey })
hl(0, "DiffDelete", { fg = c.fg, bg = c.coral })
hl(0, "DiffText", { fg = c.bg, bg = c.sky, bold = true })

hl(0, "SpellBad", { sp = c.coral, undercurl = true })
hl(0, "SpellCap", { sp = c.sky, undercurl = true })
