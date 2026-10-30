-- ~/.config/nvim/colors/PureVivid.lua
-- Pure Vivid colorscheme for Neovim
-- Maximum contrast: absolute black background, absolute white foreground,
-- and 16 fully-saturated pure colors — no muted or desaturated tones
-- anywhere in the palette.

if vim.g.colors_name then
  vim.cmd("hi clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "PureVivid"

-- Palette --------------------------------------------------------------
-- The full 16 pure colors this theme draws from:
--   0  Black         #000000     8  Gray           #808080
--   1  Red           #FF0000     9  Orange         #FF7F00
--   2  Green         #00FF00    10  Purple         #7F00FF
--   3  Yellow        #FFFF00    11  Pink           #FF007F
--   4  Blue          #0000FF    12  Lime           #7FFF00
--   5  Magenta       #FF00FF    13  Spring Green   #00FF7F
--   6  Cyan          #00FFFF    14  Azure          #007FFF
--   7  White         #FFFFFF    15  Gold           #FFD700
local c = {
  bg = "#000000", -- Background — absolute black
  surface = "#000000", -- Surface / Float / Telescope — same absolute black, no shading
  selection = "#0000FF", -- Selection / CursorLine — pure Blue
  accent = "#FF0000", -- Primary Accent — cursor / keywords — pure Red
  border = "#808080", -- Borders / Separators — pure Gray
  type = "#007FFF", -- Types / Traits / Structs — pure Azure
  warn = "#FFFF00", -- Warnings / Todo — pure Yellow
  const = "#FF00FF", -- Lifetimes / Constants / Numbers — pure Magenta
  func = "#00FF00", -- Functions / Methods — pure Green
  string = "#00FFFF", -- Strings / Info / Hint — pure Cyan
  variable = "#FFFFFF", -- Variables / Fields — pure White
  comment = "#808080", -- Comments — pure Gray
  error = "#FF7F00", -- Error — pure Orange
  punct = "#FFFFFF", -- Punctuation — pure White
  folder = "#7F00FF", -- Folders — pure Purple
  fg = "#FFFFFF", -- Foreground — absolute white
  -- Extra tints, all pulled from the same 16-color set
  darkred = "#FF0000", -- pure Red, reused — DiffDelete / dim error
  darkgreen = "#00FF00", -- pure Green, reused — dim green accents
  darkblue = "#0000FF", -- pure Blue, reused — dim blue accents
  brightcyan = "#00FFFF", -- pure Cyan, reused
  tabinactive = "#000000", -- absolute black, inactive tab background
  none = "NONE",
}

local hl = vim.api.nvim_set_hl

-- Highlight groups -------------------------------------------------------
local groups = {
  -- UI / Editor chrome
  Normal = { fg = c.fg, bg = c.bg },
  NormalNC = { fg = c.fg, bg = c.bg },
  NormalFloat = { fg = c.fg, bg = c.surface },
  FloatBorder = { fg = c.border, bg = c.surface },
  FloatTitle = { fg = c.accent, bg = c.surface, bold = true },
  Pmenu = { fg = c.fg, bg = c.surface },
  PmenuSel = { fg = c.bg, bg = c.accent, bold = true },
  PmenuSbar = { bg = c.surface },
  PmenuThumb = { bg = c.type },
  CursorLine = { bg = c.selection },
  CursorLineNr = { fg = c.accent, bold = true },
  CursorColumn = { bg = c.selection },
  LineNr = { fg = c.border },
  Visual = { fg = c.fg, bg = c.selection },
  VisualNOS = { fg = c.fg, bg = c.selection },
  Search = { fg = c.bg, bg = c.warn },
  IncSearch = { fg = c.bg, bg = c.accent },
  CurSearch = { fg = c.bg, bg = c.accent },
  StatusLine = { fg = c.fg, bg = c.surface },
  StatusLineNC = { fg = c.comment, bg = c.surface },
  WinSeparator = { fg = c.border },
  VertSplit = { fg = c.border },
  SignColumn = { bg = c.bg },
  FoldColumn = { fg = c.comment, bg = c.bg },
  Folded = { fg = c.comment, bg = c.surface },
  ColorColumn = { bg = c.selection },
  Cursor = { fg = c.bg, bg = c.accent },
  TabLine = { fg = c.comment, bg = c.tabinactive },
  TabLineSel = { fg = c.bg, bg = c.accent, bold = true },
  TabLineFill = { bg = c.tabinactive },
  MatchParen = { fg = c.accent, bold = true, underline = true },
  NonText = { fg = c.border },
  Whitespace = { fg = c.border },
  WinBar = { fg = c.fg, bg = c.bg },
  WinBarNC = { fg = c.comment, bg = c.bg },

  -- Base syntax
  Comment = { fg = c.comment, italic = true },
  Constant = { fg = c.const },
  String = { fg = c.string },
  Character = { fg = c.string },
  Number = { fg = c.const },
  Boolean = { fg = c.const, bold = true },
  Float = { fg = c.const },
  Identifier = { fg = c.variable },
  Function = { fg = c.func, bold = true },
  Statement = { fg = c.accent, bold = true },
  Conditional = { fg = c.accent },
  Repeat = { fg = c.accent },
  Label = { fg = c.accent },
  Operator = { fg = c.accent },
  Keyword = { fg = c.accent, bold = true },
  Exception = { fg = c.error, bold = true },
  PreProc = { fg = c.type },
  Include = { fg = c.type },
  Define = { fg = c.type },
  Macro = { fg = c.type, bold = true },
  PreCondit = { fg = c.type },
  Type = { fg = c.type, bold = true },
  StorageClass = { fg = c.type },
  Structure = { fg = c.type },
  Typedef = { fg = c.type },
  Special = { fg = c.const },
  SpecialChar = { fg = c.const },
  Tag = { fg = c.accent },
  Delimiter = { fg = c.punct },
  SpecialComment = { fg = c.comment, bold = true },
  Debug = { fg = c.error },
  Underlined = { underline = true },
  Ignore = { fg = c.comment },
  Error = { fg = c.error, bold = true },
  Todo = { fg = c.warn, bold = true },

  -- Diagnostics
  DiagnosticError = { fg = c.error },
  DiagnosticWarn = { fg = c.warn },
  DiagnosticInfo = { fg = c.type },
  DiagnosticHint = { fg = c.string },
  DiagnosticOk = { fg = c.func },
  DiagnosticUnderlineError = { undercurl = true, sp = c.error },
  DiagnosticUnderlineWarn = { undercurl = true, sp = c.warn },
  DiagnosticUnderlineInfo = { undercurl = true, sp = c.type },
  DiagnosticUnderlineHint = { undercurl = true, sp = c.string },
  DiagnosticVirtualTextError = { fg = c.error, bg = c.bg },
  DiagnosticVirtualTextWarn = { fg = c.warn, bg = c.bg },
  DiagnosticVirtualTextInfo = { fg = c.type, bg = c.bg },
  DiagnosticVirtualTextHint = { fg = c.string, bg = c.bg },

  -- Diffs
  DiffAdd = { fg = c.func, bg = c.bg },
  DiffChange = { fg = c.warn, bg = c.bg },
  DiffDelete = { fg = c.darkred, bg = c.bg },
  DiffText = { fg = c.accent, bg = c.bg },

  -- Generic fallback (netrw, fern, and anything that just uses Directory)
  Directory = { fg = c.folder, bold = true },

  -- nvim-tree.lua
  NvimTreeFolderIcon = { fg = c.folder },
  NvimTreeFolderName = { fg = c.folder },
  NvimTreeOpenedFolderName = { fg = c.brightcyan, bold = true },
  NvimTreeEmptyFolderName = { fg = c.folder },
  NvimTreeRootFolder = { fg = c.folder, bold = true },
  NvimTreeSpecialFile = { fg = c.type, underline = true },
  NvimTreeIndentMarker = { fg = c.border },
  NvimTreeNormal = { fg = c.fg, bg = c.surface },
  NvimTreeWinSeparator = { fg = c.border, bg = c.surface },
  NvimTreeGitDirty = { fg = c.warn },
  NvimTreeGitNew = { fg = c.func },
  NvimTreeGitDeleted = { fg = c.error },

  -- neo-tree.nvim
  NeoTreeDirectoryIcon = { fg = c.folder },
  NeoTreeDirectoryName = { fg = c.folder },
  NeoTreeRootName = { fg = c.brightcyan, bold = true },
  NeoTreeSymbolicLinkTarget = { fg = c.type },
  NeoTreeIndentMarker = { fg = c.border },
  NeoTreeNormal = { fg = c.fg, bg = c.surface },
  NeoTreeGitAdded = { fg = c.func },
  NeoTreeGitDeleted = { fg = c.error },
  NeoTreeGitModified = { fg = c.warn },

  -- snacks.nvim (explorer / picker — LazyVim's newer default explorer)
  SnacksPickerDirectory = { fg = c.folder },
  SnacksPickerDir = { fg = c.folder },
  SnacksPickerIcon = { fg = c.folder },
  SnacksPickerPathHidden = { fg = c.comment },
  SnacksPickerGitStatusUntracked = { fg = c.func },
  SnacksPickerGitStatusModified = { fg = c.warn },
  SnacksPickerGitStatusDeleted = { fg = c.error },

  -- Treesitter (@-groups)
  ["@keyword"] = { link = "Keyword" },
  ["@keyword.function"] = { fg = c.accent, bold = true },
  ["@keyword.operator"] = { fg = c.accent },
  ["@keyword.return"] = { fg = c.accent, bold = true },
  ["@keyword.import"] = { fg = c.type },
  ["@function"] = { link = "Function" },
  ["@function.call"] = { fg = c.func },
  ["@function.macro"] = { fg = c.type, bold = true },
  ["@function.builtin"] = { fg = c.func, bold = true },
  ["@method"] = { fg = c.func },
  ["@method.call"] = { fg = c.func },
  ["@constructor"] = { fg = c.type },
  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { fg = c.type, bold = true },
  ["@type.definition"] = { fg = c.type },
  ["@attribute"] = { fg = c.const },
  ["@string"] = { link = "String" },
  ["@string.escape"] = { fg = c.const },
  ["@string.special"] = { fg = c.const },
  ["@comment"] = { link = "Comment" },
  ["@variable"] = { fg = c.variable },
  ["@variable.builtin"] = { fg = c.const, bold = true },
  ["@variable.parameter"] = { fg = c.variable },
  ["@variable.member"] = { fg = c.variable },
  ["@constant"] = { link = "Constant" },
  ["@constant.builtin"] = { fg = c.const, bold = true },
  ["@property"] = { fg = c.variable },
  ["@field"] = { fg = c.variable },
  ["@parameter"] = { fg = c.variable },
  ["@punctuation.delimiter"] = { fg = c.punct },
  ["@punctuation.bracket"] = { fg = c.punct },
  ["@punctuation.special"] = { fg = c.accent },
  ["@operator"] = { link = "Operator" },
  ["@tag"] = { fg = c.accent },
  ["@tag.attribute"] = { fg = c.type },
  ["@tag.delimiter"] = { fg = c.punct },
  ["@lsp.type.lifetime"] = { fg = c.const },
  ["@lsp.type.macro"] = { fg = c.type, bold = true },
  ["@lsp.type.enum"] = { fg = c.type },
  ["@lsp.type.struct"] = { fg = c.type },
  ["@lsp.type.trait"] = { fg = c.type },
  ["@lsp.typemod.variable.readonly"] = { fg = c.const },
}

for group, opts in pairs(groups) do
  hl(0, group, opts)
end
