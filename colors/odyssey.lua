-- ~/.config/nvim/colors/Odyssey.lua
-- Odyssey colorscheme for Neovim
-- Extracted from a series of Greek-epic illustrated posters:
--   1. Ivory/bone marble — the dominant tone (bg + fg), gray-beige not brown
--   2. Deep royal-blue sky/sea — a major, present secondary color
--   3. Glossy black armor & horse — near-black structure (borders, punctuation)
--   4. Gold armor trim — secondary accent (constants, folders)
--   5. A hidden touch of red (jewel, faint moon) — used sparingly, cursor only

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
local c = {
  bg = "#38352d", -- Background — ivory/bone marble, dark gray-beige, NOT brown
  surface = "#2b2921", -- Surface / Float / Telescope — marble in shadow
  selection = "#4a4638", -- Selection / CursorLine — warm bone highlight
  accent = "#b53a3a", -- Primary Accent — cursor / keywords (the hidden red — jewel, faint moon; used sparingly)
  border = "#15161a", -- Borders / Separators (glossy black armor/horse)
  type = "#3righ", -- placeholder to be overwritten below
  warn = "#c1633b", -- Warnings / Todo (terracotta accent)
  const = "#c9a25c", -- Lifetimes / Constants / Numbers (gold armor trim)
  func = "#7c9473", -- Functions / Methods (cypress green, minor foliage note)
  string = "#d6cdb4", -- Strings / Info / Hint (sunlit ivory highlight)
  variable = "#cbc3ac", -- Variables / Fields (dimmer bone)
  comment = "#7d7563", -- Comments (marble in shadow, muted warm gray)
  error = "#8f2f2f", -- Error (deeper red, distinct from accent)
  punct = "#1f2024", -- Punctuation (near-black armor, slightly lifted for readability)
  folder = "#c9a25c", -- Folders (gold armor trim)
  fg = "#e8e2d1", -- Foreground — ivory/bone marble, the dominant text tone
  -- Extra tints
  darkred = "#6b1f1f", -- deep maroon — DiffDelete / dim error
  darkgreen = "#4f5f45", -- deep olive — dim green accents
  darkblue = "#1c2c4a", -- deep navy — dim blue accents
  brightcyan = "#7ea1d6", -- pale sky blue, bright variant
  tabinactive = "#221f19", -- inactive tab background
  none = "NONE",
}
c.type = "#3a5fae" -- Types / Traits / Structs — the deep royal-blue sky/sea, a major present color

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
  Statement = { fg = c.type },
  Conditional = { fg = c.type },
  Repeat = { fg = c.type },
  Label = { fg = c.type },
  Operator = { fg = c.type },
  Keyword = { fg = c.accent, bold = true },
  Exception = { fg = c.accent, bold = true },
  PreProc = { fg = c.type },
  Include = { fg = c.type },
  Define = { fg = c.type },
  Macro = { fg = c.type, bold = true },
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
  ["@keyword.operator"] = { fg = c.type },
  ["@keyword.return"] = { fg = c.accent, bold = true },
  ["@keyword.import"] = { fg = c.type },
  ["@function"] = { link = "Function" },
  ["@function.call"] = { fg = c.func },
  ["@function.macro"] = { fg = c.type, bold = true },
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
  ["@lsp.type.macro"] = { fg = c.type, bold = true },
  ["@lsp.type.enum"] = { fg = c.type },
  ["@lsp.type.struct"] = { fg = c.type },
  ["@lsp.type.trait"] = { fg = c.type },
  ["@lsp.typemod.variable.readonly"] = { fg = c.const },
}

for group, opts in pairs(groups) do
  hl(0, group, opts)
end
