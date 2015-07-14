-- Locations, for names for example

--- Place in the world.
-- Abstract location, maybe city or something like that. May or may not contain
-- coordinate data to actually get the location.
-- @type location
local Location = {}

function Location:new(name,o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self;
  self.name = name
  return o
end

--- Unlocalized name of location.
Location.name = "unknown"

--- Link to Shards Online scripting location data, if available.
Location.location_SO = {}

--- Rules for name generator to generate naming rules.
-- Contains table of naming rules, for name generators in general. It is
-- responsibility of the generator to see if it can apply the rule.
Location.namingRules = {}

-- TODO placeholder for namegen-life

return Location