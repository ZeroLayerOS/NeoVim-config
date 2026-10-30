--  ███╗   ██╗██╗   ██╗██╗███╗   ███╗    ██████╗ ███████╗███████╗ █████╗ ██╗   ██╗██╗  ████████╗
--  ████╗  ██║██║   ██║██║████╗ ████║    ██╔══██╗██╔════╝██╔════╝██╔══██╗██║   ██║██║  ╚══██╔══╝
--  ██╔██╗ ██║██║   ██║██║██╔████╔██║    ██║  ██║█████╗  █████╗  ███████║██║   ██║██║     ██║
--  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║    ██║  ██║██╔══╝  ██╔══╝  ██╔══██║██║   ██║██║     ██║
--  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║    ██████╔╝███████╗██║     ██║  ██║╚██████╔╝███████╗██║
--  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═════╝ ╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝
-- nvim_default.nvim — Neovim's built-in "default" colorscheme (the blue-grey one you
-- see on a fresh install), re-expressed as a standalone Lua colorscheme.
-- Source of truth: neovim/src/nvim/highlight_group.c
--   (highlight_init_both / _dark / _light / _cmdline and the "Default Neovim palettes")
--
-- FILE LOCATION (required for :colorscheme to find it):
--   ~/.config/nvim/colors/nvim_default.lua
--
-- Honors 'background': dark and light variants are both implemented, exactly as
-- upstream does it — the "Dark*" palette is the BACKGROUND in the dark scheme and the
-- FOREGROUND in the light scheme, and vice versa for "Light*".

