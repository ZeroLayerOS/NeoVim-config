--  ▄▄▄▄· ██▓    ▄▄▄· ▄▄· ▄ •▄     • ▌ ▄ ·.  ▄▄▄ .▄▄▄▄▄ ▄▄▄· ▄▄▌
--  ▐█ ▀█▪▓██▒   ▐█ ▀█▪▐█ ▌▪█▌▄▌▪    ·██ ▐███▪▀▄.▀·•██  ▐█ ▀█ ██•
--  ▐█▀▀█▄▒██░   ▐█▀▀█▄██ ▄▄▐▪▐█▌    ▐█ ▌▐▌▐█· ▐▀▀▪▄ ▐█.▪▄█▀▀█ ██▪
--  ██▓▪▐█▒██░   ██▓▪▐███▌▐▌██▐█▌    ██ ██▌▐█▌ ▐█▄▄▌ ▐█▌·▐█ ▪▐▌▐█▌▐▌
--  ▀▀▀▀ ░▓█▄▩▄▄░▀▀▀▀ ▀▀▀ ·▀▀▀▀▀·    ▀▀  █▪▀▀▀  ▀▀▀  ▀▀▀  ▀  ▀ .▀▀▀
-- black_metal.nvim — a colorscheme built from a black_metal kitty theme
--
-- FILE LOCATION (required for :colorscheme to find it):
--   ~/.config/nvim/colors/black_metal.lua

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
vim.g.colors_name = "black_metal"

-- ============================================================
-- 1. PALETTE — from the black_metal kitty theme (bg/cursor/etc. inferred)
-- ============================================================
local c = {
  -- given directly in the kitty theme
  bg3        = "#333333", -- color8 -- selection / hover / prompt bg
  fg_icon    = "#c1c1c1", -- color7/15 -- identifiers / types / secondary fg
  fg         = "#ffffff", -- foreground -- primary text
  yellow     = "#5f8787", -- color1/9  -- functions / active state (teal accent)
  orange_lt  = "#dd9999", -- color2/10 -- strings (dusty rose)
  orange     = "#a06666", -- color3/11 -- keywords / titles / errors (blood accent)
  orange_dk  = "#999999", -- color5/13 -- constants / numbers (cold gray)
  border     = "#333333", -- color8    -- borders / separators
  black      = "#000000",
  white      = "#ffffff", -- also selection_background

  -- inferred (not in the original kitty color list; background was implied
  -- by active/inactive_tab_background = #000000, everything else is a
  -- subtle near-black lift so panels/cursorline stay readable on pure black)
  bg0        = "#000000", -- deepest surface: gutters, floats, statusline, tabline
  bg1        = "#000000", -- base editor bg (true black, matches the kitty bg)
  bg2        = "#0d0d0d", -- panel / popup / results bg
  bg4        = "#1a1a1a", -- cursorline / lightest ui surface
  bg_alt     = "#0d0d0d", -- secondary surface
  fg_muted   = "#666666", -- inactive_tab_foreground -- comments, line numbers, muted UI
}

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
hi("NormalNC",     { fg = c.fg_muted, bg = c.bg1 })
hi("NormalFloat",  { fg = c.fg,       bg = c.bg2 })
hi("FloatBorder",  { fg = c.border,   bg = c.bg2 })
hi("FloatTitle",   { fg = c.orange,   bg = c.bg2, bold = true })
hi("FloatShadow",         { bg = c.black, blend = 40 })
hi("FloatShadowThrough",  { bg = c.black, blend = 60 })

hi("SignColumn",   { fg = c.fg_muted, bg = c.bg1 })
hi("LineNr",       { fg = c.fg_muted, bg = c.bg1 })
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
hi("CursorLineNr", { fg = c.orange,   bg = c.bg4, bold = true })
hi("CursorLine",   { bg = c.bg4 })
link("CursorLineSign", "SignColumn")
link("CursorLineFold", "FoldColumn")
hi("CursorColumn", { bg = c.bg4 })
hi("Cursor",       { fg = c.bg1, bg = c.fg })
hi("lCursor",      { fg = c.bg1, bg = c.fg })
hi("TermCursor",   { reverse = true })
hi("ColorColumn",  { bg = c.bg3 })

