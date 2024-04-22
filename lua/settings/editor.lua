local opt = vim.opt -- global opt variable
-- explore more editor's options on: https://neovim.io/doc/user/options.html
----- globals -----
vim.lsp.diagnostic.enable = true -- enables LSP diagnostics
opt.laststatus = 3 -- stores the last displayed status line content
opt.showmode = false -- toggles showing whitespace characters
opt.formatoptions:append({ "r" }) -- includes "readonly" mode
opt.clipboard = "unnamedplus" -- sets the clipboard mode
opt.cursorline = true -- enables highlighting the current line
opt.conceallevel = 0 -- hides special characters (0 is show all)
vim.scriptencoding = "UTF-8" -- set default encoding to UTF-8
opt.backspace = "start,eol,indent" -- configures how backspace works
opt.winblend = 0 -- enables transpacery (0 is disable)
opt.pumblend = 5 -- enables pseudo-transparency for the popup-menu
opt.background = "dark" -- sets the background colorscheme
opt.completeopt = "menuone,noinsert,noselect" -- comma-separated list of options for Insert mode completion
opt.termguicolors = true -- enables 24-bit RGB color
opt.timeoutlen = 400 -- title of the window will be set to the value of 'titlestring'
opt.scrolloff = 10 -- minimal number of screen lines to keep above and below the cursor
opt.mouse = "a" -- enables mouse support
opt.mouseshape = "s:udsizing,m:no" -- change arrow over the status lines
opt.bufhidden = "wipe" -- specifies what happens when a buffer is no longer displayed
---- Command ----
opt.shell = "zsh" -- specifies the default shell for commands
opt.cmdheight = 1 -- number of screen lines to use for the command-line
opt.showcmd = true -- enables display of command characters
opt.splitright = true -- commands listed below move the cursor to the firs non-blank of the line
opt.splitbelow = true -- splitting a window will put the new window below the current one.
opt.shortmess:append("sI") -- helps to avoid all the hit-enter prompts caused by file messages
---- Completion ----
opt.wildoptions = "pum" -- sets options for wildcard completion behavior
opt.wildignore:append({ "*/node_modules/*" }) -- excludes directories from wildcard completion
---- Column ----
vim.o.signcolumn = "yes:2" -- enables a column to display signs
opt.fillchars = { eob = " " } -- characters to fill the statuslines
--see: https://neovim.io/doc/user/options.html#'fillchars'
---- Search ----
opt.ignorecase = true -- ignores case in search patterns
opt.smartcase = true -- overrides the 'ignorecase' option if the search pattern contains upper case characters
opt.path:append({ "**" }) -- adds patterns to search for files
opt.incsearch = true -- highlight command search patterns
opt.hlsearch = false -- determines the highlighting for all matches not under the cursor
---- Syntax ----
--syntax = dosini
---- Indenting ----
opt.expandtab = true -- enables spaces to tabs
opt.shiftwidth = 2 -- sets the amount of spaces for tabs
opt.smartindent = true -- set adaptative/smart ident
opt.tabstop = 2 -- set tab behaviour to stop at desirable space amount
opt.softtabstop = 2 -- number of spaces that a <Tab> counts for while performing editing operations
opt.breakindent = true -- enable identing same amount of space as the beginning of that line
opt.autoindent = true -- copy indent from current line when starting a new line
opt.wrap = true -- changes how overflowing text is displayed
---- Numbers ----
opt.number = true -- print the line number in front of each line
opt.relativenumber = true -- set relative line numbers
opt.numberwidth = 4 -- minimal number of columns to use for the line number
opt.ruler = false -- show the line and column number of the cursor position
-- Behaviour
opt.undofile = true -- saves undo history to an undo file when writing a buffer to a file
opt.errorbells = false -- ring the bell (beep or screen flash) for error messages
opt.swapfile = false -- use a swapfile for the buffer
opt.backup = false -- make a backup before overwriting a file
