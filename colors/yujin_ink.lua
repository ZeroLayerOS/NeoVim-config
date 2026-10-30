--  ╦ ╦ ╦ ╦  ╦ ╦ ╔╗╔   ╦ ╔╗╔ ╦╔═
--  ╚╦╝ ║ ║  ║ ║ ║║║   ║ ║║║ ╠╩╗
--   ╩  ╚═╝ ╚╝ ╩ ╝╚╝   ╩ ╝╚╝ ╩ ╩
-- yujin_ink — a colorscheme built from two woodcut-style cat illustrations:
--   black ink on kraft paper. Two core colors, everything else is muted.
--     ink   #0E0D0C  (dark)
--     paper #D9C3A3  (light)
--
-- This file is the PALETTE + HIGHLIGHTS module. It is loaded from your main
-- colorscheme file (e.g. require("<your.path>.yujin_ink")) and returns the
-- palette table `c` so other modules (lualine, bufferline, ...) can reuse it.
--
-- Targets Neovim 0.10 → 0.12+ (new treesitter capture names, new diff groups,
-- 0.11 Pmenu / snippet groups). Legacy capture names (@field, @method,
-- @parameter, @text.*, ...) are intentionally NOT used.

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
vim.g.colors_name = "yujin_ink"

-- ============================================================
-- 1. PALETTE — two core colors (ink / paper) + 16 muted "old ink" colors
-- ============================================================
local c = {
  -- ink: backgrounds / surfaces
  bg0        = "#0A0909", -- deepest surface: gutters, floats, tabline, trees
  bg1        = "#0E0D0C", -- base editor bg (ink)
  bg2        = "#131110", -- panel / popup / results bg
  bg3        = "#26221E", -- selection / visual / prompt bg
  bg4        = "#171513", -- cursorline / lightest ui surface
  bg_alt     = "#131110", -- secondary surface (statusline)
  border     = "#3A342D", -- borders / separators
  fg_muted   = "#6B6154", -- comments, line numbers, muted UI

  -- paper: foregrounds
  fg         = "#D9C3A3", -- primary text (kraft paper)
  fg_bright  = "#EFE0C8", -- bright cream (titles / emphasis)
  fg_dim     = "#A89677", -- identifiers / secondary text / operators

  -- ANSI 0-7
  black      = "#0E0D0C", -- color0
  red        = "#B5533C", -- color1  blood / rust
  green      = "#8A9A5B", -- color2  faded moss
  yellow     = "#C9A24D", -- color3  old gold
  blue       = "#5F7F8C", -- color4  storm sea
  magenta    = "#9A6B7E", -- color5  dusty wine
  cyan       = "#6FA39B", -- color6  sea foam
  white      = "#D9C3A3", -- color7  kraft paper

  -- ANSI 8-15
  bright_black   = "#6B6154", -- color8  ash
  bright_red     = "#D4694F", -- color9  ember
  bright_green   = "#A8B876", -- color10 olive light
  bright_yellow  = "#E3BC63", -- color11 polished gold
  bright_blue    = "#7FA0AE", -- color12 pre-dawn sky
  bright_magenta = "#B88499", -- color13 earthy pink
  bright_cyan    = "#8CC2B8", -- color14 sea spray
  bright_white   = "#EFE0C8", -- color15 cream

  -- inferred: subtle tinted backgrounds for diff (readable on ink)
  diff_add    = "#1F261A",
  diff_change = "#2A2415",
  diff_delete = "#2E1A15",
  diff_text   = "#4A3C1B",
}

-- terminal colors (:terminal, fzf, lazygit, ...)
local ansi = {
  c.black, c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.white,
  c.bright_black, c.bright_red, c.bright_green, c.bright_yellow,
  c.bright_blue, c.bright_magenta, c.bright_cyan, c.bright_white,
}
for i, color in ipairs(ansi) do
  vim.g["terminal_color_" .. (i - 1)] = color
end

-- ============================================================
-- 2. HELPERS
-- ============================================================
local function hi(group, opts) vim.api.nvim_set_hl(0, group, opts) end
local function link(from, to) vim.api.nvim_set_hl(0, from, { link = to }) end
local function clear(group) vim.api.nvim_set_hl(0, group, {}) end

-- ============================================================
-- 3. CORE EDITOR UI
-- ============================================================
hi("Normal",       { fg = c.fg,       bg = c.bg1 })
hi("NormalNC",     { fg = c.fg_dim,   bg = c.bg1 })
hi("NormalFloat",  { fg = c.fg,       bg = c.bg2 })
hi("FloatBorder",  { fg = c.border,   bg = c.bg2 })
hi("FloatTitle",   { fg = c.yellow,   bg = c.bg2, bold = true })
hi("FloatFooter",  { fg = c.fg_muted, bg = c.bg2 })
hi("FloatShadow",         { bg = c.black, blend = 40 })
hi("FloatShadowThrough",  { bg = c.black, blend = 60 })

