--[[

File: 		enemy.lua
Author: 	Daniel "lytedev" Flanagan
Website:	http://dmf.me

The enemy class.

]]--

local Enemy = Class{__includes = Gameobject}

function Enemy:init(x, y)
	Gameobject.init(self, x, y, "dynamic")

	self.speed = 500

	enemies[table.address(self)] = self
end

function Enemy:update(dt)
	Gameobject.update(self, dt)

	local px, py = player:getPosition()
	local x, y = self:getPosition()
	local angle = angleToPoint(px, py, x, y)

	local movement = vector(self.speed, 0)
	movement:rotate_inplace(angle)
	self:applyForce(movement:unpack())
end

function Enemy:draw()
	love.graphics.setColor(200, 20, 0, 255)
	Gameobject.draw(self)
end

return Enemy
