-- feynman — Richard Feynman, as the chalkboard, the bongo wood, the
-- notebook paper and the colored lines of his diagrams. A warm slate-green
-- board with chalk-cream text and medium-saturation accents that stay
-- easy on the eyes.
--
-- FILE LOCATION (required for :colorscheme to find it):
--   ~/.config/nvim/colors/feynman.lua

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
vim.g.colors_name = "feynman"

-- ============================================================
-- 1. PALETTE
-- stylua: ignore
-- ============================================================
local c = {
  bg        = "#1F2A27", -- slate board
  bg_dark   = "#18211F", -- deeper board, floats and panels
  bg_light  = "#2A3733", -- board shadow, cursorline
  fg        = "#E8E2D0", -- chalk dust
  fg_dim    = "#A9B5AE", -- faded chalk
  rope      = "#6B7B75", -- pencil graphite, comments
  select    = "#3B4A45", -- eraser smudge, selection
  paper     = "#F4EDD8", -- notebook paper, highlighted text
  wood      = "#B5835A", -- bongo wood
  red       = "#D9694F", -- diagram red
  orange    = "#E39B55", -- Caltech orange
  yellow    = "#E6C45C", -- curiosity yellow
  green     = "#9DBF7E", -- chalk green
  teal      = "#6FB5A6", -- quantum teal
  blue      = "#7AA2C8", -- pacific blue
  violet    = "#A58BC4", -- photon violet
  rose      = "#D68FA0", -- rose chalk
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
hi("FloatBorder", { fg = c.wood, bg = c.bg_dark })
hi("FloatTitle", { fg = c.yellow, bg = c.bg_dark, bold = true })

hi("SignColumn", { fg = c.fg_dim, bg = c.bg })
hi("LineNr", { fg = c.rope })
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
hi("CursorLineNr", { fg = c.yellow, bold = true })
hi("CursorLine", { bg = c.bg_light })
hi("CursorColumn", { bg = c.bg_light })
hi("Cursor", { fg = c.bg, bg = c.fg })

hi("Visual", { bg = c.select, fg = c.paper })
hi("Search", { fg = c.bg, bg = c.yellow })
hi("IncSearch", { fg = c.bg, bg = c.orange, bold = true })
link("CurSearch", "IncSearch")
link("Substitute", "Search")
link("QuickFixLine", "Search")

hi("MatchParen", { fg = c.rose, bold = true, underline = true })

hi("Pmenu", { fg = c.fg, bg = c.bg_dark })
hi("PmenuSel", { fg = c.bg, bg = c.yellow, bold = true })
hi("PmenuSbar", { bg = c.bg_dark })
hi("PmenuThumb", { bg = c.rope })

hi("WinSeparator", { fg = c.select, bg = c.bg })
link("VertSplit", "WinSeparator")

hi("StatusLine", { fg = c.fg, bg = c.bg_dark, bold = true })
hi("StatusLineNC", { fg = c.rope, bg = c.bg_dark })

hi("TabLine", { fg = c.rope, bg = c.bg_dark })
hi("TabLineSel", { fg = c.bg, bg = c.yellow, bold = true })
hi("TabLineFill", { fg = c.rope, bg = c.bg_dark })

hi("NonText", { fg = c.select })
link("EndOfBuffer", "NonText")
link("Whitespace", "NonText")

hi("Folded", { fg = c.fg_dim, bg = c.bg_dark })
hi("FoldColumn", { fg = c.fg_dim, bg = c.bg })

hi("Directory", { fg = c.blue })
hi("Title", { fg = c.paper, bold = true })
hi("ErrorMsg", { fg = c.paper, bg = c.red })
hi("WarningMsg", { fg = c.orange })
hi("MoreMsg", { fg = c.teal, bold = true })
hi("Question", { fg = c.teal, bold = true })

-- ============================================================
-- 4. SYNTAX — red for keywords (the diagram lines), yellow for
--    functions (curiosity), orange for constants, green for strings
--    (chalk), teal for types, violet reserved for Special.
-- ============================================================
hi("Comment", { fg = c.rope, italic = true })

hi("Constant", { fg = c.orange })
hi("String", { fg = c.green })
link("Character", "String")
link("Number", "Constant")
link("Boolean", "Constant")

hi("Identifier", { fg = c.blue })
hi("Function", { fg = c.yellow, bold = true })

hi("Statement", { fg = c.red, bold = true })
link("Conditional", "Statement")
link("Repeat", "Statement")
link("Label", "Statement")
link("Keyword", "Statement")
link("Exception", "Statement")
hi("Operator", { fg = c.fg_dim })

hi("PreProc", { fg = c.wood })
link("Include", "PreProc")
link("Define", "PreProc")
link("Macro", "PreProc")

hi("Type", { fg = c.teal, italic = true })
link("StorageClass", "Type")
link("Structure", "Type")
link("Typedef", "Type")

hi("Special", { fg = c.violet })
link("Delimiter", "Special")
link("SpecialChar", "Special")

hi("Underlined", { fg = c.blue, underline = true })
hi("Error", { fg = c.paper, bg = c.red })
hi("Todo", { fg = c.bg, bg = c.orange, bold = true })

-- ============================================================
-- 5. DIAGNOSTICS
-- ============================================================
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.orange })
hi("DiagnosticInfo", { fg = c.blue })
hi("DiagnosticHint", { fg = c.fg_dim })
hi("DiagnosticOk", { fg = c.green })

link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticFloatingWarn", "DiagnosticWarn")
link("DiagnosticFloatingInfo", "DiagnosticInfo")
link("DiagnosticFloatingHint", "DiagnosticHint")

