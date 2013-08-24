--[[

File: 		player.lua
Author: 	Daniel "lytedev" Flanagan
Website:	http://dmf.me

The player class.

]]--

local Player = Class{__includes = Gameobject}

function Player:init(x, y)
	Gameobject.init(self, x, y, "dynamic")

	self.speed = 1000
	self.towerTime = 0
	self.towerCooldown = 0.2
	self.towerDropRange = 20
end

function Player:update(dt)
	Gameobject.update(self, dt)
	if self.towerTime > 0 then
		self.towerTime = self.towerTime - dt
	end
end

function Player:draw()
	love.graphics.setColor(100, 255, 0, 255)
	Gameobject.draw(self)

	local mx, my = gameCamera:mousepos()
	local px, py = self:getPosition()
	local angle = angleToPoint(mx, my, px, py)
	drawAngledLine(px, py, self.towerDropRange, angle)
end

function Player:dropTower()
	if self.towerTime <= 0 then
		self.towerTime = self.towerCooldown

		local mx, my = gameCamera:mousepos()
		local px, py = self:getPosition()
		local angle = angleToPoint(mx, my, px, py)
		local x1, y1, x2, y2 = angledLine(px, py, self.towerDropRange, angle)

		Tower(x2, y2)
	end
end

return Player
