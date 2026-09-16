-- Evergarden Spring — a full nvim colorscheme built on the evergarden palette
-- family, following the same section layout as classic.lua.
--
-- FILE LOCATION (required for :colorscheme to find it):
--   ~/.config/nvim/colors/evergarden_spring.lua

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
vim.g.colors_name = "evergarden_spring"

-- ============================================================
-- 1. PALETTE
-- ============================================================
local c = {
  red = "#f57f82",
  orange = "#f7a182",
  yellow = "#f5d098",
  lime = "#dbe6af",
  green = "#cbe3b3",
  aqua = "#b3e3ca",
  skye = "#b3e6db",
  snow = "#afd9e6",
  blue = "#b2caed",
  purple = "#d2bdf3",
  pink = "#f3c0e5",
  cherry = "#fae6ef",
  text = "#f8f9e8",
  subtext1 = "#adc9bc",
  subtext0 = "#96b4aa",
  overlay2 = "#839e9a",
  overlay1 = "#6f8788",
  overlay0 = "#58686d",
  surface2 = "#4a585c",
  surface1 = "#3e4a4f",
  surface0 = "#343e43",
  base = "#2b3438",
  mantle = "#232a2e",
  crust = "#1c2225",
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
hi("Normal",       { fg = c.text,     bg = c.base })
hi("NormalNC",     { fg = c.subtext0, bg = c.base })
hi("NormalFloat",  { fg = c.text,     bg = c.mantle })
hi("FloatBorder",  { fg = c.overlay0, bg = c.mantle })
hi("FloatTitle",   { fg = c.pink,     bg = c.mantle, bold = true })
hi("FloatShadow",         { bg = c.crust, blend = 40 })
hi("FloatShadowThrough",  { bg = c.crust, blend = 60 })

hi("SignColumn",   { fg = c.overlay0, bg = c.base })
hi("LineNr",       { fg = c.overlay0, bg = c.base })
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
hi("CursorLineNr", { fg = c.yellow, bg = c.surface0, bold = true })
hi("CursorLine",   { bg = c.surface0 })
link("CursorLineSign", "SignColumn")
link("CursorLineFold", "FoldColumn")
hi("CursorColumn", { bg = c.surface0 })
hi("Cursor",       { fg = c.base, bg = c.text })
hi("lCursor",      { fg = c.base, bg = c.text })
hi("TermCursor",   { reverse = true })
hi("ColorColumn",  { bg = c.surface0 })

hi("Visual",       { bg = c.surface1 })
hi("VisualNOS",    { bg = c.surface1 })
hi("Search",       { fg = c.base, bg = c.yellow })
hi("IncSearch",    { fg = c.base, bg = c.cherry, bold = true })
link("CurSearch",    "IncSearch")
link("Substitute",   "Search")
link("QuickFixLine", "Search")

hi("MatchParen",   { fg = c.cherry, bold = true, underline = true })

hi("Pmenu",        { fg = c.text, bg = c.mantle })
hi("PmenuSel",     { fg = c.base, bg = c.pink, bold = true })
hi("PmenuSbar",    { bg = c.surface0 })
hi("PmenuThumb",   { bg = c.surface2 })
link("PmenuKind",    "Pmenu")
link("PmenuKindSel", "PmenuSel")
link("PmenuExtra",   "Pmenu")
link("PmenuExtraSel","PmenuSel")

hi("WinSeparator", { fg = c.overlay0, bg = c.base })
link("VertSplit", "WinSeparator")

hi("StatusLine",   { fg = c.text,     bg = c.mantle, bold = true })
hi("StatusLineNC", { fg = c.subtext0, bg = c.mantle })
link("MsgSeparator", "StatusLine")

hi("TabLine",       { fg = c.overlay0, bg = c.mantle })
hi("TabLineSel",    { fg = c.base,     bg = c.yellow, bold = true })
hi("TabLineFill",   { fg = c.overlay0, bg = c.mantle })
hi("TabLineSep",    { fg = c.base,     bg = c.base })
hi("TabLineSelSep", { fg = c.yellow,   bg = c.surface0, bold = true })

hi("WildMenu",  { fg = c.base, bg = c.pink })
hi("Directory", { fg = c.blue })
hi("Title",     { fg = c.pink, bold = true })

hi("NonText",   { fg = c.overlay0 })
link("EndOfBuffer", "NonText")
link("Whitespace",  "NonText")

hi("Folded",    { fg = c.overlay1, bg = c.surface0 })
hi("FoldColumn",{ fg = c.overlay0, bg = c.base })

hi("ModeMsg",   { bold = true })
hi("MoreMsg",   { fg = c.aqua, bold = true })
hi("Question",  { fg = c.aqua, bold = true })
hi("WarningMsg",{ fg = c.orange })
hi("ErrorMsg",  { fg = c.base, bg = c.red })

hi("Ignore",    { fg = c.base })
link("Conceal", "Ignore")
hi("SpecialKey",{ fg = c.overlay0 })

for i = 1, 9 do
  hi("User" .. i, { fg = c.text, bg = c.surface0 })
end
hi("WinBar", { bold = true })
link("WinBarNC", "WinBar")

-- ============================================================
-- 4. SYNTAX GROUPS
-- ============================================================
hi("Comment",   { fg = c.overlay1, italic = true })

hi("Constant",  { fg = c.pink })
hi("String",    { fg = c.green })
link("Character", "String")
hi("Number",    { fg = c.orange })
link("Boolean",   "Number")
link("Float",     "Number")

hi("Identifier",{ fg = c.blue })
hi("Function",  { fg = c.aqua })

hi("Statement", { fg = c.purple, bold = true })
link("Conditional", "Statement")
link("Repeat",       "Statement")
link("Label",        "Statement")
link("Operator",     "Statement")
link("Keyword",      "Statement")
link("Exception",    "Statement")

hi("PreProc",   { fg = c.skye })
link("Include",   "PreProc")
link("Define",    "PreProc")
link("Macro",     "PreProc")
link("PreCondit", "PreProc")

hi("Type", { fg = c.yellow, bold = true })
link("StorageClass", "Type")
link("Structure",    "Type")
link("Typedef",      "Type")

hi("Special", { fg = c.cherry })
link("Tag",             "Special")
link("SpecialChar",    "Special")
link("Delimiter",       "Special")
link("SpecialComment",  "Special")
link("Debug",            "Special")

hi("Underlined", { fg = c.snow, underline = true })
hi("Error",      { fg = c.base, bg = c.red })
hi("Todo",       { fg = c.base, bg = c.yellow, bold = true })

-- ============================================================
-- 5. DIAGNOSTICS
-- ============================================================
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn",  { fg = c.orange })
hi("DiagnosticInfo",  { fg = c.blue })
hi("DiagnosticHint",  { fg = c.overlay1 })
hi("DiagnosticOk",    { fg = c.lime })

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

hi("DiagnosticSignError", { fg = c.red,    bg = c.base })
hi("DiagnosticSignWarn",  { fg = c.orange, bg = c.base })
hi("DiagnosticSignInfo",  { fg = c.blue,   bg = c.base })
hi("DiagnosticSignHint",  { fg = c.overlay1, bg = c.base })
link("DiagnosticSignOk", "DiagnosticOk")

hi("DiagnosticVirtualTextError", { fg = c.red,    bg = c.surface0 })
hi("DiagnosticVirtualTextWarn",  { fg = c.orange, bg = c.surface0 })
hi("DiagnosticVirtualTextInfo",  { fg = c.blue,   bg = c.surface0 })
hi("DiagnosticVirtualTextHint",  { fg = c.overlay1, bg = c.surface0 })
link("DiagnosticVirtualTextOk", "DiagnosticOk")
link("DiagnosticVirtualTextWarning", "DiagnosticVirtualTextWarn")

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.orange })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.overlay1 })
link("DiagnosticUnderlineOk", "DiagnosticOk")

