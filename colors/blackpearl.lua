-- blackpearl — Pirates of the Caribbean, not as neon or gothic, but as it
-- actually looks on screen: weathered ship wood, faded sea-charts, brass
-- compasses, rum-amber bottles, a storm-grey Caribbean sea, and one eerie
-- moonlit-gold-green for the cursed Aztec coins. A dusk palette on purpose:
-- neither a black-background dark theme nor a white-background light one.
--
-- FILE LOCATION (required for :colorscheme to find it):
--   ~/.config/nvim/colors/blackpearl.lua

-- ============================================================
-- 0. RESET
-- ============================================================
vim.o.background = "dark" -- closer to dark, but the actual bg value is mid-tone
if vim.g.colors_name then
  vim.cmd("highlight clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "blackpearl"

-- ============================================================
-- 1. PALETTE
-- stylua: ignore
-- ============================================================
local c = {
  bg        = "#3c362e", -- weathered deck wood — the mid-tone base
  bg_dark   = "#2c2721", -- below-deck, darker planks
  bg_light  = "#4a4339", -- lighter wood, for subtle elevation (cursorline)
  fg        = "#cdbfa0", -- old sea-chart parchment
  fg_dim    = "#8a8070", -- faded ink
  rope      = "#6b5d47", -- ship rope, used for comments
  sea       = "#3f7d78", -- stormy Caribbean teal
  brass     = "#a97f38", -- compass brass, pulled off yellow toward copper
  sail      = "#c9b183", -- faded canvas sail
  storm     = "#5d7380", -- storm-cloud blue-grey
  rum       = "#c17f3a", -- amber rum bottle
  cursedglow       = "#6f93a6", -- Aztec curse under moonlight — cold blue-silver, not gold
  cursedglow_bright= "#a8c4d1", -- the curse at its brightest — pale icy moon-glint
  rust      = "#8c3f34", -- dried blood / rusted cutlass
  lantern   = "#cc8c38", -- ship's lantern warning glow, warmer amber, less yellow
  moonwater = "#7fa3ab", -- moonlight on water
  seaweed   = "#5f7a52", -- oxidized copper / seaweed
  mahogany  = "#5a3826", -- dark mahogany wood — used for selection
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
hi("FloatBorder",  { fg = c.brass, bg = c.bg_dark })
hi("FloatTitle",   { fg = c.sail, bg = c.bg_dark, bold = true })

hi("SignColumn",   { fg = c.fg_dim, bg = c.bg })
hi("LineNr",       { fg = c.rope })
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
hi("CursorLineNr", { fg = c.brass, bold = true })
hi("CursorLine",   { bg = c.bg_light })
hi("CursorColumn", { bg = c.bg_light })
hi("Cursor",       { fg = c.bg, bg = c.fg })

hi("Visual",       { bg = c.mahogany, fg = c.sail })
hi("Search",       { fg = c.bg, bg = c.brass })
hi("IncSearch",    { fg = c.bg, bg = c.rum, bold = true })
link("CurSearch",    "IncSearch")
link("Substitute",   "Search")
link("QuickFixLine", "Search")

hi("MatchParen",   { fg = c.cursedglow_bright, bold = true, underline = true })

hi("Pmenu",        { fg = c.fg, bg = c.bg_dark })
hi("PmenuSel",     { fg = c.bg, bg = c.brass, bold = true })
hi("PmenuSbar",    { bg = c.bg_dark })
hi("PmenuThumb",   { bg = c.rope })

hi("WinSeparator", { fg = c.rope, bg = c.bg })
link("VertSplit", "WinSeparator")

hi("StatusLine",   { fg = c.fg, bg = c.bg_dark, bold = true })
hi("StatusLineNC", { fg = c.rope, bg = c.bg_dark })

hi("TabLine",       { fg = c.rope, bg = c.bg_dark })
hi("TabLineSel",    { fg = c.bg, bg = c.brass, bold = true })
hi("TabLineFill",   { fg = c.rope, bg = c.bg_dark })

hi("NonText",   { fg = c.rope })
link("EndOfBuffer", "NonText")
link("Whitespace",  "NonText")

hi("Folded",    { fg = c.fg_dim, bg = c.bg_dark })
hi("FoldColumn",{ fg = c.fg_dim, bg = c.bg })

hi("Directory", { fg = c.sea })
hi("Title",     { fg = c.sail, bold = true })
hi("ErrorMsg",  { fg = c.fg, bg = c.rust })
hi("WarningMsg",{ fg = c.lantern })
hi("MoreMsg",   { fg = c.moonwater, bold = true })
hi("Question",  { fg = c.moonwater, bold = true })

-- ============================================================
-- 4. SYNTAX — sea-teal for keywords, brass for functions (the
--    compass leads you to the code), rum-amber for constants,
--    cursed blue-glow reserved only for Special (it should feel rare).
-- ============================================================
hi("Comment",   { fg = c.rope, italic = true })

hi("Constant",  { fg = c.rum })
hi("String",    { fg = c.sail })
link("Character", "String")
link("Number",     "Constant")
link("Boolean",    "Constant")

hi("Identifier",{ fg = c.fg })
hi("Function",  { fg = c.brass, bold = true })

hi("Statement", { fg = c.sea, bold = true })
link("Conditional", "Statement")
link("Repeat",       "Statement")
link("Label",        "Statement")
link("Keyword",      "Statement")
link("Exception",    "Statement")
hi("Operator",  { fg = c.storm })

hi("PreProc",   { fg = c.moonwater })
link("Include",   "PreProc")
link("Define",    "PreProc")
link("Macro",     "PreProc")

hi("Type", { fg = c.storm, italic = true })
link("StorageClass", "Type")
link("Structure",    "Type")
link("Typedef",      "Type")

hi("Special", { fg = c.cursedglow })
link("Delimiter", "Special")
link("SpecialChar","Special")

hi("Underlined", { fg = c.moonwater, underline = true })
hi("Error",      { fg = c.fg, bg = c.rust })
hi("Todo",       { fg = c.bg, bg = c.lantern, bold = true })

-- ============================================================
-- 5. DIAGNOSTICS
-- ============================================================
hi("DiagnosticError", { fg = c.rust })
hi("DiagnosticWarn",  { fg = c.lantern })
hi("DiagnosticInfo",  { fg = c.moonwater })
hi("DiagnosticHint",  { fg = c.fg_dim })
hi("DiagnosticOk",    { fg = c.seaweed })

link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticFloatingWarn",  "DiagnosticWarn")
link("DiagnosticFloatingInfo",  "DiagnosticInfo")
link("DiagnosticFloatingHint",  "DiagnosticHint")

hi("DiagnosticSignError", { fg = c.rust, bg = c.bg })
hi("DiagnosticSignWarn",  { fg = c.lantern, bg = c.bg })
hi("DiagnosticSignInfo",  { fg = c.moonwater, bg = c.bg })
hi("DiagnosticSignHint",  { fg = c.fg_dim, bg = c.bg })

hi("DiagnosticVirtualTextError", { fg = c.rust, bg = c.bg_dark })
hi("DiagnosticVirtualTextWarn",  { fg = c.lantern, bg = c.bg_dark })
hi("DiagnosticVirtualTextInfo",  { fg = c.moonwater, bg = c.bg_dark })
hi("DiagnosticVirtualTextHint",  { fg = c.fg_dim, bg = c.bg_dark })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.rust })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.lantern })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.moonwater })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.fg_dim })

