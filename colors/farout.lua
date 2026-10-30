--  ███████╗ █████╗ ██████╗  ██████╗ ██╗   ██╗████████╗
--  ██╔════╝██╔══██╗██╔══██╗██╔═══██╗██║   ██║╚══██╔══╝
--  █████╗  ███████║██████╔╝██║   ██║██║   ██║   ██║
--  ██╔══╝  ██╔══██║██╔══██╗██║   ██║██║   ██║   ██║
--  ██║     ██║  ██║██║  ██║╚██████╔╝╚██████╔╝   ██║
--  ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝    ╚═╝
-- farout.nvim — a warm, near-monochrome colorscheme (burnt orange / vermilion / sand
-- on a brown-black ground), sampled pixel-by-pixel from a Neovim screenshot.
--
-- FILE LOCATION (required for :colorscheme to find it):
--   ~/.config/nvim/colors/farout.lua

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
vim.g.colors_name = "farout"

-- ============================================================
-- 1. PALETTE
-- ============================================================
-- The 16 ANSI colors. [img] = measured in the screenshot, [new] = the screenshot has
-- no such hue (it is a one-family warm theme), so it is derived to sit in the same
-- warm, low-saturation range.
local ansi = {
  black = "#241a18", -- 0  [img] statusline / margin surface
  red = "#bb472f", -- 1  [img] vermilion: builtins, types, errors
  green = "#8f9660", -- 2  [new] olive
  yellow = "#d37c4a", -- 3  [img] burnt orange: functions, accent fill
  blue = "#7a8ea3", -- 4  [new] dusk steel
  magenta = "#a07777", -- 5  [img] dusty rose: keywords
  cyan = "#82a39a", -- 6  [new] sage teal
  white = "#bfa58c", -- 7  [img] tan: properties / fields
  br_black = "#6b4238", -- 8  [img] dim brown: comments, line numbers
  br_red = "#d9553a", -- 9  [new] lighter vermilion
  br_green = "#a9b273", -- 10 [new] light olive
  br_yellow = "#ff9c64", -- 11 [img] peach: numbers, constants
  br_blue = "#98acc0", -- 12 [new] light steel
  br_magenta = "#bf9090", -- 13 [new] light rose
  br_cyan = "#9fc2b8", -- 14 [new] light sage
  br_white = "#dfcbac", -- 15 [img] sand: primary text
}

local function hex2rgb(h)
  return tonumber(h:sub(2, 3), 16), tonumber(h:sub(4, 5), 16), tonumber(h:sub(6, 7), 16)
end
local function mix(a, b, t) -- blend color `a` toward `b` by `t` (0..1)
  local ar, ag, ab = hex2rgb(a)
  local br, bg, bb = hex2rgb(b)
  return string.format(
    "#%02x%02x%02x",
    math.floor(ar + (br - ar) * t + 0.5),
    math.floor(ag + (bg - ag) * t + 0.5),
    math.floor(ab + (bb - ab) * t + 0.5)
  )
end

local c = {
  ansi = ansi,

  -- surfaces
  bg = "#161110", -- editor background
  bg_float = "#1b1413", -- floats, popups
  bg_alt = ansi.black, -- statusline, tabline, pmenu, folds
  bg_cursor = "#291e1c", -- cursorline
  bg_visual = "#3b2622", -- selection, references
  guide = "#4b2f29", -- indent guides, NonText
  border = "#413c3b", -- window separators, float borders

  -- text
  fg = ansi.br_white, -- #dfcbac
  fg_prop = ansi.white, -- #bfa58c properties / fields / secondary text
  fg_str = "#a3886e", -- strings
  comment = ansi.br_black, -- #6b4238
  doc = "#5b4443", -- ---  doc-comment dashes

  -- accents
  peach = ansi.br_yellow, -- #ff9c64 numbers, constants, module names
  peach2 = "#f1a465", -- parameters, parentheses
  orange = ansi.yellow, -- #d37c4a functions
  red = ansi.red, -- #bb472f builtins / types
  rose = ansi.magenta, -- #a07777 keywords
  rose_dim = "#874c54", -- `function` keyword
  crimson = "#834951", -- table constructor braces
  blame = "#662d32", -- git blame virtual text
  brown = "#a37257", -- delimiters, and/or, current line number
  brown_op = "#956850", -- operators
  green = ansi.green,
  blue = ansi.blue,
  cyan = ansi.cyan,
}

