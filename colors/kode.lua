-- Koda — a restrained, mostly-grayscale nvim colorscheme. Syntax stays
-- muted on purpose (keywords/types/operators share one gray, comments
-- sit a shade darker); only functions, strings and special tokens pop
-- in near-white, and real color is spent on things that carry meaning
-- (diagnostics, git, links) rather than decorating every keyword.
--
-- FILE LOCATION (required for :colorscheme to find it):
--   ~/.config/nvim/colors/koda.lua

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
vim.g.colors_name = "koda"

-- ============================================================
-- 1. PALETTE
-- stylua: ignore
-- ============================================================
---@class koda.Palette
local c = {
  bg         = "#101010",
  fg         = "#b0b0b0",
  dim        = "#474747",
  line       = "#272727",
  keyword    = "#777777",
  type       = "#777777",
  operator   = "#777777",
  comment    = "#50585d",
  border     = "#ffffff",
  emphasis   = "#ffffff",
  func       = "#ffffff",
  string     = "#ffffff",
  char       = "#ffffff",
  special    = "#ffffff",
  const      = "#d9ba73",
  highlight  = "#458ee6",
  info       = "#8ebeec",
  success    = "#86cd82",
  warning    = "#d9ba73",
  danger     = "#ff7676",
  green      = "#14ba19",
  orange     = "#ff5733",
  red        = "#701516",
  pink       = "#f2a4db",
  cyan       = "#5abfb5",
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
local function clear(group)
  vim.api.nvim_set_hl(0, group, {})
end

-- ============================================================
-- 3. CORE EDITOR UI
-- ============================================================
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalNC", { fg = c.dim, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.line })
hi("FloatBorder", { fg = c.border, bg = c.line })
hi("FloatTitle", { fg = c.emphasis, bg = c.line, bold = true })
hi("FloatShadow", { bg = c.bg })
hi("FloatShadowThrough", { bg = c.bg })

hi("SignColumn", { fg = c.dim, bg = c.bg })
hi("LineNr", { fg = c.dim, bg = c.bg })
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
hi("CursorLineNr", { fg = c.emphasis, bg = c.line, bold = true })
hi("CursorLine", { bg = c.line })
link("CursorLineSign", "SignColumn")
link("CursorLineFold", "FoldColumn")
hi("CursorColumn", { bg = c.line })
hi("Cursor", { fg = c.bg, bg = c.fg })
hi("lCursor", { fg = c.bg, bg = c.fg })
hi("TermCursor", { reverse = true })
hi("ColorColumn", { bg = c.line })

hi("Visual", { bg = c.dim })
hi("VisualNOS", { bg = c.dim })
hi("Search", { fg = c.bg, bg = c.highlight })
hi("IncSearch", { fg = c.bg, bg = c.warning, bold = true })
link("CurSearch", "IncSearch")
link("Substitute", "Search")
link("QuickFixLine", "Search")

hi("MatchParen", { fg = c.highlight, bold = true, underline = true })

hi("Pmenu", { fg = c.fg, bg = c.line })
hi("PmenuSel", { fg = c.bg, bg = c.highlight, bold = true })
hi("PmenuSbar", { bg = c.line })
hi("PmenuThumb", { bg = c.dim })
link("PmenuKind", "Pmenu")
link("PmenuKindSel", "PmenuSel")
link("PmenuExtra", "Pmenu")
link("PmenuExtraSel", "PmenuSel")

hi("WinSeparator", { fg = c.dim, bg = c.bg })
link("VertSplit", "WinSeparator")

hi("StatusLine", { fg = c.fg, bg = c.line, bold = true })
hi("StatusLineNC", { fg = c.dim, bg = c.line })
link("MsgSeparator", "StatusLine")

hi("TabLine", { fg = c.dim, bg = c.line })
hi("TabLineSel", { fg = c.bg, bg = c.highlight, bold = true })
hi("TabLineFill", { fg = c.dim, bg = c.line })
hi("TabLineSep", { fg = c.bg, bg = c.bg })
hi("TabLineSelSep", { fg = c.highlight, bg = c.line, bold = true })

hi("WildMenu", { fg = c.bg, bg = c.highlight })
hi("Directory", { fg = c.highlight })
hi("Title", { fg = c.emphasis, bold = true })

hi("NonText", { fg = c.dim })
link("EndOfBuffer", "NonText")
link("Whitespace", "NonText")

hi("Folded", { fg = c.dim, bg = c.line })
hi("FoldColumn", { fg = c.dim, bg = c.bg })

hi("ModeMsg", { bold = true })
hi("MoreMsg", { fg = c.info, bold = true })
hi("Question", { fg = c.info, bold = true })
hi("WarningMsg", { fg = c.warning })
hi("ErrorMsg", { fg = c.bg, bg = c.danger })

hi("Ignore", { fg = c.bg })
link("Conceal", "Ignore")
hi("SpecialKey", { fg = c.special })

for i = 1, 9 do
  hi("User" .. i, { fg = c.fg, bg = c.line })
end
hi("WinBar", { bold = true })
link("WinBarNC", "WinBar")

-- ============================================================
-- 4. SYNTAX GROUPS
--    keyword/type/operator deliberately share one muted gray;
--    func/string/char/special/emphasis/border deliberately share
--    near-white — that flatness is the point of this theme.
-- ============================================================
hi("Comment", { fg = c.comment, italic = true })

hi("Constant", { fg = c.const })
hi("String", { fg = c.string })
link("Character", "String")
link("Number", "Constant")
link("Boolean", "Constant")
link("Float", "Number")

hi("Identifier", { fg = c.fg })
hi("Function", { fg = c.func })

hi("Statement", { fg = c.keyword })
link("Conditional", "Statement")
link("Repeat", "Statement")
link("Label", "Statement")
link("Keyword", "Statement")
link("Exception", "Statement")
hi("Operator", { fg = c.operator })

hi("PreProc", { fg = c.special })
link("Include", "PreProc")
link("Define", "PreProc")
link("Macro", "PreProc")
link("PreCondit", "PreProc")

hi("Type", { fg = c.type })
link("StorageClass", "Type")
link("Structure", "Type")
link("Typedef", "Type")

hi("Special", { fg = c.special })
link("Tag", "Special")
link("SpecialChar", "Special")
link("Delimiter", "Special")
link("SpecialComment", "Special")
link("Debug", "Special")

hi("Underlined", { fg = c.highlight, underline = true })
hi("Error", { fg = c.bg, bg = c.danger })
hi("Todo", { fg = c.bg, bg = c.warning, bold = true })

-- ============================================================
-- 5. DIAGNOSTICS
-- ============================================================
hi("DiagnosticError", { fg = c.danger })
hi("DiagnosticWarn", { fg = c.warning })
hi("DiagnosticInfo", { fg = c.info })
hi("DiagnosticHint", { fg = c.dim })
hi("DiagnosticOk", { fg = c.success })

link("DiagnosticErrorFloating", "DiagnosticError")
link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticWarningFloating", "DiagnosticWarn")
link("DiagnosticFloatingWarn", "DiagnosticWarn")
link("DiagnosticFloatingWarning", "DiagnosticWarn")
link("DiagnosticHintFloating", "DiagnosticHint")
link("DiagnosticFloatingHint", "DiagnosticHint")
link("DiagnosticFloatingInfo", "DiagnosticInfo")
link("DiagnosticFloatingOk", "DiagnosticOk")
hi("DiagnosticWarning", { fg = c.warning })

hi("DiagnosticSignError", { fg = c.danger, bg = c.bg })
hi("DiagnosticSignWarn", { fg = c.warning, bg = c.bg })
hi("DiagnosticSignInfo", { fg = c.info, bg = c.bg })
hi("DiagnosticSignHint", { fg = c.dim, bg = c.bg })
link("DiagnosticSignOk", "DiagnosticOk")

hi("DiagnosticVirtualTextError", { fg = c.danger, bg = c.line })
hi("DiagnosticVirtualTextWarn", { fg = c.warning, bg = c.line })
hi("DiagnosticVirtualTextInfo", { fg = c.info, bg = c.line })
hi("DiagnosticVirtualTextHint", { fg = c.dim, bg = c.line })
link("DiagnosticVirtualTextOk", "DiagnosticOk")
link("DiagnosticVirtualTextWarning", "DiagnosticVirtualTextWarn")

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.danger })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.warning })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.info })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.dim })
link("DiagnosticUnderlineOk", "DiagnosticOk")

