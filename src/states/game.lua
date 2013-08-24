--[[

File: 		game.lua
Author: 	Daniel "lytedev" Flanagan
Website:	http://dmf.me

The gamestate in charge of managinplayer... well... the game.

]]--

local Game = Gamestate.new()

local pairs = pairs

function Game:init()
	print("Game init")

	love.graphics.newFont("assets/fonts/pf_tempesta_seven_condensed.ttf", 8)
	world = love.physics.newWorld(0, 0, true)
	love.graphics.setBackgroundColor(17, 17, 17, 255)

	self.camera = Camera()
	self.camera:zoomTo(2)
	self.camera:lookAt(0, 0)

	gameCamera = self.camera

	self:restart()
end

function Game:restart()
	self.player = Player(0, 200)

	player = self.player

	Tower(50, 200)
	Tower(-50, 200)

	self:addEnemy(math.random(), math.random()) 

	self.timer = Timer.new()
	self.timer:addPeriodic(2, function() 
			self:addEnemy(math.random(), math.random()) 
		end)
end

function Game:addEnemy(x, y)
	local x = x or 0 
	local y = y or 0 
	Enemy(x, y)
end

function Game:update(dt)
	if love.keyboard.isDown("escape") then 
		love.event.quit() 
	end
	if love.keyboard.isDown("r") then 
		self:restart()
	end

	self.timer:update(dt)
	world:update(dt)

	local movement = vector(0, 0)
	if love.keyboard.isDown("a", "left") then
		movement.x = movement.x - 1
	end

	if love.keyboard.isDown("w", "up") then
		movement.y = movement.y - 1
	end

	if love.keyboard.isDown("d", "right") then
		movement.x = movement.x + 1
	end

	if love.keyboard.isDown("s", "down") then
		movement.y = movement.y + 1
	end

	if love.mouse.isDown("l") then
		self.player:dropTower()
	end

	movement:normalize_inplace()
	movement = movement * (self.player.speed)
	self.player:applyForce(movement.x, movement.y)

	for k, v in pairs(gameobjects) do
		v:update(dt)
	end
	
	px, py = self.player:getPosition()
	self.camera:lookAt(px, py)
end

function Game:draw()
	self.camera:attach()

	for k, v in pairs(towers) do
		v:drawAuras()
	end

	for k, v in pairs(gameobjects) do
		love.graphics.setColor(255, 255, 255, 255)
		v:draw()
	end

	love.graphics.setColor(255, 0, 0, 255)
	-- love.graphics.rectangle('line', -25, -25, 50, 50)

	self.camera:detach()

	-- Draw Interface
end

return Game