-- terminal (:terminal) palette
local order = {
  "black",
  "red",
  "green",
  "yellow",
  "blue",
  "magenta",
  "cyan",
  "white",
  "br_black",
  "br_red",
  "br_green",
  "br_yellow",
  "br_blue",
  "br_magenta",
  "br_cyan",
  "br_white",
}
for i, name in ipairs(order) do
  vim.g["terminal_color_" .. (i - 1)] = ansi[name]
end
vim.g.terminal_color_background = c.bg
vim.g.terminal_color_foreground = c.fg

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
hi("NormalNC", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg_float })
hi("FloatBorder", { fg = c.border, bg = c.bg_float })
hi("FloatTitle", { fg = c.orange, bg = c.bg_float, bold = true })
link("FloatFooter", "FloatTitle")
hi("FloatShadow", { bg = c.bg_alt, blend = 40 })
hi("FloatShadowThrough", { bg = c.bg_alt, blend = 60 })

hi("SignColumn", { fg = c.comment, bg = c.bg })
hi("LineNr", { fg = c.comment, bg = c.bg })
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
hi("CursorLineNr", { fg = c.brown, bg = c.bg_cursor, bold = true })
hi("CursorLine", { bg = c.bg_cursor })
link("CursorLineSign", "SignColumn")
link("CursorLineFold", "FoldColumn")
hi("CursorColumn", { bg = c.bg_cursor })
hi("Cursor", { fg = c.bg, bg = c.fg })
hi("lCursor", { fg = c.bg, bg = c.fg })
link("CursorIM", "Cursor")
hi("TermCursor", { reverse = true })
hi("ColorColumn", { bg = c.bg_alt })

hi("Visual", { bg = c.bg_visual })
link("VisualNOS", "Visual")
hi("Search", { fg = c.bg, bg = c.orange })
hi("IncSearch", { fg = c.bg, bg = c.peach })
link("CurSearch", "IncSearch")
link("Substitute", "Search")
hi("QuickFixLine", { bg = c.bg_visual })

hi("MatchParen", { fg = c.peach, bold = true, underline = true })

