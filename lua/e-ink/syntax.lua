local M = {}

--- Wrapper for vim.api.nvim_set_hl
---@param group string
---@param styles any
local function set_hl(group, styles)
    vim.api.nvim_set_hl(0, group, styles)
end

function M.generate_syntax()
    -- palette.lua now exposes mono()/everforest() as functions that read
    -- vim.o.background, instead of flat tables, so we call them here.
    local mono = require("e-ink.palette").mono()
    local everforest = require("e-ink.palette").everforest()

    set_hl("ColorColumn", { link = "CursorLine" })
    set_hl("Comment", { fg = mono[7], italic = true })
    set_hl("Constant", { link = "@variable" })
    set_hl("CurSearch", { fg = mono[13], reverse = true })
    set_hl("CursorColumn", { link = "CursorLine" })
    set_hl("CursorLine", { bg = mono[2] })
    set_hl("Delimiter", { fg = mono[16] })
    set_hl("Directory", { fg = mono[15] })
    set_hl("ErrorMsg", { fg = everforest.red })
    set_hl("FloatBorder", { fg = mono[10], bg = mono[1] })
    set_hl("Function", { fg = mono[16] })
    set_hl("Identifier", { fg = mono[8] })
    set_hl("MoreMsg", { fg = mono[15] })
    set_hl("Normal", { fg = mono[12], bg = mono[1] })
    set_hl("NormalFloat", { link = "Normal" })
    set_hl("Operator", { fg = mono[14] })
    set_hl("Question", { link = "MoreMsg" })
    set_hl("QuickFixLine", { link = "MoreMsg" })
    set_hl("Search", { fg = mono[6], reverse = true })
    set_hl("Special", { fg = mono[11] })
    set_hl("SpellBad", { sp = everforest.red, undercurl = true })
    set_hl("SpellCap", { sp = everforest.blue, undercurl = true })
    set_hl("SpellLocal", { sp = everforest.green, undercurl = true })
    set_hl("SpellRare", { sp = everforest.purple, undercurl = true })
    set_hl("Statement", { fg = mono[12] })
    set_hl("StatusLine", { link = "Normal" })
    set_hl("StatusLineNC", { link = "Normal" })
    set_hl("String", { fg = mono[11] })
    set_hl("Title", { fg = mono[16], bold = true })
    set_hl("Type", { fg = mono[13] })
    set_hl("WarningMsg", { fg = everforest.yellow })
end

return M