hi("DiagnosticDeprecated", { sp = c.dim, strikethrough = true })
hi("DiagnosticUnnecessary", { fg = c.dim, underline = true })

-- ============================================================
-- 6. LSP
-- ============================================================
hi("LspReferenceText", { fg = c.fg, bg = c.line, bold = true, undercurl = true, sp = c.highlight })
hi("LspReferenceRead", { bg = c.line, bold = true, undercurl = true, sp = c.highlight })
hi("LspReferenceWrite", { bg = c.line, bold = true, undercurl = true, sp = c.highlight })
hi("LspSignatureActiveParameter", { bold = true, italic = true, underline = true, sp = c.highlight })
link("LspCodeLens", "Comment")
hi("LspBorderBG", { fg = c.dim, bg = c.bg })
hi("LspFloatWinNormal", { fg = c.fg, bg = c.line })
hi("LspInlayHint", { fg = c.dim, bg = c.line, italic = true })

link("@lsp.type.comment", "Comment")
link("@lsp.type.decorator", "Function")
link("@lsp.type.enumMember", "Constant")
link("@lsp.type.function", "Function")
link("@lsp.type.method", "Function")
link("@lsp.type.parameter", "Identifier")
link("@lsp.type.property", "Identifier")
link("@lsp.type.type", "Type")
link("@lsp.type.variable", "Identifier")

