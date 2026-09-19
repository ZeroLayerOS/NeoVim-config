-- ~/.config/nvim/colors/Odyssey.lua
-- Odyssey colorscheme for Neovim
-- Extracted from a series of Greek-epic illustrated posters: deep navy sea
-- and sky, warm marble stone, gold-trimmed armor, cypress green, terracotta
-- roofs, and a blood-red moon. Medium contrast — comfortable, not stark.

if vim.g.colors_name then
  vim.cmd("hi clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "Odyssey"

-- Palette --------------------------------------------------------------
-- Colors pulled from the imagery itself, not a terminal export:
--   bg: dusk-navy sea/sky, softened for long reading (medium contrast)
--   fg: warm marble/stone cream
local c = {
  bg = "#232a35", -- Background — dusk navy, softened (not black)
  surface = "#1c222b", -- Surface / Float / Telescope — deeper sea shadow
  selection = "#2f3a4a", -- Selection / CursorLine — deep sea blue
  accent = "#caa25f", -- Primary Accent — cursor / keywords (helmet crest gold, marble warmth)
  border = "#2c3542", -- Borders / Separators
  type = "#5d7fae", -- Types / Traits / Structs (royal sky-blue)
  warn = "#c1633b", -- Warnings / Todo (terracotta rooftops)
  const = "#d4b483", -- Lifetimes / Constants / Numbers (pale sunlit stone)
  func = "#7c9473", -- Functions / Methods (cypress green)
  string = "#7fa8c9", -- Strings / Info / Hint (sea foam / wave highlight)
  variable = "#cbbfa8", -- Variables / Fields (dimmer warm marble)
  comment = "#5c6b7a", -- Comments (shadowed cliff stone)
  error = "#c23b3b", -- Error (the blood-red moon)
  punct = "#6b7789", -- Punctuation
  folder = "#3a5a8c", -- Folders (deep sea blue)
  fg = "#e8ddc8", -- Foreground (warm marble cream, not stark white)
  -- Extra tints
  darkred = "#8a2f2f", -- deep maroon — DiffDelete / dim error
  darkgreen = "#4f5f45", -- deep olive — dim green accents
  darkblue = "#1e2f4d", -- deep navy — dim blue accents
  brightcyan = "#a8c4d9", -- pale sea-foam, bright variant
  tabinactive = "#181e27", -- inactive tab background
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
  Search = { fg = c.bg, bg = c.type },
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
  Function = { fg = c.func },
  Statement = { fg = c.accent },
  Conditional = { fg = c.accent },
  Repeat = { fg = c.accent },
  Label = { fg = c.accent },
  Operator = { fg = c.accent },
  Keyword = { fg = c.accent, bold = true },
  Exception = { fg = c.accent, bold = true },
  PreProc = { fg = c.type },
  Include = { fg = c.accent },
  Define = { fg = c.accent },
  Macro = { fg = c.accent, bold = true },
  PreCondit = { fg = c.type },
  Type = { fg = c.type },
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
  ["@keyword.function"] = { fg = c.accent, italic = true },
  ["@keyword.operator"] = { fg = c.accent },
  ["@keyword.return"] = { fg = c.accent, bold = true },
  ["@keyword.import"] = { fg = c.accent },
  ["@function"] = { link = "Function" },
  ["@function.call"] = { fg = c.func },
  ["@function.macro"] = { fg = c.accent, bold = true },
  ["@function.builtin"] = { fg = c.func, italic = true },
  ["@method"] = { fg = c.func },
  ["@method.call"] = { fg = c.func },
  ["@constructor"] = { fg = c.type },
  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { fg = c.type, italic = true },
  ["@type.definition"] = { fg = c.type },
  ["@attribute"] = { fg = c.const },
  ["@string"] = { link = "String" },
  ["@string.escape"] = { fg = c.const },
  ["@string.special"] = { fg = c.const },
  ["@comment"] = { link = "Comment" },
  ["@variable"] = { fg = c.variable },
  ["@variable.builtin"] = { fg = c.const, italic = true },
  ["@variable.parameter"] = { fg = c.variable, italic = true },
  ["@variable.member"] = { fg = c.variable },
  ["@constant"] = { link = "Constant" },
  ["@constant.builtin"] = { fg = c.const, bold = true },
  ["@property"] = { fg = c.variable },
  ["@field"] = { fg = c.variable },
  ["@parameter"] = { fg = c.variable, italic = true },
  ["@punctuation.delimiter"] = { fg = c.punct },
  ["@punctuation.bracket"] = { fg = c.punct },
  ["@punctuation.special"] = { fg = c.accent },
  ["@operator"] = { link = "Operator" },
  ["@tag"] = { fg = c.accent },
  ["@tag.attribute"] = { fg = c.type, italic = true },
  ["@tag.delimiter"] = { fg = c.punct },
  ["@lsp.type.lifetime"] = { fg = c.const, italic = true },
  ["@lsp.type.macro"] = { fg = c.accent, bold = true },
  ["@lsp.type.enum"] = { fg = c.type },
  ["@lsp.type.struct"] = { fg = c.type },
  ["@lsp.type.trait"] = { fg = c.type },
  ["@lsp.typemod.variable.readonly"] = { fg = c.const },
}

for group, opts in pairs(groups) do
  hl(0, group, opts)
end
