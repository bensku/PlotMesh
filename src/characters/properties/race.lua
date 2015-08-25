-- Race property

import "localization"
import "characters.properties"

local module = libimport.module()

--- Race for the character.
local CharRace = CharProperty:new()
module:add(CharRace, "CharRace")

--- Unlocalized name of the race.
CharRace.name = "human"

--- Race name localizations.
-- Values default to humans.
local RaceLocal = Localization:new()
module:add(Localization, "Localization")

RaceLocal.singular = "human"

RaceLocal.plural = "humans"

-- TODO add relation modifiers

return module