-- ============================================================
-- 7. DIFF / GIT
-- ============================================================
hi("DiffAdd", { fg = c.bg, bg = c.success })
hi("DiffChange", { fg = c.bg, bg = c.warning })
hi("DiffDelete", { fg = c.bg, bg = c.danger, bold = true })
hi("DiffText", { fg = c.bg, bg = c.highlight, bold = true })
hi("DiffAdded", { fg = c.success, bg = c.bg })
hi("DiffRemoved", { fg = c.danger, bg = c.bg })

hi("GitSignsAdd", { fg = c.success, bg = c.bg })
hi("GitSignsChange", { fg = c.warning, bg = c.bg })
hi("GitSignsDelete", { fg = c.danger, bg = c.bg })

hi("gitCommitBranch", { fg = c.orange })
hi("gitCommitSelectedFile", { fg = c.green })
hi("gitCommitSelectedType", { fg = c.green })
hi("gitCommitUnmergedFile", { fg = c.red })
hi("gitCommitUnmergedType", { fg = c.red })
link("gitCommitDiscardedFile", "gitCommitUnmergedFile")
link("gitCommitDiscardedType", "gitCommitUnmergedType")
link("gitCommitUntrackedFile", "gitCommitUnmergedFile")
link("gitCommitFile", "Directory")

-- ============================================================
-- 8. SCROLLBAR
-- ============================================================
hi("ScrollbarHandle", { bg = c.line })
hi("ScrollbarCursor", { fg = c.bg })
hi("ScrollbarCursorHandle", { fg = c.bg, bg = c.bg })
for _, pair in ipairs({
  { "Error", c.danger },
  { "Warn", c.warning },
  { "Info", c.info },
  { "Hint", c.dim },
  { "Misc", c.cyan },
  { "Search", c.highlight },
  { "GitAdd", c.success },
  { "GitChange", c.warning },
  { "GitDelete", c.danger },
}) do
  local name, color = pair[1], pair[2]
  hi("Scrollbar" .. name, { fg = color })
  hi("Scrollbar" .. name .. "Handle", { fg = color, bg = c.bg })