-- ============================================================
-- 6. LSP
-- ============================================================
hi("LspReferenceText",  { bg = c.bg_light })
hi("LspReferenceRead",  { bg = c.bg_light })
hi("LspReferenceWrite", { bg = c.bg_light, bold = true })
hi("LspSignatureActiveParameter", { bold = true, underline = true, sp = c.brass })
link("LspCodeLens", "Comment")
hi("LspInlayHint", { fg = c.fg_dim, bg = c.bg_light, italic = true })

-- ============================================================
-- 7. DIFF / GIT
-- ============================================================
hi("DiffAdd",    { fg = c.bg, bg = c.seaweed })
hi("DiffChange", { fg = c.bg, bg = c.lantern })
hi("DiffDelete", { fg = c.bg, bg = c.rust })
hi("DiffText",   { fg = c.bg, bg = c.moonwater, bold = true })
hi("DiffAdded",  { fg = c.seaweed, bg = c.bg })
hi("DiffRemoved",{ fg = c.rust,    bg = c.bg })

hi("GitSignsAdd",    { fg = c.seaweed, bg = c.bg })
hi("GitSignsChange", { fg = c.lantern, bg = c.bg })
hi("GitSignsDelete", { fg = c.rust,    bg = c.bg })

-- ============================================================
-- 8. TELESCOPE
-- ============================================================
hi("TelescopeNormal",       { fg = c.fg, bg = c.bg_dark })
hi("TelescopeBorder",       { fg = c.brass, bg = c.bg_dark })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_light })
hi("TelescopePromptBorder", { fg = c.sail, bg = c.bg_light })
hi("TelescopeTitle",        { fg = c.sail, bg = c.bg_dark, bold = true })
link("TelescopePromptTitle",   "Title")
link("TelescopeResultsTitle",  "Title")
link("TelescopePreviewTitle",  "Title")
hi("TelescopeSelection",      { bg = c.mahogany, bold = true })
hi("TelescopeSelectionCaret", { fg = c.fg, bg = c.brass })
link("TelescopeMatching", "Special")

