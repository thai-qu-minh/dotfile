-- Core UI/UX ---------------------------------------------------------------

-- Shorthand handles for option tables
local o, wo, bo, g = vim.o, vim.wo, vim.bo, vim.g

-- Use truecolour in terminal UIs (enables full theme colours)
o.termguicolors = true

-- Absolute and relative line numbers (relative aids motions; current line shows absolute)
o.number = true
o.relativenumber = true


-- Highlight the current cursor line for focus
o.cursorline = true

-- Always show a sign column; reserve 1 cell so layout doesn't shift
o.signcolumn = "yes:1"

-- Keep cursor away from screen edges vertically/horizontally
o.scrolloff = 6

o.sidescrolloff = 6

-- Don't soft-wrap long lines by default
o.wrap = false

-- Hide "-- INSERT --" etc. (your statusline likely already shows mode)
o.showmode = false

-- Single global statusline (Neovim 0.7+)
o.laststatus = 3

-- Popup-menu: max visible items and slight transparency
o.pumheight = 12
o.pumblend = 10

-- Floating windows: no background blending
o.winblend = 0


-- Editing ------------------------------------------------------------------

-- Use spaces instead of tabs, width = 2
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2


-- Smarter indenting for new lines; preserve visual indent when wrapping
o.smartindent = true
o.breakindent = true

-- When wrapping is on, break by words rather than mid-word
o.linebreak = true

-- Show invisible characters (tabs, trailing spaces, etc.)
o.list = true
o.listchars = "tab:→ ,trail:·,extends:…,precedes:…,nbsp:␣"


-- Allow certain keys to move to previous/next line at ends
-- b/backspace, s/space, </>, [/]

o.whichwrap = "b,s,<,>,[,]"


-- Search -------------------------------------------------------------------

-- Case-insensitive by default...
o.ignorecase = true
-- ...but become case-sensitive if the query has any uppercase

o.smartcase = true


-- Live incremental searching; highlight matches
o.incsearch = true
o.hlsearch = true


-- Use ripgrep for :grep with smart case and hidden files
o.grepprg = "rg --vimgrep --smart-case --hidden"
o.grepformat = "%f:%l:%c:%m"


-- Splits and navigation ----------------------------------------------------

-- New splits open to the right and below (more natural layout)
o.splitright = true

o.splitbelow = true

-- Keep split sizes balanced on opening/closing windows
o.equalalways = true


-- Performance / behaviour --------------------------------------------------

-- Faster CursorHold and swap/diagnostic updates (ms)
o.updatetime = 200

-- Mappings/which-key responsiveness (general timeout and keycode timeout)
o.timeoutlen = 400
o.ttimeoutlen = 10

-- Redraw lazily in macros/etc. (false keeps visuals smoother during UI ops)
o.lazyredraw = false

-- Reduce noisy completion messages in the command line
o.shortmess = o.shortmess .. "c"


-- Files, backups, undo -----------------------------------------------------

-- Allow hiding modified buffers without saving (needed for buffers-as-tabs)
o.hidden = true

-- Disable swap and backup files (prefer undo history)
o.swapfile = false
o.backup = false

-- Persistent undo across sessions; store files under Neovim state dir

o.undofile = true
o.undodir = vim.fn.stdpath("state") .. "/undo"

-- SHAda: session/history behaviour

-- !: save/restore global variables marked with g:

-- ': save last 300 file marks; <: max file size for marks 50 KB; s10: max item size 10 KB; h: disable 'hlsearch' on start
o.shada = "!,'300,<50,s10,h"


-- Folding (Treesitter-friendly defaults) -----------------------------------

-- Enable folding but start fully unfolded, with a visible fold column

o.foldenable = true
o.foldlevel = 99
o.foldlevelstart = 99
o.foldcolumn = "1"


-- Use Treesitter expressions for fold regions
o.foldmethod = "expr"

o.foldexpr = "nvim_treesitter#foldexpr()"



-- Clipboard / mouse --------------------------------------------------------

-- Enable mouse in all modes (resize splits, click to place cursor, etc.)
o.mouse = "a"


-- Use the system clipboard as default register (+)
o.clipboard = "unnamedplus"


-- Spelling (toggle via keymap; default off) --------------------------------

-- British English dictionary; enable per-window if desired via wo.spell
o.spelllang = "en_gb"
-- wo.spell = true -- enable per window if desired


-- Completion ---------------------------------------------------------------

-- Completion behaviour:
-- - show menu even for a single match
-- - show menu without auto-inserting the first item
o.completeopt = "menu,menuone,noselect"


-- Command-line completion mode: longest match, then full cycling
o.wildmode = "longest:full,full"


-- Providers (speed: disable ones you don’t use) ----------------------------

g.loaded_python_provider = 1
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- If you do use Python, point to your interpreter:
-- g.python3_host_prog = "/usr/bin/python3"


-- NetRW (if you still use it alongside Telescope/neo-tree) -----------------

-- Hide banner; set default window size percentage

g.netrw_banner = 0
g.netrw_winsize = 25


-- Window-local overrides (optional) ----------------------------------------

-- Even if global wrap is toggled elsewhere, keep current window unwrapped
wo.wrap = false