hi("SignColumn",   { fg = c.fg_muted, bg = c.bg1 })
hi("LineNr",       { fg = c.fg_muted, bg = c.bg1 })
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
hi("CursorLineNr", { fg = c.yellow,   bg = c.bg4, bold = true })
hi("CursorLine",   { bg = c.bg4 })
link("CursorLineSign", "SignColumn")
link("CursorLineFold", "FoldColumn")
hi("CursorColumn", { bg = c.bg4 })
hi("Cursor",       { fg = c.bg1, bg = c.fg })
hi("lCursor",      { fg = c.bg1, bg = c.fg })
link("CursorIM", "Cursor")
hi("TermCursor",   { reverse = true })
hi("ColorColumn",  { bg = c.bg4 })

hi("Visual",       { bg = c.bg3 })
hi("VisualNOS",    { bg = c.bg3 })
hi("Search",       { fg = c.bg0, bg = c.yellow })
hi("IncSearch",    { fg = c.bg0, bg = c.bright_red })
link("CurSearch",    "IncSearch")
link("Substitute",   "Search")
link("QuickFixLine", "Search")

hi("MatchParen",   { fg = c.bright_yellow, bold = true, underline = true })

hi("Pmenu",        { fg = c.fg, bg = c.bg2 })
hi("PmenuSel",     { fg = c.bg0, bg = c.yellow, bold = true })
hi("PmenuSbar",    { bg = c.bg3 })
hi("PmenuThumb",   { bg = c.fg_muted })
hi("PmenuBorder",  { fg = c.border, bg = c.bg2 })
hi("PmenuMatch",    { fg = c.bright_yellow, bg = c.bg2, bold = true })
hi("PmenuMatchSel", { fg = c.bg0, bg = c.yellow, bold = true, underline = true })
link("PmenuKind",    "Pmenu")
link("PmenuKindSel", "PmenuSel")
link("PmenuExtra",   "Pmenu")
link("PmenuExtraSel","PmenuSel")
hi("ComplMatchIns", { fg = c.fg_muted })
hi("ComplHint",     { fg = c.fg_muted, italic = true })
link("ComplHintMore", "ComplHint")
hi("SnippetTabstop",       { bg = c.bg3 })
hi("SnippetTabstopActive", { bg = c.bg3, underline = true, sp = c.yellow })

hi("WinSeparator", { fg = c.border, bg = c.bg1 })
link("VertSplit", "WinSeparator")

hi("StatusLine",   { fg = c.fg,       bg = c.bg_alt, bold = true })
hi("StatusLineNC", { fg = c.fg_muted, bg = c.bg_alt })
link("StatusLineTerm",   "StatusLine")
link("StatusLineTermNC", "StatusLineNC")
link("MsgSeparator", "StatusLine")
hi("MsgArea", { fg = c.fg })

hi("TabLine",       { fg = c.fg_muted,  bg = c.bg0 })
hi("TabLineSel",    { fg = c.bg0,       bg = c.yellow, bold = true })
hi("TabLineFill",   { fg = c.fg_dim,    bg = c.bg1 })
hi("TabLineSep",    { fg = c.bg0,       bg = c.bg1 })
hi("TabLineSelSep", { fg = c.yellow,    bg = c.bg4, bold = true })

hi("WildMenu",  { fg = c.bg0, bg = c.bright_yellow })
hi("Directory", { fg = c.cyan })
hi("Title",     { fg = c.yellow, bold = true })

hi("NonText",   { fg = c.fg_muted, bold = true })
link("EndOfBuffer", "NonText")
link("Whitespace",  "NonText")

hi("Folded",    { fg = c.fg_dim, bg = c.bg2 })
hi("FoldColumn",{ fg = c.fg_muted, bg = c.bg1 })

hi("ModeMsg",   { fg = c.fg, bold = true })
hi("MoreMsg",   { fg = c.green, bold = true })
hi("Question",  { fg = c.green, bold = true })
hi("WarningMsg",{ fg = c.bright_yellow })
hi("ErrorMsg",  { fg = c.bright_red, bg = c.bg1 })
hi("OkMsg",     { fg = c.green })
hi("StdoutMsg", { fg = c.fg })
hi("StderrMsg", { fg = c.bright_red })

hi("Ignore",    { fg = c.fg_muted, underline = true })
link("Conceal", "Ignore")
hi("SpecialKey",{ fg = c.fg_muted })

for i = 1, 9 do
  hi("User" .. i, { fg = c.fg, bg = c.bg3 })
end
hi("WinBar",   { fg = c.fg, bold = true })
hi("WinBarNC", { fg = c.fg_muted })

hi("Bold",          { bold = true })
hi("Italic",        { italic = true })
hi("Underline",     { underline = true })
hi("Strikethrough", { strikethrough = true })

