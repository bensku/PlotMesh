-- Library main, should be called before doing anything with it

--- PlotMesh library initializer.
-- @type initplotlib
local initplotlib

local imports = require "libimport"

function initplotlib:init()
  import = imports.import
  libimport = imports
end

return initplotlib