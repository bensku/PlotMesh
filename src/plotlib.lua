-- Library main, should be called before doing anything with it

plotlib = {}

local pathExtensions = "./?;./?.lua"

pathExtensions = pathExtensions .. ";" .. plotlib_init.pathExtensions

LUA_PATH = LUA_PATH .. ";" .. pathExtensions