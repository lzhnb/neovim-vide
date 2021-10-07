require("core.keymap")

-- misc options
require("core.misc")

-- set vim options
local vimrc = require("core.vimrc")
vimrc.load_options()

-- loading plugins
local pack = require("core.pack")
pack.ensure_plugins()
-- require("core.event")
pack.load_compile()