-- ============================================================
-- 0. RESET
-- ============================================================
-- (unlike a single-variant theme, 'background' is NOT forced: the default scheme
--  follows it. Neovim starts with "dark" unless the terminal reports otherwise.)
if vim.g.colors_name then
  vim.cmd("highlight clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "nvim_default"

-- ============================================================
-- 1. PALETTE — Neovim's built-in Nvim{Dark,Light}* colors
-- ============================================================
local is_dark = vim.o.background ~= "light"

-- given directly in highlight_group.c (color_name_table, "Default Neovim palettes")
local dark = {
  blue = "#004c73",
  cyan = "#007373",
  green = "#005523",
  grey1 = "#07080d",
  grey2 = "#14161b",
  grey3 = "#2c2e33",
  grey4 = "#4f5258",
  magenta = "#470045",
  red = "#590008",
  yellow = "#6b5300",
}
local light = {
  blue = "#a6dbff",
  cyan = "#8cf8f7",
  green = "#b3f6c0",
  grey1 = "#eef1f8",
  grey2 = "#e0e2ea",
  grey3 = "#c4c6cd",
  grey4 = "#9b9ea4",
  magenta = "#ffcaff",
  red = "#ffc0b9",
  yellow = "#fce094",
}

-- surface palette (backgrounds) vs. content palette (text / accents) — swapped per variant
local bgp = is_dark and dark or light
local fgp = is_dark and light or dark

local c = {
  -- raw palettes, in case a plugin config wants them
  dark = dark,
  light = light,
  is_dark = is_dark,

  -- surfaces (backgrounds)
  bg0 = bgp.grey1, -- deepest: floats, folds, winbar, diff text fg
  bg1 = bgp.grey2, -- base editor background (Normal)
  bg3 = bgp.grey3, -- cursorline / popup menu
  bg4 = bgp.grey4, -- selection / statusline / gutter text / line numbers

  -- content (foregrounds)
  fg0 = fgp.grey1, -- brightest text (on colored backgrounds)
  fg = fgp.grey2, -- primary text (Normal)
  fg3 = fgp.grey3, -- inactive statusline text
  fg_muted = fgp.grey4, -- comments, folded text, winbar

  -- accents used as foreground / sp
  red = fgp.red,
  yellow = fgp.yellow,
  green = fgp.green,
  cyan = fgp.cyan,
  blue = fgp.blue,
  magenta = fgp.magenta,

  -- accents used as background (the opposite palette: dark tint on dark scheme)
  bg_red = bgp.red,
  bg_yellow = bgp.yellow,
  bg_green = bgp.green,
  bg_cyan = bgp.cyan,
  bg_blue = bgp.blue,
  bg_magenta = bgp.magenta,
}

-- ============================================================
-- 2. HELPERS
-- ============================================================
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end
-- upstream declares nearly every link as `default link`, so user/plugin overrides win
local function link(from, to)
  vim.api.nvim_set_hl(0, from, { link = to, default = true })
end
local function clear(group)
  vim.api.nvim_set_hl(0, group, {})
end

-- ============================================================
-- 3. CORE EDITOR UI
-- ============================================================
hi("Normal", { fg = c.fg, bg = c.bg1 })
hi("NormalFloat", { bg = c.bg0 })
hi("FloatShadow", { bg = c.bg4, blend = 80 })
hi("FloatShadowThrough", { bg = c.bg4, blend = 100 })

hi("SignColumn", { fg = c.bg4 })
hi("LineNr", { fg = c.bg4 })
hi("CursorLineNr", { bold = true })
hi("CursorLine", { bg = c.bg3 })
hi("CursorColumn", { bg = c.bg3 })
hi("Cursor", { fg = c.bg1, bg = c.fg })
hi("lCursor", { fg = c.bg1, bg = c.fg })
hi("TermCursor", { reverse = true })
hi("ColorColumn", { bg = c.bg4 })

hi("Visual", { bg = c.bg4 })
hi("Search", { fg = c.fg0, bg = c.bg_yellow })
hi("CurSearch", { fg = c.bg0, bg = c.yellow })

hi("MatchParen", { bg = c.bg4, bold = true })

hi("Pmenu", { bg = c.bg3 })
hi("PmenuSel", { reverse = true, blend = 0 })
hi("PmenuThumb", { bg = c.bg4 })
hi("PmenuMatch", { bold = true })
hi("PmenuMatchSel", { bold = true })

hi("StatusLine", { fg = c.fg, bg = c.bg4 })
hi("StatusLineNC", { fg = c.fg3, bg = c.bg3 })

hi("TabLineSel", { bold = true })

hi("Directory", { fg = c.cyan })
hi("Title", { fg = c.fg, bold = true })

hi("NonText", { fg = c.bg4 })

hi("Folded", { fg = c.fg_muted, bg = c.bg0 })

hi("ModeMsg", { fg = c.green })
hi("MoreMsg", { fg = c.cyan })
hi("Question", { fg = c.cyan })
hi("OkMsg", { fg = c.green })
hi("WarningMsg", { fg = c.yellow })
hi("ErrorMsg", { fg = c.red })

link("Ignore", "Normal")
hi("Conceal", { fg = c.bg4 })
hi("QuickFixLine", { fg = c.cyan })

hi("WinBar", { fg = c.fg_muted, bg = c.bg0, bold = true })
hi("WinBarNC", { fg = c.fg_muted, bg = c.bg0 })

hi("Bold", { bold = true })
hi("Italic", { italic = true })
hi("BoldItalic", { bold = true, italic = true })
hi("Underlined", { underline = true })

-- links to other groups (`default link` upstream)
-- NOTE: TabLineSel / Ignore follow the released Neovim 0.12.x behavior (verified by
-- diffing against the built-in scheme); upstream master still has the older fg/bg form.
link("CursorIM", "Cursor")
link("CursorLineFold", "FoldColumn")
link("CursorLineSign", "SignColumn")
link("DiffTextAdd", "DiffText")
link("EndOfBuffer", "NonText")
link("FloatBorder", "NormalFloat")
link("FloatFooter", "FloatTitle")
link("FloatTitle", "Title")
link("FoldColumn", "SignColumn")
link("IncSearch", "CurSearch")
link("LineNrAbove", "LineNr")
link("LineNrBelow", "LineNr")
link("MsgSeparator", "StatusLine")
clear("MsgArea")
clear("NormalNC")
link("PmenuExtra", "Pmenu")
link("PmenuExtraSel", "PmenuSel")
link("PmenuKind", "Pmenu")
link("PmenuKindSel", "PmenuSel")
link("PmenuSbar", "Pmenu")
link("PmenuBorder", "Pmenu")
link("PmenuShadow", "FloatShadow")
link("PmenuShadowThrough", "FloatShadowThrough")
link("PreInsert", "Added")
clear("ComplMatchIns")
link("ComplHint", "NonText")
link("ComplHintMore", "MoreMsg")
link("MCursor", "CurSearch")
link("MCursorVisual", "Visual")
link("Substitute", "Search")
link("StatusLineTerm", "StatusLine")
link("StatusLineTermNC", "StatusLineNC")
link("StderrMsg", "ErrorMsg")
clear("StdoutMsg")
link("TabLine", "TabLineFill")
link("TabLineFill", "StatusLineNC")
link("VertSplit", "WinSeparator")
link("VisualNOS", "Visual")
link("Whitespace", "NonText")
link("WildMenu", "PmenuSel")
link("WinSeparator", "Normal")

-- ============================================================
-- 4. CLASSIC SYNTAX GROUPS
-- ============================================================
-- Constant / Operator / PreProc / Type / Delimiter use only the Normal foreground,
-- so the scheme stays usable on any background.
hi("Constant", { fg = c.fg })
hi("Operator", { fg = c.fg })
hi("PreProc", { fg = c.fg })
hi("Type", { fg = c.fg })
hi("Delimiter", { fg = c.fg })

hi("Comment", { fg = c.fg_muted })
hi("String", { fg = c.green })
hi("Identifier", { fg = c.blue })
hi("Function", { fg = c.cyan })
hi("Statement", { fg = c.fg, bold = true })
hi("Special", { fg = c.cyan })
hi("Error", { fg = c.fg0, bg = c.bg_red })
hi("Todo", { fg = c.fg, bold = true })

link("Character", "Constant")
link("Number", "Constant")
link("Boolean", "Constant")
link("Regexp", "Constant")
link("Float", "Number")
link("Conditional", "Statement")
link("Repeat", "Statement")
link("Label", "Statement")
link("Keyword", "Statement")
link("Exception", "Statement")
link("Include", "PreProc")
link("Define", "PreProc")
link("Macro", "PreProc")
link("PreCondit", "PreProc")
link("StorageClass", "Type")
link("Structure", "Type")
link("Typedef", "Type")
link("Tag", "Special")
link("SpecialChar", "Special")
link("SpecialComment", "Special")
link("Debug", "Special")
link("SpecialKey", "Special")
link("Dimmed", "Comment")

-- ============================================================
-- 5. DIAGNOSTICS
-- ============================================================
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.cyan })
hi("DiagnosticHint", { fg = c.blue })
hi("DiagnosticOk", { fg = c.green })