end

-- ============================================================
-- 9. TELESCOPE
-- ============================================================
hi("TelescopeNormal", { fg = c.fg, bg = c.line })
hi("TelescopeBorder", { fg = c.border, bg = c.line })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.dim })
hi("TelescopePromptBorder", { fg = c.emphasis, bg = c.dim })
hi("TelescopeTitle", { fg = c.emphasis, bg = c.line, bold = true })
link("TelescopePromptTitle", "Title")
link("TelescopePromptPrefix", "Title")
link("TelescopePromptCounter", "TelescopeBorder")
link("TelescopeResultsTitle", "Title")
link("TelescopeResultsBorder", "TelescopeBorder")
link("TelescopePreviewBorder", "TelescopeBorder")
link("TelescopePreviewTitle", "Title")
hi("TelescopeSelection", { bg = c.dim, bold = true })
hi("TelescopeSelectionCaret", { fg = c.fg, bg = c.highlight })
link("TelescopePreviewLine", "TelescopeSelection")
link("TelescopeMatching", "Special")
hi("TelescopeMultiSelection", {})
hi("TelescopeMultiIcon", {})
hi("TelescopeResultsNormal", {})
hi("TelescopeResultsLineNr", {})
hi("TelescopeResultsComment", {})
hi("TelescopeResultsFunction", {})
hi("TelescopeResultsMethod", {})
hi("TelescopeResultsIdentifier", {})
hi("TelescopeResultsVariable", {})
hi("TelescopeResultsField", {})
hi("TelescopeResultsClass", {})
hi("TelescopeResultsStruct", {})
hi("TelescopeResultsConstant", {})
hi("TelescopeResultsNumber", {})
hi("TelescopeResultsOperator", {})
hi("TelescopeResultsSpecialComment", {})
hi("TelescopeResultsDiffUntracked", {})
link("TelescopeResultsFileIcon", "Special")
hi("TelescopePreviewNormal", {})
for _, g in ipairs({
  "Block",
  "CharDev",
  "Date",
  "Directory",
  "Execute",
  "Group",
  "Hyphen",
  "Link",
  "Match",
  "Message",
  "MessageFillchar",
  "Pipe",
  "Read",
  "Size",
  "Socket",
  "Sticky",
  "User",
  "Write",
}) do
  hi("TelescopePreview" .. g, {})
end

-- ============================================================
-- 10. WHICHKEY
-- ============================================================
hi("WhichKeyFloat", { bg = c.line })
hi("WhichKeyBorder", { bg = c.line })
hi("WhichKey", { fg = c.fg, bg = c.line })
hi("WhichKeyGroup", { fg = c.danger, bg = c.line })
hi("WhichKeyDesc", { fg = c.highlight, bg = c.line })
hi("WhichKeyValue", { fg = c.dim })
hi("WhichKeySeparator", { fg = c.dim, bg = c.line })

-- ============================================================
-- 11. LAZY.NVIM
-- ============================================================
hi("LazyH1", { fg = c.bg, bg = c.highlight })
hi("LazyH2", { fg = c.danger, bg = c.bg })
hi("LazyButton", { bg = c.line })
hi("LazyButtonActive", { fg = c.bg, bg = c.highlight })
hi("LazyNormal", { bg = c.line })
hi("LazySpecial", { fg = c.pink })
for _, g in ipairs({
  "Comment",
  "Commit",
  "CommitIssue",
  "CommitScope",
  "CommitType",
  "Dimmed",
  "Dir",
  "Local",
  "NoCond",
  "ProgressDone",
  "ProgressTodo",
  "Prop",
  "ReasonCmd",
  "ReasonEvent",
  "ReasonFt",
  "ReasonImport",
  "ReasonKeys",
  "ReasonPlugin",
  "ReasonRuntime",
  "ReasonSource",
  "ReasonStart",
  "TaskError",
  "TaskOutput",
  "Url",
  "Value",
}) do
  hi("Lazy" .. g, {})
