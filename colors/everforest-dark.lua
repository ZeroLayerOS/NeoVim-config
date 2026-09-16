-- Everforest Dark (Medium) — A soft, warm, natural color scheme for Neovim.
-- Remapped to match official Everforest palette standards while retaining clean structure.

local c = {
  bg = "#2d353b", -- Everforest Main Dark Background
  bg_dark = "#232a2e", -- Darker background (float windows / popups)
  bg_light = "#343f44", -- Selection / elevated UI background
  fg = "#d3c6aa", -- Foreground (cream / warm beige)
  fg_dim = "#859289", -- Dimmed foreground / line numbers
  sage = "#7fbbb3", -- Soft muted aqua/sage for comments
  sky = "#7fbbb3", -- Aqua blue for keywords & statements
  leaf = "#a7c080", -- Everforest primary Green for functions
  peach = "#e67e80", -- Warm red/peach for strings
  honey = "#dbbc7f", -- Soft Yellow/Amber for constants & numbers
  lavender = "#d699b6", -- Soft Purple for types & data structures
  coral = "#e67e80", -- Warm Red/Coral for special characters & errors
  moss = "#a7c080", -- Forest Green for diff additions
  dawn = "#e69875", -- Warm Orange for warnings & highlights
  mist = "#83c092", -- Cool Green/Mist for operators & punctuation
  bloom = "#e3d8b8", -- Light beige for visual focus / match paren
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
vim.g.colors_name = "everforest-dark"

-- ============================================================
-- UI Elements
-- ============================================================
hl(0, "Normal", { fg = c.fg, bg = c.bg })
hl(0, "NormalNC", { fg = c.fg_dim, bg = c.bg })
hl(0, "NormalFloat", { fg = c.fg, bg = c.bg_dark })
hl(0, "FloatBorder", { fg = c.mist, bg = c.bg_dark })
hl(0, "FloatTitle", { fg = c.bloom, bg = c.bg_dark, bold = true })

hl(0, "CursorLine", { bg = c.bg_light })
hl(0, "CursorColumn", { bg = c.bg_light })
hl(0, "LineNr", { fg = c.fg_dim })
hl(0, "CursorLineNr", { fg = c.dawn, bold = true })
hl(0, "SignColumn", { fg = c.fg_dim, bg = c.bg })

hl(0, "Visual", { bg = c.bg_light, fg = c.bloom })
hl(0, "Search", { fg = c.bg_dark, bg = c.honey })
hl(0, "IncSearch", { fg = c.bg_dark, bg = c.coral, bold = true })
hl(0, "MatchParen", { fg = c.bloom, bold = true, underline = true })

hl(0, "Pmenu", { fg = c.fg, bg = c.bg_dark })
hl(0, "PmenuSel", { fg = c.bg_dark, bg = c.leaf, bold = true })
hl(0, "PmenuSbar", { bg = c.bg_dark })
hl(0, "PmenuThumb", { bg = c.fg_dim })

hl(0, "WinSeparator", { fg = c.bg_light, bg = c.bg })
hl(0, "StatusLine", { fg = c.fg, bg = c.bg_dark, bold = true })
hl(0, "StatusLineNC", { fg = c.fg_dim, bg = c.bg_dark })
hl(0, "TabLine", { fg = c.fg_dim, bg = c.bg_dark })
hl(0, "TabLineSel", { fg = c.bg_dark, bg = c.leaf, bold = true })
hl(0, "TabLineFill", { fg = c.fg_dim, bg = c.bg_dark })

hl(0, "NonText", { fg = c.bg_light })
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
hl(0, "Todo", { fg = c.bg_dark, bg = c.honey, bold = true })

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

hl(0, "DiffAdd", { fg = c.bg_dark, bg = c.moss })
hl(0, "DiffChange", { fg = c.bg_dark, bg = c.honey })
hl(0, "DiffDelete", { fg = c.bg_dark, bg = c.coral })
hl(0, "DiffText", { fg = c.bg_dark, bg = c.sky, bold = true })

hl(0, "SpellBad", { sp = c.coral, undercurl = true })
hl(0, "SpellCap", { sp = c.sky, undercurl = true })
