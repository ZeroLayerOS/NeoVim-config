-- ~/.config/nvim/colors/DragonBallZ.lua
-- Dragon Ball Z colorscheme for Neovim
-- Ported from a Kitty terminal theme (Super Saiyan gold / Ki-blast palette)

if vim.g.colors_name then
  vim.cmd("hi clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "DragonBallZ"

-- Palette --------------------------------------------------------------
-- Base values taken directly from the Kitty theme:
--   background #12131a   foreground #ffb703
--   cursor #ffb703
--   selection_background #1d3557 / selection_foreground #ffffff
--   color0..15 as supplied
local c = {
  bg        = "#12131a", -- Background (kitty: background)
  surface   = "#16171f", -- Surface / Float / Telescope (derived, slightly lifted off bg)
  selection = "#1d3557", -- Selection / CursorLine (kitty: selection_background / color4)
  accent    = "#ffb703", -- Primary Accent — cursor / keywords (kitty: cursor / foreground / color11)
  border    = "#2b2d42", -- Borders / Separators (kitty: color8)
  type      = "#48cae4", -- Types / Traits / Structs (kitty: color12, bright blue)
  warn      = "#e76f51", -- Warnings / Todo (kitty: color3, burnt orange)
  const     = "#f72585", -- Lifetimes / Constants / Numbers (kitty: color13, ki-blast pink)
  func      = "#52b788", -- Functions / Methods (kitty: color10, bright green)
  string    = "#90e0ef", -- Strings / Info / Hint (kitty: color14, bright cyan)
  variable  = "#d8e2dc", -- Variables / Fields (kitty: color7, soft off-white)
  comment   = "#565973", -- Comments (derived muted slate, no direct kitty slot)
  error     = "#ff0054", -- Error (kitty: color9, bright red)
  punct     = "#6b6e85", -- Punctuation (derived mid gray, between border and variable)
  folder    = "#00b4d8", -- Folders (kitty: color6, cyan)
  fg        = "#ffb703", -- Foreground (kitty: foreground, gold — matches accent by design)
  -- Extra tints pulled straight from the palette
  darkred     = "#e63946", -- color1 — DiffDelete / dim error
  darkgreen   = "#2a9d8f", -- color2 — dim green accents
  darkblue    = "#1d3557", -- color4 — dim blue accents / selection
  brightcyan  = "#90e0ef", -- color14 — bright cyan, bright variant
  tabinactive = "#1b1c26", -- inactive_tab_background
  none      = "NONE",
}

local hl = vim.api.nvim_set_hl

-- Highlight groups -------------------------------------------------------
local groups = {
  -- UI / Editor chrome
  Normal          = { fg = c.fg, bg = c.bg },
  NormalNC        = { fg = c.fg, bg = c.bg },
  NormalFloat     = { fg = c.fg, bg = c.surface },
  FloatBorder     = { fg = c.border, bg = c.surface },
  FloatTitle      = { fg = c.accent, bg = c.surface, bold = true },
  Pmenu           = { fg = c.fg, bg = c.surface },
  PmenuSel        = { fg = c.bg, bg = c.accent, bold = true },
  PmenuSbar       = { bg = c.surface },
  PmenuThumb      = { bg = c.type },
  CursorLine      = { bg = c.selection },
  CursorLineNr    = { fg = c.accent, bold = true },
  CursorColumn    = { bg = c.selection },
  LineNr          = { fg = c.border },
  Visual          = { fg = "#ffffff", bg = c.selection },
  VisualNOS       = { fg = "#ffffff", bg = c.selection },
  Search          = { fg = c.bg, bg = c.type },
  IncSearch       = { fg = c.bg, bg = c.accent },
  CurSearch       = { fg = c.bg, bg = c.accent },
  StatusLine      = { fg = c.fg, bg = c.surface },
  StatusLineNC    = { fg = c.comment, bg = c.surface },
  WinSeparator    = { fg = c.border },
  VertSplit       = { fg = c.border },
  SignColumn      = { bg = c.bg },
  FoldColumn      = { fg = c.comment, bg = c.bg },
  Folded          = { fg = c.comment, bg = c.surface },
  ColorColumn     = { bg = c.selection },
  Cursor          = { fg = c.bg, bg = c.accent },
  TabLine         = { fg = c.comment, bg = c.tabinactive },
  TabLineSel      = { fg = c.bg, bg = c.accent, bold = true },
  TabLineFill     = { bg = c.tabinactive },
  MatchParen      = { fg = c.accent, bold = true, underline = true },
  NonText         = { fg = c.border },
  Whitespace      = { fg = c.border },
  WinBar          = { fg = c.fg, bg = c.bg },
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

  -- Diagnostics
  DiagnosticError          = { fg = c.error },
  DiagnosticWarn           = { fg = c.warn },
  DiagnosticInfo           = { fg = c.type },
  DiagnosticHint           = { fg = c.string },
  DiagnosticOk             = { fg = c.func },
  DiagnosticUnderlineError = { undercurl = true, sp = c.error },
  DiagnosticUnderlineWarn  = { undercurl = true, sp = c.warn },
  DiagnosticUnderlineInfo  = { undercurl = true, sp = c.type },
  DiagnosticUnderlineHint  = { undercurl = true, sp = c.string },
  DiagnosticVirtualTextError = { fg = c.error, bg = c.bg },
  DiagnosticVirtualTextWarn  = { fg = c.warn, bg = c.bg },
  DiagnosticVirtualTextInfo  = { fg = c.type, bg = c.bg },
  DiagnosticVirtualTextHint  = { fg = c.string, bg = c.bg },

  -- Diffs
  DiffAdd     = { fg = c.func, bg = c.bg },
  DiffChange  = { fg = c.warn, bg = c.bg },
  DiffDelete  = { fg = c.darkred, bg = c.bg },
  DiffText    = { fg = c.accent, bg = c.bg },

  -- Generic fallback (netrw, fern, and anything that just uses Directory)
  Directory   = { fg = c.folder, bold = true },

  -- nvim-tree.lua
  NvimTreeFolderIcon       = { fg = c.folder },
  NvimTreeFolderName       = { fg = c.folder },
  NvimTreeOpenedFolderName = { fg = c.brightcyan, bold = true },
  NvimTreeEmptyFolderName  = { fg = c.folder },
  NvimTreeRootFolder       = { fg = c.folder, bold = true },
  NvimTreeSpecialFile      = { fg = c.type, underline = true },
  NvimTreeIndentMarker     = { fg = c.border },
  NvimTreeNormal           = { fg = c.fg, bg = c.surface },
  NvimTreeWinSeparator     = { fg = c.border, bg = c.surface },
  NvimTreeGitDirty         = { fg = c.warn },
  NvimTreeGitNew           = { fg = c.func },
  NvimTreeGitDeleted       = { fg = c.error },

  -- neo-tree.nvim
  NeoTreeDirectoryIcon = { fg = c.folder },
  NeoTreeDirectoryName = { fg = c.folder },
  NeoTreeRootName      = { fg = c.brightcyan, bold = true },
  NeoTreeSymbolicLinkTarget = { fg = c.type },
  NeoTreeIndentMarker  = { fg = c.border },
  NeoTreeNormal        = { fg = c.fg, bg = c.surface },
  NeoTreeGitAdded      = { fg = c.func },
  NeoTreeGitDeleted    = { fg = c.error },
  NeoTreeGitModified   = { fg = c.warn },

  -- snacks.nvim (explorer / picker — LazyVim's newer default explorer)
  SnacksPickerDirectory = { fg = c.folder },
  SnacksPickerDir       = { fg = c.folder },
  SnacksPickerIcon      = { fg = c.folder },
  SnacksPickerPathHidden = { fg = c.comment },
  SnacksPickerGitStatusUntracked = { fg = c.func },
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