-- ============================================================
-- 4. CLASSIC SYNTAX GROUPS
-- ============================================================
hi("Boolean",   { fg = c.red, bold = true })
hi("Comment",   { fg = c.fg_muted, italic = true })
hi("Constant",  { fg = c.red })
link("Character", "Constant")
hi("String",    { fg = c.green })
hi("Number",    { fg = c.red })
link("Float", "Number")

hi("Identifier",{ fg = c.fg })
hi("Function",  { fg = c.yellow })

hi("Statement", { fg = c.magenta, bold = true })
link("Conditional", "Statement")
link("Repeat",       "Statement")
link("Label",        "Statement")
link("Exception",    "Statement")

hi("Delimiter", { fg = c.fg_dim })
link("Operator", "Delimiter")

hi("Keyword",   { fg = c.magenta, bold = true })
hi("PreProc",   { fg = c.bright_magenta })
link("Include",   "PreProc")
link("Define",    "PreProc")
link("Macro",     "PreProc")
link("PreCondit", "PreProc")

hi("Type", { fg = c.cyan })
link("StorageClass", "Type")
link("Structure",    "Type")
link("Typedef",      "Type")

hi("Special", { fg = c.bright_magenta })
link("SpecialChar",    "Special")
link("SpecialComment", "Special")
link("Tag",             "Special")
link("Debug",           "Special")

hi("Underlined", { fg = c.bright_blue, underline = true })
hi("Error",      { fg = c.fg_bright, bg = c.red, bold = true })
hi("Todo",       { fg = c.bg0, bg = c.bright_yellow, bold = true })

-- ============================================================
-- 5. DIAGNOSTICS
-- ============================================================
hi("DiagnosticError", { fg = c.bright_red })
hi("DiagnosticWarn",  { fg = c.bright_yellow })
hi("DiagnosticInfo",  { fg = c.blue })
hi("DiagnosticHint",  { fg = c.cyan })
hi("DiagnosticOk",    { fg = c.green })

link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticFloatingWarn",  "DiagnosticWarn")
link("DiagnosticFloatingInfo",  "DiagnosticInfo")
link("DiagnosticFloatingHint",  "DiagnosticHint")
link("DiagnosticFloatingOk",    "DiagnosticOk")

hi("DiagnosticSignError", { fg = c.bright_red,    bg = c.bg1 })
hi("DiagnosticSignWarn",  { fg = c.bright_yellow, bg = c.bg1 })
hi("DiagnosticSignInfo",  { fg = c.blue,          bg = c.bg1 })
hi("DiagnosticSignHint",  { fg = c.cyan,          bg = c.bg1 })
hi("DiagnosticSignOk",    { fg = c.green,         bg = c.bg1 })

hi("DiagnosticVirtualTextError", { fg = c.bright_red,    bg = c.bg2 })
hi("DiagnosticVirtualTextWarn",  { fg = c.bright_yellow, bg = c.bg2 })
hi("DiagnosticVirtualTextInfo",  { fg = c.blue,          bg = c.bg2 })
hi("DiagnosticVirtualTextHint",  { fg = c.cyan,          bg = c.bg2 })
hi("DiagnosticVirtualTextOk",    { fg = c.green,         bg = c.bg2 })

link("DiagnosticVirtualLinesError", "DiagnosticError")
link("DiagnosticVirtualLinesWarn",  "DiagnosticWarn")
link("DiagnosticVirtualLinesInfo",  "DiagnosticInfo")
link("DiagnosticVirtualLinesHint",  "DiagnosticHint")
link("DiagnosticVirtualLinesOk",    "DiagnosticOk")

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.bright_red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.bright_yellow })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.cyan })
hi("DiagnosticUnderlineOk",    { undercurl = true, sp = c.green })

hi("DiagnosticDeprecated",  { sp = c.fg_muted, strikethrough = true })
hi("DiagnosticUnnecessary", { fg = c.fg_muted })

-- ============================================================
-- 6. LSP
-- ============================================================
hi("LspReferenceText",   { bg = c.bg3 })
hi("LspReferenceRead",   { bg = c.bg3 })
hi("LspReferenceWrite",  { bg = c.bg3, underline = true, sp = c.yellow })
hi("LspReferenceTarget", { bg = c.bg3, bold = true })
hi("LspSignatureActiveParameter", { fg = c.bright_yellow, bold = true, underline = true })
link("LspCodeLens", "Comment")
link("LspCodeLensSeparator", "Comment")
hi("LspInlayHint",      { fg = c.fg_muted, bg = c.bg2, italic = true })
hi("LspInfoBorder",     { fg = c.border, bg = c.bg2 })

