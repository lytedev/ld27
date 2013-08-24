--[[

File: 		gameobject.lua
Author: 	Daniel "lytedev" Flanagan
Website:	http://dmf.me

The base gameobject class.

]]--

local Gameobject = Class{}

function Gameobject:init(x, y, objectType)
	local objectType = objectType or "static"

	gameobjects[table.address(self)] = self

	local x = x or 0
	local y = y or 0
	self.body = love.physics.newBody(world, x, y, objectType) 
	self.shape = love.physics.newCircleShape(8)
	self.fixture = love.physics.newFixture(self.body, self.shape)

	self.body:setLinearDamping(20)
	self.body:setFixedRotation(true)
end

function Gameobject:update(dt)
	
end

function Gameobject:draw()
	love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())

	-- love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
end

function Gameobject:applyForce(x, y)
	self.body:applyForce(x, y)
end

function Gameobject:getPosition()
	return self.body:getPosition()
end

return Gameobject