hi("DiagnosticDeprecated",  { sp = c.overlay1, strikethrough = true })
hi("DiagnosticUnnecessary", { fg = c.overlay0, underline = true })

-- ============================================================
-- 6. LSP
-- ============================================================
hi("LspReferenceText",  { fg = c.blue, bg = c.surface0, bold = true, undercurl = true, sp = c.cherry })
hi("LspReferenceRead",  { bg = c.surface0, bold = true, undercurl = true, sp = c.cherry })
hi("LspReferenceWrite", { bg = c.surface0, bold = true, undercurl = true, sp = c.cherry })
hi("LspSignatureActiveParameter", { bold = true, italic = true, underline = true, sp = c.purple })
link("LspCodeLens", "Comment")
hi("LspBorderBG",       { fg = c.overlay0, bg = c.base })
hi("LspFloatWinNormal", { fg = c.text,     bg = c.mantle })
hi("LspInlayHint",      { fg = c.overlay0, bg = c.surface0, italic = true })

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
hi("DiffAdd",    { fg = c.base, bg = c.lime })
hi("DiffChange", { fg = c.base, bg = c.orange })
hi("DiffDelete", { fg = c.base, bg = c.red, bold = true })
hi("DiffText",   { fg = c.base, bg = c.yellow, bold = true })
hi("DiffAdded",  { fg = c.lime, bg = c.base })
hi("DiffRemoved",{ fg = c.red,  bg = c.base })

hi("GitSignsAdd",    { fg = c.lime,   bg = c.base })
hi("GitSignsChange", { fg = c.orange, bg = c.base })
hi("GitSignsDelete", { fg = c.red,    bg = c.base })