-- semantic tokens (override treesitter at higher priority → keep in sync)
link("@lsp.type.class",         "@type")
link("@lsp.type.decorator",     "@attribute")
link("@lsp.type.enum",          "@type")
link("@lsp.type.enumMember",    "@constant")
link("@lsp.type.event",         "@constant")
link("@lsp.type.function",      "@function")
link("@lsp.type.interface",     "@type")
link("@lsp.type.keyword",       "@keyword")
link("@lsp.type.macro",         "@function.macro")
link("@lsp.type.method",        "@function.method")
link("@lsp.type.modifier",      "@keyword.modifier")
link("@lsp.type.namespace",     "@module")
link("@lsp.type.number",        "@number")
link("@lsp.type.operator",      "@operator")
link("@lsp.type.parameter",     "@variable.parameter")
link("@lsp.type.property",      "@property")
link("@lsp.type.regexp",        "@string.regexp")
link("@lsp.type.string",        "@string")
link("@lsp.type.struct",        "@type")
link("@lsp.type.type",          "@type")
link("@lsp.type.typeParameter", "@type")
link("@lsp.type.variable",      "@variable")
hi("@lsp.mod.deprecated", { strikethrough = true })
link("@lsp.typemod.function.defaultLibrary", "@function.builtin")
link("@lsp.typemod.method.defaultLibrary",   "@function.builtin")
link("@lsp.typemod.variable.defaultLibrary", "@variable.builtin")
link("@lsp.typemod.variable.readonly",       "@constant")

-- ============================================================
-- 7. DIFF / GIT
-- ============================================================
hi("DiffAdd",    { bg = c.diff_add })
hi("DiffChange", { bg = c.diff_change })
hi("DiffDelete", { fg = c.red, bg = c.diff_delete })
hi("DiffText",   { bg = c.diff_text, bold = true })
hi("Added",      { fg = c.green })
hi("Changed",    { fg = c.yellow })
hi("Removed",    { fg = c.red })
link("DiffAdded",   "Added")
link("DiffRemoved", "Removed")
link("DiffChanged", "Changed")

hi("GitSignsAdd",    { fg = c.green,  bg = c.bg1 })
hi("GitSignsChange", { fg = c.yellow, bg = c.bg1 })
hi("GitSignsDelete", { fg = c.red,    bg = c.bg1 })
hi("GitSignsStagedAdd",    { fg = c.fg_muted, bg = c.bg1 })
hi("GitSignsStagedChange", { fg = c.fg_muted, bg = c.bg1 })
hi("GitSignsStagedDelete", { fg = c.fg_muted, bg = c.bg1 })
hi("GitSignsCurrentLineBlame", { fg = c.fg_muted, italic = true })

hi("gitCommitBranch",         { fg = c.yellow })
hi("gitCommitSelectedFile",   { fg = c.green })
hi("gitCommitSelectedType",   { fg = c.green })
hi("gitCommitUnmergedFile",   { fg = c.bright_yellow })
hi("gitCommitUnmergedType",   { fg = c.bright_yellow })
link("gitCommitDiscardedFile", "gitCommitUnmergedFile")
link("gitCommitDiscardedType", "gitCommitUnmergedType")
link("gitCommitUntrackedFile", "gitCommitUnmergedFile")
link("gitCommitFile", "Directory")

-- ============================================================
-- 8. SCROLLBAR
-- ============================================================
hi("ScrollbarHandle",       { bg = c.bg3 })
hi("ScrollbarCursor",       { fg = c.fg_dim })
hi("ScrollbarCursorHandle", { fg = c.fg_dim, bg = c.bg3 })
for _, pair in ipairs({
  { "Error",  c.bright_red },
  { "Warn",   c.bright_yellow },
  { "Info",   c.blue },
  { "Hint",   c.cyan },
  { "Misc",   c.magenta },
  { "Search", c.yellow },
  { "GitAdd",    c.green },
  { "GitChange", c.yellow },
  { "GitDelete", c.red },
}) do
  local name, color = pair[1], pair[2]
  hi("Scrollbar" .. name,             { fg = color })
  hi("Scrollbar" .. name .. "Handle", { fg = color, bg = c.bg3 })
end

