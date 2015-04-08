-- Character properties

--- Character property
-- @type CharProperty
CharProperty = {}
--- Name of property. If default, relation calculation will fail.
CharProperty.name = "default"
CharProperty.level = 1
--- Description CODE for property. Full description should gotten using that code.
CharProperty.desc = nil

function CharProperty:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self;
  return o
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