hi("gitCommitBranch",         { fg = c.orange })
hi("gitCommitSelectedFile",   { fg = c.lime })
hi("gitCommitSelectedType",   { fg = c.lime })
hi("gitCommitUnmergedFile",   { fg = c.red })
hi("gitCommitUnmergedType",   { fg = c.red })
link("gitCommitDiscardedFile", "gitCommitUnmergedFile")
link("gitCommitDiscardedType", "gitCommitUnmergedType")
link("gitCommitUntrackedFile", "gitCommitUnmergedFile")
link("gitCommitFile", "Directory")

-- ============================================================
-- 8. SCROLLBAR
-- ============================================================
hi("ScrollbarHandle",       { bg = c.surface1 })
hi("ScrollbarCursor",       { fg = c.base })
hi("ScrollbarCursorHandle", { fg = c.base, bg = c.base })
for _, pair in ipairs({
  { "Error",  c.red },
  { "Warn",   c.orange },
  { "Info",   c.blue },
  { "Hint",   c.overlay1 },
  { "Misc",   c.purple },
  { "Search", c.yellow },
  { "GitAdd",    c.lime },
  { "GitChange", c.orange },
  { "GitDelete", c.red },
}) do
  local name, color = pair[1], pair[2]
  hi("Scrollbar" .. name,        { fg = color })
  hi("Scrollbar" .. name .. "Handle", { fg = color, bg = c.base })
end

-- ============================================================
-- 9. TELESCOPE
-- ============================================================
hi("TelescopeNormal",        { fg = c.text, bg = c.mantle })
hi("TelescopeBorder",        { fg = c.overlay0, bg = c.mantle })
hi("TelescopePromptNormal",  { fg = c.text, bg = c.surface0 })
hi("TelescopePromptBorder",  { fg = c.pink, bg = c.surface0 })
hi("TelescopeTitle",         { fg = c.pink, bg = c.mantle, bold = true })
link("TelescopePromptTitle",   "Title")
link("TelescopePromptPrefix",  "Title")
link("TelescopePromptCounter", "TelescopeBorder")
link("TelescopeResultsTitle",  "Title")
link("TelescopeResultsBorder", "TelescopeBorder")
link("TelescopePreviewBorder", "TelescopeBorder")
link("TelescopePreviewTitle",  "Title")
hi("TelescopeSelection",     { fg = c.text, bg = c.surface1, bold = true })
hi("TelescopeSelectionCaret",{ fg = c.text, bg = c.pink })
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
link("TelescopeResultsFileIcon", "Special")
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
hi("WhichKeyFloat",     { bg = c.mantle })
hi("WhichKeyBorder",    { bg = c.mantle })
hi("WhichKey",          { fg = c.text,  bg = c.mantle })
hi("WhichKeyGroup",     { fg = c.red,   bg = c.mantle })
hi("WhichKeyDesc",      { fg = c.blue,  bg = c.mantle })
hi("WhichKeyValue",     { fg = c.overlay1 })
hi("WhichKeySeparator", { fg = c.overlay0, bg = c.mantle })

-- ============================================================
-- 11. LAZY.NVIM
-- ============================================================
hi("LazyH1",           { fg = c.base, bg = c.pink })
hi("LazyH2",            { fg = c.red, bg = c.base })
hi("LazyButton",        { bg = c.surface0 })
hi("LazyButtonActive",  { fg = c.base, bg = c.pink })
hi("LazyNormal",        { bg = c.mantle })
hi("LazySpecial",       { fg = c.purple })
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
hi("MasonHeader",        { fg = c.base, bg = c.pink, bold = true })
hi("MasonHighlight",     { fg = c.pink,   bg = c.base })
hi("MasonMuted",         { fg = c.overlay1, bg = c.base })
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
hi("IblIndent",     { fg = c.surface1, nocombine = true })
hi("IblScope",      { fg = c.pink,     nocombine = true })
hi("IblWhitespace", { fg = c.surface1, nocombine = true })
link("IndentBlanklineChar",        "IblIndent")
link("IndentBlanklineContextChar", "IblScope")

-- ============================================================
-- 14. FILETYPE-SPECIFIC
-- ============================================================
hi("htmlArg",      { fg = c.blue })
hi("htmlTag",       { fg = c.overlay1 })
hi("htmlTagName",   { fg = c.purple })
link("htmlEndTag", "htmlTag")
hi("htmlBold",              { bold = true })
hi("htmlItalic",            { italic = true })
hi("htmlUnderline",         { underline = true })
hi("htmlUnderlineItalic",   { italic = true, underline = true })
hi("htmlBoldItalic",        { bold = true, italic = true })
hi("htmlBoldUnderline",     { bold = true, underline = true })
hi("htmlBoldUnderlineItalic",{ bold = true, italic = true, underline = true })
hi("htmlH1",                { fg = c.pink, bold = true })
link("htmlLink", "Underlined")

