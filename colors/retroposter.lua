-- retroposter — American retro poster palette: a charcoal poster-black
-- base with a faint teal tint, warm parchment text, vintage teal, brick red,
-- amber and sage. Muted, warm and easy on the eyes.
--
-- FILE LOCATION (required for :colorscheme to find it):
--   ~/.config/nvim/colors/retroposter.lua

-- ============================================================
-- 0. RESET
-- ============================================================
vim.o.background = "dark"
if vim.g.colors_name then
  vim.cmd("highlight clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "retroposter"

-- ============================================================
-- 1. PALETTE
-- stylua: ignore
-- ============================================================
local c = {
  bg_dark   = "#181B1B", -- deep charcoal, floats and panels
  bg        = "#212525", -- poster black, main background
  bg_light  = "#2B3130", -- soft charcoal, cursorline
  select    = "#3E6868", -- vintage teal, selection (anchor)
  rope      = "#6B756F", -- faded ink, comments
  fg_dim    = "#9C9582", -- dusty beige, secondary text
  fg        = "#DCCFB0", -- paper light, main text
  parchment = "#C1AB85", -- parchment, titles and highlights (anchor)
  brick     = "#AC5045", -- brick red, error backgrounds (anchor)
  red       = "#D77A68", -- signal red, keywords and errors
  amber     = "#DFA05D", -- amber, constants and functions (anchor)
  sage      = "#658761", -- sage green, diff add background (anchor)
  green     = "#8FB38A", -- chalk green, strings
  teal      = "#6FA3A0", -- soft teal, types
  blue      = "#7FA4B5", -- dusk blue, variables and info
  mauve     = "#A9818F", -- faded mauve, special
}

-- ============================================================
-- 2. HELPERS
-- ============================================================
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end
local function link(from, to)
  vim.api.nvim_set_hl(0, from, { link = to })
end

-- ============================================================
-- 3. CORE EDITOR UI
-- ============================================================
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalNC", { fg = c.fg_dim, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg_dark })
hi("FloatBorder", { fg = c.parchment, bg = c.bg_dark })
hi("FloatTitle", { fg = c.amber, bg = c.bg_dark, bold = true })

hi("SignColumn", { fg = c.fg_dim, bg = c.bg })
hi("LineNr", { fg = c.rope })
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
hi("CursorLineNr", { fg = c.amber, bold = true })
hi("CursorLine", { bg = c.bg_light })
hi("CursorColumn", { bg = c.bg_light })
hi("Cursor", { fg = c.bg, bg = c.fg })

hi("Visual", { bg = c.select, fg = c.fg })
hi("Search", { fg = c.bg, bg = c.parchment })
hi("IncSearch", { fg = c.bg, bg = c.amber, bold = true })
link("CurSearch", "IncSearch")
link("Substitute", "Search")
link("QuickFixLine", "Search")

hi("MatchParen", { fg = c.mauve, bold = true, underline = true })

hi("Pmenu", { fg = c.fg, bg = c.bg_dark })
hi("PmenuSel", { fg = c.bg, bg = c.amber, bold = true })
hi("PmenuSbar", { bg = c.bg_dark })
hi("PmenuThumb", { bg = c.rope })

hi("WinSeparator", { fg = c.rope, bg = c.bg })
link("VertSplit", "WinSeparator")

hi("StatusLine", { fg = c.fg, bg = c.bg_dark, bold = true })
hi("StatusLineNC", { fg = c.rope, bg = c.bg_dark })

hi("TabLine", { fg = c.rope, bg = c.bg_dark })
hi("TabLineSel", { fg = c.bg, bg = c.amber, bold = true })
hi("TabLineFill", { fg = c.rope, bg = c.bg_dark })

hi("NonText", { fg = c.bg_light })
link("EndOfBuffer", "NonText")
link("Whitespace", "NonText")

hi("Folded", { fg = c.fg_dim, bg = c.bg_dark })
hi("FoldColumn", { fg = c.fg_dim, bg = c.bg })

hi("Directory", { fg = c.teal })
hi("Title", { fg = c.parchment, bold = true })
hi("ErrorMsg", { fg = c.fg, bg = c.brick })
hi("WarningMsg", { fg = c.amber })
hi("MoreMsg", { fg = c.blue, bold = true })
hi("Question", { fg = c.blue, bold = true })

-- ============================================================
-- 4. SYNTAX — signal red for keywords, amber for functions and
--    constants, chalk green for strings, soft teal for types,
--    dusk blue for identifiers, mauve reserved for Special.
-- ============================================================
hi("Comment", { fg = c.rope, italic = true })

hi("Constant", { fg = c.amber })
hi("String", { fg = c.green })
link("Character", "String")
link("Number", "Constant")
link("Boolean", "Constant")

hi("Identifier", { fg = c.blue })
hi("Function", { fg = c.amber, bold = true })

hi("Statement", { fg = c.red, bold = true })
link("Conditional", "Statement")
link("Repeat", "Statement")
link("Label", "Statement")
link("Keyword", "Statement")
link("Exception", "Statement")
hi("Operator", { fg = c.fg_dim })

hi("PreProc", { fg = c.parchment })
link("Include", "PreProc")
link("Define", "PreProc")
link("Macro", "PreProc")

hi("Type", { fg = c.teal, italic = true })
link("StorageClass", "Type")
link("Structure", "Type")
link("Typedef", "Type")

hi("Special", { fg = c.mauve })
link("Delimiter", "Special")
link("SpecialChar", "Special")

hi("Underlined", { fg = c.blue, underline = true })
hi("Error", { fg = c.fg, bg = c.brick })
hi("Todo", { fg = c.bg, bg = c.amber, bold = true })

-- ============================================================
-- 5. DIAGNOSTICS
-- ============================================================
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.amber })
hi("DiagnosticInfo", { fg = c.blue })
hi("DiagnosticHint", { fg = c.fg_dim })
hi("DiagnosticOk", { fg = c.green })

