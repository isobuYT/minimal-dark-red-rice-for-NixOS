# minimal-dark-red-rice-for-NixOS
=======
# 🔴 dark rice — NixOS + Sway

> minimal dark red rice for NixOS · Sway WM · foot terminal · custom colorscheme

![os](https://img.shields.io/badge/OS-NixOS-5277C3?style=flat&logo=nixos)
![wm](https://img.shields.io/badge/WM-Sway-cc1a2a?style=flat)
![terminal](https://img.shields.io/badge/Terminal-Foot-cc1a2a?style=flat)
![editor](https://img.shields.io/badge/Editor-Neovim-cc1a2a?style=flat&logo=neovim)
![font](https://img.shields.io/badge/Font-JetBrainsMono_Nerd-8a8a9a?style=flat)
![license](https://img.shields.io/badge/License-MIT-333340?style=flat)

---

## 📸 Screenshots


---

## 🖥️ Setup

| Component     | Program                     |
|---------------|-----------------------------|
| OS            | NixOS                       |
| WM            | Sway                        |
| Bar           | Waybar                      |
| Terminal      | Foot                        |
| Launcher      | Wofi                        |
| Fetch         | Fastfetch                   |
| Editor        | Neovim (lazy.nvim)          |
| Font          | JetBrainsMono Nerd Font     |
| Monitor       | Btop (dark-r theme)         |
| Notifications | Mako                        |
| Wallpaper     | Swaybg                      |
| Screenshots   | Grim                        |
| Media         | Playerctl / MPRIS           |
| Audio         | PulseAudio / Pavucontrol    |

---

## 🎨 Colors

| Role       | Hex       | Usage                                   |
|------------|-----------|-----------------------------------------|
| Background | `#0a0a0f` | foot, waybar, wofi, nvim, btop          |
| Surface    | `#111118` | nvim bg2, btop meters                   |
| Border     | `#1a1a24` | nvim WinSeparator, btop div_line        |
| Accent     | `#2a2a35` | nvim Visual, waybar module border       |
| Red        | `#cc1a2a` | focused elements, keywords, lualine     |
| Text       | `#8a8a9a` | foreground across all apps              |
| Dim        | `#333340` | line numbers, inactive elements         |

> Terminal opacity: **0.80** · waybar module backdrop: **0.60**

---


---

## 🚀 Installation

### 1. Clone the repo

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_RICE.git ~/dotfiles
cd ~/dotfiles
```

### 2. Create config directories

```bash
mkdir -p ~/.config/sway
mkdir -p ~/.config/waybar
mkdir -p ~/.config/foot
mkdir -p ~/.config/wofi
mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/btop/themes
mkdir -p ~/.config/mako
mkdir -p ~/.config/cava
mkdir -p ~/.config/nvim/lua/plugins
```

### 3. Copy configs

```bash
# window manager & bar
cp ~/dotfiles/sway/config              ~/.config/sway/config
cp ~/dotfiles/waybar/config            ~/.config/waybar/config
cp ~/dotfiles/waybar/style.css         ~/.config/waybar/style.css

# terminal
cp ~/dotfiles/foot/foot.ini            ~/.config/foot/foot.ini

# launcher
cp ~/dotfiles/wofi/config              ~/.config/wofi/config
cp ~/dotfiles/wofi/style.css           ~/.config/wofi/style.css

# fetch — custom logo
cp ~/dotfiles/fastfetch/config.jsonc   ~/.config/fastfetch/config.jsonc
cp ~/dotfiles/fastfetch/logo.txt       ~/.config/fastfetch/logo.txt

# monitor — bass theme
cp ~/dotfiles/btop/btop.conf           ~/.config/btop/btop.conf
cp ~/dotfiles/btop/themes/dark-r.theme   ~/.config/btop/themes/dark-r.theme

# editor
cp ~/dotfiles/nvim/init.lua                        ~/.config/nvim/init.lua
cp ~/dotfiles/nvim/lazy-lock.json                  ~/.config/nvim/lazy-lock.json
cp ~/dotfiles/nvim/lua/plugins/dankcolors.lua      ~/.config/nvim/lua/plugins/dankcolors.lua
```

### 4. Set the wallpaper

In `~/.config/sway/config`, update the wallpaper line:

```
output * bg ~/dotfiles/wallpapers/001.jpg fill
```

### 5. Set Waybar network interface

Find your interface, then edit `~/.config/waybar/config`:

```bash
ip link show
```

```json
"network": {
  "interface": "your-interface-name"
}
```

### 6. Rebuild NixOS

```bash
# standard
sudo nixos-rebuild switch

# with flakes
sudo nixos-rebuild switch --flake .#yourhost
```

### 7. Launch Sway

```bash
sway
```

> Add `exec sway` to `~/.bash_profile` (guarded by `[ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]`) for auto-launch on TTY1.

---

## ⌨️ Keybinds

| Key                      | Action                    |
|--------------------------|---------------------------|
| `Super + Enter`          | Open Foot                 |
| `Super + A`              | Open Wofi launcher        |
| `Super + Q`              | Close focused window      |
| `Super + 1–5`            | Switch workspace          |
| `Super + Shift + 1–5`    | Move window to workspace  |
| `Super + F`              | Toggle fullscreen         |
| `Super + Shift + Space`  | Toggle floating           |
| `Super + Shift + E`      | Exit Sway                 |
| `Super + Shift + C`      | Reload Sway config        |
| `Print`                  | Screenshot (grimshot)     |

---

## ✏️ Neovim

Managed with **lazy.nvim**. Plugins:

| Plugin | Purpose |
|--------|---------|
| `nvim-tree/nvim-tree.lua` | File tree sidebar |
| `nvim-lualine/lualine.nvim` | Statusline (custom red lualine theme) |
| `RRethy/base16-nvim` | Base16 colorscheme via `dankcolors.lua` |

The colorscheme lives in `nvim/lua/plugins/dankcolors.lua` and has a **live-reload watcher** built in — saving the file re-applies colors instantly without restarting Neovim.

```
Ctrl + N   → toggle file tree
```

---

## 🖥️ Btop — dark-r theme

`btop/themes/dark-r.theme` maps the full palette:

| Key | Color | Meaning |
|-----|-------|---------|
| `main_bg` | `#0a0a0f` | background |
| `main_fg` | `#8a8a9a` | text |
| `temp_end` | `#cc1a2a` | critical temperature |
| `div_line` | `#1a1a24` | box borders |
| `selected_bg` | `#111118` | selection surface |

After copying the theme file, activate it inside btop:

```
btop → ESC → Options → Color theme → dark-r
```

---

## ✨ Fastfetch — custom logo

The braille-art logo in `fastfetch/logo.txt` is loaded via `config.jsonc`:

```jsonc
{
  "logo": {
    "type": "file",
    "source": "~/.config/fastfetch/logo.txt",
    "color": { "1": "red", "2": "white" },
    "width": 5,
    "height": 5
  },
  "display": {
    "color": { "keys": "red", "title": "white", "separator": "black" },
    "separator": " → "
  }
}
```

Modules shown: `os · host · kernel · uptime · packages · shell · display · wm · terminal · cpu · gpu · memory · disk · localip`

---

## 📁 Structure

```
dotfiles/
├── sway/
│   └── config
├── waybar/
│   ├── config
│   └── style.css
├── foot/
│   └── foot.ini
├── wofi/
│   ├── config
│   └── style.css
├── fastfetch/
│   ├── config.jsonc
│   └── logo.txt
├── btop/
│   ├── btop.conf
│   └── themes/
│       └── dark-r.theme
├── nvim/
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua/
│       └── plugins/
│           └── dankcolors.lua
├── screenshots/
└── wallpapers/
    └── 001.jpg

```
made with love on nixos!