-- ============================================================
-- 9. TELESCOPE
-- ============================================================
hi("TelescopeNormal",        { fg = c.fg, bg = c.bg2 })
hi("TelescopeBorder",        { fg = c.border, bg = c.bg2 })
hi("TelescopePromptNormal",  { fg = c.fg, bg = c.bg3 })
hi("TelescopePromptBorder",  { fg = c.bg3, bg = c.bg3 })
hi("TelescopeTitle",         { fg = c.bright_yellow, bg = c.bg2, bold = true })
link("TelescopePromptTitle",   "TelescopeTitle")
link("TelescopePromptPrefix",  "Title")
link("TelescopePromptCounter", "TelescopeBorder")
link("TelescopeResultsTitle",  "TelescopeTitle")
link("TelescopeResultsBorder", "TelescopeBorder")
link("TelescopePreviewBorder", "TelescopeBorder")
link("TelescopePreviewTitle",  "TelescopeTitle")
hi("TelescopeSelection",      { fg = c.fg_bright, bg = c.bg4, bold = true })
hi("TelescopeSelectionCaret", { fg = c.yellow, bg = c.bg4 })
link("TelescopePreviewLine", "TelescopeSelection")
hi("TelescopeMatching", { fg = c.bright_yellow, bold = true })
hi("TelescopeMultiSelection", { fg = c.bright_magenta, bold = true })
hi("TelescopeMultiIcon",      { fg = c.bright_magenta })
link("TelescopeResultsNormal", "TelescopeNormal")
link("TelescopePreviewNormal", "TelescopeNormal")
link("TelescopeResultsLineNr",  "LineNr")
link("TelescopeResultsComment", "Comment")
link("TelescopeResultsFunction","Function")
link("TelescopeResultsMethod",  "Function")
link("TelescopeResultsIdentifier","Identifier")
link("TelescopeResultsVariable","Identifier")
link("TelescopeResultsField",   "Identifier")
link("TelescopeResultsClass",   "Type")
link("TelescopeResultsStruct",  "Type")
link("TelescopeResultsConstant","Constant")
link("TelescopeResultsNumber",  "Number")
link("TelescopeResultsOperator","Operator")
link("TelescopeResultsSpecialComment", "SpecialComment")
link("TelescopeResultsDiffUntracked", "Added")
link("TelescopeResultsDiffAdd",       "Added")
link("TelescopeResultsDiffChange",    "Changed")
link("TelescopeResultsDiffDelete",    "Removed")
hi("TelescopeResultsFileIcon", { link = "Special" })
for _, g in ipairs({
  "Block","CharDev","Date","Directory","Execute","Group","Hyphen","Link",
  "Match","Message","MessageFillchar","Pipe","Read","Size","Socket",
  "Sticky","User","Write",
}) do
  link("TelescopePreview" .. g, "Normal")
end

-- ============================================================
-- 10. WHICHKEY (v3 groups + legacy float groups)
-- ============================================================
hi("WhichKey",          { fg = c.cyan })
hi("WhichKeyGroup",     { fg = c.yellow })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeyValue",     { fg = c.fg_muted })
hi("WhichKeySeparator", { fg = c.fg_muted })
hi("WhichKeyNormal",    { fg = c.fg, bg = c.bg2 })
hi("WhichKeyBorder",    { fg = c.border, bg = c.bg2 })
hi("WhichKeyTitle",     { fg = c.bright_yellow, bg = c.bg2, bold = true })
hi("WhichKeyIcon",      { fg = c.cyan })
hi("WhichKeyIconBlue",   { fg = c.blue })
hi("WhichKeyIconAzure",  { fg = c.bright_blue })
hi("WhichKeyIconCyan",   { fg = c.cyan })
hi("WhichKeyIconGreen",  { fg = c.green })
hi("WhichKeyIconOrange", { fg = c.yellow })
hi("WhichKeyIconPurple", { fg = c.magenta })
hi("WhichKeyIconRed",    { fg = c.red })
hi("WhichKeyIconYellow", { fg = c.bright_yellow })
hi("WhichKeyIconGrey",   { fg = c.fg_muted })
link("WhichKeyFloat", "WhichKeyNormal")

-- ============================================================
-- 11. LAZY.NVIM
-- ============================================================
hi("LazyNormal",        { fg = c.fg, bg = c.bg2 })
hi("LazyH1",            { fg = c.bg0, bg = c.yellow, bold = true })
hi("LazyH2",            { fg = c.bright_yellow, bold = true })
hi("LazyButton",        { fg = c.fg_dim, bg = c.bg3 })
hi("LazyButtonActive",  { fg = c.bg0, bg = c.yellow, bold = true })
hi("LazySpecial",       { fg = c.cyan })
hi("LazyProgressDone",  { fg = c.yellow, bold = true })
hi("LazyProgressTodo",  { fg = c.bg3, bold = true })
hi("LazyTaskError",     { fg = c.bright_red })
hi("LazyTaskOutput",    { fg = c.fg_dim })
hi("LazyCommit",        { fg = c.green })
hi("LazyCommitIssue",   { fg = c.magenta })
hi("LazyCommitScope",   { fg = c.fg_dim, italic = true })
hi("LazyCommitType",    { fg = c.cyan })
hi("LazyUrl",           { fg = c.bright_blue, underline = true })
hi("LazyValue",         { fg = c.green })
hi("LazyLocal",         { fg = c.fg_dim })
hi("LazyNoCond",        { fg = c.bright_red })
for _, g in ipairs({ "Comment", "Dimmed", "Prop" }) do
  link("Lazy" .. g, "Comment")
end
link("LazyDir", "Directory")
for _, g in ipairs({
  "ReasonCmd","ReasonEvent","ReasonFt","ReasonImport","ReasonKeys",
  "ReasonPlugin","ReasonRuntime","ReasonSource","ReasonStart",
}) do
  hi("Lazy" .. g, { fg = c.fg_dim })