end

-- ============================================================
-- 12. MASON
-- ============================================================
hi("MasonHeader", { fg = c.bg, bg = c.highlight, bold = true })
hi("MasonHighlight", { fg = c.highlight, bg = c.bg })
hi("MasonMuted", { fg = c.dim, bg = c.bg })
link("MasonHeaderSecondary", "LazyButtonActive")
link("MasonHighlightBlockBold", "LazyButtonActive")
link("MasonHighlightBlock", "LazyButtonActive")
link("MasonMutedBlockBold", "MasonHighlight")
link("MasonMutedBlock", "MasonMuted")
hi("MasonHeading", {})
hi("MasonError", {})
hi("MasonWarning", {})
hi("MasonHighlightSecondary", {})
hi("MasonHighlightBlockSecondary", {})
hi("MasonHighlightBlockBoldSecondary", {})

-- ============================================================
-- 13. INDENT-BLANKLINE
-- ============================================================
hi("IblIndent", { fg = c.line, nocombine = true })
hi("IblScope", { fg = c.highlight, nocombine = true })
hi("IblWhitespace", { fg = c.line, nocombine = true })
link("IndentBlanklineChar", "IblIndent")
link("IndentBlanklineContextChar", "IblScope")

-- ============================================================
-- 14. FILETYPE-SPECIFIC
-- ============================================================
hi("htmlArg", { fg = c.const })
hi("htmlTag", { fg = c.dim })
hi("htmlTagName", { fg = c.keyword })
link("htmlEndTag", "htmlTag")
hi("htmlBold", { bold = true })
hi("htmlItalic", { italic = true })
hi("htmlUnderline", { underline = true })
hi("htmlUnderlineItalic", { italic = true, underline = true })
hi("htmlBoldItalic", { bold = true, italic = true })
hi("htmlBoldUnderline", { bold = true, underline = true })
hi("htmlBoldUnderlineItalic", { bold = true, italic = true, underline = true })
hi("htmlH1", { fg = c.emphasis, bold = true })
link("htmlLink", "Underlined")

link("markdownCodeBlock", "String")
link("markdownCodeDelimiter", "NonText")
link("markdownHeadingRule", "NonText")
link("markdownLinkDelimiter", "Delimiter")
link("markdownURLDelimiter", "Delimiter")
hi("markdownBold", { bold = true })
hi("markdownItalic", { italic = true })

hi("phpIdentifier", { fg = c.fg })
hi("phpSpecialFunction", { fg = c.func })
link("phpDefine", "Statement")
link("phpHereDoc", "String")
link("phpVarSelector", "phpIdentifier")

hi("rubyInstanceVariable", { fg = c.const })
link("rubyConstant", "Constant")
link("rubyDefine", "Statement")
link("rubyLocalVariableOrMethod", "Identifier")

link("xmlAttrib", "xmlTag")
link("xmlEndTag", "xmlTag")
link("xmlEqual", "xmlTag")
hi("xmlTag", { fg = c.dim })
hi("xmlTagName", { fg = c.keyword })
link("xmlString", "xmlTagName")

hi("mustacheMarker", { fg = c.const })
hi("mustachePartial", { fg = c.const })
hi("mustacheVariable", { fg = c.keyword })
hi("mustacheVariableUnescape", { fg = c.danger })
hi("mustacheSection", { bold = true })

hi("netrwClassify", { fg = c.dim, bold = true })
hi("netrwExe", { fg = c.red })
link("NERDTreeExecFile", "String")
link("NERDTreeHelp", "Comment")

link("javaScript", "Normal")
link("javaScriptBraces", "Delimiter")
hi("lessVariable", { fg = c.const })
link("lessVariableValue", "Normal")
link("shDerefVar", "shDerefSimple")
hi("shDerefSimple", { fg = c.const })

