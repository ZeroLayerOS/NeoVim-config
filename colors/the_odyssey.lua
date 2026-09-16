-- The Odyssey (Christopher Nolan Concept) — Atmospheric Steel-Blue & Bone
-- Deep ocean-trench backgrounds, muted bronze accents, and icy maritime blues.

local c = {
  bg = "#091118", -- Deepest oceanic blue / void
  bg_dark = "#0d1822", -- Inactive tab / darker panel background
  bg_light = "#1a2632", -- Selection / elevated UI background
  fg = "#cde1eb", -- Weathered bone foreground
  fg_dim = "#8ca3b0", -- Dimmed steel-grey
  sage = "#3a5f73", -- Slate ocean blue for comments
  sky = "#5f8a9f", -- Vibrant steel blue for keywords
  leaf = "#48686a", -- Dark sea-foam green for functions
  peach = "#9e7d53", -- Bronze / aged compass gold for strings
  honey = "#d4b07b", -- Bright compass gold for constants & numbers
  lavender = "#5c536e", -- Stormy violet for types & data structures
  coral = "#b83b30", -- Crimson warning / error accent
  moss = "#2c4244", -- Deep sea moss for diff additions
  dawn = "#d4b07b", -- Bright amber gold for warnings
  mist = "#2c5470", -- Deep maritime blue for operators & brackets
  bloom = "#cde1eb", -- Bright bone highlight for visual focus
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
vim.g.colors_name = "the_odyssey"

-- ============================================================
-- UI Elements
-- ============================================================
hl(0, "Normal", { fg = c.fg, bg = c.bg })
hl(0, "NormalNC", { fg = c.fg_dim, bg = c.bg })
hl(0, "NormalFloat", { fg = c.fg, bg = c.bg_dark })
hl(0, "FloatBorder", { fg = c.sky, bg = c.bg_dark })
hl(0, "FloatTitle", { fg = c.honey, bg = c.bg_dark, bold = true })

hl(0, "CursorLine", { bg = c.bg_light })
hl(0, "CursorColumn", { bg = c.bg_light })
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

hl(0, "NonText", { fg = c.bg_light })
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
