-- ~/.config/nvim/colors/claude.lua
-- Neovim colorscheme derived from Claude's UI palette (16 colors extracted from screenshot)
-- Activate with: :colorscheme claude
--
-- IMPORTANT (Neovim colorscheme convention):
--   Vim/Neovim colorschemes are discovered ONLY from a file at:
--       colors/<name>.lua
--   So this file must live at:  ~/.config/nvim/colors/claude.lua
--   (NOT lua/colors/ or "color schema.lua" — that path won't be picked up
--    automatically by :colorscheme claude, only via require() manually).

-- ============================================================
-- 1. RESET
-- ============================================================
if vim.g.colors_name then
  vim.cmd("highlight clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "claude"

-- ============================================================
-- 2. PALETTE (16 colors — extracted directly from the Claude UI)
-- ============================================================
local c = {
  bg0        = "#111111", -- deepest bg (sidebar)
  bg1        = "#151515", -- base editor bg
  bg2        = "#20201F", -- panel / float / popup bg
  bg3        = "#2B2B2A", -- visual selection / hover
  bg4        = "#343434", -- cursorline / lighter ui surface
  border     = "#353535", -- subtle borders / separators
  bg_alt     = "#292928", -- secondary surface (statusline, tabline)
  fg_muted   = "#545452", -- comments / line numbers / disabled
  fg_icon    = "#E8E7E4", -- icons / types / secondary fg
  fg         = "#F0EFEC", -- primary text
  yellow     = "#FAB219", -- functions / active indicators
  orange_lt  = "#D97757", -- strings / brand accent (light)
  orange     = "#C6613F", -- keywords / primary accent
  orange_dk  = "#954E35", -- constants / booleans / shadow accent
  black      = "#000000",
  white      = "#FFFFFF",
}

-- ============================================================
-- 3. HELPER
-- ============================================================
local hl = vim.api.nvim_set_hl

-- ============================================================
-- 4. EDITOR UI
-- ============================================================
hl(0, "Normal",         { fg = c.fg,       bg = c.bg1 })
hl(0, "NormalFloat",    { fg = c.fg,       bg = c.bg2 })
hl(0, "NormalNC",       { fg = c.fg_muted, bg = c.bg1 })
hl(0, "FloatBorder",    { fg = c.border,   bg = c.bg2 })
hl(0, "SignColumn",     { fg = c.fg_muted, bg = c.bg1 })
hl(0, "LineNr",         { fg = c.fg_muted, bg = c.bg1 })
hl(0, "CursorLineNr",   { fg = c.orange,   bg = c.bg4, bold = true })
hl(0, "CursorLine",     { bg = c.bg4 })
hl(0, "CursorColumn",   { bg = c.bg4 })
hl(0, "ColorColumn",    { bg = c.bg3 })
hl(0, "Visual",         { bg = c.bg3 })
hl(0, "VisualNOS",      { bg = c.bg3 })
hl(0, "Cursor",         { fg = c.bg1,      bg = c.fg })
hl(0, "Search",         { fg = c.bg0,      bg = c.yellow })
hl(0, "IncSearch",      { fg = c.bg0,      bg = c.orange_lt })
hl(0, "MatchParen",     { fg = c.orange,   bold = true, underline = true })
hl(0, "Pmenu",          { fg = c.fg,       bg = c.bg2 })
hl(0, "PmenuSel",       { fg = c.bg0,      bg = c.orange })
hl(0, "PmenuSbar",      { bg = c.bg3 })
hl(0, "PmenuThumb",     { bg = c.fg_muted })
hl(0, "WinSeparator",   { fg = c.border,   bg = c.bg1 })
hl(0, "VertSplit",      { fg = c.border,   bg = c.bg1 })
hl(0, "StatusLine",     { fg = c.fg,       bg = c.bg_alt })
hl(0, "StatusLineNC",   { fg = c.fg_muted, bg = c.bg_alt })
hl(0, "TabLine",        { fg = c.fg_muted, bg = c.bg_alt })
hl(0, "TabLineSel",     { fg = c.bg0,      bg = c.orange })
hl(0, "TabLineFill",    { bg = c.bg0 })
hl(0, "WildMenu",       { fg = c.bg0,      bg = c.orange })
hl(0, "Directory",      { fg = c.orange_lt })
hl(0, "Title",          { fg = c.orange,   bold = true })
hl(0, "NonText",        { fg = c.bg4 })
hl(0, "Whitespace",     { fg = c.bg4 })
hl(0, "EndOfBuffer",    { fg = c.bg1 })
hl(0, "Folded",         { fg = c.fg_muted, bg = c.bg2, italic = true })
hl(0, "FoldColumn",     { fg = c.fg_muted, bg = c.bg1 })

-- ============================================================
-- 5. SYNTAX (classic groups)
-- ============================================================
hl(0, "Comment",        { fg = c.fg_muted,  italic = true })
hl(0, "Constant",       { fg = c.orange_dk })
hl(0, "String",         { fg = c.orange_lt })
hl(0, "Character",      { fg = c.orange_lt })
hl(0, "Number",         { fg = c.orange_dk })
hl(0, "Boolean",        { fg = c.orange_dk, bold = true })
hl(0, "Float",          { fg = c.orange_dk })
hl(0, "Identifier",     { fg = c.fg_icon })
hl(0, "Function",       { fg = c.yellow })
hl(0, "Statement",      { fg = c.orange,    bold = true })
hl(0, "Conditional",    { fg = c.orange,    bold = true })
hl(0, "Repeat",         { fg = c.orange,    bold = true })
hl(0, "Label",          { fg = c.orange })
hl(0, "Operator",       { fg = c.fg })
hl(0, "Keyword",        { fg = c.orange,    bold = true })
hl(0, "Exception",      { fg = c.orange,    bold = true })
hl(0, "PreProc",        { fg = c.orange_lt })
hl(0, "Include",        { fg = c.orange_lt })
hl(0, "Define",         { fg = c.orange_lt })
hl(0, "Macro",          { fg = c.orange_lt })
hl(0, "Type",           { fg = c.fg_icon,   bold = true })
hl(0, "StorageClass",   { fg = c.fg_icon })
hl(0, "Structure",      { fg = c.fg_icon })
hl(0, "Typedef",        { fg = c.fg_icon })
hl(0, "Special",        { fg = c.fg_muted })
hl(0, "SpecialChar",    { fg = c.orange_lt })
hl(0, "Delimiter",      { fg = c.fg_muted })
hl(0, "Underlined",     { underline = true })
hl(0, "Ignore",         { fg = c.fg_muted })
hl(0, "Error",          { fg = c.white, bg = c.orange, bold = true })
hl(0, "Todo",           { fg = c.bg0, bg = c.yellow, bold = true })

-- ============================================================
-- 6. TREESITTER (@ groups)
-- ============================================================
hl(0, "@variable",            { fg = c.fg })
hl(0, "@variable.builtin",    { fg = c.orange_dk, italic = true })
hl(0, "@variable.parameter",  { fg = c.fg_icon })
hl(0, "@constant",             { fg = c.orange_dk })
hl(0, "@constant.builtin",     { fg = c.orange_dk, bold = true })
hl(0, "@string",               { fg = c.orange_lt })
hl(0, "@string.escape",        { fg = c.yellow })
hl(0, "@number",               { fg = c.orange_dk })
hl(0, "@boolean",              { fg = c.orange_dk, bold = true })
hl(0, "@function",             { fg = c.yellow })
hl(0, "@function.call",        { fg = c.yellow })
hl(0, "@function.builtin",     { fg = c.yellow, italic = true })
hl(0, "@method",               { fg = c.yellow })
hl(0, "@constructor",          { fg = c.fg_icon })
hl(0, "@keyword",              { fg = c.orange, bold = true })
hl(0, "@keyword.function",     { fg = c.orange, bold = true })
hl(0, "@keyword.return",       { fg = c.orange, bold = true })
hl(0, "@conditional",          { fg = c.orange, bold = true })
hl(0, "@repeat",               { fg = c.orange, bold = true })
hl(0, "@type",                 { fg = c.fg_icon, bold = true })
hl(0, "@type.builtin",         { fg = c.fg_icon })
hl(0, "@property",             { fg = c.fg_icon })
hl(0, "@field",                { fg = c.fg_icon })
hl(0, "@comment",              { fg = c.fg_muted, italic = true })
hl(0, "@punctuation.delimiter",{ fg = c.fg_muted })
hl(0, "@punctuation.bracket",  { fg = c.fg_muted })
hl(0, "@tag",                  { fg = c.orange })
hl(0, "@tag.attribute",        { fg = c.fg_icon })
hl(0, "@tag.delimiter",        { fg = c.fg_muted })

-- ============================================================
-- 7. LSP / DIAGNOSTICS
-- ============================================================
hl(0, "DiagnosticError",       { fg = c.orange })
hl(0, "DiagnosticWarn",        { fg = c.yellow })
hl(0, "DiagnosticInfo",        { fg = c.orange_lt })
hl(0, "DiagnosticHint",        { fg = c.fg_muted })
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.orange })
hl(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
hl(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = c.orange_lt })
hl(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = c.fg_muted })
hl(0, "LspReferenceText",      { bg = c.bg3 })
hl(0, "LspReferenceRead",      { bg = c.bg3 })
hl(0, "LspReferenceWrite",     { bg = c.bg3 })
hl(0, "LspInlayHint",          { fg = c.fg_muted, bg = c.bg2, italic = true })

