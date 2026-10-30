-- ~/.config/nvim/colors/TempleOS.lua
-- TempleOS colorscheme for Neovim
-- Corrected port based directly on an actual screenshot of the HolyC editor:
-- a white/light-gray background, black default text, blue keywords/types,
-- green comments, and a turquoise highlight matching TempleOS's own
-- ATTRF_SELECTED rendering. Minimalist by design — HolyC's real editor
-- does NOT color numbers, strings, or function names differently from
-- plain text, so this stays close to that austerity rather than inventing
-- syntax colors that were never there.

if vim.g.colors_name then
  vim.cmd("hi clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "light" -- genuinely a light theme, unlike the rest of your set
vim.g.colors_name = "TempleOS"

-- Palette --------------------------------------------------------------
-- Taken directly from the screenshot: white editor background, black text,
-- blue keywords/types, green comments, and the turquoise ATTRF_SELECTED
-- highlight. The blue status bar with gold modifier-key text is echoed in
-- StatusLine and warn.
local c = {
  bg = "#FFFFFF", -- Background — white editor area
  surface = "#E8E8E8", -- Surface / Float / Telescope — light gray panel
  selection = "#CFF7F7", -- Selection / CursorLine — the turquoise ATTRF_SELECTED highlight
  accent = "#0000FF", -- Primary Accent — cursor / keywords (if/while/else/Bool/U16/U0/I64/U32)
  border = "#AAAAAA", -- Borders / Separators — mid gray
  type = "#0000FF", -- Types / Traits / Structs — same blue as keywords, matching the source's minimalism
  warn = "#CC9900", -- Warnings / Todo — gold, echoing the "ALT SHIFT a" status bar text
  const = "#000000", -- Lifetimes / Constants / Numbers — plain black, numbers aren't styled in the real editor
  func = "#000000", -- Functions / Methods — plain black, function names aren't styled either
  string = "#009999", -- Strings / Info / Hint — teal, drawn from the same turquoise family as the highlight
  variable = "#000000", -- Variables / Fields — plain black, the default text color
  comment = "#008000", -- Comments — green, matches the // lines exactly
  error = "#CC0000", -- Error — red (not in the screenshot, added for usability)
  punct = "#000000", -- Punctuation — plain black, brackets/operators aren't specially colored
  folder = "#0000FF", -- Folders — blue, reused
  fg = "#000000", -- Foreground — black
  -- Extra tints
  darkred = "#990000", -- deep red — DiffDelete / dim error
  darkgreen = "#006600", -- deep green — dim green accents
  darkblue = "#0000AA", -- deep blue — dim blue accents, the classic DOS blue for reference
  brightcyan = "#00CCCC", -- bright teal variant
  tabinactive = "#DCDCDC", -- inactive tab background
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
  PmenuSel = { fg = "#FFFFFF", bg = c.accent, bold = true },
  PmenuSbar = { bg = c.surface },
  PmenuThumb = { bg = c.border },
  CursorLine = { bg = c.selection },
  CursorLineNr = { fg = c.accent, bold = true },
  CursorColumn = { bg = c.selection },
  LineNr = { fg = c.border },
  Visual = { fg = c.fg, bg = c.selection },
  VisualNOS = { fg = c.fg, bg = c.selection },
  Search = { fg = "#FFFFFF", bg = c.accent },
  IncSearch = { fg = "#FFFFFF", bg = c.warn },
  CurSearch = { fg = "#FFFFFF", bg = c.warn },
  StatusLine = { fg = "#FFFFFF", bg = c.darkblue, bold = true }, -- the classic DOS-blue status bar
  StatusLineNC = { fg = c.border, bg = c.surface },
  WinSeparator = { fg = c.border },
  VertSplit = { fg = c.border },
  SignColumn = { bg = c.bg },
  FoldColumn = { fg = c.comment, bg = c.bg },
  Folded = { fg = c.comment, bg = c.surface },
  ColorColumn = { bg = c.selection },
  Cursor = { fg = c.bg, bg = c.accent },
  TabLine = { fg = c.border, bg = c.tabinactive },
  TabLineSel = { fg = "#FFFFFF", bg = c.accent, bold = true },
  TabLineFill = { bg = c.tabinactive },
  MatchParen = { fg = c.accent, bold = true, underline = true },
  NonText = { fg = c.border },
  Whitespace = { fg = c.border },
  WinBar = { fg = c.fg, bg = c.bg },
  WinBarNC = { fg = c.border, bg = c.bg },

  -- Base syntax
  Comment = { fg = c.comment, italic = false }, -- HolyC comments aren't italic either
  Constant = { fg = c.const },
  String = { fg = c.string },
  Character = { fg = c.string },
  Number = { fg = c.const },
  Boolean = { fg = c.accent, bold = true }, -- Bool is a builtin type keyword, so it's blue
  Float = { fg = c.const },
  Identifier = { fg = c.variable },
  Function = { fg = c.func },
  Statement = { fg = c.accent, bold = true },
  Conditional = { fg = c.accent, bold = true },
  Repeat = { fg = c.accent, bold = true },
  Label = { fg = c.accent },
  Operator = { fg = c.fg },
  Keyword = { fg = c.accent, bold = true },
  Exception = { fg = c.error, bold = true },
  PreProc = { fg = c.accent },
  Include = { fg = c.accent },
  Define = { fg = c.accent },
  Macro = { fg = c.accent, bold = true },
  PreCondit = { fg = c.accent },
  Type = { fg = c.type, bold = true },
  StorageClass = { fg = c.type, bold = true },
  Structure = { fg = c.type },
  Typedef = { fg = c.type },
  Special = { fg = c.warn },
  SpecialChar = { fg = c.warn },
  Tag = { fg = c.accent },
  Delimiter = { fg = c.punct },
  SpecialComment = { fg = c.comment, bold = true },
  Debug = { fg = c.error },
  Underlined = { underline = true },
  Ignore = { fg = c.border },
  Error = { fg = c.error, bold = true },
  Todo = { fg = c.warn, bold = true },

  -- Diagnostics
  DiagnosticError = { fg = c.error },
  DiagnosticWarn = { fg = c.warn },
  DiagnosticInfo = { fg = c.type },
  DiagnosticHint = { fg = c.string },
  DiagnosticOk = { fg = c.comment },
  DiagnosticUnderlineError = { undercurl = true, sp = c.error },
  DiagnosticUnderlineWarn = { undercurl = true, sp = c.warn },
  DiagnosticUnderlineInfo = { undercurl = true, sp = c.type },
  DiagnosticUnderlineHint = { undercurl = true, sp = c.string },
  DiagnosticVirtualTextError = { fg = c.error, bg = c.bg },
  DiagnosticVirtualTextWarn = { fg = c.warn, bg = c.bg },
  DiagnosticVirtualTextInfo = { fg = c.type, bg = c.bg },
  DiagnosticVirtualTextHint = { fg = c.string, bg = c.bg },

  -- Diffs
  DiffAdd = { fg = c.darkgreen, bg = c.bg },
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
  NvimTreeGitNew = { fg = c.comment },
  NvimTreeGitDeleted = { fg = c.error },

  -- neo-tree.nvim
  NeoTreeDirectoryIcon = { fg = c.folder },
  NeoTreeDirectoryName = { fg = c.folder },
  NeoTreeRootName = { fg = c.brightcyan, bold = true },
  NeoTreeSymbolicLinkTarget = { fg = c.type },
  NeoTreeIndentMarker = { fg = c.border },
  NeoTreeNormal = { fg = c.fg, bg = c.surface },
  NeoTreeGitAdded = { fg = c.comment },
  NeoTreeGitDeleted = { fg = c.error },
  NeoTreeGitModified = { fg = c.warn },

  -- snacks.nvim (explorer / picker — LazyVim's newer default explorer)
  SnacksPickerDirectory = { fg = c.folder },
  SnacksPickerDir = { fg = c.folder },
  SnacksPickerIcon = { fg = c.folder },
  SnacksPickerPathHidden = { fg = c.border },
  SnacksPickerGitStatusUntracked = { fg = c.comment },
  SnacksPickerGitStatusModified = { fg = c.warn },
  SnacksPickerGitStatusDeleted = { fg = c.error },

  -- Treesitter (@-groups)
  ["@keyword"] = { link = "Keyword" },
  ["@keyword.function"] = { fg = c.accent, bold = true },
  ["@keyword.operator"] = { fg = c.fg },
  ["@keyword.return"] = { fg = c.accent, bold = true },
  ["@keyword.import"] = { fg = c.accent },
  ["@function"] = { link = "Function" },
  ["@function.call"] = { fg = c.func },
  ["@function.macro"] = { fg = c.accent, bold = true },
  ["@function.builtin"] = { fg = c.func },
  ["@method"] = { fg = c.func },
  ["@method.call"] = { fg = c.func },
  ["@constructor"] = { fg = c.type },
  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { fg = c.type, bold = true },
  ["@type.definition"] = { fg = c.type },
  ["@attribute"] = { fg = c.warn },
  ["@string"] = { link = "String" },
  ["@string.escape"] = { fg = c.warn },
  ["@string.special"] = { fg = c.warn },
  ["@comment"] = { link = "Comment" },
  ["@variable"] = { fg = c.variable },
  ["@variable.builtin"] = { fg = c.accent },
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
  ["@lsp.type.macro"] = { fg = c.accent, bold = true },
  ["@lsp.type.enum"] = { fg = c.type },
  ["@lsp.type.struct"] = { fg = c.type },
  ["@lsp.type.trait"] = { fg = c.type },
  ["@lsp.typemod.variable.readonly"] = { fg = c.const },
}

for group, opts in pairs(groups) do
  hl(0, group, opts)
end
