-- Relation modifier

--- Modifier
-- Static modifier, which is used and multiplied in Relation. After
-- initializing it is not recommended to change any variable values
-- 
-- @type modifier
-- @field base
-- @field name
Modifier = {}
Modifier.base = 0

--- New modifier
-- @param o
-- @param base Base value, which is then multiplied in Relations.modifiers
-- @param name Identifier of the modifier. Probably not display name; PlotMesh is not responsible for direct messaging
-- @return #modifier modifier
function Modifier:new(o, base, name)
  o = o or {}
  setmetatable(o, self)
  self.__index = self;
  o.base = base
  o.name = name
  return o
end