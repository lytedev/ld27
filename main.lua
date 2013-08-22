--[[

File: 		main.lua
Author: 	Daniel "lytedev" Flanagan
Website:	http://dmf.me

Game entry point.

]]--

require("src.utils")

function love.load()
	Gamestate.registerEvents()
end
