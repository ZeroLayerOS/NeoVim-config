-- Haloknight — a warrior's palette: cold rhodium/titanium armor,
-- a warm golden halo behind him, a crimson feather, a diamond-tipped
-- gold spear, and eyes as black as the dark he stands against.

local c = {
  bg = "#0d0e12",
  bg_dark = "#08090b",
  fg = "#c9ccd1", -- rhodium
  titanium = "#5b6169", -- dim/comment
  titanium_lt = "#878e97",
  gold = "#e8b923", -- halo
  gold_bright = "#ffd651", -- halo glow
  feather = "#c23b3b", -- crimson feather
  diamond = "#f2f4f8", -- spear tip
  eyes = "#08090b", -- black eyes
  selection = "#1c1f26",
  line = "#161920",
  danger = "#e05252",
  success = "#8fae5d",
  info = "#8ebeec",
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
vim.g.colors_name = "haloknight"

-- ============================================================
-- UI
-- ============================================================
hl(0, "Normal", { fg = c.fg, bg = c.bg })
hl(0, "NormalNC", { fg = c.titanium, bg = c.bg })
hl(0, "NormalFloat", { fg = c.fg, bg = c.bg_dark })
hl(0, "FloatBorder", { fg = c.gold, bg = c.bg_dark })
hl(0, "FloatTitle", { fg = c.gold_bright, bg = c.bg_dark, bold = true })

hl(0, "CursorLine", { bg = c.line })
hl(0, "CursorColumn", { bg = c.line })
hl(0, "LineNr", { fg = c.titanium })
hl(0, "CursorLineNr", { fg = c.gold_bright, bold = true })
hl(0, "SignColumn", { fg = c.titanium, bg = c.bg })

-- the golden halo, made visible where you select
hl(0, "Visual", { bg = "#3a2f12", fg = c.gold_bright })
hl(0, "Search", { fg = c.bg, bg = c.gold })
hl(0, "IncSearch", { fg = c.bg, bg = c.feather, bold = true })
hl(0, "MatchParen", { fg = c.gold_bright, bold = true, underline = true })

hl(0, "Pmenu", { fg = c.fg, bg = c.bg_dark })
hl(0, "PmenuSel", { fg = c.bg, bg = c.gold, bold = true })
hl(0, "PmenuSbar", { bg = c.bg_dark })
hl(0, "PmenuThumb", { bg = c.titanium })

hl(0, "WinSeparator", { fg = c.selection, bg = c.bg })
hl(0, "StatusLine", { fg = c.fg, bg = c.bg_dark, bold = true })
hl(0, "StatusLineNC", { fg = c.titanium, bg = c.bg_dark })
hl(0, "TabLine", { fg = c.titanium, bg = c.bg_dark })
hl(0, "TabLineSel", { fg = c.bg, bg = c.gold, bold = true })
hl(0, "TabLineFill", { fg = c.titanium, bg = c.bg_dark })

hl(0, "NonText", { fg = c.selection })
link("EndOfBuffer", "NonText")
hl(0, "Directory", { fg = c.gold })
hl(0, "Title", { fg = c.gold_bright, bold = true })

-- ============================================================
-- Syntax — the feather leads (keywords), the halo glows (funcs),
-- the spear-tip gleams (strings), rhodium/titanium stay neutral.
-- ============================================================
hl(0, "Comment", { fg = c.titanium, italic = true })
hl(0, "Statement", { fg = c.feather, bold = true })
link("Keyword", "Statement")
link("Conditional", "Statement")
link("Repeat", "Statement")
hl(0, "Function", { fg = c.gold, bold = true })
hl(0, "Identifier", { fg = c.fg })
hl(0, "String", { fg = c.diamond })
link("Character", "String")
hl(0, "Type", { fg = c.titanium_lt, italic = true })
hl(0, "Constant", { fg = c.gold_bright })
link("Number", "Constant")
link("Boolean", "Constant")
hl(0, "Operator", { fg = c.titanium_lt })
hl(0, "PreProc", { fg = c.feather })
hl(0, "Special", { fg = c.diamond })
hl(0, "Underlined", { fg = c.gold, underline = true })
hl(0, "Error", { fg = c.diamond, bg = c.feather, bold = true })
hl(0, "Todo", { fg = c.eyes, bg = c.gold_bright, bold = true })

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
hl(0, "@punctuation.delimiter", { fg = c.titanium_lt })
hl(0, "@punctuation.bracket", { fg = c.titanium_lt })

-- ============================================================
-- Diagnostics / Diff / Spell
-- ============================================================
hl(0, "DiagnosticError", { fg = c.danger })
hl(0, "DiagnosticWarn", { fg = c.gold })
hl(0, "DiagnosticInfo", { fg = c.info })
hl(0, "DiagnosticHint", { fg = c.titanium })
link("DiagnosticUnderlineError", "DiagnosticError")
link("DiagnosticUnderlineWarn", "DiagnosticWarn")

hl(0, "DiffAdd", { fg = c.bg, bg = c.success })
hl(0, "DiffChange", { fg = c.bg, bg = c.gold })
hl(0, "DiffDelete", { fg = c.bg, bg = c.danger })
hl(0, "DiffText", { fg = c.bg, bg = c.gold_bright, bold = true })

hl(0, "SpellBad", { sp = c.feather, undercurl = true })
hl(0, "SpellCap", { sp = c.info, undercurl = true })