hi("DiagnosticUnderlineError", { sp = c.red, underline = true })
hi("DiagnosticUnderlineWarn", { sp = c.yellow, underline = true })
hi("DiagnosticUnderlineInfo", { sp = c.cyan, underline = true })
hi("DiagnosticUnderlineHint", { sp = c.blue, underline = true })
hi("DiagnosticUnderlineOk", { sp = c.green, underline = true })

hi("DiagnosticDeprecated", { sp = c.red, strikethrough = true })

link("DiagnosticFloatingError", "DiagnosticError")
link("DiagnosticFloatingWarn", "DiagnosticWarn")
link("DiagnosticFloatingInfo", "DiagnosticInfo")
link("DiagnosticFloatingHint", "DiagnosticHint")
link("DiagnosticFloatingOk", "DiagnosticOk")
link("DiagnosticVirtualTextError", "DiagnosticError")
link("DiagnosticVirtualTextWarn", "DiagnosticWarn")
link("DiagnosticVirtualTextInfo", "DiagnosticInfo")
link("DiagnosticVirtualTextHint", "DiagnosticHint")
link("DiagnosticVirtualTextOk", "DiagnosticOk")
link("DiagnosticVirtualLinesError", "DiagnosticError")
link("DiagnosticVirtualLinesWarn", "DiagnosticWarn")
link("DiagnosticVirtualLinesInfo", "DiagnosticInfo")
link("DiagnosticVirtualLinesHint", "DiagnosticHint")
link("DiagnosticVirtualLinesOk", "DiagnosticOk")
link("DiagnosticSignError", "DiagnosticError")
link("DiagnosticSignWarn", "DiagnosticWarn")
link("DiagnosticSignInfo", "DiagnosticInfo")
link("DiagnosticSignHint", "DiagnosticHint")
link("DiagnosticSignOk", "DiagnosticOk")
link("DiagnosticUnnecessary", "Comment")

-- ============================================================
-- 6. LSP
-- ============================================================
link("LspCodeLens", "NonText")
link("LspCodeLensSeparator", "LspCodeLens")
link("LspInlayHint", "NonText")
link("LspReferenceRead", "LspReferenceText")
link("LspReferenceText", "Visual")
link("LspReferenceWrite", "LspReferenceText")
link("LspReferenceTarget", "LspReferenceText")
link("LspSignatureActiveParameter", "Visual")
link("SnippetTabstop", "Visual")
link("SnippetTabstopActive", "SnippetTabstop")

