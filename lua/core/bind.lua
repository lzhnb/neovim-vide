local rhs_opts = {}

function rhs_opts:new(cmd)
    local instance = {
        cmd = cmd,
        options = {
            noremap = false,
            silent = false,
            expr = false,
            nowait = false
        }
    }
    setmetatable(instance, self)
    self.__index = self
    return instance
end

function rhs_opts:with_silent()
    self.options.silent = true
    return self
end

function rhs_opts:with_noremap()
    self.options.noremap = true
    return self
end

function rhs_opts:with_expr()
    self.options.expr = true
    return self
end

function rhs_opts:with_nowait()
    self.options.nowait = true
    return self
end

local pbind = {}

function pbind.map(cmd)
    local ro = rhs_opts:new(cmd)
    return ro
end

function pbind.nvim_load_mapping(mapping)
    for key, value in pairs(mapping) do
        local mode, keymap = key:match("([^|]*)|?(.*)")
        if type(value) == 'table' then
            local rhs = value.cmd
            local options = value.options
            vim.api.nvim_set_keymap(mode, keymap, rhs, options)
        end
    end
end

return pbind



