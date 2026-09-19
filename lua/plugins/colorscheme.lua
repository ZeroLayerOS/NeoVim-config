-- ~/.config/nvim/lua/plugins/colorscheme.lua
-- Replaces the manual "colorscheme = Hellsing" switch with themery.nvim,
-- which gives you a live-preview picker and remembers your choice across restarts.

return {
  -- Official kanagawa.nvim plugin — ships wave/dragon/lotus as ready-made
  -- variants, no manual porting needed like the hand-built themes above.
  {
    "rebelot/kanagawa.nvim",
    lazy = true, -- themery loads it on demand when selected
  },

  {
    "zaldih/themery.nvim",
    lazy = false, -- load on startup so the saved theme applies immediately
    priority = 1000, -- load before other UI plugins, same reasoning as a colorscheme plugin
    config = function()
      require("themery").setup({
        themes = {
          "Hellsing",
          "ayu-dark",
          "DragonBallZ",
          "Zenburn",
          "KanagawaDragon",
          "GruvboxDark",
          "claude",
          "miasma",
          "e-ink",
          "e-ink-dark",
          "black_metal",
          "classic",
          "evergarden_winter",
          "evergarden_summer",
          "evergarden_spring",
          "evergarden_fall",
          "evergarden_lunar",
          "kode",
          "sunset-titanium",
          "haloknight",
          "blight",
          "Dragin-ball-dark",
          "blackpearl",
          "amper-slate",
          "chokehold",
          "verdant-dawn",
          "everforest-dark",
          "tokyonight-dark",
          "the_odyssey",
          "grand_budapest",
          "the_martian",
          "desert",
          "GruberDarker",
          "TwelveAngryMen",
          "DarkIsTheNight",
          "odyssey",
        },
        livePreview = true, -- see the theme change as you move through the list
      })
    end,
  },

  -- LazyVim still wants a default colorscheme set for the very first load,
  -- before themery has ever saved a choice. After that, themery's saved
  -- pick takes over automatically.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "Hellsing",
    },
  },
}