-- ============================================================
-- 9. WHICHKEY
-- ============================================================
hi("WhichKeyFloat",     { bg = c.bg_dark })
hi("WhichKeyBorder",    { bg = c.bg_dark })
hi("WhichKey",          { fg = c.fg, bg = c.bg_dark })
hi("WhichKeyGroup",     { fg = c.brass, bg = c.bg_dark })
hi("WhichKeyDesc",      { fg = c.sea,   bg = c.bg_dark })
hi("WhichKeyValue",     { fg = c.fg_dim })
hi("WhichKeySeparator", { fg = c.fg_dim, bg = c.bg_dark })

-- ============================================================
-- 10. LAZY.NVIM / MASON
-- ============================================================
hi("LazyH1",           { fg = c.bg, bg = c.brass })
hi("LazyH2",            { fg = c.lantern, bg = c.bg })
hi("LazyButton",        { bg = c.bg_dark })
hi("LazyButtonActive",  { fg = c.bg, bg = c.brass })
hi("LazyNormal",        { bg = c.bg_dark })

hi("MasonHeader",    { fg = c.bg, bg = c.brass, bold = true })
hi("MasonHighlight", { fg = c.brass, bg = c.bg })
hi("MasonMuted",     { fg = c.fg_dim, bg = c.bg })

-- ============================================================
-- 11. INDENT-BLANKLINE
-- ============================================================
hi("IblIndent", { fg = c.bg_light, nocombine = true })
hi("IblScope",  { fg = c.brass,    nocombine = true })

-- ============================================================
-- 12. SPELL
-- ============================================================
hi("SpellBad",   { sp = c.rust,      undercurl = true })
hi("SpellCap",   { sp = c.moonwater, undercurl = true })
hi("SpellLocal", { sp = c.lantern,   undercurl = true })
hi("SpellRare",  { sp = c.cursedglow,undercurl = true })

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
hi("NvimTreeFolderIcon",       { fg = c.sea })
hi("NvimTreeFolderName",       { fg = c.sea })
hi("NvimTreeOpenedFolderName", { fg = c.sail, bold = true })
hi("NvimTreeRootFolder",       { fg = c.brass, bold = true })
hi("NvimTreeIndentMarker",     { fg = c.rope })
hi("NvimTreeGitDirty",         { fg = c.lantern })
hi("NvimTreeGitNew",           { fg = c.seaweed })

hi("NeoTreeNormal",        { fg = c.fg, bg = c.bg_dark })
hi("NeoTreeDirectoryIcon", { fg = c.sea })
hi("NeoTreeDirectoryName", { fg = c.sea })
hi("NeoTreeRootName",      { fg = c.brass, bold = true })

link("FzfLuaNormal", "Normal")
link("FzfLuaBorder", "FloatBorder")
link("FzfLuaCursor", "Cursor")
link("FzfLuaSearch", "IncSearch")

return c
