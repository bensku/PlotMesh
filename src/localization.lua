-- Main for all localization files.

local module = libimport.module()

--- Localization object.
-- @type #localization
local Localization = {}
module:add(Localization, "Localization")

function Localization:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self;
  return o
end

--- Language code.
Localization.lang = "en_US"

return module