end

-- ============================================================
-- 12. MASON
-- ============================================================
hi("MasonNormal",        { fg = c.fg, bg = c.bg2 })
hi("MasonHeader",        { fg = c.bg0, bg = c.yellow, bold = true })
hi("MasonHeaderSecondary", { fg = c.bg0, bg = c.cyan, bold = true })
hi("MasonHighlight",     { fg = c.cyan })
hi("MasonHighlightBlock",     { fg = c.bg0, bg = c.cyan })
hi("MasonHighlightBlockBold", { fg = c.bg0, bg = c.cyan, bold = true })
hi("MasonHighlightSecondary", { fg = c.bright_yellow })
hi("MasonHighlightBlockSecondary",     { fg = c.bg0, bg = c.yellow })
hi("MasonHighlightBlockBoldSecondary", { fg = c.bg0, bg = c.yellow, bold = true })
hi("MasonMuted",         { fg = c.fg_muted })
hi("MasonMutedBlock",    { fg = c.fg_dim, bg = c.bg3 })
hi("MasonMutedBlockBold",{ fg = c.fg_dim, bg = c.bg3, bold = true })
hi("MasonHeading",       { fg = c.fg_bright, bold = true })
hi("MasonError",         { fg = c.bright_red })
hi("MasonWarning",       { fg = c.bright_yellow })

-- ============================================================
-- 13. INDENT-BLANKLINE
-- ============================================================
hi("IblIndent",     { fg = c.bg4, nocombine = true })
hi("IblScope",      { fg = c.fg_muted, nocombine = true })
hi("IblWhitespace", { fg = c.bg4, nocombine = true })
link("IndentBlanklineChar",        "IblIndent")
link("IndentBlanklineContextChar", "IblScope")

-- ============================================================
-- 14. FILETYPE-SPECIFIC (legacy vim syntax; used when treesitter is off)
-- ============================================================
hi("htmlArg",      { fg = c.fg_dim })
hi("htmlTag",       { fg = c.fg_dim })
hi("htmlTagName",   { fg = c.magenta })
link("htmlEndTag", "htmlTag")
hi("htmlBold",              { bold = true })
hi("htmlItalic",            { italic = true })
hi("htmlUnderline",         { underline = true })
hi("htmlUnderlineItalic",   { underline = true, italic = true })
hi("htmlBoldItalic",        { bold = true, italic = true })
hi("htmlBoldUnderline",     { bold = true, underline = true })
hi("htmlBoldUnderlineItalic",{ bold = true, underline = true, italic = true })
hi("htmlH1",                { fg = c.bright_yellow, bold = true })
link("htmlLink", "Underlined")

link("markdownCodeBlock",     "String")
link("markdownCodeDelimiter", "NonText")
link("markdownHeadingRule",   "NonText")
link("markdownLinkDelimiter", "Delimiter")
link("markdownURLDelimiter",  "Delimiter")
hi("markdownBold",   { bold = true })
hi("markdownItalic", { italic = true })

hi("phpIdentifier",      { fg = c.fg })
hi("phpSpecialFunction", { fg = c.bright_magenta })
link("phpDefine",  "Statement")
link("phpHereDoc", "String")
link("phpVarSelector", "phpIdentifier")

hi("rubyInstanceVariable",         { fg = c.fg_dim })
link("rubyConstant", "Constant")
link("rubyDefine",   "Statement")
link("rubyLocalVariableOrMethod", "Identifier")

hi("xmlTag",         { fg = c.fg_dim })
hi("xmlTagName",     { fg = c.magenta })
link("xmlAttrib",   "xmlTag")
link("xmlEndTag",   "xmlTag")
link("xmlEqual",    "xmlTag")
link("xmlString",   "String")

hi("mustacheMarker",            { fg = c.fg_muted })
hi("mustachePartial",           { fg = c.bright_magenta })
hi("mustacheVariable",          { fg = c.yellow })
hi("mustacheVariableUnescape",  { fg = c.red })
hi("mustacheSection",           { bold = true })

hi("netrwClassify", { fg = c.fg_muted, bold = true })
hi("netrwExe",       { fg = c.red })
link("NERDTreeExecFile", "String")
link("NERDTreeHelp",     "Comment")

link("javaScript", "Normal")
link("javaScriptBraces", "Delimiter")
hi("lessVariable",      { fg = c.yellow })
link("lessVariableValue", "Normal")
hi("shDerefSimple", { fg = c.red })
link("shDerefVar", "shDerefSimple")

link("vimContinue", "Delimiter")
link("vimHiAttrib",  "Constant")
link("vimSetSep",    "Delimiter")