hi("Pmenu", { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel", { fg = c.fg, bg = c.bg_visual, bold = true })
hi("PmenuSbar", { bg = c.bg_visual })
hi("PmenuThumb", { bg = c.comment })
hi("PmenuMatch", { fg = c.orange, bold = true })
hi("PmenuMatchSel", { fg = c.peach, bold = true })
link("PmenuKind", "Pmenu")
link("PmenuKindSel", "PmenuSel")
link("PmenuExtra", "Pmenu")
link("PmenuExtraSel", "PmenuSel")
link("PmenuBorder", "FloatBorder")

hi("WinSeparator", { fg = c.border, bg = c.bg })
link("VertSplit", "WinSeparator")

hi("StatusLine", { fg = c.peach2, bg = c.bg_alt })
hi("StatusLineNC", { fg = c.comment, bg = c.bg_alt })
link("StatusLineTerm", "StatusLine")
link("StatusLineTermNC", "StatusLineNC")
link("MsgSeparator", "StatusLine")

hi("TabLine", { fg = c.comment, bg = c.bg_alt })
hi("TabLineSel", { fg = c.bg, bg = c.orange, bold = true })
hi("TabLineFill", { bg = c.bg_alt })

hi("WildMenu", { fg = c.bg, bg = c.orange })
hi("Directory", { fg = c.orange })
hi("Title", { fg = c.orange, bold = true })

hi("NonText", { fg = c.guide })
link("EndOfBuffer", "NonText")
link("Whitespace", "NonText")
hi("SpecialKey", { fg = c.guide })

hi("Folded", { fg = c.brown, bg = c.bg_alt })
hi("FoldColumn", { fg = c.comment, bg = c.bg })

hi("ModeMsg", { fg = c.orange, bold = true })
hi("MoreMsg", { fg = c.green })
hi("Question", { fg = c.peach })
hi("WarningMsg", { fg = c.orange })
hi("ErrorMsg", { fg = c.red })
hi("OkMsg", { fg = c.green })
link("StderrMsg", "ErrorMsg")
clear("StdoutMsg")
clear("MsgArea")

hi("Ignore", { fg = c.comment })
hi("Conceal", { fg = c.comment })

hi("WinBar", { fg = c.fg_prop, bold = true })
hi("WinBarNC", { fg = c.comment })

hi("Bold", { bold = true })
hi("Italic", { italic = true })
hi("BoldItalic", { bold = true, italic = true })
hi("Underlined", { fg = c.fg_prop, underline = true })

for i = 1, 9 do
  hi("User" .. i, { fg = c.bg, bg = c.orange })
end

-- ============================================================
-- 4. CLASSIC SYNTAX GROUPS
-- ============================================================
hi("Comment", { fg = c.comment, italic = true })

hi("Constant", { fg = c.peach })
hi("String", { fg = c.fg_str })
link("Character", "String")
hi("Number", { fg = c.peach })
hi("Boolean", { fg = c.peach })
link("Float", "Number")
link("Regexp", "String")

hi("Identifier", { fg = c.fg })
hi("Function", { fg = c.orange })

hi("Statement", { fg = c.rose, italic = true })
link("Conditional", "Statement")
link("Repeat", "Statement")
link("Label", "Statement")
link("Exception", "Statement")
hi("Keyword", { fg = c.rose, italic = true })
hi("Operator", { fg = c.brown_op })

hi("PreProc", { fg = c.red })
link("Include", "PreProc")
link("Define", "PreProc")
link("Macro", "PreProc")
link("PreCondit", "PreProc")

hi("Type", { fg = c.red })
link("StorageClass", "Type")
link("Structure", "Type")
link("Typedef", "Type")

hi("Special", { fg = c.peach })
link("SpecialChar", "Special")
link("SpecialComment", "Special")
link("Tag", "Special")
link("Debug", "Special")
hi("Delimiter", { fg = c.brown })

hi("Error", { fg = c.fg, bg = c.red })
hi("Todo", { fg = c.bg, bg = c.orange, bold = true })
link("Dimmed", "Comment")

-- ============================================================
-- 5. DIAGNOSTICS
-- ============================================================
local diag = { Error = c.red, Warn = c.orange, Info = c.blue, Hint = c.cyan, Ok = c.green }
for name, color in pairs(diag) do
  hi("Diagnostic" .. name, { fg = color })
  hi("DiagnosticSign" .. name, { fg = color })
  hi("DiagnosticFloating" .. name, { fg = color })
  hi("DiagnosticVirtualText" .. name, { fg = color, bg = mix(c.bg, color, 0.10) })
  hi("DiagnosticVirtualLines" .. name, { fg = color })
  hi("DiagnosticUnderline" .. name, { undercurl = true, sp = color })
end
hi("DiagnosticDeprecated", { sp = c.comment, strikethrough = true })
hi("DiagnosticUnnecessary", { fg = c.comment })

-- ============================================================
-- 6. LSP
-- ============================================================
hi("LspReferenceText", { bg = c.bg_visual })
hi("LspReferenceRead", { bg = c.bg_visual })
hi("LspReferenceWrite", { bg = c.bg_visual, underline = true })
hi("LspSignatureActiveParameter", { fg = c.peach2, bold = true, underline = true })
hi("LspInlayHint", { fg = c.comment, bg = c.bg_alt, italic = true })
link("LspCodeLens", "Comment")
link("LspCodeLensSeparator", "Comment")
link("SnippetTabstop", "Visual")

link("@lsp.type.comment", "@comment")
link("@lsp.type.decorator", "@attribute")
link("@lsp.type.enumMember", "@constant")
link("@lsp.type.function", "@function")
link("@lsp.type.method", "@function.method")
link("@lsp.type.parameter", "@variable.parameter")
link("@lsp.type.property", "@property")
link("@lsp.type.namespace", "@module")
link("@lsp.type.type", "@type")
link("@lsp.type.class", "@type")
link("@lsp.type.keyword", "@keyword")
link("@lsp.type.variable", "@variable")
link("@lsp.mod.deprecated", "DiagnosticDeprecated")
-- LuaLS marks `vim`, `require`, `type`... as defaultLibrary: same vermilion as the builtins
link("@lsp.typemod.variable.defaultLibrary", "@variable.builtin")
link("@lsp.typemod.function.defaultLibrary", "@function.builtin")
link("@lsp.typemod.namespace.defaultLibrary", "@module.builtin")

-- ============================================================
-- 7. DIFF / GIT
-- ============================================================
hi("DiffAdd", { bg = mix(c.bg, c.green, 0.18) })
hi("DiffChange", { bg = mix(c.bg, c.orange, 0.14) })
hi("DiffDelete", { fg = c.red, bg = mix(c.bg, c.red, 0.18) })
hi("DiffText", { bg = mix(c.bg, c.orange, 0.34), bold = true })
link("DiffTextAdd", "DiffText")
hi("DiffAdded", { fg = c.green })
hi("DiffRemoved", { fg = c.red })

hi("Added", { fg = c.green })
hi("Changed", { fg = c.orange })
hi("Removed", { fg = c.red })

hi("GitSignsAdd", { fg = c.green, bg = c.bg })
hi("GitSignsChange", { fg = c.orange, bg = c.bg })
hi("GitSignsDelete", { fg = c.red, bg = c.bg })
hi("GitSignsCurrentLineBlame", { fg = c.blame })

hi("gitCommitBranch", { fg = c.orange })
hi("gitCommitSelectedFile", { fg = c.green })
hi("gitCommitUnmergedFile", { fg = c.red })
link("gitCommitDiscardedFile", "gitCommitUnmergedFile")
link("gitCommitUntrackedFile", "gitCommitUnmergedFile")
link("gitCommitFile", "Directory")

-- ============================================================
-- 8. SCROLLBAR (nvim-scrollbar)
-- ============================================================
hi("ScrollbarHandle", { bg = c.bg_alt })
hi("ScrollbarCursor", { fg = c.bg })
hi("ScrollbarCursorHandle", { fg = c.bg, bg = c.bg })
for _, pair in ipairs({
  { "Error", c.red },
  { "Warn", c.orange },
  { "Info", c.blue },
  { "Hint", c.cyan },
  { "Misc", c.peach2 },
  { "Search", c.orange },
  { "GitAdd", c.green },
  { "GitChange", c.orange },
  { "GitDelete", c.red },
}) do
  local name, color = pair[1], pair[2]
  hi("Scrollbar" .. name, { fg = color })
  hi("Scrollbar" .. name .. "Handle", { fg = color, bg = c.bg })
end

-- ============================================================
-- 9. TELESCOPE
-- ============================================================
hi("TelescopeNormal", { fg = c.fg, bg = c.bg_float })
hi("TelescopeBorder", { fg = c.border, bg = c.bg_float })
hi("TelescopeTitle", { fg = c.orange, bg = c.bg_float, bold = true })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_alt })
hi("TelescopePromptBorder", { fg = c.orange, bg = c.bg_alt })
link("TelescopePromptTitle", "TelescopeTitle")
hi("TelescopePromptPrefix", { fg = c.orange, bg = c.bg_alt })
hi("TelescopePromptCounter", { fg = c.comment })
link("TelescopeResultsNormal", "TelescopeNormal")
link("TelescopeResultsBorder", "TelescopeBorder")
link("TelescopeResultsTitle", "TelescopeTitle")
link("TelescopePreviewNormal", "TelescopeNormal")
link("TelescopePreviewBorder", "TelescopeBorder")
link("TelescopePreviewTitle", "TelescopeTitle")
hi("TelescopeSelection", { fg = c.fg, bg = c.bg_visual, bold = true })
hi("TelescopeSelectionCaret", { fg = c.orange, bg = c.bg_visual })
link("TelescopePreviewLine", "Visual")
hi("TelescopeMatching", { fg = c.peach, bold = true })

