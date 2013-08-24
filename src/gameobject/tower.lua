--[[

File: 		tower.lua
Author: 	Daniel "lytedev" Flanagan
Website:	http://dmf.me

The tower class.

]]--

local Tower = Class{__includes = Gameobject}

function Tower:init(x, y)
	Gameobject.init(self, x, y, "dynamic")

	self.body:setMass(100)
	self.noBuildRadius = 0
	self.range = 40

	towers[table.address(self)] = self
end

function Tower:update(dt)
	Gameobject.update(self, dt)

	
end

function Tower:drawAuras()
	local px, py = self:getPosition()
	--[[ 
	love.graphics.setColor(255, 20, 0, 40)
	love.graphics.circle("fill", px, py, self.noBuildRadius)
	love.graphics.setColor(255, 20, 0, 80)
	love.graphics.circle("line", px, py, self.noBuildRadius)
	]]--

	love.graphics.setColor(255, 255, 50, 10)
	love.graphics.circle("fill", px, py, self.range)
	love.graphics.setColor(255, 255, 50, 10)
	love.graphics.circle("line", px, py, self.range)
end

function Tower:draw()
	love.graphics.setColor(255, 255, 255, 255)
	Gameobject.draw(self)
end

return Tower