link("helpExample",       "String")
link("helpHeadline",      "Title")
link("helpHyperTextEntry","Statement")
link("helpHyperTextJump", "Underlined")
link("helpSectionDelim",  "Comment")
link("helpURL",           "Underlined")

hi("SyntasticErrorSign",   { fg = c.bright_red })
hi("SyntasticWarningSign", { fg = c.bright_yellow })

-- ============================================================
-- 15. SPELL
-- ============================================================
hi("SpellBad",   { sp = c.bright_red,    undercurl = true })
hi("SpellCap",   { sp = c.bright_yellow, undercurl = true })
hi("SpellLocal", { sp = c.cyan,          undercurl = true })
hi("SpellRare",  { sp = c.magenta,       undercurl = true })

-- ============================================================
-- 16. TREESITTER (@ groups — Neovim 0.10+ naming)
-- ============================================================
-- identifiers
link("@variable",                    "Identifier")
hi("@variable.builtin",              { fg = c.bright_magenta, italic = true })
link("@variable.parameter",          "Identifier")
hi("@variable.parameter.builtin",    { fg = c.bright_magenta, italic = true })
link("@variable.member",             "Identifier")

link("@constant",                    "Constant")
hi("@constant.builtin",              { fg = c.red, bold = true })
link("@constant.macro",              "Macro")

link("@module",                      "Identifier")
hi("@module.builtin",                { fg = c.bright_magenta, italic = true })
link("@label",                       "Label")

-- literals
link("@string",                      "String")
link("@string.documentation",        "Comment")
link("@string.regexp",               "Special")
link("@string.escape",               "SpecialChar")
link("@string.special",              "SpecialChar")
hi("@string.special.symbol",         { fg = c.bright_green })
hi("@string.special.url",            { fg = c.bright_blue, underline = true })
link("@string.special.path",         "Directory")

link("@character",                   "Character")
link("@character.special",           "SpecialChar")
link("@boolean",                     "Boolean")
link("@number",                      "Number")
link("@number.float",                "Float")

-- types
link("@type",                        "Type")
hi("@type.builtin",                  { fg = c.cyan, italic = true })
link("@type.definition",             "Typedef")

link("@attribute",                   "PreProc")
link("@attribute.builtin",           "Special")
link("@property",                    "Identifier")

-- functions
link("@function",                    "Function")
hi("@function.builtin",              { fg = c.bright_yellow })
link("@function.call",               "Function")
link("@function.macro",              "Macro")
link("@function.method",             "Function")
link("@function.method.call",        "Function")
link("@constructor",                 "Type")
link("@operator",                    "Operator")

-- keywords
link("@keyword",                     "Keyword")
link("@keyword.coroutine",           "Keyword")
link("@keyword.function",            "Keyword")
link("@keyword.operator",            "Keyword")
link("@keyword.import",              "Include")
link("@keyword.type",                "Keyword")
link("@keyword.modifier",            "Keyword")
link("@keyword.repeat",              "Repeat")
link("@keyword.return",              "Keyword")
link("@keyword.debug",               "Debug")
link("@keyword.exception",           "Exception")
link("@keyword.conditional",         "Conditional")
link("@keyword.conditional.ternary", "Conditional")
link("@keyword.directive",           "PreProc")
link("@keyword.directive.define",    "Define")

-- punctuation
link("@punctuation.delimiter",       "Delimiter")
link("@punctuation.bracket",         "Delimiter")
link("@punctuation.special",         "Special")

-- comments
link("@comment",                     "Comment")
link("@comment.documentation",       "Comment")
hi("@comment.error",                 { fg = c.bg0, bg = c.bright_red,    bold = true })
hi("@comment.warning",               { fg = c.bg0, bg = c.bright_yellow, bold = true })
hi("@comment.todo",                  { fg = c.bg0, bg = c.yellow,        bold = true })
hi("@comment.note",                  { fg = c.bg0, bg = c.blue,          bold = true })

-- markup (markdown, help, etc.)
hi("@markup.strong",                 { bold = true })
hi("@markup.italic",                 { italic = true })
hi("@markup.strikethrough",          { strikethrough = true })
hi("@markup.underline",              { underline = true })
link("@markup.heading",              "Title")
hi("@markup.heading.1",              { fg = c.bright_yellow,  bold = true })
hi("@markup.heading.2",              { fg = c.bright_red,     bold = true })
hi("@markup.heading.3",              { fg = c.bright_green,   bold = true })
hi("@markup.heading.4",              { fg = c.bright_cyan,    bold = true })
hi("@markup.heading.5",              { fg = c.bright_blue,    bold = true })
hi("@markup.heading.6",              { fg = c.bright_magenta, bold = true })
hi("@markup.quote",                  { fg = c.fg_dim, italic = true })
link("@markup.math",                 "Special")
hi("@markup.link",                   { fg = c.blue })
link("@markup.link.label",           "Special")
link("@markup.link.url",             "@string.special.url")
hi("@markup.raw",                    { fg = c.green })
link("@markup.raw.block",            "@markup.raw")
hi("@markup.list",                   { fg = c.yellow })
hi("@markup.list.checked",           { fg = c.green })
hi("@markup.list.unchecked",         { fg = c.fg_muted })

