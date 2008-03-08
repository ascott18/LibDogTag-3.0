local MAJOR_VERSION = "LibDogTag-3.0"
local MINOR_VERSION = tonumber(("$Revision$"):match("%d+")) or 0

if MINOR_VERSION > _G.DogTag_MINOR_VERSION then
	_G.DogTag_MINOR_VERSION = MINOR_VERSION
end

local DogTag, oldMinor = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not DogTag then
	return
end

local oldLib
if next(DogTag) ~= nil then
	oldLib = {}
	for k,v in pairs(DogTag) do
		oldLib[k] = v
		DogTag[k] = nil
	end
end
DogTag.oldLib = oldLib

_G.DogTag = DogTag

for _,v in ipairs(DogTag_funcs) do
	v()
end

_G.DogTag = nil