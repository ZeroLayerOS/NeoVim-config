-- chokehold — a dark theme that reeks of it: concrete floors, cold iron
-- plates, dried sweat on old canvas, dry blood, bruised skin, and one
-- suppressed-red warning color that only shows up when it means it.
-- No romance, no warmth. Everything is heavy, tired, and coiled tight.
--
-- FILE LOCATION (required for :colorscheme to find it):
--   ~/.config/nvim/colors/chokehold.lua

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
vim.g.colors_name = "chokehold"

-- ============================================================
-- 1. PALETTE
-- stylua: ignore
-- ============================================================
local c = {
  bg       = "#1b1815", -- wet concrete under dim light — the base
  bg_dark  = "#100e0c", -- the dark corner under the rack
  bg_light = "#2a2521", -- raised surface — the weight rack itself
  fg       = "#c4bcae", -- a shirt gone grey with sweat
  fg_dim   = "#756c62", -- tired eyes after the last set
  iron     = "#575d63", -- weight-plate iron — cold and heavy
  rust     = "#7f4527", -- metal corroded by sweat and time
  blood    = "#692922", -- dried blood / old bruise
  bruise   = "#52384c", -- bruising under the skin
  sweat    = "#9c8142", -- an old sweat stain on canvas
  leather  = "#43302a", -- worn boxing-glove leather
  concrete = "#645f59", -- raw, undecorated concrete
  alarm    = "#ab3527", -- suppressed warning — aggression held in check
  khaki    = "#635f34", -- tired military canvas
  smoke    = "#454a4d", -- cigarette smoke hanging in gym air
  chalk    = "#d8d0bd", -- gym chalk — the only thing allowed to be pale
}

-- ============================================================
-- 2. HELPERS
-- ============================================================
local function hi(group, opts) vim.api.nvim_set_hl(0, group, opts) end
local function link(from, to) vim.api.nvim_set_hl(0, from, { link = to }) end

-- ============================================================
-- 3. CORE EDITOR UI
-- ============================================================
hi("Normal",       { fg = c.fg, bg = c.bg })
hi("NormalNC",     { fg = c.fg_dim, bg = c.bg })
hi("NormalFloat",  { fg = c.fg, bg = c.bg_dark })
hi("FloatBorder",  { fg = c.iron, bg = c.bg_dark })
hi("FloatTitle",   { fg = c.chalk, bg = c.bg_dark, bold = true })

hi("SignColumn",   { fg = c.fg_dim, bg = c.bg })
hi("LineNr",       { fg = c.leather })
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
hi("CursorLineNr", { fg = c.chalk, bold = true })
hi("CursorLine",   { bg = c.bg_light })
hi("CursorColumn", { bg = c.bg_light })
hi("Cursor",       { fg = c.bg, bg = c.fg })

hi("Visual",       { bg = c.leather, fg = c.chalk })
hi("Search",       { fg = c.bg, bg = c.chalk })
hi("IncSearch",    { fg = c.bg, bg = c.alarm, bold = true })
link("CurSearch",    "IncSearch")
link("Substitute",   "Search")
link("QuickFixLine", "Search")

hi("MatchParen",   { fg = c.chalk, bold = true, underline = true })

hi("Pmenu",        { fg = c.fg, bg = c.bg_dark })
hi("PmenuSel",     { fg = c.bg, bg = c.chalk, bold = true })
hi("PmenuSbar",    { bg = c.bg_dark })
hi("PmenuThumb",   { bg = c.iron })

hi("WinSeparator", { fg = c.iron, bg = c.bg })
link("VertSplit", "WinSeparator")

hi("StatusLine",   { fg = c.fg, bg = c.bg_dark, bold = true })
hi("StatusLineNC", { fg = c.leather, bg = c.bg_dark })

hi("TabLine",       { fg = c.leather, bg = c.bg_dark })
hi("TabLineSel",    { fg = c.bg, bg = c.chalk, bold = true })
hi("TabLineFill",   { fg = c.leather, bg = c.bg_dark })

hi("NonText",   { fg = c.leather })
link("EndOfBuffer", "NonText")
link("Whitespace",  "NonText")

hi("Folded",    { fg = c.fg_dim, bg = c.bg_dark })
hi("FoldColumn",{ fg = c.fg_dim, bg = c.bg })

hi("Directory", { fg = c.sweat })
hi("Title",     { fg = c.chalk, bold = true })
hi("ErrorMsg",  { fg = c.fg, bg = c.blood })
hi("WarningMsg",{ fg = c.sweat })
hi("MoreMsg",   { fg = c.concrete, bold = true })
hi("Question",  { fg = c.concrete, bold = true })