-- semantic tokens
link("@lsp.type.class", "@type")
link("@lsp.type.comment", "@comment")
link("@lsp.type.decorator", "@attribute")
link("@lsp.type.enum", "@type")
link("@lsp.type.enumMember", "@constant")
link("@lsp.type.event", "@type")
link("@lsp.type.function", "@function")
link("@lsp.type.interface", "@type")
link("@lsp.type.keyword", "@keyword")
link("@lsp.type.macro", "@constant.macro")
link("@lsp.type.method", "@function.method")
link("@lsp.type.modifier", "@type.qualifier")
link("@lsp.type.namespace", "@module")
link("@lsp.type.number", "@number")
link("@lsp.type.operator", "@operator")
link("@lsp.type.parameter", "@variable.parameter")
link("@lsp.type.property", "@property")
link("@lsp.type.regexp", "@string.regexp")
link("@lsp.type.string", "@string")
link("@lsp.type.struct", "@type")
link("@lsp.type.type", "@type")
link("@lsp.type.typeParameter", "@type.definition")
link("@lsp.type.variable", "@variable")
link("@lsp.mod.deprecated", "DiagnosticDeprecated")

-- ============================================================
-- 7. DIFF / GIT
-- ============================================================
hi("DiffAdd", { fg = c.fg0, bg = c.bg_green })
hi("DiffChange", { fg = c.fg0, bg = c.bg4 })
hi("DiffDelete", { fg = c.red, bold = true })
hi("DiffText", { fg = c.fg0, bg = c.bg_cyan })

hi("Added", { fg = c.green })
hi("Changed", { fg = c.cyan })
hi("Removed", { fg = c.red })

link("GitSignsAdd", "Added")
link("GitSignsChange", "Changed")
link("GitSignsDelete", "Removed")

-- ============================================================
-- 8. SCROLLBAR (nvim-scrollbar)
-- ============================================================
hi("ScrollbarHandle", { bg = c.bg3 })
hi("ScrollbarCursor", { fg = c.bg1 })
hi("ScrollbarCursorHandle", { fg = c.bg1, bg = c.bg1 })
for _, pair in ipairs({
  { "Error", c.red },
  { "Warn", c.yellow },
  { "Info", c.cyan },
  { "Hint", c.blue },
  { "Misc", c.cyan },
  { "Search", c.yellow },
  { "GitAdd", c.green },
  { "GitChange", c.cyan },
  { "GitDelete", c.red },
}) do
  local name, color = pair[1], pair[2]
  hi("Scrollbar" .. name, { fg = color })
  hi("Scrollbar" .. name .. "Handle", { fg = color, bg = c.bg1 })
end

-- ============================================================
-- 9. TELESCOPE  (upstream defines none — plugin groups follow the native ones)
-- ============================================================
link("TelescopeNormal", "NormalFloat")
link("TelescopeBorder", "FloatBorder")
link("TelescopeTitle", "FloatTitle")
link("TelescopePromptNormal", "NormalFloat")
link("TelescopePromptBorder", "FloatBorder")
link("TelescopePromptTitle", "FloatTitle")
link("TelescopePromptPrefix", "Special")
link("TelescopePromptCounter", "NonText")
link("TelescopeResultsNormal", "NormalFloat")
link("TelescopeResultsBorder", "FloatBorder")
link("TelescopeResultsTitle", "FloatTitle")
link("TelescopePreviewNormal", "NormalFloat")
link("TelescopePreviewBorder", "FloatBorder")
link("TelescopePreviewTitle", "FloatTitle")
link("TelescopeSelection", "Visual")
link("TelescopeSelectionCaret", "Special")
link("TelescopePreviewLine", "Visual")
link("TelescopeMatching", "Special")

-- ============================================================
-- 10. WHICHKEY
-- ============================================================
link("WhichKeyNormal", "NormalFloat")
link("WhichKeyFloat", "NormalFloat")
link("WhichKeyBorder", "FloatBorder")
link("WhichKey", "Function")
link("WhichKeyGroup", "Statement")
link("WhichKeyDesc", "Identifier")
link("WhichKeyValue", "Comment")
link("WhichKeySeparator", "NonText")

-- ============================================================
-- 11. LAZY.NVIM
-- ============================================================
link("LazyNormal", "NormalFloat")
link("LazyH1", "Title")
link("LazyH2", "Title")
link("LazyButton", "CursorLine")
link("LazyButtonActive", "Visual")
link("LazySpecial", "Special")
link("LazyComment", "Comment")
link("LazyDimmed", "Comment")

-- ============================================================
-- 12. MASON
-- ============================================================
link("MasonNormal", "NormalFloat")
link("MasonHeader", "Title")
link("MasonHighlight", "Special")
link("MasonMuted", "Comment")
link("MasonHeaderSecondary", "Visual")
link("MasonHighlightBlock", "Visual")
link("MasonHighlightBlockBold", "Visual")
link("MasonMutedBlock", "CursorLine")
link("MasonMutedBlockBold", "CursorLine")

