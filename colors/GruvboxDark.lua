-- ~/.config/nvim/colors/GruvboxDark.lua
-- Gruvbox Dark colorscheme for Neovim
-- Ported from the official morhetz/gruvbox palette (retro groove, warm
-- pastel colors), medium-contrast dark variant.

if vim.g.colors_name then
  vim.cmd("hi clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "GruvboxDark"

-- Palette --------------------------------------------------------------
-- Base values taken from the official Gruvbox palette (dark0/dark1/dark2,
-- light1 foreground, and the bright/neutral accent colors).
local c = {
  bg        = "#282828", -- Background (dark0, medium contrast)
  surface   = "#1d2021", -- Surface / Float / Telescope (dark0_hard)
  selection = "#504945", -- Selection / CursorLine (dark2)
  accent    = "#fb4934", -- Primary Accent — cursor / keywords (bright_red)
  border    = "#665c54", -- Borders / Separators (dark3)
  type      = "#fabd2f", -- Types / Traits / Structs (bright_yellow)
  warn      = "#d79921", -- Warnings / Todo (neutral_yellow)
  const     = "#d3869b", -- Lifetimes / Constants / Numbers (bright_purple)
  func      = "#b8bb26", -- Functions / Methods (bright_green)
  string    = "#b8bb26", -- Strings / Info / Hint (bright_green — gruvbox uses the same green for both)
  variable  = "#83a598", -- Variables / Fields (bright_blue — the iconic gruvbox Identifier color)
  comment   = "#928374", -- Comments (gray)
  error     = "#fb4934", -- Error (bright_red)
  punct     = "#a89984", -- Punctuation (light4)
  folder    = "#8ec07c", -- Folders (bright_aqua)
  fg        = "#ebdbb2", -- Foreground (light1)
  orange    = "#fe8019", -- Operator / Special (bright_orange — gruvbox's signature pop of color)
  -- Extra tints pulled straight from the palette
  darkred     = "#cc241d", -- neutral_red — DiffDelete / dim error
  darkgreen   = "#98971a", -- neutral_green — dim green accents
  darkblue    = "#458588", -- neutral_blue — dim blue accents
  brightcyan  = "#8ec07c", -- bright_aqua, bright variant
  tabinactive = "#1d2021", -- dark0_hard, inactive tab background
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
  Visual          = { bg = c.selection },
  VisualNOS       = { bg = c.selection },
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
  Function        = { fg = c.func, bold = true },
  Statement       = { fg = c.accent, bold = true },
  Conditional     = { fg = c.accent },
  Repeat          = { fg = c.accent },
  Label           = { fg = c.accent },
  Operator        = { fg = c.orange },
  Keyword         = { fg = c.accent, bold = true },
  Exception       = { fg = c.accent, bold = true },
  PreProc         = { fg = c.folder },
  Include         = { fg = c.folder },
  Define          = { fg = c.folder },
  Macro           = { fg = c.folder },
  PreCondit       = { fg = c.folder },
  Type            = { fg = c.type },
  StorageClass    = { fg = c.orange },
  Structure       = { fg = c.folder },
  Typedef         = { fg = c.type },
  Special         = { fg = c.orange },
  SpecialChar     = { fg = c.orange },
  Tag             = { fg = c.accent },
  Delimiter       = { fg = c.punct },
  SpecialComment  = { fg = c.comment, bold = true },
  Debug           = { fg = c.error },
  Underlined      = { fg = c.variable, underline = true },
  Ignore          = { fg = c.comment },
  Error           = { fg = c.error, bold = true },
  Todo            = { fg = c.bg, bg = c.warn, bold = true },

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
  DiffAdd     = { fg = c.darkgreen, bg = c.bg },
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
  NvimTreeGitNew           = { fg = c.string },
  NvimTreeGitDeleted       = { fg = c.error },

  -- neo-tree.nvim
  NeoTreeDirectoryIcon = { fg = c.folder },
  NeoTreeDirectoryName = { fg = c.folder },
  NeoTreeRootName      = { fg = c.brightcyan, bold = true },
  NeoTreeSymbolicLinkTarget = { fg = c.type },
  NeoTreeIndentMarker  = { fg = c.border },
  NeoTreeNormal        = { fg = c.fg, bg = c.surface },
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
  ["@keyword.operator"]      = { fg = c.orange },
  ["@keyword.return"]        = { fg = c.accent, bold = true },
  ["@keyword.import"]        = { fg = c.folder },
  ["@function"]              = { link = "Function" },
  ["@function.call"]         = { fg = c.func },
  ["@function.macro"]        = { fg = c.folder, bold = true },
  ["@function.builtin"]      = { fg = c.func, italic = true },
  ["@method"]                = { fg = c.func },
  ["@method.call"]           = { fg = c.func },
  ["@constructor"]           = { fg = c.type },
  ["@type"]                  = { link = "Type" },
  ["@type.builtin"]          = { fg = c.type, italic = true },
  ["@type.definition"]       = { fg = c.type },
  ["@attribute"]             = { fg = c.orange },
  ["@string"]                = { link = "String" },
  ["@string.escape"]         = { fg = c.orange },
  ["@string.special"]        = { fg = c.orange },
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
  ["@punctuation.special"]   = { fg = c.orange },
  ["@operator"]              = { link = "Operator" },
  ["@tag"]                   = { fg = c.accent },
  ["@tag.attribute"]         = { fg = c.type, italic = true },
  ["@tag.delimiter"]         = { fg = c.punct },
  ["@lsp.type.lifetime"]     = { fg = c.const, italic = true },
  ["@lsp.type.macro"]        = { fg = c.folder, bold = true },
  ["@lsp.type.enum"]         = { fg = c.type },
  ["@lsp.type.struct"]       = { fg = c.type },
  ["@lsp.type.trait"]        = { fg = c.type },
  ["@lsp.typemod.variable.readonly"] = { fg = c.const },
}

for group, opts in pairs(groups) do
  hl(0, group, opts)
end
