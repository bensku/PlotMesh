-- Relations between characters

--- Relation between two characters.
-- Contains relation modifiers, and stores consequences of them (TODO do these classes...)
-- Relations are short lived objects. They're calculated using Character, and possibly
-- other values affecting how character react when they meet. However, they MAY
-- be changed without re-instantiating; sometimes very quick changes are needed.
-- 
-- @type relation
Relation = {}
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
-- @param char1: first character
-- @param char2: second character
function Relation:calculate(char1,char2)
  local properties = char2.properties
  local checks = char1.checkProperties
  
  for i,p in pairs(properties) do
    for i2,c in pairs(checks) do
      if c.property.name == p.property.name then --Try to find properties that char1 cares about
        local modValue = c.multip * p.level
        
        local modifier = {}
        modifier.name = c.property.name
        modifier.multip = c.multip
        modifier.level = p.level
        modifier.desc = c.property.desc
        table.insert(self.modifiers, modifier)
      end
    end
  end
end