return {
  {
    "casedami/neomodern.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      vim.o.background = "dark"
      require("neomodern").load("roseprime")
    end,
  },
}

--theme = "moon", -- 'moon' | 'iceclimber' | 'gyokuro' | 'hojicha' | 'roseprime'
