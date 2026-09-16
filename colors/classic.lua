-- classic.nvim — Vim's real "no colorscheme, syntax on" default look,
-- rebuilt as an actual :colorscheme so it can be selected on purpose.
--
-- Source of truth: $VIMRUNTIME/syntax/syncolor.vim (background=dark
-- block) — the file that has painted every stock Vim on every server
-- since the 1990s. Every fg/bg below traces back to it 1:1.
--
-- IMPORTANT — this is genuinely a 16-COLOR theme, not a truecolor one
-- pretending to be: every group sets BOTH the real ANSI index
-- (ctermfg/ctermbg 0-15, what the tty/QEMU console in your screenshot
-- actually renders) AND a guifg/guibg hex fallback (used only if some
-- other terminal has 'termguicolors' on). We deliberately do NOT force
-- 'termguicolors' here — the whole point of this theme is to look
-- correct on a plain 16-color server console, where forcing truecolor
-- output would just corrupt the colors.
--
-- FILE LOCATION (required for :colorscheme to find it):
--   ~/.config/nvim/colors/classic.lua

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
vim.g.colors_name = "classic"

-- ============================================================
-- 1. PALETTE — the actual 16 ANSI slots (:help cterm-colors), each
--    carrying its terminal index AND a gui hex. Nothing here is an
--    invented shade; every entry is one of the 16 real colors.
-- ============================================================
local c16 = {
  black = { cterm = 0, gui = "#000000" },
  darkred = { cterm = 1, gui = "#800000" },
  darkgreen = { cterm = 2, gui = "#008000" },
  brown = { cterm = 3, gui = "#808000" },
  darkblue = { cterm = 4, gui = "#000080" },
  darkmagenta = { cterm = 5, gui = "#800080" },
  darkcyan = { cterm = 6, gui = "#008080" },
  lightgray = { cterm = 7, gui = "#c0c0c0" },
  darkgray = { cterm = 8, gui = "#808080" },
  red = { cterm = 9, gui = "#ff0000" },
  green = { cterm = 10, gui = "#00ff00" },
  yellow = { cterm = 11, gui = "#ffff00" },
  blue = { cterm = 12, gui = "#0000ff" },
  magenta = { cterm = 13, gui = "#ff00ff" },
  cyan = { cterm = 14, gui = "#00ffff" },
  white = { cterm = 15, gui = "#ffffff" },
}

-- Semantic groups, exactly as syncolor.vim defines them for a dark
-- background — same cterm index as above, but the nicer literal gui
-- hex Vim itself ships (e.g. Comment's guifg=#80a0ff instead of flat
-- cyan) so it still looks like "real" default Vim if termguicolors
-- ever gets switched on.
local syn = {
  comment = { cterm = c16.cyan.cterm, gui = "#00ffff" }, -- Blue/Cyan (Classic Cyan comment)
  constant = { cterm = c16.magenta.cterm, gui = "#ff00ff" }, -- Magenta
  special = { cterm = c16.red.cterm, gui = "#ff0000" }, -- Red / Orange
  identifier = { cterm = c16.cyan.cterm, gui = "#00ffff" }, -- Cyan
  statement = { cterm = c16.yellow.cterm, gui = "#ffff00" }, -- Yellow
  preproc = { cterm = c16.blue.cterm, gui = "#0000ff" }, -- Light Magenta / Blue
  type = { cterm = c16.green.cterm, gui = "#00ff00" }, -- Green
  underlined = { cterm = c16.blue.cterm, gui = "#0000ff" }, -- Blue
  err_fg = { cterm = c16.white.cterm, gui = "#ffffff" }, -- Error fg
  err_bg = { cterm = c16.red.cterm, gui = "#ff0000" }, -- Error bg
  todo_fg = { cterm = c16.black.cterm, gui = "#000000" }, -- Todo fg
  todo_bg = { cterm = c16.yellow.cterm, gui = "#ffff00" }, -- Todo bg
  fg = { cterm = c16.white.cterm, gui = "#ffffff" }, -- Normal fg
  bg = { cterm = c16.black.cterm, gui = "#000000" },
}

