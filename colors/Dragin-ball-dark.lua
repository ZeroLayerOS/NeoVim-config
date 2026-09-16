-- voidsaiyan — extracted from a Goku Black / Rose + Training Arc palette:
-- void black, dried-blood brick, sepia dust, a broken destroyed-sky indigo,
-- and one aggressive blood-crimson accent cutting through all the muted
-- grief-brown and grief-blue. Nothing here is fully saturated except the
-- crimson — that restraint is the point.
--
-- FILE LOCATION (required for :colorscheme to find it):
--   ~/.config/nvim/colors/voidsaiyan.lua

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
vim.g.colors_name = "voidsaiyan"

-- ============================================================
-- 1. PALETTE — the 16 extracted colors, plus one synthesized
--    olive (the source images had no green; everything functional
--    that needs one borrows this desaturated olive to stay in key)
-- stylua: ignore
-- ============================================================
local c = {
  bg          = "#020102", -- void black
  bg_dark     = "#010001",
  ash         = "#1a1012", -- ash charcoal
  brick       = "#522e30", -- dried blood / brick
  sepia       = "#342622", -- warm sepia wash
  taupe       = "#70675b", -- warm taupe midtone
  bone        = "#fbf8f8", -- broken bone white
  lavender    = "#f2e9ec", -- muted lavender-grey
  dustypink   = "#dfd4d9", -- dusty pink-grey
  midgrey     = "#594941", -- mid warm grey
  lightgrey   = "#c4b7bc", -- light warm grey
  smoky       = "#887c76", -- smoky brown
  wine        = "#814758", -- dark wine mauve
  indigo      = "#2f367b", -- deep indigo (destroyed sky)
  royal       = "#4b52aa", -- royal blue-violet
  periwinkle  = "#a9b3e6", -- periwinkle glow
  crimson     = "#c42e46", -- blood crimson — the one hot accent
  gold        = "#b8963f", -- muted gold (earring accent, used sparingly)
  -- synthesized, not from source images — see note above
  olive       = "#6b7a5e",
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
hi("Normal", { fg = c.lavender, bg = c.bg })
hi("NormalNC", { fg = c.taupe, bg = c.bg })
hi("NormalFloat", { fg = c.lavender, bg = c.ash })
hi("FloatBorder", { fg = c.crimson, bg = c.ash })
hi("FloatTitle", { fg = c.bone, bg = c.ash, bold = true })

hi("SignColumn", { fg = c.taupe, bg = c.bg })
hi("LineNr", { fg = c.midgrey })
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
hi("CursorLineNr", { fg = c.crimson, bold = true })
hi("CursorLine", { bg = c.sepia })
hi("CursorColumn", { bg = c.sepia })
hi("Cursor", { fg = c.bg, bg = c.lavender })

hi("Visual", { bg = c.brick, fg = c.bone })
hi("Search", { fg = c.bg, bg = c.gold })
hi("IncSearch", { fg = c.bg, bg = c.crimson, bold = true })
link("CurSearch", "IncSearch")
link("Substitute", "Search")
link("QuickFixLine", "Search")

hi("MatchParen", { fg = c.crimson, bold = true, underline = true })

hi("Pmenu", { fg = c.lavender, bg = c.ash })
hi("PmenuSel", { fg = c.bg, bg = c.crimson, bold = true })
hi("PmenuSbar", { bg = c.ash })
hi("PmenuThumb", { bg = c.taupe })

hi("WinSeparator", { fg = c.sepia, bg = c.bg })
link("VertSplit", "WinSeparator")

hi("StatusLine", { fg = c.lavender, bg = c.ash, bold = true })
hi("StatusLineNC", { fg = c.midgrey, bg = c.ash })

hi("TabLine", { fg = c.midgrey, bg = c.ash })
hi("TabLineSel", { fg = c.bg, bg = c.crimson, bold = true })
hi("TabLineFill", { fg = c.midgrey, bg = c.ash })

hi("NonText", { fg = c.sepia })
link("EndOfBuffer", "NonText")
link("Whitespace", "NonText")

hi("Folded", { fg = c.taupe, bg = c.ash })
hi("FoldColumn", { fg = c.taupe, bg = c.bg })

hi("Directory", { fg = c.royal })
hi("Title", { fg = c.bone, bold = true })
hi("ErrorMsg", { fg = c.bone, bg = c.crimson })
hi("WarningMsg", { fg = c.gold })
hi("MoreMsg", { fg = c.periwinkle, bold = true })
hi("Question", { fg = c.periwinkle, bold = true })

-- ============================================================
-- 4. SYNTAX — royal/periwinkle carry the "destroyed sky" cool
--    side, brick/sepia/taupe carry the training-arc warm side,
--    crimson is spent only on the two things that should pop.
-- ============================================================
hi("Comment", { fg = c.midgrey, italic = true })

hi("Constant", { fg = c.gold })
hi("String", { fg = c.periwinkle })
link("Character", "String")
link("Number", "Constant")
link("Boolean", "Constant")

hi("Identifier", { fg = c.lightgrey })
hi("Function", { fg = c.crimson, bold = true })

hi("Statement", { fg = c.royal, bold = true })
link("Conditional", "Statement")
link("Repeat", "Statement")
link("Label", "Statement")
link("Keyword", "Statement")
link("Exception", "Statement")
hi("Operator", { fg = c.smoky })

hi("PreProc", { fg = c.indigo })
link("Include", "PreProc")
link("Define", "PreProc")
link("Macro", "PreProc")

hi("Type", { fg = c.smoky, italic = true })
link("StorageClass", "Type")
link("Structure", "Type")
link("Typedef", "Type")

hi("Special", { fg = c.wine })
link("Delimiter", "Special")
link("SpecialChar", "Special")

hi("Underlined", { fg = c.periwinkle, underline = true })
hi("Error", { fg = c.bone, bg = c.crimson })
hi("Todo", { fg = c.bg, bg = c.gold, bold = true })

-- ============================================================
-- 5. DIAGNOSTICS (olive is the one synthesized, non-source color)
-- ============================================================
hi("DiagnosticError", { fg = c.crimson })
hi("DiagnosticWarn", { fg = c.gold })
hi("DiagnosticInfo", { fg = c.periwinkle })
hi("DiagnosticHint", { fg = c.taupe })
hi("DiagnosticOk", { fg = c.olive })

link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticFloatingWarn", "DiagnosticWarn")
link("DiagnosticFloatingInfo", "DiagnosticInfo")
link("DiagnosticFloatingHint", "DiagnosticHint")

hi("DiagnosticSignError", { fg = c.crimson, bg = c.bg })
hi("DiagnosticSignWarn", { fg = c.gold, bg = c.bg })
hi("DiagnosticSignInfo", { fg = c.periwinkle, bg = c.bg })
hi("DiagnosticSignHint", { fg = c.taupe, bg = c.bg })

hi("DiagnosticVirtualTextError", { fg = c.crimson, bg = c.ash })
hi("DiagnosticVirtualTextWarn", { fg = c.gold, bg = c.ash })
hi("DiagnosticVirtualTextInfo", { fg = c.periwinkle, bg = c.ash })
hi("DiagnosticVirtualTextHint", { fg = c.taupe, bg = c.ash })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.crimson })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.gold })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.periwinkle })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.taupe })

