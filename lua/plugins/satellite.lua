return {
  "lewis6991/satellite.nvim",
  -- تحميل الإضافة عند فتح ملف لمعالجة أسرع للـ Startup
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    current_only = true,
    winblend = 0,
    handlers = {
      cursor = { enable = false },
      search = { enable = true },
      diagnostic = { enable = true },
      gitsigns = { enable = false },
      marks = { enable = false },
      quickfix = { enable = false },
    },
  },
}