-- ============================================================
-- 8. DIFF / GIT
-- ============================================================
hl(0, "DiffAdd",     { fg = c.fg,       bg = c.bg3 })
hl(0, "DiffChange",  { fg = c.yellow,   bg = c.bg3 })
hl(0, "DiffDelete",  { fg = c.orange_dk,bg = c.bg2 })
hl(0, "DiffText",    { fg = c.orange,   bg = c.bg3, bold = true })
hl(0, "GitSignsAdd",    { fg = c.fg_icon })
hl(0, "GitSignsChange", { fg = c.yellow })
hl(0, "GitSignsDelete", { fg = c.orange_dk })

-- ============================================================
-- 9. PLUGIN GROUPS (Telescope, NvimTree/Neo-tree, WhichKey, IBL)
-- ============================================================
hl(0, "TelescopeNormal",       { fg = c.fg,       bg = c.bg2 })
hl(0, "TelescopeBorder",       { fg = c.border,   bg = c.bg2 })
hl(0, "TelescopePromptNormal", { fg = c.fg,       bg = c.bg3 })
hl(0, "TelescopePromptBorder", { fg = c.border,   bg = c.bg3 })
hl(0, "TelescopeSelection",    { fg = c.fg,       bg = c.bg4, bold = true })
hl(0, "TelescopeMatching",     { fg = c.orange,   bold = true })