link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticFloatingWarn", "DiagnosticWarn")
link("DiagnosticFloatingInfo", "DiagnosticInfo")
link("DiagnosticFloatingHint", "DiagnosticHint")

hi("DiagnosticSignError", { fg = c.red, bg = c.bg })
hi("DiagnosticSignWarn", { fg = c.amber, bg = c.bg })
hi("DiagnosticSignInfo", { fg = c.blue, bg = c.bg })
hi("DiagnosticSignHint", { fg = c.fg_dim, bg = c.bg })

hi("DiagnosticVirtualTextError", { fg = c.red, bg = c.bg_dark })
hi("DiagnosticVirtualTextWarn", { fg = c.amber, bg = c.bg_dark })
hi("DiagnosticVirtualTextInfo", { fg = c.blue, bg = c.bg_dark })
hi("DiagnosticVirtualTextHint", { fg = c.fg_dim, bg = c.bg_dark })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.amber })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.fg_dim })

-- ============================================================
-- 6. LSP
-- ============================================================
hi("LspReferenceText", { bg = c.bg_light })
hi("LspReferenceRead", { bg = c.bg_light })
hi("LspReferenceWrite", { bg = c.bg_light, bold = true })
hi("LspSignatureActiveParameter", { bold = true, underline = true, sp = c.amber })
link("LspCodeLens", "Comment")
hi("LspInlayHint", { fg = c.rope, bg = c.bg_light, italic = true })

-- ============================================================
-- 7. DIFF / GIT
-- ============================================================
hi("DiffAdd", { fg = c.fg, bg = c.sage })
hi("DiffChange", { fg = c.bg, bg = c.amber })
hi("DiffDelete", { fg = c.fg, bg = c.brick })
hi("DiffText", { fg = c.bg, bg = c.blue, bold = true })
hi("DiffAdded", { fg = c.green, bg = c.bg })
hi("DiffRemoved", { fg = c.red, bg = c.bg })

hi("GitSignsAdd", { fg = c.green, bg = c.bg })
hi("GitSignsChange", { fg = c.amber, bg = c.bg })
hi("GitSignsDelete", { fg = c.red, bg = c.bg })

