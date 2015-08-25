-- Relations between characters

import "characters.properties"
import "characters.character"

local module = libimport.module()

--- Relation between two characters.
-- Contains relation modifiers, and stores consequences of them (TODO do these classes...)
-- Relations are short lived objects. They're calculated using Character, and possibly
-- other values affecting how character react when they meet. However, they MAY
-- be changed without re-instantiating; sometimes very quick changes are needed.
-- 
-- @type relation
local Relation = {}
module:add(Relation, "Relation")

--- Modifiers.
-- Array of modifiers.
Relation.modifiers = {}

--- Create a new relation.
function Relation:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self;
  return o
end

--- Calculates relation for first character towards second character.
-- @param #character char1: First character
-- @param #character char2: Second character
function Relation:calculate(char1,char2)
  local properties = char2.properties
  local checks = char1.checkProperties
  
  for i,p in pairs(properties) do
    self.modifiers[#self.modifiers+1] = p:getModifier(char1,char2)
  end
end

return module