--[[

File: 		player.lua
Author: 	Daniel "lytedev" Flanagan
Website:	http://dmf.me

The player class.

]]--

local Player = Class{__includes = Unit}

function Player:init(x, y)
	Unit.init(self, x, y, "dynamic")

	self.speed = 1000
	self.towerCooldown = 0.5
	self.towerDropRange = 20
end

function Player:update(dt)
	Unit.update(self, dt)
end

function Player:draw()
	love.graphics.setColor(100, 255, 0, 255)
	Unit.draw(self)

	local mx, my = gameCamera:mousepos()
	local px, py = self:getPosition()
	local angle = angleToPoint(mx, my, px, py)
	love.graphics.setLineWidth(2)
	drawAngledLine(px, py, self.towerDropRange, angle)
end

function Player:dropTower()
	if self.cooldown <= 0 then
		self.cooldown = self.towerCooldown

		local mx, my = gameCamera:mousepos()
		local px, py = self:getPosition()
		local angle = angleToPoint(mx, my, px, py)
		local x1, y1, x2, y2 = angledLine(px, py, self.towerDropRange, angle)

		Tower(x2, y2)
	end
end

function Player:destroy()
	Unit.destroy(self)
end

return Player
