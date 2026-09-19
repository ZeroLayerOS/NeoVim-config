-- ~/.config/nvim/colors/DarkIsTheNight.lua
-- Dark is the Night (Тёмная ночь) colorscheme for Neovim
-- Ported from a custom Kitty theme built around Soviet WWII trench warmth,
-- snowy steppe darkness, and the golden hope of a letter from home.

if vim.g.colors_name then
  vim.cmd("hi clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "DarkIsTheNight"

-- Palette --------------------------------------------------------------
-- Base values taken directly from the Kitty theme:
--   background #080a0f   foreground #ded8ce
--   cursor #c4924a
--   selection_background #1a2836 / selection_foreground #ded8ce
--   color0..15 as supplied
local c = {
  bg = "#080a0f", -- Background (kitty: background)
  surface = "#0c0e14", -- Surface / Float / Telescope (derived, slightly lifted off bg)
  selection = "#1a2836", -- Selection / CursorLine (kitty: selection_background / color4)
  accent = "#c4924a", -- Primary Accent — cursor / keywords (kitty: cursor / color11, the letter's golden hope)
  border = "#1d232e", -- Borders / Separators (kitty: color8)
  type = "#3a5673", -- Types / Traits / Structs (kitty: color12, snowy ash reflected from the night sky)
  warn = "#946b38", -- Warnings / Todo (kitty: color3, burnt wood / dim ember warmth)
  const = "#734861", -- Lifetimes / Constants / Numbers (kitty: color13, the violin's emotional tone)
  func = "#546952", -- Functions / Methods (kitty: color10, military green lit by firelight)
  string = "#638596", -- Strings / Info / Hint (kitty: color14, the glint of silent tears)
  variable = "#9e988f", -- Variables / Fields (kitty: color7, ivory paper of the letter)
  comment = "#3e5866", -- Comments (kitty: color6, bluish-gray of metal and blades)
  error = "#aa3834", -- Error (kitty: color9, the sudden flash of gunfire)
  punct = "#5c6169", -- Punctuation (derived mid gray, between border and variable)
  folder = "#3a5673", -- Folders (kitty: color12, reused)
  fg = "#ded8ce", -- Foreground (kitty: foreground / color15, the dusty candlelight of the trench)
  -- Extra tints pulled straight from the palette
  darkred = "#7a2826", -- color1 — DiffDelete / dim error
  darkgreen = "#364235", -- color2 — dim green accents
  darkblue = "#1a2836", -- color4 — dim blue accents / selection
  brightcyan = "#638596", -- color14 — bright variant, reused
  tabinactive = "#11151f", -- inactive_tab_background
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