-- ============================================================
-- 4. SYNTAX — iron for keywords (cold, load-bearing), chalk for
--    functions (the only thing meant to catch your eye), khaki
--    for strings, sweat for constants, and alarm reserved only
--    for Special — it should feel like it's holding itself back.
-- ============================================================
hi("Comment",   { fg = c.leather, italic = true })

hi("Constant",  { fg = c.sweat })
hi("String",    { fg = c.khaki })
link("Character", "String")
link("Number",     "Constant")
link("Boolean",    "Constant")

hi("Identifier",{ fg = c.fg })
hi("Function",  { fg = c.chalk, bold = true })

hi("Statement", { fg = c.iron, bold = true })
link("Conditional", "Statement")
link("Repeat",       "Statement")
link("Label",        "Statement")
link("Keyword",      "Statement")
link("Exception",    "Statement")
hi("Operator",  { fg = c.smoke })

hi("PreProc",   { fg = c.bruise })
link("Include",   "PreProc")
link("Define",    "PreProc")
link("Macro",     "PreProc")

hi("Type", { fg = c.concrete, italic = true })
link("StorageClass", "Type")
link("Structure",    "Type")
link("Typedef",      "Type")

hi("Special", { fg = c.alarm })
link("Delimiter", "Special")
link("SpecialChar","Special")

hi("Underlined", { fg = c.chalk, underline = true })
hi("Error",      { fg = c.fg, bg = c.blood })
hi("Todo",       { fg = c.bg, bg = c.alarm, bold = true })

-- ============================================================
-- 5. DIAGNOSTICS
-- ============================================================
hi("DiagnosticError", { fg = c.alarm })
hi("DiagnosticWarn",  { fg = c.sweat })
hi("DiagnosticInfo",  { fg = c.iron })
hi("DiagnosticHint",  { fg = c.fg_dim })
hi("DiagnosticOk",    { fg = c.khaki })

link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticFloatingWarn",  "DiagnosticWarn")
link("DiagnosticFloatingInfo",  "DiagnosticInfo")
link("DiagnosticFloatingHint",  "DiagnosticHint")

hi("DiagnosticSignError", { fg = c.alarm, bg = c.bg })
hi("DiagnosticSignWarn",  { fg = c.sweat, bg = c.bg })
hi("DiagnosticSignInfo",  { fg = c.iron, bg = c.bg })
hi("DiagnosticSignHint",  { fg = c.fg_dim, bg = c.bg })

hi("DiagnosticVirtualTextError", { fg = c.alarm, bg = c.bg_dark })
hi("DiagnosticVirtualTextWarn",  { fg = c.sweat, bg = c.bg_dark })
hi("DiagnosticVirtualTextInfo",  { fg = c.iron, bg = c.bg_dark })
hi("DiagnosticVirtualTextHint",  { fg = c.fg_dim, bg = c.bg_dark })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.alarm })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.sweat })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.iron })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.fg_dim })

-- ============================================================
-- 6. LSP
-- ============================================================
hi("LspReferenceText",  { bg = c.bg_light })
hi("LspReferenceRead",  { bg = c.bg_light })
hi("LspReferenceWrite", { bg = c.bg_light, bold = true })
hi("LspSignatureActiveParameter", { bold = true, underline = true, sp = c.chalk })
link("LspCodeLens", "Comment")
hi("LspInlayHint", { fg = c.fg_dim, bg = c.bg_light, italic = true })

-- ============================================================
-- 7. DIFF / GIT
-- ============================================================
hi("DiffAdd",    { fg = c.bg, bg = c.khaki })
hi("DiffChange", { fg = c.bg, bg = c.sweat })
hi("DiffDelete", { fg = c.bg, bg = c.blood })
hi("DiffText",   { fg = c.bg, bg = c.chalk, bold = true })
hi("DiffAdded",  { fg = c.khaki, bg = c.bg })
hi("DiffRemoved",{ fg = c.blood, bg = c.bg })

hi("GitSignsAdd",    { fg = c.khaki, bg = c.bg })
hi("GitSignsChange", { fg = c.sweat, bg = c.bg })
hi("GitSignsDelete", { fg = c.blood, bg = c.bg })