-- ============================================================
-- 6. LSP
-- ============================================================
hi("LspReferenceText", { bg = c.sepia })
hi("LspReferenceRead", { bg = c.sepia })
hi("LspReferenceWrite", { bg = c.sepia, bold = true })
hi("LspSignatureActiveParameter", { bold = true, underline = true, sp = c.crimson })
link("LspCodeLens", "Comment")
hi("LspInlayHint", { fg = c.taupe, bg = c.sepia, italic = true })

-- ============================================================
-- 7. DIFF / GIT
-- ============================================================
hi("DiffAdd", { fg = c.bg, bg = c.olive })
hi("DiffChange", { fg = c.bg, bg = c.gold })
hi("DiffDelete", { fg = c.bg, bg = c.crimson })
hi("DiffText", { fg = c.bg, bg = c.periwinkle, bold = true })
hi("DiffAdded", { fg = c.olive, bg = c.bg })
hi("DiffRemoved", { fg = c.crimson, bg = c.bg })

hi("GitSignsAdd", { fg = c.olive, bg = c.bg })
hi("GitSignsChange", { fg = c.gold, bg = c.bg })
hi("GitSignsDelete", { fg = c.crimson, bg = c.bg })

-- ============================================================
-- 8. TELESCOPE
-- ============================================================
hi("TelescopeNormal", { fg = c.lavender, bg = c.ash })
hi("TelescopeBorder", { fg = c.crimson, bg = c.ash })
hi("TelescopePromptNormal", { fg = c.lavender, bg = c.sepia })
hi("TelescopePromptBorder", { fg = c.bone, bg = c.sepia })
hi("TelescopeTitle", { fg = c.bone, bg = c.ash, bold = true })
link("TelescopePromptTitle", "Title")
link("TelescopeResultsTitle", "Title")
link("TelescopePreviewTitle", "Title")
hi("TelescopeSelection", { bg = c.brick, bold = true })
hi("TelescopeSelectionCaret", { fg = c.lavender, bg = c.crimson })
link("TelescopeMatching", "Special")

