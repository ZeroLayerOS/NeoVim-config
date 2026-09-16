-- Kitty Custom Theme — Dark charcoal base, amber/gold highlights, and vibrant neon accents

local c = {
  bg = "#121110", -- Dark charcoal background
  bg_dark = "#161614", -- Inactive tab / popup background
  bg_light = "#2c78bf", -- Selection / elevated UI surface
  fg = "#fce8c3", -- Warm cream foreground
  fg_dim = "#917e6b", -- Dimmed brown-grey
  sage = "#917e6b", -- Muted tone for comments
  sky = "#68a8e4", -- Bright blue for keywords
  leaf = "#98bc37", -- Vibrant green for functions
  peach = "#fbb829", -- Warm gold for strings
  honey = "#fed06e", -- Amber for constants & numbers
  lavender = "#ff5c8f", -- Soft pink/magenta for types
  coral = "#ef2f27", -- Bright red for errors & accents
  moss = "#519f50", -- Deep green for diff additions
  dawn = "#fbb829", -- Gold cursor/warning color
  mist = "#2be4d0", -- Bright cyan for operators & delimiters
  bloom = "#fce8c3", -- Warm cream highlight
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
vim.g.colors_name = "kitty_custom"

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
hl(0, "CursorLineNr", { fg = c.dawn, bold = true })
hl(0, "SignColumn", { fg = c.fg_dim, bg = c.bg })

hl(0, "Visual", { bg = c.fg, fg = c.bg })
hl(0, "Search", { fg = c.bg, bg = c.honey })
hl(0, "IncSearch", { fg = c.bg, bg = c.coral, bold = true })
hl(0, "MatchParen", { fg = c.dawn, bold = true, underline = true })

hl(0, "Pmenu", { fg = c.fg, bg = c.bg_dark })
hl(0, "PmenuSel", { fg = c.bg, bg = c.sky, bold = true })
hl(0, "PmenuSbar", { bg = c.bg_dark })
hl(0, "PmenuThumb", { bg = c.fg_dim })

hl(0, "WinSeparator", { fg = c.bg_dark, bg = c.bg })
hl(0, "StatusLine", { fg = c.fg, bg = c.bg_dark, bold = true })
hl(0, "StatusLineNC", { fg = c.fg_dim, bg = c.bg_dark })
hl(0, "TabLine", { fg = c.fg_dim, bg = c.bg_dark })
hl(0, "TabLineSel", { fg = c.bg, bg = c.fg, bold = true })
hl(0, "TabLineFill", { fg = c.fg_dim, bg = c.bg_dark })

hl(0, "NonText", { fg = c.bg_dark })
link("EndOfBuffer", "NonText")
hl(0, "Directory", { fg = c.sky })
hl(0, "Title", { fg = c.dawn, bold = true })

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

hl(0, "DiffAdd", { fg = c.bg, bg = c.moss })
hl(0, "DiffChange", { fg = c.bg, bg = c.honey })
hl(0, "DiffDelete", { fg = c.fg, bg = c.coral })
hl(0, "DiffText", { fg = c.bg, bg = c.sky, bold = true })

hl(0, "SpellBad", { sp = c.coral, undercurl = true })
hl(0, "SpellCap", { sp = c.sky, undercurl = true })
