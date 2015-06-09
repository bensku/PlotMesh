-- Character properties

--- Character property
-- @type CharProperty
CharProperty = {}
--- Name of property. If default, relation calculation will fail.
CharProperty.name = "default"
CharProperty.level = 1
--- Description CODE for property. Full description should gotten using that code.
CharProperty.desc = nil
--- Is normal handling used even if target doesn't care about property.
-- Custom handling for that needs function override.
CharProperty.noCareCheck = false

function CharProperty:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

--- Gets relation modifier of this property for char1 towards char2.
-- The method gets properties from given characters. Then it calls
-- self:calculateModifier(prop1, prop2) if char1 cares about property. If
-- self.noCareCheck is true, that method will called anyway.
-- 
-- In case the char1 doesn't care about property AND noCareCheck is 
-- false or nil, self:calculateModifierSpecial(prop1, prop2) will called.
-- By default that method will return nil.
-- 
-- @param #character char1: Character that considers the other one
-- @param #character char2: Character that is considered by the other one
-- @return #modifier: Modifier
function CharProperty:getModifier(char1, char2)
  local prop1 = char1.properties[self.name]
  local prop2 = char2.properties[self.name]
  
  if prop1 == nil and self.noCareCheck == false then
    return self:calculateModifierSpecial(prop1, prop2)
  end
  
  return self:calculateModifier(prop1, prop2)
end

--- Returns multiplier of property.
-- @param #property prop: Property variable for char1
function CharProperty:getMultip(prop)
  return prop.multip
end

--- Returns level of property.
-- @param #property prop: Property variable for char2
function CharProperty:getLevel(prop)
  return prop.level
end

--- Returns total relation modifier amount.
-- @param #number multip: Multiplier from char1
-- @param #number level: Level from char2
function CharProperty:getTotalAmount(multip, level)
  return multip * level
end

--- Returns description of property or nil if default one is wanted.
-- @param #character char1: Character 1
-- @param #character char2: Character 2
function CharProperty:getDescription(char1, char2)
  return nil
end

function CharProperty:calculateModifier(prop1, prop2)
  local modifier = {}
  modifier.name = self.name
  modifier.multip = self:getMultip(prop1)
  modifier.level = self:getLevel(prop2)
  modifier.amount = self:getTotalAmount(modifier.multip, modifier.level)
  modifier.desc = self:getDescription(char1,char2) or self.desc
  return modifier
end

function CharProperty:calculateModifierSpecial(prop1, prop2)
  return nil
end

--- Special boolean properties for NPCs, not players.
-- @type NPCflags
NPCFlags = CharProperty:new()
NPCFlags.name = "npcFlags"

--- Is character excluded from plot mesh.
-- Sometimes it is necessary to keep character in plot mesh system to
-- store certain data values, but no other plot mesh actions are wanted.
-- Only few actions (like NPCAggro forceAttack) will performed.
NPCFlags.meshOutsider = false

--- Is NPC STAR.
-- STAR NPCs are "leaders" of different groups. They have more complex
-- AI, which requires more CPU time.
NPCFlags.star = false

--- Is character battling boss.
-- If the character is powerful boss in middle of the battle, it should
-- be flagged. Bosses outside of battles should NOT be flagged.
NPCFlags.boss = false

--- Quest keeper without movement or combat.
-- Certain NPCs (in newbie zones?) will never do anything but stand there and talk.
-- They can, however, hate or like other characters.
NPCFlags.questKeeper = false

--- NPC aggro controller.
-- Controls which characters NPC tries to attack
-- @type NPCAggro
NPCAggro = CharProperty:new()
NPCAggro.name = "aggro"

--- Is aggro enabled.
-- If, and ONLY IF, the NPC has very bad relations with another character,
-- will it/she/he attack it. If disabled, character doesn't attack unless
-- attacked or scripted manually
NPCAggro.enabled = true

--- Range of attack.
-- Range of attack in unknown units (TODO)
NPCAggro.range = 10

--- Required relation.
-- Relations less than set value will make NPC attack.
NPCAggro.relation = -1000

--- Force attack to characters with given properties.
-- List of properties, which make NPC attack another character
-- regardless of their relations.
NPCAggro.forceAttack = {}