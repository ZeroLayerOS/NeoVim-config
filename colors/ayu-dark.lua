-- ~/.config/nvim/colors/ayu-dark.lua
-- Ayu Dark colorscheme for Neovim
-- Based on the official Ayu Dark palette (github.com/ayu-theme/ayu-colors)

if vim.g.colors_name then
  vim.cmd("hi clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "ayu-dark"

-- Palette --------------------------------------------------------------
local c = {
  bg        = "#0a0e14", -- Background
  surface   = "#0d1017", -- Surface / Float / Telescope
  selection = "#273747", -- Selection / CursorLine
  accent    = "#ff8f40", -- Primary Accent (borders, cursor, keywords) — ayu orange
  border    = "#1f2430", -- Borders / Separators
  type      = "#59c2ff", -- Types / Traits / Structs — ayu blue
  warn      = "#e6b673", -- Warnings / Todo — ayu annotation tone
  const     = "#d2a6ff", -- Lifetimes / Constants / Numbers — ayu purple
  func      = "#ffb454", -- Functions / Methods — ayu yellow
  string    = "#aad94c", -- Strings / Info / Hint — ayu green
  variable  = "#bfbdb6", -- Variables / Fields — ayu foreground
  comment   = "#5c6773", -- Comments
  error     = "#ff3333", -- Error
  punct     = "#6c7380", -- Punctuation (brackets, commas, delimiters) — readable, not border
  folder    = "#39bae6", -- Folders — ayu tag blue
  -- Bright tints (match Kitty ayu-dark bright colors, kept in sync)
  string_bright = "#eafe84", -- bright green tint (Kitty color10)
  punct_bright  = "#68d5ff", -- bright blue tint (Kitty color12)
  folder_bright = "#73d0ff", -- bright cyan-blue tint (Kitty color14)
  none      = "NONE",
}

local hl = vim.api.nvim_set_hl

-- Highlight groups -------------------------------------------------------
local groups = {
  -- UI / Editor chrome
  Normal          = { fg = c.variable, bg = c.bg },
  NormalNC        = { fg = c.variable, bg = c.bg },
  NormalFloat     = { fg = c.variable, bg = c.surface },
  FloatBorder     = { fg = c.border, bg = c.surface },
  FloatTitle      = { fg = c.accent, bg = c.surface, bold = true },
  Pmenu           = { fg = c.variable, bg = c.surface },
  PmenuSel        = { fg = c.bg, bg = c.accent, bold = true },
  PmenuSbar       = { bg = c.surface },
  PmenuThumb      = { bg = c.punct_bright },
  CursorLine      = { bg = c.selection },
  CursorLineNr    = { fg = c.accent, bold = true },
  CursorColumn    = { bg = c.selection },
  LineNr          = { fg = c.border },
  Visual          = { bg = c.selection },
  VisualNOS       = { bg = c.selection },
  Search          = { fg = c.bg, bg = c.type },
  IncSearch       = { fg = c.bg, bg = c.accent },
  CurSearch       = { fg = c.bg, bg = c.accent },
  StatusLine      = { fg = c.variable, bg = c.surface },
  StatusLineNC    = { fg = c.comment, bg = c.surface },
  WinSeparator    = { fg = c.border },
  VertSplit       = { fg = c.border },
  SignColumn      = { bg = c.bg },
  FoldColumn      = { fg = c.comment, bg = c.bg },
  Folded          = { fg = c.comment, bg = c.surface },
  ColorColumn     = { bg = c.selection },
  Cursor          = { fg = c.bg, bg = c.accent },
  TabLine         = { fg = c.comment, bg = c.surface },
  TabLineSel      = { fg = c.accent, bg = c.bg, bold = true },
  TabLineFill     = { bg = c.surface },
  MatchParen      = { fg = c.accent, bold = true, underline = true },
  NonText         = { fg = c.border },
  Whitespace      = { fg = c.border },
  WinBar          = { fg = c.variable, bg = c.bg },
  WinBarNC        = { fg = c.comment, bg = c.bg },

  -- Base syntax
  Comment         = { fg = c.comment, italic = true },
  Constant        = { fg = c.const },
  String          = { fg = c.string },
  Character       = { fg = c.string },
  Number          = { fg = c.const },
  Boolean         = { fg = c.const, bold = true },
  Float           = { fg = c.const },
  Identifier      = { fg = c.variable },
  Function        = { fg = c.func },
  Statement       = { fg = c.accent },
  Conditional     = { fg = c.accent },
  Repeat          = { fg = c.accent },
  Label           = { fg = c.accent },
  Operator        = { fg = c.accent },
  Keyword         = { fg = c.accent, bold = true },
  Exception       = { fg = c.accent, bold = true },
  PreProc         = { fg = c.type },
  Include         = { fg = c.accent },
  Define          = { fg = c.accent },
  Macro           = { fg = c.accent, bold = true },
  PreCondit       = { fg = c.type },
  Type            = { fg = c.type },
  StorageClass    = { fg = c.type },
  Structure       = { fg = c.type },
  Typedef         = { fg = c.type },
  Special         = { fg = c.const },
  SpecialChar     = { fg = c.const },
  Tag             = { fg = c.accent },
  Delimiter       = { fg = c.punct },
  SpecialComment  = { fg = c.comment, bold = true },
  Debug           = { fg = c.error },
  Underlined      = { underline = true },
  Ignore          = { fg = c.comment },
  Error           = { fg = c.error, bold = true },
  Todo            = { fg = c.warn, bold = true },

  -- Diagnostics (matches the requested diagnostics mapping)
  DiagnosticError          = { fg = c.error },
  DiagnosticWarn           = { fg = c.warn },
  DiagnosticInfo           = { fg = c.string },
  DiagnosticHint           = { fg = c.string },
  DiagnosticOk             = { fg = c.string_bright },
  DiagnosticUnderlineError = { undercurl = true, sp = c.error },
  DiagnosticUnderlineWarn  = { undercurl = true, sp = c.warn },
  DiagnosticUnderlineInfo  = { undercurl = true, sp = c.string },
  DiagnosticUnderlineHint  = { undercurl = true, sp = c.string },
  DiagnosticVirtualTextError = { fg = c.error, bg = c.bg },
  DiagnosticVirtualTextWarn  = { fg = c.warn, bg = c.bg },
  DiagnosticVirtualTextInfo  = { fg = c.string, bg = c.bg },
  DiagnosticVirtualTextHint  = { fg = c.string, bg = c.bg },

  -- Diffs
  DiffAdd     = { fg = c.string, bg = c.bg },
  DiffChange  = { fg = c.warn, bg = c.bg },
  DiffDelete  = { fg = c.error, bg = c.bg },
  DiffText    = { fg = c.accent, bg = c.bg },

  -- Generic fallback (netrw, fern, and anything that just uses Directory)
  Directory   = { fg = c.folder, bold = true },

  -- nvim-tree.lua
  NvimTreeFolderIcon       = { fg = c.folder },
  NvimTreeFolderName       = { fg = c.folder },
  NvimTreeOpenedFolderName = { fg = c.folder_bright, bold = true },
  NvimTreeEmptyFolderName  = { fg = c.folder },
  NvimTreeRootFolder       = { fg = c.folder, bold = true },
  NvimTreeSpecialFile      = { fg = c.type, underline = true },
  NvimTreeIndentMarker     = { fg = c.border },
  NvimTreeNormal           = { fg = c.variable, bg = c.surface },
  NvimTreeWinSeparator     = { fg = c.border, bg = c.surface },
  NvimTreeGitDirty         = { fg = c.warn },
  NvimTreeGitNew           = { fg = c.string },
  NvimTreeGitDeleted       = { fg = c.error },

  -- neo-tree.nvim
  NeoTreeDirectoryIcon = { fg = c.folder },
  NeoTreeDirectoryName = { fg = c.folder },
  NeoTreeRootName      = { fg = c.folder_bright, bold = true },
  NeoTreeSymbolicLinkTarget = { fg = c.type },
  NeoTreeIndentMarker  = { fg = c.border },
  NeoTreeNormal        = { fg = c.variable, bg = c.surface },
  NeoTreeGitAdded      = { fg = c.string },
  NeoTreeGitDeleted    = { fg = c.error },
  NeoTreeGitModified   = { fg = c.warn },

  -- snacks.nvim (explorer / picker — LazyVim's newer default explorer)
  SnacksPickerDirectory = { fg = c.folder },
  SnacksPickerDir       = { fg = c.folder },
  SnacksPickerIcon      = { fg = c.folder },
  SnacksPickerPathHidden = { fg = c.comment },
  SnacksPickerGitStatusUntracked = { fg = c.string },
  SnacksPickerGitStatusModified  = { fg = c.warn },
  SnacksPickerGitStatusDeleted   = { fg = c.error },

  -- Treesitter (@-groups)
  ["@keyword"]               = { link = "Keyword" },
  ["@keyword.function"]      = { fg = c.accent, italic = true },
  ["@keyword.operator"]      = { fg = c.accent },
  ["@keyword.return"]        = { fg = c.accent, bold = true },
  ["@keyword.import"]        = { fg = c.accent },
  ["@function"]              = { link = "Function" },
  ["@function.call"]         = { fg = c.func },
  ["@function.macro"]        = { fg = c.accent, bold = true },
  ["@function.builtin"]      = { fg = c.func, italic = true },
  ["@method"]                = { fg = c.func },
  ["@method.call"]           = { fg = c.func },
  ["@constructor"]           = { fg = c.type },
  ["@type"]                  = { link = "Type" },
  ["@type.builtin"]          = { fg = c.type, italic = true },
  ["@type.definition"]       = { fg = c.type },
  ["@attribute"]             = { fg = c.const },
  ["@string"]                = { link = "String" },
  ["@string.escape"]         = { fg = c.const },
  ["@string.special"]        = { fg = c.const },
  ["@comment"]               = { link = "Comment" },
  ["@variable"]              = { fg = c.variable },
  ["@variable.builtin"]      = { fg = c.const, italic = true },
  ["@variable.parameter"]    = { fg = c.variable, italic = true },
  ["@variable.member"]       = { fg = c.variable },
  ["@constant"]              = { link = "Constant" },
  ["@constant.builtin"]      = { fg = c.const, bold = true },
  ["@property"]              = { fg = c.variable },
  ["@field"]                 = { fg = c.variable },
  ["@parameter"]             = { fg = c.variable, italic = true },
  ["@punctuation.delimiter"] = { fg = c.punct },
  ["@punctuation.bracket"]   = { fg = c.punct },
  ["@punctuation.special"]   = { fg = c.accent },
  ["@operator"]              = { link = "Operator" },
  ["@tag"]                   = { fg = c.accent },
  ["@tag.attribute"]         = { fg = c.type, italic = true },
  ["@tag.delimiter"]         = { fg = c.punct },
  ["@lsp.type.lifetime"]     = { fg = c.const, italic = true },
  ["@lsp.type.macro"]        = { fg = c.accent, bold = true },
  ["@lsp.type.enum"]         = { fg = c.type },
  ["@lsp.type.struct"]       = { fg = c.type },
  ["@lsp.type.trait"]        = { fg = c.type },
  ["@lsp.typemod.variable.readonly"] = { fg = c.const },
}

for group, opts in pairs(groups) do
  hl(0, group, opts)
end