-- ============================================================
-- 13. INDENT-BLANKLINE
-- ============================================================
link("IblIndent", "NonText")
link("IblWhitespace", "Whitespace")
link("IblScope", "Special")
link("IndentBlanklineChar", "IblIndent")
link("IndentBlanklineContextChar", "IblScope")

-- ============================================================
-- 14. FILETYPE-SPECIFIC
-- ============================================================
-- :help — highlight "===" and "---" heading delimiters as an underline rule
hi(
  "@markup.heading.1.delimiter.vimdoc",
  { default = true, bg = c.bg1, fg = c.bg1, sp = c.fg, underdouble = true, nocombine = true }
)
hi(
  "@markup.heading.2.delimiter.vimdoc",
  { default = true, bg = c.bg1, fg = c.bg1, sp = c.fg, underline = true, nocombine = true }
)

-- ============================================================
-- 15. SPELL
-- ============================================================
hi("SpellBad", { sp = c.red, undercurl = true })
hi("SpellCap", { sp = c.yellow, undercurl = true })
hi("SpellLocal", { sp = c.green, undercurl = true })
hi("SpellRare", { sp = c.cyan, undercurl = true })

-- ============================================================
-- 16. TREESITTER (@ groups)
-- ============================================================
hi("@variable", { fg = c.fg })

hi("@markup.strong", { bold = true })
hi("@markup.italic", { italic = true })
hi("@markup.strikethrough", { strikethrough = true })
hi("@markup.underline", { underline = true })

link("@variable.builtin", "Special")
link("@variable.parameter.builtin", "Special")
link("@constant", "Constant")
link("@constant.builtin", "Special")
link("@module", "Structure")
link("@module.builtin", "Special")
link("@label", "Label")
link("@string", "String")
link("@string.regexp", "@string.special")
link("@string.escape", "@string.special")
link("@string.special", "SpecialChar")
link("@string.special.url", "Underlined")
link("@character", "Character")
link("@character.special", "SpecialChar")
link("@boolean", "Boolean")
link("@number", "Number")
link("@number.float", "Float")
link("@type", "Type")
link("@type.builtin", "Special")
link("@attribute", "Macro")
link("@attribute.builtin", "Special")
link("@property", "Identifier")
link("@function", "Function")
link("@function.builtin", "Special")
link("@constructor", "Special")
link("@operator", "Operator")
link("@keyword", "Keyword")
link("@punctuation", "Delimiter")
link("@punctuation.special", "Special")
link("@comment", "Comment")
link("@comment.error", "DiagnosticError")
link("@comment.warning", "DiagnosticWarn")
link("@comment.note", "DiagnosticInfo")
link("@comment.todo", "Todo")
link("@markup", "Special")
link("@markup.heading", "Title")
link("@markup.link", "Underlined")
link("@diff.plus", "Added")
link("@diff.minus", "Removed")
link("@diff.delta", "Changed")
link("@tag", "Tag")
link("@tag.builtin", "Special")

-- ============================================================
-- 17. REMAINING NEOVIM-INTERNAL / MISC LINKS
-- ============================================================
hi("NvimInternalError", { fg = "#ff0000", bg = "#ff0000" })

hi("RedrawDebugNormal", { reverse = true })
hi("RedrawDebugClear", { bg = c.bg_yellow })
hi("RedrawDebugComposed", { bg = c.bg_green })
hi("RedrawDebugRecompose", { bg = c.bg_red })

-- (the Nvim* expression-parser groups of :help expression-highlighting are defined
--  by Neovim itself and survive `highlight clear`, so nothing to repeat here)

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
-- 19. EXTRAS (NvimTree / Neo-tree) — follow the native groups
-- ============================================================
link("NvimTreeNormal", "Normal")
link("NvimTreeFolderIcon", "Directory")
link("NvimTreeFolderName", "Directory")
link("NvimTreeOpenedFolderName", "Directory")
link("NvimTreeRootFolder", "Title")
link("NvimTreeIndentMarker", "NonText")
link("NvimTreeGitDirty", "Changed")
link("NvimTreeGitNew", "Added")

link("NeoTreeNormal", "Normal")
link("NeoTreeDirectoryIcon", "Directory")
link("NeoTreeDirectoryName", "Directory")
link("NeoTreeRootName", "Title")

return c
