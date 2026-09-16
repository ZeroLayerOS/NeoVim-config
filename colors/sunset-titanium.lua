-- Sunset Titanium Theme for Neovim
-- Concept: Glowing gold & titanium contrast on dusty sunset palette

local colors = {
  bg = "#161413",
  fg = "#cfc7bc",
  titanium = "#8a929a",
  gold = "#e6b800",
  sunset = "#d95338",
  rust = "#8c4331",
  clay = "#a3785e",
  dark_bg = "#0e0d0c",
  selection = "#2a2421",
}

local hl = vim.api.nvim_set_hl

-- Reset highlights
if vim.g.colors_name then
  vim.cmd("highlight clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "sunset-titanium"

-- ============================================================
-- UI Highlights
-- ============================================================
hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
hl(0, "NormalNC", { fg = colors.titanium, bg = colors.bg })
hl(0, "NormalFloat", { fg = colors.fg, bg = colors.dark_bg })
hl(0, "FloatBorder", { fg = colors.titanium, bg = colors.dark_bg })
hl(0, "FloatTitle", { fg = colors.gold, bg = colors.dark_bg, bold = true })

hl(0, "CursorLine", { bg = colors.selection })
hl(0, "CursorColumn", { bg = colors.selection })
hl(0, "LineNr", { fg = colors.clay })
hl(0, "CursorLineNr", { fg = colors.gold, bold = true })
hl(0, "SignColumn", { fg = colors.clay, bg = colors.bg })

hl(0, "Visual", { bg = colors.rust, fg = colors.gold })
hl(0, "Search", { fg = colors.dark_bg, bg = colors.gold })
hl(0, "IncSearch", { fg = colors.dark_bg, bg = colors.sunset, bold = true })
hl(0, "MatchParen", { fg = colors.gold, bold = true, underline = true })

hl(0, "Pmenu", { fg = colors.fg, bg = colors.dark_bg })
hl(0, "PmenuSel", { fg = colors.dark_bg, bg = colors.gold, bold = true })
hl(0, "PmenuSbar", { bg = colors.dark_bg })
hl(0, "PmenuThumb", { bg = colors.titanium })

hl(0, "WinSeparator", { fg = colors.selection, bg = colors.bg })
hl(0, "StatusLine", { fg = colors.titanium, bg = colors.dark_bg })
hl(0, "StatusLineNC", { fg = colors.clay, bg = colors.dark_bg })
hl(0, "TabLine", { fg = colors.clay, bg = colors.dark_bg })
hl(0, "TabLineSel", { fg = colors.dark_bg, bg = colors.gold, bold = true })
hl(0, "TabLineFill", { fg = colors.clay, bg = colors.dark_bg })

hl(0, "NonText", { fg = colors.selection })
hl(0, "EndOfBuffer", { fg = colors.selection })
hl(0, "Directory", { fg = colors.gold })
hl(0, "Title", { fg = colors.gold, bold = true })

-- ============================================================
-- Syntax Highlights (The Concept Visualized)
-- ============================================================
hl(0, "Comment", { fg = colors.clay, italic = true })
hl(0, "Keyword", { fg = colors.sunset, bold = true })
hl(0, "Function", { fg = colors.gold, bold = true })
hl(0, "Identifier", { fg = colors.titanium })
hl(0, "String", { fg = "#b5a368" })
hl(0, "Type", { fg = colors.titanium, italic = true })
hl(0, "Constant", { fg = colors.sunset })
hl(0, "Statement", { fg = colors.gold })
hl(0, "Operator", { fg = colors.titanium })
hl(0, "PreProc", { fg = colors.sunset })
hl(0, "Special", { fg = colors.gold })
hl(0, "Underlined", { fg = colors.gold, underline = true })
hl(0, "Error", { fg = colors.dark_bg, bg = colors.sunset })
hl(0, "Todo", { fg = colors.dark_bg, bg = colors.gold, bold = true })

-- ============================================================
-- Diff / Spell
-- ============================================================
hl(0, "DiffAdd", { fg = colors.dark_bg, bg = "#8fae5d" })
hl(0, "DiffChange", { fg = colors.dark_bg, bg = colors.gold })
hl(0, "DiffDelete", { fg = colors.dark_bg, bg = colors.sunset })
hl(0, "DiffText", { fg = colors.dark_bg, bg = colors.gold, bold = true })

hl(0, "SpellBad", { sp = colors.sunset, undercurl = true })
hl(0, "SpellCap", { sp = colors.titanium, undercurl = true })

-- ============================================================
-- Treesitter & Diagnostics
-- ============================================================
hl(0, "@variable", { fg = colors.fg })
hl(0, "@function", { fg = colors.gold })
hl(0, "@keyword", { fg = colors.sunset })
hl(0, "@comment", { fg = colors.clay, italic = true })
hl(0, "@string", { fg = "#b5a368" })
hl(0, "@type", { fg = colors.titanium, italic = true })
hl(0, "@constant", { fg = colors.sunset })
hl(0, "@number", { fg = colors.sunset })
hl(0, "@boolean", { fg = colors.sunset })
hl(0, "@punctuation.delimiter", { fg = colors.titanium })
hl(0, "@punctuation.bracket", { fg = colors.titanium })

hl(0, "DiagnosticError", { fg = colors.sunset })
hl(0, "DiagnosticWarn", { fg = colors.gold })
hl(0, "DiagnosticInfo", { fg = colors.titanium })
hl(0, "DiagnosticHint", { fg = colors.clay })
hl(0, "DiagnosticUnderlineError", { sp = colors.sunset, undercurl = true })
hl(0, "DiagnosticUnderlineWarn", { sp = colors.gold, undercurl = true })