-- ============================================================
-- 10. WHICHKEY
-- ============================================================
hi("WhichKeyNormal", { bg = c.bg_float })
hi("WhichKeyFloat", { bg = c.bg_float })
hi("WhichKeyBorder", { fg = c.border, bg = c.bg_float })
hi("WhichKey", { fg = c.orange })
hi("WhichKeyGroup", { fg = c.rose })
hi("WhichKeyDesc", { fg = c.fg })
hi("WhichKeyValue", { fg = c.comment })
hi("WhichKeySeparator", { fg = c.comment })

-- ============================================================
-- 11. LAZY.NVIM
-- ============================================================
hi("LazyNormal", { bg = c.bg_float })
hi("LazyH1", { fg = c.bg, bg = c.orange, bold = true })
hi("LazyH2", { fg = c.orange, bold = true })
hi("LazyButton", { bg = c.bg_alt })
hi("LazyButtonActive", { fg = c.bg, bg = c.orange })
hi("LazySpecial", { fg = c.peach })
link("LazyComment", "Comment")
link("LazyDimmed", "Comment")
hi("LazyProgressDone", { fg = c.orange })
hi("LazyProgressTodo", { fg = c.guide })

-- ============================================================
-- 12. MASON
-- ============================================================
hi("MasonNormal", { bg = c.bg_float })
hi("MasonHeader", { fg = c.bg, bg = c.orange, bold = true })
hi("MasonHighlight", { fg = c.orange })
hi("MasonMuted", { fg = c.comment })
link("MasonHeaderSecondary", "MasonHeader")
link("MasonHighlightBlock", "MasonHeader")
link("MasonHighlightBlockBold", "MasonHeader")
hi("MasonMutedBlock", { fg = c.fg_prop, bg = c.bg_alt })
hi("MasonMutedBlockBold", { fg = c.fg_prop, bg = c.bg_alt, bold = true })

