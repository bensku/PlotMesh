-- Character properties

import "characters.properties"

local module = libimport.module()

--- Wealth properties for character
-- Wealth properties contain rank in the society, owned money etc.
-- 
-- TODO only stuff needed by namegen-life is here currently
-- @type #WealthProp
local WealthProp = CharProperty:new()
module:add(WealthProp, "WealthProp")

--- Rank of the character in his/her own society.
-- It can be considered when generating name, clothes etc. Also other characters
-- may care about it and behave differently.
-- 
-- Default value is 0, suitable for average farmer. The higher the value is, 
-- the more important character is. Negative values mean that the character
-- is less important.
WealthProp.rank = 0

--- Total money owned by the character.
-- TODO needs money system to explain more
WealthProp.money = 0

--- Character's importance for whole world.
-- How much the world will change if the character is killed/saved/turn evil etc.
-- Negative values are ignored.
WealthProp.importance = 0

return module