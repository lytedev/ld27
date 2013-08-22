--[[

File: 		src/utils.lua
Author: 	Daniel "lytedev" Flanagan
Website:	http://dmf.me

Defines basic utility/helper functions.

]]--

-- Load standard classes
vector = require("lib.hump.vector")
Class = require("lib.hump.class")
Gamestate = require("lib.hump.gamestate")
assetManager = require("lib.assetmanager")()

debugText = ""

function addDebug(s)
    debugText = debugText .. s .. "\n"
end

function printDebug(pos)
    local pos = pos or vector(5, 5)
    love.graphics.print(debugText, pos.x, pos.y)
    debugText = ""
end

function rerequire(module)
    package.loaded[module] = nil
    return require(module)
end

function selectRectangles(position, size, rsize)
    return math.floor((position.x) / rsize.x),
        math.floor((position.y) / rsize.y),
        math.ceil((position.x + size.x) / rsize.x),
        math.ceil((position.y + size.y) / rsize.y)
end

function minimumTranslation(pos1, size1, pos2, size2)
    local max1 = pos1 + size1
    local max2 = pos2 + size2

    if pos1.x < max2.x and
        max1.x > pos2.x and
        pos1.y < max2.y and
        max1.y > pos2.y then

    else
        return vector(0, 0)
    end

    local mtd = vector(0, 0)

    local left = pos2.x - max1.x
    local right = max2.x - pos1.x
    local top = pos2.y - max1.y
    local bottom = max2.y - pos1.y

    if left > 0 or right < 0 then return vector(0, 0) end
    if top > 0 or bottom < 0 then return vector(0, 0) end

    if math.abs(left) < right then
        mtd = mtd + vector(left, 0)
    else
        mtd = mtd + vector(right, 0)
    end

    if math.abs(top) < bottom then
        mtd = mtd + vector(0, top)
    else
        mtd = mtd + vector(0, bottom)
    end

	if math.abs(mtd.x) < math.abs(mtd.y) then return vector(mtd.x, 0) end
	return vector(0, mtd.y)
end

function shortLeg(v)
	if v.x < v.y then return vector(v.x, 0) end
	return vector(0, v.y)
end

function math.wrap(low, n, high) if n<=high and n>=low then return n else return ((n-low)%(high-low))+low end end

function math.clamp(low, n, high) return math.min(math.max(low, n), high) end

function lerp(a,b,t) return a+(b-a)*t end

function cerp(a,b,t) local f=(1-math.cos(t*math.pi))*.5 return a*(1-f)+b*f end