hi("Visual",       { bg = c.bg3 })
hi("VisualNOS",    { bg = c.bg3 })
hi("Search",       { fg = c.bg0, bg = c.yellow })
hi("IncSearch",    { fg = c.bg0, bg = c.orange_lt })
link("CurSearch",    "IncSearch")
link("Substitute",   "Search")
link("QuickFixLine", "Search")

hi("MatchParen",   { fg = c.orange, bold = true, underline = true })

hi("Pmenu",        { fg = c.fg, bg = c.bg2 })
hi("PmenuSel",     { fg = c.bg0, bg = c.orange, bold = true })
hi("PmenuSbar",    { bg = c.bg3 })
hi("PmenuThumb",   { bg = c.fg_muted })
link("PmenuKind",    "Pmenu")
link("PmenuKindSel", "PmenuSel")
link("PmenuExtra",   "Pmenu")
link("PmenuExtraSel","PmenuSel")

hi("WinSeparator", { fg = c.border, bg = c.bg1 })
link("VertSplit", "WinSeparator")

hi("StatusLine",   { fg = c.fg,       bg = c.bg_alt, bold = true })
hi("StatusLineNC", { fg = c.fg_muted, bg = c.bg_alt })
link("MsgSeparator", "StatusLine")

hi("TabLine",       { fg = c.fg_muted, bg = c.bg0 })
hi("TabLineSel",    { fg = c.bg0,      bg = c.orange, bold = true })
hi("TabLineFill",   { fg = c.orange_lt, bg = c.bg1 })
hi("TabLineSep",    { fg = c.bg0,      bg = c.bg1 })
hi("TabLineSelSep", { fg = c.orange,   bg = c.bg4, bold = true })

hi("WildMenu",  { fg = c.black, bg = c.orange_lt })
hi("Directory", { fg = c.orange_lt })
hi("Title",     { fg = c.orange, bold = true })

hi("NonText",   { fg = c.fg_muted, bold = true })
link("EndOfBuffer", "NonText")
link("Whitespace",  "NonText")

hi("Folded",    { fg = c.orange_lt, bg = c.bg2 })
hi("FoldColumn",{ fg = c.fg_muted, bg = c.bg1 })

hi("ModeMsg",   { bold = true })
hi("MoreMsg",   { fg = c.fg_icon, bold = true })
hi("Question",  { fg = c.fg_icon, bold = true })
hi("WarningMsg",{ fg = c.orange })
hi("ErrorMsg",  { fg = c.orange, bg = c.bg1 })

hi("Ignore",    { fg = c.fg_muted, underline = true })
link("Conceal", "Ignore")
hi("SpecialKey",{ fg = c.fg })

for i = 1, 9 do
  hi("User" .. i, { fg = c.fg, bg = c.orange_dk })
end
hi("WinBar", { bold = true })
link("WinBarNC", "WinBar")

-- ============================================================
-- 4. CLASSIC SYNTAX GROUPS
-- ============================================================
hi("Boolean",   { fg = c.orange_dk, bold = true })
hi("Comment",   { fg = c.fg_muted, italic = true })
hi("Constant",  { fg = c.orange_dk })
link("Character", "Constant")
hi("String",    { fg = c.orange_lt })
hi("Number",    { fg = c.orange_dk })
link("Float", "Number")

hi("Identifier",{ fg = c.fg_icon })
hi("Function",  { fg = c.yellow })

hi("Statement", { fg = c.orange, bold = true })
link("Conditional", "Statement")
link("Repeat",       "Statement")
link("Label",        "Statement")
link("Exception",    "Statement")

hi("Delimiter", { fg = c.fg_muted })
link("Operator", "Delimiter")

hi("Keyword",   { fg = c.orange, bold = true })
link("PreProc",   "Keyword")
link("Include",   "PreProc")
link("Define",    "PreProc")
link("Macro",     "PreProc")
link("PreCondit", "PreProc")

hi("Type", { fg = c.fg_icon, bold = true })
link("StorageClass", "Type")
link("Structure",    "Type")
link("Typedef",      "Type")

hi("Special", { fg = c.orange_lt })
link("SpecialChar",    "Special")
link("SpecialComment", "Special")
link("Tag",             "Special")
link("Debug",           "Special")

hi("Underlined", { fg = c.fg_icon, underline = true })
hi("Error",      { fg = c.fg, bg = c.orange, bold = true })
hi("Todo",       { fg = c.bg0, bg = c.yellow, bold = true, underline = true })