link("vimContinue", "Delimiter")
link("vimHiAttrib", "Constant")
link("vimSetSep", "Delimiter")

link("helpExample", "String")
link("helpHeadline", "Title")
link("helpHyperTextEntry", "Statement")
link("helpHyperTextJump", "Underlined")
link("helpSectionDelim", "Comment")
link("helpURL", "Underlined")

hi("SyntasticErrorSign", { fg = c.danger })
hi("SyntasticWarningSign", { fg = c.warning })

-- ============================================================
-- 15. SPELL
-- ============================================================
hi("SpellBad", { sp = c.danger, undercurl = true })
hi("SpellCap", { sp = c.info, undercurl = true })
hi("SpellLocal", { sp = c.cyan, undercurl = true })
hi("SpellRare", { sp = c.pink, undercurl = true })

-- ============================================================
-- 16. TREESITTER (@ groups)
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
link("@text.diff.add", "DiffAdd")
link("@text.diff.delete", "DiffDelete")
link("@text.literal", "Comment")
link("@text.reference", "Identifier")
link("@text.title", "Title")
link("@text.todo", "Todo")
link("@text.underline", "Underlined")
link("@text.uri", "Underlined")
link("@type", "Type")
link("@variable", "Identifier")

-- ============================================================
-- 17. REMAINING NEOVIM-INTERNAL / MISC LINKS
-- ============================================================
hi("NvimInternalError", { fg = c.bg, bg = c.danger })
link("NvimInvalid", "Error")
link("NvimInvalidSpacing", "ErrorMsg")
link("NvimInvalidSingleQuotedUnknownEscape", "NvimInternalError")
link("NvimSingleQuotedUnknownEscape", "NvimInternalError")
link("NvimFigureBrace", "NvimInternalError")
link("NvimIdentifier", "Identifier")
link("NvimNumber", "Number")
link("NvimNumberPrefix", "Type")
link("NvimOptionSigil", "Type")
link("NvimString", "String")
link("NvimSpacing", "Normal")
for _, g in ipairs({ "Arrow", "Colon", "Comma", "Parenthesis" }) do
  link("Nvim" .. g, "Delimiter")
end

hi("RedrawDebugNormal", { reverse = true })
hi("RedrawDebugClear", { fg = c.bg, bg = c.warning })
hi("RedrawDebugComposed", { fg = c.bg, bg = c.info })
hi("RedrawDebugRecompose", { fg = c.bg, bg = c.orange })

-- ============================================================
-- 18. FZF-LUA
-- ============================================================
link("FzfLuaNormal", "Normal")
link("FzfLuaBorder", "Normal")
link("FzfLuaCursor", "Cursor")
link("FzfLuaCursorLine", "CursorLine")
link("FzfLuaCursorLineNr", "CursorLineNr")
link("FzfLuaScrollFloatEmpty", "PmenuSbar")
link("FzfLuaScrollFloatFull", "PmenuThumb")
link("FzfLuaSearch", "IncSearch")

-- ============================================================
-- 19. EXTRAS NOT IN THE REFERENCE SET (NvimTree / Neo-tree)
-- ============================================================
hi("NvimTreeNormal", { fg = c.fg, bg = c.line })
hi("NvimTreeFolderIcon", { fg = c.highlight })
hi("NvimTreeFolderName", { fg = c.highlight })
hi("NvimTreeOpenedFolderName", { fg = c.emphasis, bold = true })
hi("NvimTreeRootFolder", { fg = c.emphasis, bold = true })
hi("NvimTreeIndentMarker", { fg = c.dim })
hi("NvimTreeGitDirty", { fg = c.warning })
hi("NvimTreeGitNew", { fg = c.success })

hi("NeoTreeNormal", { fg = c.fg, bg = c.line })
hi("NeoTreeDirectoryIcon", { fg = c.highlight })
hi("NeoTreeDirectoryName", { fg = c.highlight })
hi("NeoTreeRootName", { fg = c.emphasis, bold = true })

return c