hl(0, "NvimTreeNormal",        { fg = c.fg,       bg = c.bg0 })
hl(0, "NvimTreeFolderIcon",    { fg = c.orange_lt })
hl(0, "NvimTreeFolderName",    { fg = c.fg_icon })
hl(0, "NvimTreeOpenedFolderName", { fg = c.orange, bold = true })
hl(0, "NvimTreeRootFolder",    { fg = c.orange,   bold = true })
hl(0, "NvimTreeIndentMarker",  { fg = c.bg4 })
hl(0, "NvimTreeGitDirty",      { fg = c.yellow })
hl(0, "NvimTreeGitNew",        { fg = c.orange_lt })

hl(0, "NeoTreeNormal",         { fg = c.fg,       bg = c.bg0 })
hl(0, "NeoTreeDirectoryIcon",  { fg = c.orange_lt })
hl(0, "NeoTreeDirectoryName",  { fg = c.fg_icon })
hl(0, "NeoTreeRootName",       { fg = c.orange,   bold = true })

hl(0, "WhichKeyFloat",         { bg = c.bg2 })
hl(0, "WhichKey",               { fg = c.orange })
hl(0, "WhichKeyGroup",          { fg = c.yellow })
hl(0, "WhichKeyDesc",           { fg = c.fg })

hl(0, "IndentBlanklineChar",           { fg = c.bg4 })
hl(0, "IndentBlanklineContextChar",    { fg = c.orange_dk })
hl(0, "IblIndent",                     { fg = c.bg4 })
hl(0, "IblScope",                      { fg = c.orange_dk })

-- ============================================================
-- 10. LUALINE-COMPATIBLE PALETTE (import from another config file)
-- ============================================================
-- Usage in lualine.lua:
--   local claude = require("colors.claude_palette")
--   options = { theme = { normal = { a = { bg = claude.orange, fg = claude.bg0, gui="bold" } } } }
return c