-- ============================================================
-- 8. TELESCOPE
-- ============================================================
hi("TelescopeNormal",       { fg = c.fg, bg = c.bg_dark })
hi("TelescopeBorder",       { fg = c.iron, bg = c.bg_dark })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_light })
hi("TelescopePromptBorder", { fg = c.chalk, bg = c.bg_light })
hi("TelescopeTitle",        { fg = c.chalk, bg = c.bg_dark, bold = true })
link("TelescopePromptTitle",   "Title")
link("TelescopeResultsTitle",  "Title")
link("TelescopePreviewTitle",  "Title")
hi("TelescopeSelection",      { bg = c.leather, bold = true })
hi("TelescopeSelectionCaret", { fg = c.fg, bg = c.chalk })
link("TelescopeMatching", "Special")

-- ============================================================
-- 9. WHICHKEY
-- ============================================================
hi("WhichKeyFloat",     { bg = c.bg_dark })
hi("WhichKeyBorder",    { bg = c.bg_dark })
hi("WhichKey",          { fg = c.fg, bg = c.bg_dark })
hi("WhichKeyGroup",     { fg = c.chalk, bg = c.bg_dark })
hi("WhichKeyDesc",      { fg = c.iron,  bg = c.bg_dark })
hi("WhichKeyValue",     { fg = c.fg_dim })
hi("WhichKeySeparator", { fg = c.fg_dim, bg = c.bg_dark })

-- ============================================================
-- 10. LAZY.NVIM / MASON
-- ============================================================
hi("LazyH1",           { fg = c.bg, bg = c.chalk })
hi("LazyH2",            { fg = c.sweat, bg = c.bg })
hi("LazyButton",        { bg = c.bg_dark })
hi("LazyButtonActive",  { fg = c.bg, bg = c.chalk })
hi("LazyNormal",        { bg = c.bg_dark })

hi("MasonHeader",    { fg = c.bg, bg = c.chalk, bold = true })
hi("MasonHighlight", { fg = c.chalk, bg = c.bg })
hi("MasonMuted",     { fg = c.fg_dim, bg = c.bg })

-- ============================================================
-- 11. INDENT-BLANKLINE
-- ============================================================
hi("IblIndent", { fg = c.bg_light, nocombine = true })
hi("IblScope",  { fg = c.chalk,    nocombine = true })

-- ============================================================
-- 12. SPELL
-- ============================================================
hi("SpellBad",   { sp = c.blood,  undercurl = true })
hi("SpellCap",   { sp = c.iron,   undercurl = true })
hi("SpellLocal", { sp = c.sweat,  undercurl = true })
hi("SpellRare",  { sp = c.alarm,  undercurl = true })

-- ============================================================
-- 13. TREESITTER (@ groups)
-- ============================================================
link("@boolean",     "Boolean")
link("@comment",      "Comment")
link("@constant.builtin", "Special")
link("@constant",         "Constant")
link("@constructor",      "Special")
link("@field",            "Identifier")
link("@function.builtin", "Special")
link("@function",         "Function")
link("@keyword",          "Keyword")
link("@method",           "Function")
link("@namespace",        "Identifier")
link("@number",           "Number")
link("@parameter",        "Identifier")
link("@preproc",          "PreProc")
link("@property",         "Identifier")
link("@punctuation",      "Delimiter")
link("@string",           "String")
link("@type",             "Type")
link("@variable",         "Identifier")
link("@text.title",       "Title")
link("@text.todo",        "Todo")
link("@text.underline",   "Underlined")
link("@text.uri",         "Underlined")

-- ============================================================
-- 14. EXTRAS (NvimTree / Neo-tree / FzfLua)
-- ============================================================
hi("NvimTreeNormal",           { fg = c.fg, bg = c.bg_dark })
hi("NvimTreeFolderIcon",       { fg = c.khaki })
hi("NvimTreeFolderName",       { fg = c.khaki })
hi("NvimTreeOpenedFolderName", { fg = c.sweat, bold = true })
hi("NvimTreeRootFolder",       { fg = c.chalk, bold = true })
hi("NvimTreeIndentMarker",     { fg = c.leather })
hi("NvimTreeGitDirty",         { fg = c.sweat })
hi("NvimTreeGitNew",           { fg = c.khaki })

hi("NeoTreeNormal",        { fg = c.fg, bg = c.bg_dark })
hi("NeoTreeDirectoryIcon", { fg = c.khaki })
hi("NeoTreeDirectoryName", { fg = c.khaki })
hi("NeoTreeRootName",      { fg = c.chalk, bold = true })

link("FzfLuaNormal", "Normal")
link("FzfLuaBorder", "FloatBorder")
link("FzfLuaCursor", "Cursor")
link("FzfLuaSearch", "IncSearch")

return c