-- ============================================================
-- 13. INDENT-BLANKLINE
-- ============================================================
hi("IblIndent", { fg = c.guide, nocombine = true })
hi("IblScope", { fg = c.doc, nocombine = true })
hi("IblWhitespace", { fg = c.guide, nocombine = true })
link("IndentBlanklineChar", "IblIndent")
link("IndentBlanklineContextChar", "IblScope")

-- ============================================================
-- 14. FILETYPE-SPECIFIC
-- ============================================================
link("markdownCodeBlock", "String")
link("markdownCodeDelimiter", "NonText")
link("markdownHeadingRule", "NonText")
link("markdownLinkDelimiter", "Delimiter")
link("markdownURLDelimiter", "Delimiter")
hi("markdownBold", { bold = true })
hi("markdownItalic", { italic = true })

link("helpExample", "String")
link("helpHeadline", "Title")
link("helpHyperTextEntry", "Statement")
link("helpHyperTextJump", "Underlined")
link("helpSectionDelim", "Comment")
link("helpURL", "Underlined")

hi("htmlTag", { fg = c.brown })
hi("htmlTagName", { fg = c.red })
hi("htmlArg", { fg = c.orange })
link("htmlEndTag", "htmlTag")
link("xmlTag", "htmlTag")
link("xmlTagName", "htmlTagName")
link("xmlAttrib", "htmlArg")

-- ============================================================
-- 15. SPELL
-- ============================================================
hi("SpellBad", { sp = c.red, undercurl = true })
hi("SpellCap", { sp = c.orange, undercurl = true })
hi("SpellLocal", { sp = c.blue, undercurl = true })
hi("SpellRare", { sp = c.cyan, undercurl = true })

-- ============================================================
-- 16. TREESITTER (@ groups)
-- ============================================================
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.red })
hi("@variable.parameter", { fg = c.peach2 })
hi("@variable.parameter.builtin", { fg = c.peach2, italic = true })
hi("@variable.member", { fg = c.fg_prop })
hi("@property", { fg = c.fg_prop })

hi("@constant", { fg = c.peach })
hi("@constant.builtin", { fg = c.peach })
hi("@module", { fg = c.fg })
hi("@module.builtin", { fg = c.red })
hi("@label", { fg = c.brown })

hi("@string", { fg = c.fg_str })
hi("@string.escape", { fg = c.peach })
hi("@string.regexp", { fg = c.peach })
hi("@string.special", { fg = c.peach })
hi("@string.special.url", { fg = c.fg_prop, underline = true })
link("@character", "String")
link("@character.special", "SpecialChar")
link("@boolean", "Boolean")
link("@number", "Number")
link("@number.float", "Float")

hi("@type", { fg = c.red })
hi("@type.builtin", { fg = c.red })
hi("@type.definition", { fg = c.red })
hi("@attribute", { fg = c.peach })
hi("@attribute.builtin", { fg = c.peach })

hi("@function", { fg = c.orange })
hi("@function.call", { fg = c.orange })
hi("@function.method", { fg = c.orange })
hi("@function.method.call", { fg = c.orange })
hi("@function.builtin", { fg = c.red })
hi("@constructor", { fg = c.crimson })

hi("@keyword", { fg = c.rose, italic = true })
hi("@keyword.function", { fg = c.rose_dim })
hi("@keyword.operator", { fg = c.brown })
hi("@keyword.return", { fg = c.rose, italic = true })
hi("@keyword.import", { fg = c.rose, italic = true })
hi("@keyword.conditional", { fg = c.rose, italic = true })
hi("@keyword.repeat", { fg = c.rose, italic = true })
hi("@keyword.exception", { fg = c.rose, italic = true })
hi("@operator", { fg = c.brown_op })

hi("@punctuation", { fg = c.brown })
hi("@punctuation.delimiter", { fg = c.brown })
hi("@punctuation.bracket", { fg = c.peach2 })
hi("@punctuation.special", { fg = c.brown })

