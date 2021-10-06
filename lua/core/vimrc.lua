local cfg = {}

cfg.load_options = function()
    local vimrc_args = {
        -- coding
        encoding = "utf-8",
        fileencodings = {"ucs-bom", "utf-8", "cp936"},
        fileencoding = "utf-8",
        
        -- io
        autoread = true,            -- Read file again when the file changed outside 
        backup = false,             -- do not create a backup file
        swapfile = false,           -- do not create the swap file
        clipboard = "unnamedplus",  -- share the clipboard with system 
        
		-- misc
		hidden = true,              -- required to keep multiple buffers and open multiple buffers
		autochdir = false,          -- do not change the working directory according to the edited file 
	    ignorecase = true,          -- ignore case in search patterns 
        smartcase = true,           -- smart case

        -- editor
		textwidth = 0,              -- Maximum width of text that is being inserted.(work with wrap)
        wrap = false,               -- do not insert line while line so long
        whichwrap = "b,s,<,>,[,]",  -- allow move the cursor left/right to move to the previous/next line 
	    mouse = "n",                -- allow mouse operation in normal mode("a" means all modes) (useless for Windows Terminal)
		showcmd = true,             -- Show (partial) command in the last line of the screen.
	    pumheight = 10,             -- pop up menu height
		wrapscan = true,            -- briefly jump to the matching one when a bracket is inserted
        ---- indent options
        smartindent = true,         -- make indenting smarter again
        cindent = true,             -- enables automatic C program indenting.
        autoindent = true,          -- copy indent from current line when starting a new line
        smarttab = true,            -- a <Tab> in front of a line inserts blanks according to 'shiftwidth'.  'tabstop' or 'softtabstop'
        expandtab = true,           -- convert tabs to spaces
        shiftwidth = 4,             -- the number of spaces inserted for each indentation
        tabstop = 4,                -- indert 4 spaces for a tab

		-- ui
		number = true,              -- set numbered lines
        relativenumber = false,     -- set relative numbered lines
        termguicolors = true,       -- use the terminal gui color to strength visualization
	    cmdheight = 1,              -- space in command line for displaying messages
		hlsearch = true,            -- highlight all matches on previous search pattern(F4 to switch)
	    cursorline = true,          -- highlight current line
	    showmode = false,           -- do not need to see things like -- INSERT -- anymore
	    showtabline = 2,            -- always show tabs
		showmatch = true,           -- highlight the matching one when a bracket is inserted
		scrolloff = 6,              -- Minimal number of screen lines to keep above and below the cursor.
    }
    ---  SETTINGS  ---

    for k, v in pairs(vimrc_args) do
        vim.opt[k] = v
    end
end

return cfg