link("markdownCodeBlock",     "String")
link("markdownCodeDelimiter", "NonText")
link("markdownHeadingRule",   "NonText")
link("markdownLinkDelimiter", "Delimiter")
link("markdownURLDelimiter",  "Delimiter")
hi("markdownBold",   { bold = true })
hi("markdownItalic", { italic = true })

hi("phpIdentifier",      { fg = c.blue })
hi("phpSpecialFunction", { fg = c.aqua })
link("phpDefine",  "Statement")
link("phpHereDoc", "String")
link("phpVarSelector", "phpIdentifier")

hi("rubyInstanceVariable",         { fg = c.pink })
link("rubyConstant", "Constant")
link("rubyDefine",   "Statement")
link("rubyLocalVariableOrMethod", "Identifier")

link("xmlAttrib",   "xmlTag")
link("xmlEndTag",   "xmlTag")
link("xmlEqual",    "xmlTag")
hi("xmlTag",         { fg = c.overlay1 })
hi("xmlTagName",     { fg = c.purple })
link("xmlString",   "xmlTagName")

hi("mustacheMarker",            { fg = c.pink })
hi("mustachePartial",           { fg = c.pink })
hi("mustacheVariable",          { fg = c.purple })
hi("mustacheVariableUnescape",  { fg = c.red })
hi("mustacheSection",           { bold = true })

hi("netrwClassify", { fg = c.overlay0, bold = true })
hi("netrwExe",       { fg = c.red })
link("NERDTreeExecFile", "String")
link("NERDTreeHelp",     "Comment")

link("javaScript", "Normal")
link("javaScriptBraces", "Delimiter")
hi("lessVariable",      { fg = c.pink })
link("lessVariableValue", "Normal")
link("shDerefVar", "shDerefSimple")
hi("shDerefSimple", { fg = c.pink })

link("vimContinue", "Delimiter")
link("vimHiAttrib",  "Constant")
link("vimSetSep",    "Delimiter")

link("helpExample",       "String")
link("helpHeadline",      "Title")
link("helpHyperTextEntry","Statement")
link("helpHyperTextJump", "Underlined")
link("helpSectionDelim",  "Comment")
link("helpURL",           "Underlined")

hi("SyntasticErrorSign",   { fg = c.red })
hi("SyntasticWarningSign", { fg = c.orange })

-- ============================================================
-- 15. SPELL
-- ============================================================
hi("SpellBad",   { sp = c.red,    undercurl = true })
hi("SpellCap",   { sp = c.blue,   undercurl = true })
hi("SpellLocal", { sp = c.pink,   undercurl = true })
hi("SpellRare",  { sp = c.orange, undercurl = true })

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
hi("NvimInternalError", { fg = c.base, bg = c.red })
link("NvimInvalid", "Error")
link("NvimInvalidSpacing", "ErrorMsg")
link("NvimInvalidSingleQuotedUnknownEscape", "NvimInternalError")
link("NvimSingleQuotedUnknownEscape",        "NvimInternalError")
link("NvimFigureBrace", "NvimInternalError")
link("NvimIdentifier",   "Identifier")
link("NvimNumber",       "Number")
link("NvimNumberPrefix", "Type")
link("NvimOptionSigil",  "Type")
link("NvimString",       "String")
link("NvimSpacing",      "Normal")
for _, g in ipairs({ "Arrow", "Colon", "Comma", "Parenthesis" }) do
  link("Nvim" .. g, "Delimiter")
end

hi("RedrawDebugNormal",    { reverse = true })
hi("RedrawDebugClear",     { fg = c.base, bg = c.yellow })
hi("RedrawDebugComposed",  { fg = c.base, bg = c.blue })
hi("RedrawDebugRecompose", { fg = c.base, bg = c.orange })

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
-- 19. EXTRAS NOT IN THE REFERENCE SET (NvimTree / Neo-tree)
-- ============================================================
hi("NvimTreeNormal",     { fg = c.text, bg = c.mantle })
hi("NvimTreeFolderIcon", { fg = c.blue })
hi("NvimTreeFolderName", { fg = c.blue })
hi("NvimTreeOpenedFolderName", { fg = c.pink, bold = true })
hi("NvimTreeRootFolder", { fg = c.pink, bold = true })
hi("NvimTreeIndentMarker", { fg = c.surface1 })
hi("NvimTreeGitDirty",   { fg = c.orange })
hi("NvimTreeGitNew",     { fg = c.lime })

hi("NeoTreeNormal",        { fg = c.text, bg = c.mantle })
hi("NeoTreeDirectoryIcon", { fg = c.blue })
hi("NeoTreeDirectoryName", { fg = c.blue })
hi("NeoTreeRootName",      { fg = c.pink, bold = true })

return c