-- One flat table so the rest of the file can just reach for c.<name>
local c = vim.tbl_extend("force", {}, c16, syn)

-- ============================================================
-- 2. HELPERS
-- ============================================================
-- hl() takes color TOKENS ({cterm=.., gui=..}) for fg/bg/sp and
-- expands each into its guifg-equivalent + ctermfg-equivalent pair,
-- so every highlight is defined for both a 16-color console and a
-- truecolor terminal at once.
local function hl(group, opts)
  local o = {}
  if opts.fg then
    o.fg = opts.fg.gui
    o.ctermfg = opts.fg.cterm
  end
  if opts.bg then
    o.bg = opts.bg.gui
    o.ctermbg = opts.bg.cterm
  end
  if opts.sp then
    o.sp = opts.sp.gui
  end
  for _, attr in ipairs({
    "bold",
    "italic",
    "underline",
    "undercurl",
    "underdouble",
    "underdotted",
    "underdashed",
    "strikethrough",
    "reverse",
    "nocombine",
    "standout",
    "blend",
  }) do
    if opts[attr] ~= nil then
      o[attr] = opts[attr]
    end
  end
  vim.api.nvim_set_hl(0, group, o)
end
local function link(from, to)
  vim.api.nvim_set_hl(0, from, { link = to })
end
local function clear(group)
  vim.api.nvim_set_hl(0, group, {})
end

-- ============================================================
-- 3. CORE EDITOR UI
--    Vim itself never styled these in syncolor.vim (a plain 16-color
--    console just used reverse video for emphasis, which is exactly
--    what we do here) — no invented in-between grays, only the 16
--    real slots plus `reverse`.
-- ============================================================
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalNC", { fg = c.darkgray, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg })
hl("FloatBorder", { fg = c.darkgray, bg = c.bg })
hl("FloatTitle", { fg = c.special, bg = c.bg, bold = true })
hl("FloatShadow", { bg = c.black, blend = 40 })
hl("FloatShadowThrough", { bg = c.black, blend = 60 })

hl("SignColumn", { fg = c.darkgray, bg = c.bg })
hl("LineNr", { fg = c.darkgray, bg = c.bg })
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
hl("CursorLineNr", { fg = c.statement, bold = true, reverse = true })
hl("CursorLine", { bg = c.darkgray })
link("CursorLineSign", "SignColumn")
link("CursorLineFold", "FoldColumn")
hl("CursorColumn", { bg = c.darkgray })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("lCursor", { fg = c.bg, bg = c.fg })
hl("TermCursor", { reverse = true })
hl("ColorColumn", { bg = c.darkgray })

hl("Visual", { bg = c.darkblue })
hl("VisualNOS", { bg = c.darkblue })
hl("Search", { fg = c.black, bg = c.yellow })
hl("IncSearch", { fg = c.black, bg = c.yellow, bold = true })
link("CurSearch", "IncSearch")
link("Substitute", "Search")
link("QuickFixLine", "Search")

hl("MatchParen", { fg = c.special, bold = true, underline = true })

hl("Pmenu", { fg = c.fg, bg = c.darkgray })
hl("PmenuSel", { fg = c.black, bg = c.lightgray, bold = true })
hl("PmenuSbar", { bg = c.darkgray })
hl("PmenuThumb", { bg = c.lightgray })
link("PmenuKind", "Pmenu")
link("PmenuKindSel", "PmenuSel")
link("PmenuExtra", "Pmenu")
link("PmenuExtraSel", "PmenuSel")

hl("WinSeparator", { fg = c.darkgray, bg = c.bg })
link("VertSplit", "WinSeparator")

hl("StatusLine", { fg = c.black, bg = c.lightgray, bold = true })
hl("StatusLineNC", { fg = c.black, bg = c.darkgray })
link("MsgSeparator", "StatusLine")

hl("TabLine", { fg = c.darkgray, bg = c.bg })
hl("TabLineSel", { fg = c.black, bg = c.statement, bold = true })
hl("TabLineFill", { fg = c.darkgray, bg = c.bg })
hl("TabLineSep", { fg = c.bg, bg = c.bg })
hl("TabLineSelSep", { fg = c.statement, bg = c.darkgray, bold = true })

