<div align="center">

# 💤 nvim

### A blazing-fast, LazyVim-based Neovim configuration for systems programming

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/Built_on-LazyVim-2E7DE1?style=for-the-badge&logo=lua&logoColor=white)](https://www.lazyvim.org)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)
[![Themes](https://img.shields.io/badge/Colorschemes-31-blueviolet?style=for-the-badge)](#-theming)

<br>

<img src="https://placehold.co/900x500/1d2021/ebdbb2?text=GruvboxDark+Screenshot" width="45%" />
<img src="https://placehold.co/900x500/2b2426/e0d8c8?text=Zenburn+Screenshot" width="45%" />

</div>

<br>

## ✨ Overview

Personal Neovim setup built on top of **LazyVim**, tuned for systems-level work —
C, Rust, and Python — with full LSP support, a minimal terminal-first
workflow, and a Nerd Font–powered UI. No single theme is baked in — the config
ships with **31 curated colorschemes** you can swap on the fly.

## 🚀 Features

- ⚡ **LazyVim core** — fast startup, sane defaults, lazy-loaded plugins
- 🧠 **Full LSP** — C, Rust, and Python configured out of the box
- 🎨 **31 built-in colorschemes** — switch without touching config files
- 📝 **LaTeX support** for document writing
- 🐞 **Integrated debugging** (DAP)
- 🔠 **Nerd Font icons** throughout the UI (statusline, tree, tabs)
- ✨ **Polished UX** — noice.nvim, mini-animate, satellite scrollbar, incline winbar
- 🎯 **Focus tools** — zen-mode & twilight for distraction-free writing/coding
- 🖥️ **Terminal-centric** — built for a tiling terminal workflow, no bloat
- 🧩 **Modular structure** — every concern in its own plugin file

## 📦 Requirements

| Tool | Notes |
|---|---|
| Neovim `>= 0.10` | required |
| [Nerd Font](https://www.nerdfonts.com) | for icons to render correctly |
| `git` | for plugin management |
| `ripgrep`, `fd` | for Telescope/fuzzy search |
| Language toolchains | `rust-analyzer`, `clangd`, `pyright` |

## 📥 Installation

```bash
# Back up your existing config first
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://github.com/<your-username>/nvim.git ~/.config/nvim

# Launch — plugins install automatically on first run
nvim
```

## 🎨 Theming

No default theme is forced — pick whatever fits your mood. 31 colorschemes
ship with this config out of the box:

<details>
<summary><b>Click to expand full theme list</b></summary>

| | | | |
|---|---|---|---|
| `amper-slate` | `ayu-dark` | `black_metal` | `blackpearl` |
| `blight` | `chokehold` | `classic` | `claude` |
| `Dragin-ball-dark` | `DragonBallZ` | `e-ink` | `e-ink-dark` |
| `evergarden_fall` | `evergarden_lunar` | `evergarden_spring` | `evergarden_summer` |
| `evergarden_winter` | `everforest-dark` | `grand_budapest` | `GruvboxDark` |
| `haloknight` | `Hellsing` | `KanagawaDragon` | `kode` |
| `miasma` | `sunset-titanium` | `the_martian` | `the_odyssey` |
| `tokyonight-dark` | `verdant-dawn` | `Zenburn` | |

</details>

Switch between them at runtime with:

```vim
:colorscheme <name>
```

Or pick your default in `lua/plugins/colorscheme.lua`.

## 📁 Structure

```
~/.config/nvim/
├── init.lua
├── colors/                    # 31 standalone colorscheme files
│   ├── GruvboxDark.lua
│   ├── tokyonight-dark.lua
│   ├── evergarden_*.lua
│   └── ...
├── lua/
│   ├── config/
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   └── autocmds.lua
│   └── plugins/
│       ├── colorscheme.lua       # theme loader/picker
│       ├── lang_c.lua            # C LSP
│       ├── lang_python.lua       # Python LSP
│       ├── rust.lua              # Rust LSP
│       ├── debugging.lua         # DAP
│       ├── treesitter-context.lua
│       ├── illuminate.lua
│       ├── blink.lua             # completion
│       ├── ui.lua
│       ├── statusline.lua
│       ├── incline.lua
│       ├── noice.lua
│       ├── mini-animate.lua
│       ├── satellite.lua
│       ├── virt-column.lua
│       ├── zen-mode.lua
│       ├── twilight.lua
│       ├── latex.lua
│       ├── productivity.lua
│       ├── auto-save.lua
│       ├── neomodern.lua
│       └── fix.lua
└── lazy-lock.json
```

## ⌨️ Key Keymaps

| Keymap | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>e`  | Toggle file explorer |
| `<leader>ca` | Code actions |
| `gd`         | Go to definition |
| `<leader>z`  | Toggle Zen mode |

## 📄 License

[MIT](LICENSE)

<div align="center">

Made with 🐧 by **Ziad**

</div>