-- ============================================================
-- 5. DIAGNOSTICS
-- ============================================================
hi("DiagnosticError", { fg = c.orange })
hi("DiagnosticWarn",  { fg = c.orange_lt })
hi("DiagnosticInfo",  { fg = c.fg_icon })
hi("DiagnosticHint",  { fg = c.fg_muted })
hi("DiagnosticOk",    { fg = c.yellow })

link("DiagnosticErrorFloating", "DiagnosticError")
link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticWarningFloating", "DiagnosticWarn")
link("DiagnosticFloatingWarn", "DiagnosticWarn")
link("DiagnosticFloatingWarning", "DiagnosticWarn")
link("DiagnosticHintFloating", "DiagnosticHint")
link("DiagnosticFloatingHint", "DiagnosticHint")
link("DiagnosticFloatingInfo", "DiagnosticInfo")
link("DiagnosticFloatingOk", "DiagnosticOk")
hi("DiagnosticWarning", { fg = c.orange })

hi("DiagnosticSignError", { fg = c.orange,    bg = c.bg1 })
hi("DiagnosticSignWarn",  { fg = c.orange_lt, bg = c.bg1 })
hi("DiagnosticSignInfo",  { fg = c.fg_icon,   bg = c.bg1 })
hi("DiagnosticSignHint",  { fg = c.fg_muted,  bg = c.bg1 })
link("DiagnosticSignOk", "DiagnosticOk")

hi("DiagnosticVirtualTextError", { fg = c.orange,    bg = c.bg2 })
hi("DiagnosticVirtualTextWarn",  { fg = c.orange_lt, bg = c.bg2 })
hi("DiagnosticVirtualTextInfo",  { fg = c.fg_icon,   bg = c.bg2 })
hi("DiagnosticVirtualTextHint",  { fg = c.fg_muted,  bg = c.bg2 })
link("DiagnosticVirtualTextOk", "DiagnosticOk")
link("DiagnosticVirtualTextWarning", "DiagnosticVirtualTextWarn")

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.orange })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.orange_lt })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.fg_icon })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.fg_muted })
link("DiagnosticUnderlineOk", "DiagnosticOk")

hi("DiagnosticDeprecated",  { sp = c.fg_muted, strikethrough = true })
hi("DiagnosticUnnecessary", { fg = c.fg_muted, underline = true })

-- ============================================================
-- 6. LSP
-- ============================================================
hi("LspReferenceText",  { fg = c.fg_icon, bg = c.bg3, bold = true, undercurl = true, sp = c.orange_lt })
hi("LspReferenceRead",  { bg = c.bg3, bold = true, undercurl = true, sp = c.orange_lt })
hi("LspReferenceWrite", { bg = c.bg3, bold = true, undercurl = true, sp = c.orange_lt })
hi("LspSignatureActiveParameter", { bold = true, italic = true, underline = true, sp = c.yellow })
link("LspCodeLens", "Comment")
hi("LspBorderBG",       { fg = c.border,  bg = c.bg1 })
hi("LspFloatWinNormal", { fg = c.fg,      bg = c.bg2 })
hi("LspInlayHint",      { fg = c.fg_muted, bg = c.bg2, italic = true })

link("@lsp.type.comment",   "Comment")
link("@lsp.type.decorator", "Function")
link("@lsp.type.enumMember","Constant")
link("@lsp.type.function",  "Function")
link("@lsp.type.method",    "Function")
link("@lsp.type.parameter", "Identifier")
link("@lsp.type.property",  "Identifier")
link("@lsp.type.type",      "Type")
link("@lsp.type.variable",  "Identifier")

-- ============================================================
-- 7. DIFF / GIT
-- ============================================================
hi("DiffAdd",    { fg = c.bg1, bg = c.fg_icon })
hi("DiffChange", { fg = c.bg1, bg = c.orange_lt })
hi("DiffDelete", { fg = c.bg1, bg = c.orange, bold = true })
hi("DiffText",   { fg = c.bg1, bg = c.yellow, bold = true })
hi("DiffAdded",  { fg = c.fg_icon,  bg = c.bg1 })
hi("DiffRemoved",{ fg = c.orange,   bg = c.bg1 })

hi("GitSignsAdd",    { fg = c.fg_icon,   bg = c.bg1 })
hi("GitSignsChange", { fg = c.orange_lt, bg = c.bg1 })
hi("GitSignsDelete", { fg = c.orange,    bg = c.bg1 })