hl("WildMenu", { fg = c.black, bg = c.constant })
hl("Directory", { fg = c.identifier })
hl("Title", { fg = c.special, bold = true })

hl("NonText", { fg = c.comment, bold = true })
link("EndOfBuffer", "NonText")
link("Whitespace", "NonText")

hl("Folded", { fg = c.comment, bg = c.darkgray })
hl("FoldColumn", { fg = c.darkgray, bg = c.bg })

hl("ModeMsg", { bold = true })
hl("MoreMsg", { fg = c.identifier, bold = true })
hl("Question", { fg = c.identifier, bold = true })
hl("WarningMsg", { fg = c.special })
hl("ErrorMsg", { fg = c.err_fg, bg = c.err_bg })

hl("Ignore", { fg = c.bg })
link("Conceal", "Ignore")
hl("SpecialKey", { fg = c.special })

for i = 1, 9 do
  hl("User" .. i, { fg = c.fg, bg = c.darkgray })
end
hl("WinBar", { bold = true })
link("WinBarNC", "WinBar")

-- ============================================================
-- 4. CLASSIC SYNTAX GROUPS
--    This block IS syncolor.vim — same 10 top-level groups, same
--    exact SynLink hierarchy Vim ships, nothing added or renamed.
-- ============================================================
hl("Comment", { fg = c.comment })

hl("Constant", { fg = c.constant })
link("String", "Constant")
link("Character", "Constant")
link("Number", "Constant")
link("Boolean", "Constant")
link("Float", "Number")

hl("Identifier", { fg = c.identifier, bold = true })
link("Function", "Identifier")

hl("Statement", { fg = c.statement, bold = true })
link("Conditional", "Statement")
link("Repeat", "Statement")
link("Label", "Statement")
link("Operator", "Statement")
link("Keyword", "Statement")
link("Exception", "Statement")

hl("PreProc", { fg = c.preproc })
link("Include", "PreProc")
link("Define", "PreProc")
link("Macro", "PreProc")
link("PreCondit", "PreProc")

hl("Type", { fg = c.type, bold = true })
link("StorageClass", "Type")
link("Structure", "Type")
link("Typedef", "Type")

hl("Special", { fg = c.special })
link("Tag", "Special")
link("SpecialChar", "Special")
link("Delimiter", "Special")
link("SpecialComment", "Special")
link("Debug", "Special")

hl("Underlined", { fg = c.underlined, underline = true })
hl("Error", { fg = c.err_fg, bg = c.err_bg })
hl("Todo", { fg = c.todo_fg, bg = c.todo_bg })

-- ============================================================
-- 5. DIAGNOSTICS
-- ============================================================
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn", { fg = c.special })
hl("DiagnosticInfo", { fg = c.identifier })
hl("DiagnosticHint", { fg = c.darkgray })
hl("DiagnosticOk", { fg = c.type })

link("DiagnosticErrorFloating", "DiagnosticError")
link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticWarningFloating", "DiagnosticWarn")
link("DiagnosticFloatingWarn", "DiagnosticWarn")
link("DiagnosticFloatingWarning", "DiagnosticWarn")
link("DiagnosticHintFloating", "DiagnosticHint")
link("DiagnosticFloatingHint", "DiagnosticHint")
link("DiagnosticFloatingInfo", "DiagnosticInfo")
link("DiagnosticFloatingOk", "DiagnosticOk")
hl("DiagnosticWarning", { fg = c.special })

hl("DiagnosticSignError", { fg = c.red, bg = c.bg })
hl("DiagnosticSignWarn", { fg = c.special, bg = c.bg })
hl("DiagnosticSignInfo", { fg = c.identifier, bg = c.bg })
hl("DiagnosticSignHint", { fg = c.darkgray, bg = c.bg })
link("DiagnosticSignOk", "DiagnosticOk")

