-- Race property

require "localization"
require "characters.properties"

--- Race for the character.
CharRace = CharProperty:new()

--- Unlocalized name of the race.
CharRace.name = "human"

--- Race name localizations.
-- Values default to humans.
RaceLocal = Localization:new();

RaceLocal.singular = "human"

RaceLocal.plural = "humans"

-- TODO add relation modifiers