hi("@comment", { fg = c.comment, italic = true })
hi("@comment.documentation", { fg = c.doc, italic = true })
hi("@comment.error", { fg = c.red, bold = true })
hi("@comment.warning", { fg = c.orange, bold = true })
hi("@comment.note", { fg = c.blue, bold = true })
hi("@comment.todo", { fg = c.bg, bg = c.orange, bold = true })

-- luadoc: `---@class ColorScheme: Palette`
hi("@keyword.luadoc", { fg = c.rose, italic = true })
hi("@type.luadoc", { fg = c.red, italic = true })
hi("@variable.parameter.luadoc", { fg = c.peach2, italic = true })

hi("@markup.strong", { bold = true })
hi("@markup.italic", { italic = true })
hi("@markup.strikethrough", { strikethrough = true })
hi("@markup.underline", { underline = true })
hi("@markup", { fg = c.fg })
hi("@markup.heading", { fg = c.orange, bold = true })
hi("@markup.link", { fg = c.fg_prop, underline = true })
hi("@markup.link.url", { fg = c.fg_prop, underline = true })
hi("@markup.raw", { fg = c.fg_str })
hi("@markup.list", { fg = c.brown })

hi("@diff.plus", { fg = c.green })
hi("@diff.minus", { fg = c.red })
hi("@diff.delta", { fg = c.orange })

hi("@tag", { fg = c.red })
hi("@tag.builtin", { fg = c.red })
hi("@tag.attribute", { fg = c.orange })
hi("@tag.delimiter", { fg = c.brown })

-- ============================================================
-- 17. REMAINING NEOVIM-INTERNAL / MISC LINKS
-- ============================================================
hi("NvimInternalError", { fg = c.bg, bg = c.red })
link("NvimInvalid", "Error")
link("NvimInvalidSpacing", "ErrorMsg")
link("NvimFigureBrace", "NvimInternalError")
link("NvimSingleQuotedUnknownEscape", "NvimInternalError")
link("NvimInvalidSingleQuotedUnknownEscape", "NvimInternalError")

hi("RedrawDebugNormal", { reverse = true })
hi("RedrawDebugClear", { fg = c.bg, bg = c.peach })
hi("RedrawDebugComposed", { fg = c.bg, bg = c.green })
hi("RedrawDebugRecompose", { fg = c.bg, bg = c.red })

-- ============================================================
-- 18. FZF-LUA
-- ============================================================
link("FzfLuaNormal", "NormalFloat")
link("FzfLuaBorder", "FloatBorder")
link("FzfLuaCursor", "Cursor")
link("FzfLuaCursorLine", "CursorLine")
link("FzfLuaCursorLineNr", "CursorLineNr")
link("FzfLuaScrollFloatEmpty", "PmenuSbar")
link("FzfLuaScrollFloatFull", "PmenuThumb")
link("FzfLuaSearch", "IncSearch")

-- ============================================================
-- 19. EXTRAS (NvimTree / Neo-tree / lualine palette)
-- ============================================================
hi("NvimTreeNormal", { fg = c.fg, bg = c.bg })
hi("NvimTreeFolderIcon", { fg = c.orange })
hi("NvimTreeFolderName", { fg = c.fg_prop })
hi("NvimTreeOpenedFolderName", { fg = c.orange, bold = true })
hi("NvimTreeRootFolder", { fg = c.peach, bold = true })
hi("NvimTreeIndentMarker", { fg = c.guide })
hi("NvimTreeGitDirty", { fg = c.orange })
hi("NvimTreeGitNew", { fg = c.green })

hi("NeoTreeNormal", { fg = c.fg, bg = c.bg })
hi("NeoTreeDirectoryIcon", { fg = c.orange })
hi("NeoTreeDirectoryName", { fg = c.fg_prop })
hi("NeoTreeRootName", { fg = c.peach, bold = true })

-- statusline segments from the screenshot, ready for lualine:
--   require("lualine").setup({ options = { theme = vim.g.farout_lualine } })
-- (load the colorscheme first, e.g. lazy.nvim priority = 1000)
local mode = {
  a = { fg = c.bg, bg = c.orange, gui = "bold" },
  b = { fg = c.orange, bg = c.comment },
  c = { fg = c.peach2, bg = c.bg_alt },
}
local off = { fg = c.comment, bg = c.bg_alt }
vim.g.farout_lualine = {
  normal = mode,
  insert = mode,
  visual = mode,
  replace = mode,
  command = mode,
  inactive = { a = off, b = off, c = off },
}

return c