-- diff
link("@diff.plus",                   "Added")
link("@diff.minus",                  "Removed")
link("@diff.delta",                  "Changed")

-- tags (html / jsx / xml)
hi("@tag",                           { fg = c.magenta })
link("@tag.builtin",                 "@tag")
hi("@tag.attribute",                 { fg = c.fg_dim, italic = true })
link("@tag.delimiter",               "Delimiter")

-- ============================================================
-- 17. REMAINING NEOVIM-INTERNAL / MISC LINKS
-- ============================================================
hi("NvimInternalError", { fg = c.bg1, bg = c.red })
link("NvimInvalid", "Error")
link("NvimInvalidSpacing", "ErrorMsg")
link("NvimInvalidSingleQuotedUnknownEscape", "NvimInternalError")
link("NvimSingleQuotedUnknownEscape",        "NvimInternalError")
link("NvimFigureBrace", "NvimInternalError")
hi("NvimIdentifier",   { link = "Identifier" })
hi("NvimNumber",       { link = "Number" })
hi("NvimNumberPrefix", { link = "Type" })
hi("NvimOptionSigil",  { link = "Type" })
hi("NvimString",       { link = "String" })
hi("NvimSpacing",      { link = "Normal" })
for _, g in ipairs({ "Arrow", "Colon", "Comma", "Parenthesis" }) do
  link("Nvim" .. g, "Delimiter")
end

hi("RedrawDebugNormal",    { reverse = true })
hi("RedrawDebugClear",     { fg = c.bg1, bg = c.yellow })
hi("RedrawDebugComposed",  { fg = c.bg1, bg = c.green })
hi("RedrawDebugRecompose", { fg = c.bg1, bg = c.bright_red })

-- ============================================================
-- 18. FZF-LUA
-- ============================================================
link("FzfLuaNormal",             "NormalFloat")
link("FzfLuaBorder",             "FloatBorder")
link("FzfLuaTitle",              "FloatTitle")
link("FzfLuaCursor",             "Cursor")
link("FzfLuaCursorLine",         "CursorLine")
link("FzfLuaCursorLineNr",       "CursorLineNr")
link("FzfLuaScrollFloatEmpty",   "PmenuSbar")
link("FzfLuaScrollFloatFull",    "PmenuThumb")
link("FzfLuaSearch",             "IncSearch")
link("FzfLuaPreviewNormal",      "NormalFloat")
link("FzfLuaPreviewBorder",      "FloatBorder")

-- ============================================================
-- 19. EXTRAS NOT IN THE REFERENCE SET (NvimTree / Neo-tree)
-- kept for file-tree plugin support
-- ============================================================
hi("NvimTreeNormal",     { fg = c.fg,        bg = c.bg0 })
hi("NvimTreeNormalNC",   { fg = c.fg,        bg = c.bg0 })
hi("NvimTreeEndOfBuffer",{ fg = c.bg0,       bg = c.bg0 })
hi("NvimTreeWinSeparator",{ fg = c.bg0,      bg = c.bg0 })
hi("NvimTreeFolderIcon", { fg = c.yellow })
hi("NvimTreeFolderName", { fg = c.fg_dim })
hi("NvimTreeOpenedFolderName", { fg = c.bright_yellow, bold = true })
hi("NvimTreeRootFolder", { fg = c.yellow, bold = true })
hi("NvimTreeIndentMarker", { fg = c.bg3 })
hi("NvimTreeGitDirty",   { fg = c.yellow })
hi("NvimTreeGitNew",     { fg = c.green })
hi("NvimTreeGitDeleted", { fg = c.red })

hi("NeoTreeNormal",        { fg = c.fg, bg = c.bg0 })
hi("NeoTreeNormalNC",      { fg = c.fg, bg = c.bg0 })
hi("NeoTreeEndOfBuffer",   { fg = c.bg0, bg = c.bg0 })
hi("NeoTreeWinSeparator",  { fg = c.bg0, bg = c.bg0 })
hi("NeoTreeFloatBorder",   { fg = c.border, bg = c.bg2 })
hi("NeoTreeDirectoryIcon", { fg = c.yellow })
hi("NeoTreeDirectoryName", { fg = c.fg_dim })
hi("NeoTreeRootName",      { fg = c.yellow, bold = true })
hi("NeoTreeIndentMarker",  { fg = c.bg3 })
hi("NeoTreeGitAdded",      { fg = c.green })
hi("NeoTreeGitModified",   { fg = c.yellow })
hi("NeoTreeGitDeleted",    { fg = c.red })
hi("NeoTreeGitUntracked",  { fg = c.bright_green })

return c
