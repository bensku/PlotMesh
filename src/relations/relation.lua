-- Relations between characters

--- Relation between two characters
-- Contains relation modifiers, and stores consequences of them (TODO do these classes...)
-- Relations are short lived objects. They're calculated using Character, and possibly
-- other values affecting how character react when they meet. However, they MAY
-- be changed without re-instantiating; sometimes very quick changes are needed.
-- 
-- @type relation
-- @field #modifier Modifiers
Relation = {}
Relation.modifiers = {}

--- Create a new relation
function Relation:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self;
  return o
end