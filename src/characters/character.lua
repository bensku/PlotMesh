-- Base character

require "character.properties"

--- Character.
-- @type character
Character = {}
Character.relations = {}
--- List of character's properties.
-- @field #number
-- @field #table
Character.properties = {}
--- List of properties.
-- List of properties that are considered when calculating Relation.
-- 
-- @field #number
-- @field #table
Character.checkProperties = {}

--- Instantiate new character.
function Character:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self;
  return o
end