hi("gitCommitBranch",         { fg = c.orange })
hi("gitCommitSelectedFile",   { fg = c.fg_icon })
hi("gitCommitSelectedType",   { fg = c.fg_icon })
hi("gitCommitUnmergedFile",   { fg = c.orange_lt })
hi("gitCommitUnmergedType",   { fg = c.orange_lt })
link("gitCommitDiscardedFile", "gitCommitUnmergedFile")
link("gitCommitDiscardedType", "gitCommitUnmergedType")
link("gitCommitUntrackedFile", "gitCommitUnmergedFile")
link("gitCommitFile", "Directory")

-- ============================================================
-- 8. SCROLLBAR
-- ============================================================
hi("ScrollbarHandle",       { bg = c.bg3 })
hi("ScrollbarCursor",       { fg = c.bg1 })
hi("ScrollbarCursorHandle", { fg = c.bg1, bg = c.bg1 })
for _, pair in ipairs({
  { "Error",  c.orange },
  { "Warn",   c.orange_lt },
  { "Info",   c.fg_icon },
  { "Hint",   c.fg_muted },
  { "Misc",   c.orange_lt },
  { "Search", c.yellow },
  { "GitAdd",    c.fg_icon },
  { "GitChange", c.orange_lt },
  { "GitDelete", c.orange },
}) do
  local name, color = pair[1], pair[2]
  hi("Scrollbar" .. name,        { fg = color })
  hi("Scrollbar" .. name .. "Handle", { fg = color, bg = c.bg1 })
end

-- ============================================================
-- 9. TELESCOPE
-- ============================================================
hi("TelescopeNormal",        { fg = c.fg, bg = c.bg2 })
hi("TelescopeBorder",        { fg = c.border, bg = c.bg2 })
hi("TelescopePromptNormal",  { fg = c.fg, bg = c.bg3 })
hi("TelescopePromptBorder",  { fg = c.orange, bg = c.bg3 })
hi("TelescopeTitle",         { fg = c.orange_lt, bg = c.bg1, bold = true })
link("TelescopePromptTitle",   "Title")
link("TelescopePromptPrefix",  "Title")
link("TelescopePromptCounter", "TelescopeBorder")
link("TelescopeResultsTitle",  "Title")
link("TelescopeResultsBorder", "TelescopeBorder")
link("TelescopePreviewBorder", "TelescopeBorder")
link("TelescopePreviewTitle",  "Title")
hi("TelescopeSelection",     { fg = c.fg, bg = c.bg4, bold = true })
hi("TelescopeSelectionCaret",{ fg = c.fg, bg = c.orange })
link("TelescopePreviewLine", "TelescopeSelection")
link("TelescopeMatching", "Special")
hi("TelescopeMultiSelection", {})
hi("TelescopeMultiIcon",      {})
hi("TelescopeResultsNormal",  {})
hi("TelescopeResultsLineNr",  {})
hi("TelescopeResultsComment", {})
hi("TelescopeResultsFunction",{})
hi("TelescopeResultsMethod",  {})
hi("TelescopeResultsIdentifier",{})
hi("TelescopeResultsVariable",{})
hi("TelescopeResultsField",   {})
hi("TelescopeResultsClass",   {})
hi("TelescopeResultsStruct",  {})
hi("TelescopeResultsConstant",{})
hi("TelescopeResultsNumber",  {})
hi("TelescopeResultsOperator",{})
hi("TelescopeResultsSpecialComment", {})
hi("TelescopeResultsDiffUntracked", {})
hi("TelescopeResultsFileIcon", { link = "Special" })
hi("TelescopePreviewNormal",  {})
for _, g in ipairs({
  "Block","CharDev","Date","Directory","Execute","Group","Hyphen","Link",
  "Match","Message","MessageFillchar","Pipe","Read","Size","Socket",
  "Sticky","User","Write",
}) do
  hi("TelescopePreview" .. g, {})
end

-- ============================================================
-- 10. WHICHKEY
-- ============================================================
hi("WhichKeyFloat",     { bg = c.bg1 })
hi("WhichKeyBorder",    { bg = c.bg1 })
hi("WhichKey",          { fg = c.fg,     bg = c.bg1 })
hi("WhichKeyGroup",     { fg = c.orange_lt, bg = c.bg1 })
hi("WhichKeyDesc",      { fg = c.fg_icon,   bg = c.bg1 })
hi("WhichKeyValue",     { fg = c.fg_muted })
hi("WhichKeySeparator", { fg = c.fg_muted, bg = c.bg1 })

