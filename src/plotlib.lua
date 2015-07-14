-- Library main, should be called before doing anything with it

plotlib = {}

local pathExtensions = "./?;./?.lua"

pathExtensions = pathExtensions .. ";" .. plotlib_init.pathExtensions

package.path = package.path .. ";" .. pathExtensions