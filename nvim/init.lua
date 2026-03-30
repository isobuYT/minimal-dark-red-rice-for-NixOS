-- ── bootstrap lazy.nvim ───────────────────────────
local lazypath = vim.fn.expand("~/.local/share/nvim/lazy/lazy.nvim")

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- ── plugins ───────────────────────────────────────
require("lazy").setup({
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-lualine/lualine.nvim" },
})

-- ── options ───────────────────────────────────────
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.termguicolors  = true
vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true

-- ── COLORS (чисто твої, без tokyonight) ───────────
local colors = {
  bg     = "#0a0a0f",
  bg2    = "#111118",
  border = "#1a1a24",
  accent = "#2a2a35",
  red    = "#cc1a2a",
  text   = "#8a8a9a",
  dim    = "#333340",
}

-- UI
vim.api.nvim_set_hl(0, "Normal",       { fg = colors.text, bg = colors.bg })
vim.api.nvim_set_hl(0, "NormalNC",     { fg = colors.text, bg = colors.bg })
vim.api.nvim_set_hl(0, "Comment",      { fg = colors.dim, italic = true })
vim.api.nvim_set_hl(0, "LineNr",       { fg = colors.dim })
vim.api.nvim_set_hl(0, "CursorLine",   { bg = colors.bg2 })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "Visual",       { bg = colors.accent })
vim.api.nvim_set_hl(0, "Search",       { fg = colors.bg, bg = colors.red })
vim.api.nvim_set_hl(0, "IncSearch",    { fg = colors.bg, bg = colors.red })
vim.api.nvim_set_hl(0, "MatchParen",   { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "Pmenu",        { fg = colors.text, bg = colors.bg2 })
vim.api.nvim_set_hl(0, "PmenuSel",     { fg = colors.bg, bg = colors.red })
vim.api.nvim_set_hl(0, "StatusLine",   { fg = colors.text, bg = colors.bg2 })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = colors.border })

-- syntax (щоб не було синього)
vim.api.nvim_set_hl(0, "Keyword",   { fg = colors.red })
vim.api.nvim_set_hl(0, "Function",  { fg = colors.text })
vim.api.nvim_set_hl(0, "String",    { fg = "#a06060" })
vim.api.nvim_set_hl(0, "Identifier",{ fg = colors.text })
vim.api.nvim_set_hl(0, "Type",      { fg = colors.text })

-- ── lualine ───────────────────────────────────────
require("lualine").setup({
  options = {
    theme = {
      normal   = { a = { fg = colors.bg, bg = colors.red, gui = "bold" },
                   b = { fg = colors.text, bg = colors.bg2 },
                   c = { fg = colors.text, bg = colors.bg } },
      insert   = { a = { fg = colors.bg, bg = "#ff3b4d", gui = "bold" } },
      visual   = { a = { fg = colors.bg, bg = "#992233", gui = "bold" } },
      replace  = { a = { fg = colors.bg, bg = "#ff5c6c", gui = "bold" } },
      inactive = { a = { fg = colors.dim, bg = colors.bg },
                   c = { fg = colors.dim, bg = colors.bg } },
    },
    component_separators = { left = "", right = "" },
    section_separators   = { left = "", right = "" },
  },
})

-- ── nvim-tree ─────────────────────────────────────
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  renderer = {
    highlight_opened_files = "name",
    icons = { show = { file = true, folder = true } },
  },
})

-- червоні папки 🔥
vim.api.nvim_set_hl(0, "NvimTreeNormal",            { fg = colors.text, bg = colors.bg })
vim.api.nvim_set_hl(0, "NvimTreeFolderName",        { fg = colors.red })
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon",        { fg = colors.red })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName",  { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "NvimTreeRootFolder",        { fg = "#ff3b4d", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName",   { fg = colors.dim })

-- ── keymaps ───────────────────────────────────────
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