-- ============================================================
-- 9. WHICHKEY
-- ============================================================
hi("WhichKeyFloat", { bg = c.ash })
hi("WhichKeyBorder", { bg = c.ash })
hi("WhichKey", { fg = c.lavender, bg = c.ash })
hi("WhichKeyGroup", { fg = c.crimson, bg = c.ash })
hi("WhichKeyDesc", { fg = c.royal, bg = c.ash })
hi("WhichKeyValue", { fg = c.taupe })
hi("WhichKeySeparator", { fg = c.taupe, bg = c.ash })

-- ============================================================
-- 10. LAZY.NVIM / MASON
-- ============================================================
hi("LazyH1", { fg = c.bg, bg = c.crimson })
hi("LazyH2", { fg = c.gold, bg = c.bg })
hi("LazyButton", { bg = c.ash })
hi("LazyButtonActive", { fg = c.bg, bg = c.crimson })
hi("LazyNormal", { bg = c.ash })

hi("MasonHeader", { fg = c.bg, bg = c.crimson, bold = true })
hi("MasonHighlight", { fg = c.crimson, bg = c.bg })
hi("MasonMuted", { fg = c.taupe, bg = c.bg })

-- ============================================================
-- 11. INDENT-BLANKLINE
-- ============================================================
hi("IblIndent", { fg = c.sepia, nocombine = true })
hi("IblScope", { fg = c.crimson, nocombine = true })

-- ============================================================
-- 12. SPELL
-- ============================================================
hi("SpellBad", { sp = c.crimson, undercurl = true })
hi("SpellCap", { sp = c.periwinkle, undercurl = true })
hi("SpellLocal", { sp = c.gold, undercurl = true })
hi("SpellRare", { sp = c.wine, undercurl = true })

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
hi("NvimTreeNormal", { fg = c.lavender, bg = c.ash })
hi("NvimTreeFolderIcon", { fg = c.royal })
hi("NvimTreeFolderName", { fg = c.royal })
hi("NvimTreeOpenedFolderName", { fg = c.bone, bold = true })
hi("NvimTreeRootFolder", { fg = c.crimson, bold = true })
hi("NvimTreeIndentMarker", { fg = c.taupe })
hi("NvimTreeGitDirty", { fg = c.gold })
hi("NvimTreeGitNew", { fg = c.olive })

hi("NeoTreeNormal", { fg = c.lavender, bg = c.ash })
hi("NeoTreeDirectoryIcon", { fg = c.royal })
hi("NeoTreeDirectoryName", { fg = c.royal })
hi("NeoTreeRootName", { fg = c.crimson, bold = true })

link("FzfLuaNormal", "Normal")
link("FzfLuaBorder", "FloatBorder")
link("FzfLuaCursor", "Cursor")
link("FzfLuaSearch", "IncSearch")

return c