-- ============================================================
-- 11. LAZY.NVIM
-- ============================================================
hi("LazyH1",           { fg = c.orange_lt, bg = c.bg1 })
hi("LazyH2",            { fg = c.orange_lt, bg = c.bg1 })
hi("LazyButton",        { bg = c.bg1 })
hi("LazyButtonActive",  { fg = c.bg1, bg = c.orange_lt })
hi("LazyNormal",        { bg = c.bg2 })
hi("LazySpecial",       { fg = c.yellow })
for _, g in ipairs({
  "Comment","Commit","CommitIssue","CommitScope","CommitType","Dimmed","Dir",
  "Local","NoCond","ProgressDone","ProgressTodo","Prop","ReasonCmd",
  "ReasonEvent","ReasonFt","ReasonImport","ReasonKeys","ReasonPlugin",
  "ReasonRuntime","ReasonSource","ReasonStart","TaskError","TaskOutput",
  "Url","Value",
}) do
  hi("Lazy" .. g, {})
end

-- ============================================================
-- 12. MASON
-- ============================================================
hi("MasonHeader",        { fg = c.fg_icon, bg = c.bg1 })
hi("MasonHighlight",     { fg = c.orange_lt, bg = c.bg1 })
hi("MasonMuted",         { fg = c.yellow,   bg = c.bg1 })
link("MasonHeaderSecondary",         "LazyButtonActive")
link("MasonHighlightBlockBold",      "LazyButtonActive")
link("MasonHighlightBlock",          "LazyButtonActive")
link("MasonMutedBlockBold",          "MasonHighlight")
link("MasonMutedBlock",              "MasonMuted")
hi("MasonHeading", {})
hi("MasonError",   {})
hi("MasonWarning", {})
hi("MasonHighlightSecondary", {})
hi("MasonHighlightBlockSecondary", {})
hi("MasonHighlightBlockBoldSecondary", {})

-- ============================================================
-- 13. INDENT-BLANKLINE
-- ============================================================
hi("IblIndent",     { fg = c.bg4, nocombine = true })
hi("IblScope",      { fg = c.orange_dk, nocombine = true })
hi("IblWhitespace", { fg = c.bg4, nocombine = true })
link("IndentBlanklineChar",        "IblIndent")
link("IndentBlanklineContextChar", "IblScope")

-- ============================================================
-- 14. FILETYPE-SPECIFIC
-- ============================================================
hi("htmlArg",      { fg = c.fg_icon })
hi("htmlTag",       { fg = c.fg_icon })
hi("htmlTagName",   { fg = c.fg_icon })
link("htmlEndTag", "htmlTag")
hi("htmlBold",              { bold = true })
hi("htmlItalic",            { underline = true })
hi("htmlUnderline",         { underline = true })
hi("htmlUnderlineItalic",   { underline = true })
hi("htmlBoldItalic",        { bold = true, underline = true })
hi("htmlBoldUnderline",     { bold = true, underline = true })
hi("htmlBoldUnderlineItalic",{ bold = true, underline = true })
hi("htmlH1",                { bold = true })
link("htmlLink", "Underlined")

link("markdownCodeBlock",     "String")
link("markdownCodeDelimiter", "NonText")
link("markdownHeadingRule",   "NonText")
link("markdownLinkDelimiter", "Delimiter")
link("markdownURLDelimiter",  "Delimiter")
hi("markdownBold",   { bold = true })
hi("markdownItalic", { underline = true })

hi("phpIdentifier",      { fg = c.orange })
hi("phpSpecialFunction", { fg = c.orange_dk })
link("phpDefine",  "Statement")
link("phpHereDoc", "String")
link("phpVarSelector", "phpIdentifier")

hi("rubyInstanceVariable",         { fg = c.orange_dk })
link("rubyConstant", "Constant")
link("rubyDefine",   "Statement")
link("rubyLocalVariableOrMethod", "Identifier")

link("xmlAttrib",   "xmlTag")
link("xmlEndTag",   "xmlTag")
link("xmlEqual",    "xmlTag")
hi("xmlTag",         { fg = c.fg_icon })
hi("xmlTagName",     { fg = c.orange_lt })
link("xmlString",   "xmlTagName")