-- ============================================================
-- 8. TELESCOPE
-- ============================================================
hi("TelescopeNormal", { fg = c.fg, bg = c.bg_dark })
hi("TelescopeBorder", { fg = c.parchment, bg = c.bg_dark })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_light })
hi("TelescopePromptBorder", { fg = c.amber, bg = c.bg_light })
hi("TelescopeTitle", { fg = c.amber, bg = c.bg_dark, bold = true })
link("TelescopePromptTitle", "Title")
link("TelescopeResultsTitle", "Title")
link("TelescopePreviewTitle", "Title")
hi("TelescopeSelection", { bg = c.select, bold = true })
hi("TelescopeSelectionCaret", { fg = c.bg, bg = c.amber })
link("TelescopeMatching", "Special")

-- ============================================================
-- 9. WHICHKEY
-- ============================================================
hi("WhichKeyFloat", { bg = c.bg_dark })
hi("WhichKeyBorder", { bg = c.bg_dark })
hi("WhichKey", { fg = c.fg, bg = c.bg_dark })
hi("WhichKeyGroup", { fg = c.amber, bg = c.bg_dark })
hi("WhichKeyDesc", { fg = c.teal, bg = c.bg_dark })
hi("WhichKeyValue", { fg = c.fg_dim })
hi("WhichKeySeparator", { fg = c.fg_dim, bg = c.bg_dark })

-- ============================================================
-- 10. LAZY.NVIM / MASON
-- ============================================================
hi("LazyH1", { fg = c.bg, bg = c.amber })
hi("LazyH2", { fg = c.parchment, bg = c.bg })
hi("LazyButton", { bg = c.bg_dark })
hi("LazyButtonActive", { fg = c.bg, bg = c.amber })
hi("LazyNormal", { bg = c.bg_dark })

hi("MasonHeader", { fg = c.bg, bg = c.amber, bold = true })
hi("MasonHighlight", { fg = c.amber, bg = c.bg })
hi("MasonMuted", { fg = c.fg_dim, bg = c.bg })

-- ============================================================
-- 11. INDENT-BLANKLINE
-- ============================================================
hi("IblIndent", { fg = c.bg_light, nocombine = true })
hi("IblScope", { fg = c.amber, nocombine = true })

-- ============================================================
-- 12. SPELL
-- ============================================================
hi("SpellBad", { sp = c.red, undercurl = true })
hi("SpellCap", { sp = c.blue, undercurl = true })
hi("SpellLocal", { sp = c.amber, undercurl = true })
hi("SpellRare", { sp = c.mauve, undercurl = true })

-- ============================================================
-- 13. TREESITTER (@ groups)
-- ============================================================
link("@boolean", "Boolean")
link("@comment", "Comment")
link("@constant.builtin", "Special")
link("@constant", "Constant")
link("@constructor", "Special")
link("@field", "Identifier")
link("@function.builtin", "Special")
link("@function", "Function")
link("@keyword", "Keyword")
link("@method", "Function")
link("@namespace", "Identifier")
link("@number", "Number")
link("@parameter", "Identifier")
link("@preproc", "PreProc")
link("@property", "Identifier")
link("@punctuation", "Delimiter")
link("@string", "String")
link("@type", "Type")
link("@variable", "Identifier")
link("@text.title", "Title")
link("@text.todo", "Todo")
link("@text.underline", "Underlined")
link("@text.uri", "Underlined")

-- ============================================================
-- 14. EXTRAS (NvimTree / Neo-tree / FzfLua)
-- ============================================================
hi("NvimTreeNormal", { fg = c.fg, bg = c.bg_dark })
hi("NvimTreeFolderIcon", { fg = c.teal })
hi("NvimTreeFolderName", { fg = c.teal })
hi("NvimTreeOpenedFolderName", { fg = c.parchment, bold = true })
hi("NvimTreeRootFolder", { fg = c.amber, bold = true })
hi("NvimTreeIndentMarker", { fg = c.rope })
hi("NvimTreeGitDirty", { fg = c.amber })
hi("NvimTreeGitNew", { fg = c.green })

hi("NeoTreeNormal", { fg = c.fg, bg = c.bg_dark })
hi("NeoTreeDirectoryIcon", { fg = c.teal })
hi("NeoTreeDirectoryName", { fg = c.teal })
hi("NeoTreeRootName", { fg = c.amber, bold = true })

link("FzfLuaNormal", "Normal")
link("FzfLuaBorder", "FloatBorder")
link("FzfLuaCursor", "Cursor")
link("FzfLuaSearch", "IncSearch")

return c