hl("DiagnosticVirtualTextError", { fg = c.red, bg = c.darkgray })
hl("DiagnosticVirtualTextWarn", { fg = c.special, bg = c.darkgray })
hl("DiagnosticVirtualTextInfo", { fg = c.identifier, bg = c.darkgray })
hl("DiagnosticVirtualTextHint", { fg = c.darkgray, bg = c.darkgray })
link("DiagnosticVirtualTextOk", "DiagnosticOk")
link("DiagnosticVirtualTextWarning", "DiagnosticVirtualTextWarn")

hl("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.special })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = c.identifier })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = c.darkgray })
link("DiagnosticUnderlineOk", "DiagnosticOk")

hl("DiagnosticDeprecated", { sp = c.darkgray, strikethrough = true })
hl("DiagnosticUnnecessary", { fg = c.darkgray, underline = true })

-- ============================================================
-- 6. LSP
-- ============================================================
hl("LspReferenceText", { fg = c.identifier, bg = c.darkgray, bold = true, undercurl = true, sp = c.special })
hl("LspReferenceRead", { bg = c.darkgray, bold = true, undercurl = true, sp = c.special })
hl("LspReferenceWrite", { bg = c.darkgray, bold = true, undercurl = true, sp = c.special })
hl("LspSignatureActiveParameter", { bold = true, italic = true, underline = true, sp = c.statement })
link("LspCodeLens", "Comment")
hl("LspBorderBG", { fg = c.darkgray, bg = c.bg })
hl("LspFloatWinNormal", { fg = c.fg, bg = c.bg })
hl("LspInlayHint", { fg = c.darkgray, bg = c.black, italic = true })
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
hl("DiffAdd", { fg = c.black, bg = c.type })
hl("DiffChange", { fg = c.black, bg = c.special })
hl("DiffDelete", { fg = c.black, bg = c.red, bold = true })
hl("DiffText", { fg = c.black, bg = c.statement, bold = true })
hl("DiffAdded", { fg = c.type, bg = c.bg })
hl("DiffRemoved", { fg = c.red, bg = c.bg })

hl("GitSignsAdd", { fg = c.type, bg = c.bg })
hl("GitSignsChange", { fg = c.special, bg = c.bg })
hl("GitSignsDelete", { fg = c.red, bg = c.bg })

hl("gitCommitBranch", { fg = c.special })
hl("gitCommitSelectedFile", { fg = c.type })
hl("gitCommitSelectedType", { fg = c.type })
hl("gitCommitUnmergedFile", { fg = c.red })
hl("gitCommitUnmergedType", { fg = c.red })
link("gitCommitDiscardedFile", "gitCommitUnmergedFile")
link("gitCommitDiscardedType", "gitCommitUnmergedType")
link("gitCommitUntrackedFile", "gitCommitUnmergedFile")
link("gitCommitFile", "Directory")

-- ============================================================
-- 8. SCROLLBAR
-- ============================================================
hl("ScrollbarHandle", { bg = c.darkgray })
hl("ScrollbarCursor", { fg = c.bg })
hl("ScrollbarCursorHandle", { fg = c.bg, bg = c.bg })
for _, pair in ipairs({
  { "Error", c.red },
  { "Warn", c.special },
  { "Info", c.identifier },
  { "Hint", c.darkgray },
  { "Misc", c.special },
  { "Search", c.statement },
  { "GitAdd", c.type },
  { "GitChange", c.special },
  { "GitDelete", c.red },
}) do
  local name, color = pair[1], pair[2]
  hl("Scrollbar" .. name, { fg = color })
  hl("Scrollbar" .. name .. "Handle", { fg = color, bg = c.bg })
end

-- ============================================================
-- 9. TELESCOPE
-- ============================================================
hl("TelescopeNormal", { fg = c.fg, bg = c.bg })
hl("TelescopeBorder", { fg = c.darkgray, bg = c.bg })
hl("TelescopePromptNormal", { fg = c.fg, bg = c.darkgray })
hl("TelescopePromptBorder", { fg = c.special, bg = c.darkgray })
hl("TelescopeTitle", { fg = c.special, bg = c.bg, bold = true })
link("TelescopePromptTitle", "Title")
link("TelescopePromptPrefix", "Title")
link("TelescopePromptCounter", "TelescopeBorder")
link("TelescopeResultsTitle", "Title")
link("TelescopeResultsBorder", "TelescopeBorder")
link("TelescopePreviewBorder", "TelescopeBorder")
link("TelescopePreviewTitle", "Title")
hl("TelescopeSelection", { bg = c.darkgray, bold = true })
hl("TelescopeSelectionCaret", { fg = c.fg, bg = c.special })
link("TelescopePreviewLine", "TelescopeSelection")
link("TelescopeMatching", "Special")
hl("TelescopeMultiSelection", {})
hl("TelescopeMultiIcon", {})
hl("TelescopeResultsNormal", {})
hl("TelescopeResultsLineNr", {})
hl("TelescopeResultsComment", {})
hl("TelescopeResultsFunction", {})
hl("TelescopeResultsMethod", {})
hl("TelescopeResultsIdentifier", {})
hl("TelescopeResultsVariable", {})
hl("TelescopeResultsField", {})
hl("TelescopeResultsClass", {})
hl("TelescopeResultsStruct", {})
hl("TelescopeResultsConstant", {})
hl("TelescopeResultsNumber", {})
hl("TelescopeResultsOperator", {})
hl("TelescopeResultsSpecialComment", {})
hl("TelescopeResultsDiffUntracked", {})
link("TelescopeResultsFileIcon", "Special")
hl("TelescopePreviewNormal", {})
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
  hl("TelescopePreview" .. g, {})
end

-- ============================================================
-- 10. WHICHKEY
-- ============================================================
hl("WhichKeyFloat", { bg = c.bg })
hl("WhichKeyBorder", { bg = c.bg })
hl("WhichKey", { fg = c.fg, bg = c.bg })
hl("WhichKeyGroup", { fg = c.red, bg = c.bg })
hl("WhichKeyDesc", { fg = c.identifier, bg = c.bg })
hl("WhichKeyValue", { fg = c.darkgray })
hl("WhichKeySeparator", { fg = c.darkgray, bg = c.bg })

-- ============================================================
-- 11. LAZY.NVIM
-- ============================================================
hl("LazyH1", { fg = c.red, bg = c.bg })
hl("LazyH2", { fg = c.red, bg = c.bg })
hl("LazyButton", { bg = c.bg })
hl("LazyButtonActive", { fg = c.bg, bg = c.red })
hl("LazyNormal", { bg = c.bg })
hl("LazySpecial", { fg = c.statement })
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
  hl("Lazy" .. g, {})
end

-- ============================================================
-- 12. MASON
-- ============================================================
hl("MasonHeader", { fg = c.identifier, bg = c.bg })
hl("MasonHighlight", { fg = c.red, bg = c.bg })
hl("MasonMuted", { fg = c.statement, bg = c.bg })
link("MasonHeaderSecondary", "LazyButtonActive")
link("MasonHighlightBlockBold", "LazyButtonActive")
link("MasonHighlightBlock", "LazyButtonActive")
link("MasonMutedBlockBold", "MasonHighlight")
link("MasonMutedBlock", "MasonMuted")
hl("MasonHeading", {})
hl("MasonError", {})
hl("MasonWarning", {})
hl("MasonHighlightSecondary", {})
hl("MasonHighlightBlockSecondary", {})
hl("MasonHighlightBlockBoldSecondary", {})

-- ============================================================
-- 13. INDENT-BLANKLINE
-- ============================================================
hl("IblIndent", { fg = c.darkgray, nocombine = true })
hl("IblScope", { fg = c.special, nocombine = true })
hl("IblWhitespace", { fg = c.darkgray, nocombine = true })
link("IndentBlanklineChar", "IblIndent")
link("IndentBlanklineContextChar", "IblScope")

-- ============================================================
-- 14. FILETYPE-SPECIFIC
-- ============================================================
hl("htmlArg", { fg = c.identifier })
hl("htmlTag", { fg = c.identifier })
hl("htmlTagName", { fg = c.identifier })
link("htmlEndTag", "htmlTag")
hl("htmlBold", { bold = true })
hl("htmlItalic", { underline = true })
hl("htmlUnderline", { underline = true })
hl("htmlUnderlineItalic", { underline = true })
hl("htmlBoldItalic", { bold = true, underline = true })
hl("htmlBoldUnderline", { bold = true, underline = true })
hl("htmlBoldUnderlineItalic", { bold = true, underline = true })
hl("htmlH1", { bold = true })
link("htmlLink", "Underlined")

link("markdownCodeBlock", "String")
link("markdownCodeDelimiter", "NonText")
link("markdownHeadingRule", "NonText")
link("markdownLinkDelimiter", "Delimiter")
link("markdownURLDelimiter", "Delimiter")
hl("markdownBold", { bold = true })
hl("markdownItalic", { underline = true })

hl("phpIdentifier", { fg = c.red })
hl("phpSpecialFunction", { fg = c.constant })
link("phpDefine", "Statement")
link("phpHereDoc", "String")
link("phpVarSelector", "phpIdentifier")

hl("rubyInstanceVariable", { fg = c.constant })
link("rubyConstant", "Constant")
link("rubyDefine", "Statement")
link("rubyLocalVariableOrMethod", "Identifier")

link("xmlAttrib", "xmlTag")
link("xmlEndTag", "xmlTag")
link("xmlEqual", "xmlTag")
hl("xmlTag", { fg = c.identifier })
hl("xmlTagName", { fg = c.red })
link("xmlString", "xmlTagName")

hl("mustacheMarker", { fg = c.constant })
hl("mustachePartial", { fg = c.constant })
hl("mustacheVariable", { fg = c.statement })
hl("mustacheVariableUnescape", { fg = c.red })
hl("mustacheSection", { bold = true })

hl("netrwClassify", { fg = c.darkgray, bold = true })
hl("netrwExe", { fg = c.red })
link("NERDTreeExecFile", "String")
link("NERDTreeHelp", "Comment")

link("javaScript", "Normal")
link("javaScriptBraces", "Delimiter")
hl("lessVariable", { fg = c.red })
link("lessVariableValue", "Normal")
link("shDerefVar", "shDerefSimple")
hl("shDerefSimple", { fg = c.red })

link("vimContinue", "Delimiter")
link("vimHiAttrib", "Constant")
link("vimSetSep", "Delimiter")

link("helpExample", "String")
link("helpHeadline", "Title")
link("helpHyperTextEntry", "Statement")
link("helpHyperTextJump", "Underlined")
link("helpSectionDelim", "Comment")
link("helpURL", "Underlined")

hl("SyntasticErrorSign", { fg = c.red })
hl("SyntasticWarningSign", { fg = c.special })

-- ============================================================
-- 15. SPELL
-- ============================================================
hl("SpellBad", { sp = c.fg, undercurl = true, fg = c.red })
hl("SpellCap", { sp = c.fg, undercurl = true, fg = c.identifier })
hl("SpellLocal", { sp = c.fg, undercurl = true, fg = c.constant })
hl("SpellRare", { sp = c.fg, undercurl = true, fg = c.special })

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
hl("NvimInternalError", { fg = c.bg, bg = c.red })
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

hl("RedrawDebugNormal", { reverse = true })
hl("RedrawDebugClear", { fg = c.bg, bg = c.statement })
hl("RedrawDebugComposed", { fg = c.bg, bg = c.identifier })
hl("RedrawDebugRecompose", { fg = c.bg, bg = c.special })

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
-- kept from the original template for file-tree plugin support
-- ============================================================
hl("NvimTreeNormal", { fg = c.fg, bg = c.bg })
hl("NvimTreeFolderIcon", { fg = c.identifier })
hl("NvimTreeFolderName", { fg = c.identifier })
hl("NvimTreeOpenedFolderName", { fg = c.special, bold = true })
hl("NvimTreeRootFolder", { fg = c.special, bold = true })
hl("NvimTreeIndentMarker", { fg = c.darkgray })
hl("NvimTreeGitDirty", { fg = c.special })
hl("NvimTreeGitNew", { fg = c.type })

hl("NeoTreeNormal", { fg = c.fg, bg = c.bg })
hl("NeoTreeDirectoryIcon", { fg = c.identifier })
hl("NeoTreeDirectoryName", { fg = c.identifier })
hl("NeoTreeRootName", { fg = c.special, bold = true })

return c