hi("mustacheMarker",            { fg = c.orange_dk })
hi("mustachePartial",           { fg = c.orange_dk })
hi("mustacheVariable",          { fg = c.yellow })
hi("mustacheVariableUnescape",  { fg = c.orange })
hi("mustacheSection",           { bold = true })

hi("netrwClassify", { fg = c.fg_muted, bold = true })
hi("netrwExe",       { fg = c.orange })
link("NERDTreeExecFile", "String")
link("NERDTreeHelp",     "Comment")

link("javaScript", "Normal")
link("javaScriptBraces", "Delimiter")
hi("lessVariable",      { fg = c.orange })
link("lessVariableValue", "Normal")
link("shDerefVar", "shDerefSimple")
hi("shDerefSimple", { fg = c.orange })

link("vimContinue", "Delimiter")
link("vimHiAttrib",  "Constant")
link("vimSetSep",    "Delimiter")

link("helpExample",       "String")
link("helpHeadline",      "Title")
link("helpHyperTextEntry","Statement")
link("helpHyperTextJump", "Underlined")
link("helpSectionDelim",  "Comment")
link("helpURL",           "Underlined")

hi("SyntasticErrorSign",   { fg = c.orange })
hi("SyntasticWarningSign", { fg = c.orange_lt })

-- ============================================================
-- 15. SPELL
-- ============================================================
hi("SpellBad",   { sp = c.fg, undercurl = true, fg = c.orange_lt })
hi("SpellCap",   { sp = c.fg, undercurl = true, fg = c.fg_icon })
hi("SpellLocal", { sp = c.fg, undercurl = true, fg = c.orange_lt })
hi("SpellRare",  { sp = c.fg, undercurl = true, fg = c.orange })

-- ============================================================
-- 16. TREESITTER (@ groups)
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
link("@text.diff.add",    "DiffAdd")
link("@text.diff.delete", "DiffDelete")
link("@text.literal",     "Comment")
link("@text.reference",   "Identifier")
link("@text.title",       "Title")
link("@text.todo",        "Todo")
link("@text.underline",   "Underlined")
link("@text.uri",         "Underlined")
link("@type",             "Type")
link("@variable",         "Identifier")

-- ============================================================
-- 17. REMAINING NEOVIM-INTERNAL / MISC LINKS
-- ============================================================
hi("NvimInternalError", { fg = c.bg1, bg = c.orange })
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
hi("RedrawDebugComposed",  { fg = c.bg1, bg = c.fg_icon })
hi("RedrawDebugRecompose", { fg = c.bg1, bg = c.orange_lt })

-- ============================================================
-- 18. FZF-LUA
-- ============================================================
link("FzfLuaNormal",             "Normal")
link("FzfLuaBorder",             "Normal")
link("FzfLuaCursor",             "Cursor")
link("FzfLuaCursorLine",         "CursorLine")
link("FzfLuaCursorLineNr",       "CursorLineNr")
link("FzfLuaScrollFloatEmpty",   "PmenuSbar")
link("FzfLuaScrollFloatFull",    "PmenuThumb")
link("FzfLuaSearch",             "IncSearch")

-- ============================================================
-- 19. EXTRAS NOT IN THE REFERENCE SET (NvimTree / Neo-tree / GitSigns extras)
-- kept from the original template for file-tree plugin support
-- ============================================================
hi("NvimTreeNormal",     { fg = c.fg,        bg = c.bg0 })
hi("NvimTreeFolderIcon", { fg = c.orange_lt })
hi("NvimTreeFolderName", { fg = c.fg_icon })
hi("NvimTreeOpenedFolderName", { fg = c.orange, bold = true })
hi("NvimTreeRootFolder", { fg = c.orange, bold = true })
hi("NvimTreeIndentMarker", { fg = c.bg4 })
hi("NvimTreeGitDirty",   { fg = c.orange_lt })
hi("NvimTreeGitNew",     { fg = c.yellow })

hi("NeoTreeNormal",        { fg = c.fg, bg = c.bg0 })
hi("NeoTreeDirectoryIcon", { fg = c.orange_lt })
hi("NeoTreeDirectoryName", { fg = c.fg_icon })
hi("NeoTreeRootName",      { fg = c.orange, bold = true })

return c
