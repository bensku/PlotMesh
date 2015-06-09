-- Main for all localization files.

--- Localization object.
-- @type #localization
Localization = {}

function Localization:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self;
  return o
end

--- Language code.
Localization.lang = "en_US"