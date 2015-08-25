-- Import library

local importlib = {}

--- Imports a library.
-- This will be mapped directly into globals during plotlib init.
-- @param #string library: Import name of library
-- @param #table mappings: Mappings for each item that will be added
-- to path where this function is called. Format original,new.
function importlib.import(library,mappings)
  -- TODO Default implementation for normal Lua
  error("TODO Default implementation for normal Lua")
end

--- Initializes new module table.
-- Table contaisn functions for all module work.
function importlib.module()
  local module = {}
  module.childs = {}
  
  function module:add(child,name)
    self.childs[name] = child
  end
  
  return module
end

return importlib