hi("DiagnosticSignError", { fg = c.red, bg = c.bg })
hi("DiagnosticSignWarn", { fg = c.orange, bg = c.bg })
hi("DiagnosticSignInfo", { fg = c.blue, bg = c.bg })
hi("DiagnosticSignHint", { fg = c.fg_dim, bg = c.bg })

hi("DiagnosticVirtualTextError", { fg = c.red, bg = c.bg_dark })
hi("DiagnosticVirtualTextWarn", { fg = c.orange, bg = c.bg_dark })
hi("DiagnosticVirtualTextInfo", { fg = c.blue, bg = c.bg_dark })
hi("DiagnosticVirtualTextHint", { fg = c.fg_dim, bg = c.bg_dark })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.orange })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.fg_dim })

-- ============================================================
-- 6. LSP
-- ============================================================
hi("LspReferenceText", { bg = c.bg_light })
hi("LspReferenceRead", { bg = c.bg_light })
hi("LspReferenceWrite", { bg = c.bg_light, bold = true })
hi("LspSignatureActiveParameter", { bold = true, underline = true, sp = c.yellow })
link("LspCodeLens", "Comment")
hi("LspInlayHint", { fg = c.rope, bg = c.bg_light, italic = true })

-- ============================================================
-- 7. DIFF / GIT
-- ============================================================
hi("DiffAdd", { fg = c.bg, bg = c.green })
hi("DiffChange", { fg = c.bg, bg = c.orange })
hi("DiffDelete", { fg = c.bg, bg = c.red })
hi("DiffText", { fg = c.bg, bg = c.blue, bold = true })
hi("DiffAdded", { fg = c.green, bg = c.bg })
hi("DiffRemoved", { fg = c.red, bg = c.bg })

hi("GitSignsAdd", { fg = c.green, bg = c.bg })
hi("GitSignsChange", { fg = c.orange, bg = c.bg })
hi("GitSignsDelete", { fg = c.red, bg = c.bg })

-- ============================================================
-- 8. TELESCOPE
-- ============================================================
hi("TelescopeNormal", { fg = c.fg, bg = c.bg_dark })
hi("TelescopeBorder", { fg = c.wood, bg = c.bg_dark })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_light })
hi("TelescopePromptBorder", { fg = c.yellow, bg = c.bg_light })
hi("TelescopeTitle", { fg = c.yellow, bg = c.bg_dark, bold = true })
link("TelescopePromptTitle", "Title")
link("TelescopeResultsTitle", "Title")
link("TelescopePreviewTitle", "Title")
hi("TelescopeSelection", { bg = c.select, bold = true })
hi("TelescopeSelectionCaret", { fg = c.fg, bg = c.yellow })
link("TelescopeMatching", "Special")

-- ============================================================
-- 9. WHICHKEY
-- ============================================================
hi("WhichKeyFloat", { bg = c.bg_dark })
hi("WhichKeyBorder", { bg = c.bg_dark })
hi("WhichKey", { fg = c.fg, bg = c.bg_dark })
hi("WhichKeyGroup", { fg = c.yellow, bg = c.bg_dark })
hi("WhichKeyDesc", { fg = c.teal, bg = c.bg_dark })
hi("WhichKeyValue", { fg = c.fg_dim })
hi("WhichKeySeparator", { fg = c.fg_dim, bg = c.bg_dark })

-- ============================================================
-- 10. LAZY.NVIM / MASON
-- ============================================================
hi("LazyH1", { fg = c.bg, bg = c.yellow })
hi("LazyH2", { fg = c.orange, bg = c.bg })
hi("LazyButton", { bg = c.bg_dark })
hi("LazyButtonActive", { fg = c.bg, bg = c.yellow })
hi("LazyNormal", { bg = c.bg_dark })

hi("MasonHeader", { fg = c.bg, bg = c.yellow, bold = true })
hi("MasonHighlight", { fg = c.yellow, bg = c.bg })
hi("MasonMuted", { fg = c.fg_dim, bg = c.bg })

-- ============================================================
-- 11. INDENT-BLANKLINE
-- ============================================================
hi("IblIndent", { fg = c.bg_light, nocombine = true })
hi("IblScope", { fg = c.yellow, nocombine = true })

-- ============================================================
-- 12. SPELL
-- ============================================================
hi("SpellBad", { sp = c.red, undercurl = true })
hi("SpellCap", { sp = c.blue, undercurl = true })
hi("SpellLocal", { sp = c.orange, undercurl = true })
hi("SpellRare", { sp = c.violet, undercurl = true })

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
hi("NvimTreeFolderIcon", { fg = c.blue })
hi("NvimTreeFolderName", { fg = c.blue })
hi("NvimTreeOpenedFolderName", { fg = c.paper, bold = true })
hi("NvimTreeRootFolder", { fg = c.yellow, bold = true })
hi("NvimTreeIndentMarker", { fg = c.select })
hi("NvimTreeGitDirty", { fg = c.orange })
hi("NvimTreeGitNew", { fg = c.green })

hi("NeoTreeNormal", { fg = c.fg, bg = c.bg_dark })
hi("NeoTreeDirectoryIcon", { fg = c.blue })
hi("NeoTreeDirectoryName", { fg = c.blue })
hi("NeoTreeRootName", { fg = c.yellow, bold = true })

link("FzfLuaNormal", "Normal")
link("FzfLuaBorder", "FloatBorder")
link("FzfLuaCursor", "Cursor")
link("FzfLuaSearch", "IncSearch")

return c
