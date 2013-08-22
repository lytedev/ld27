--[[

File: 		conf.lua
Author: 	Daniel "lytedev" Flanagan
Website:	http://dmf.me

Sets the default configuration values for the LOVE2D framework.

]]--

function love.conf(t)
	-- Set config global
	config = t

	t.title = "Ludum Dare 27 Entry"
	t.author = "Daniel \"lytedev\" Flanagan"
	t.url = "http://lytedev.com"
	t.identity = "lytedev_ld27"
	t.titleVersion = "0.1.0-alpha"
	t.version = "0.8.0"

	print(string.format("%s\n%s\n%s\n%s", t.title, t.titleVersion, t.author, t.url))
	print("TODO: Finalize game metadata!")

	t.console = false

	print("TODO: Release!")
	t.release = false

	t.screen.scaleHeight = 180
	t.screen.width = 640
	t.screen.height = 360
	t.screen.fullscreen = false
	t.screen.vsync = true
	t.screen.fsaa = 0

	t.modules.joystick = true
	t.modules.audio = true
	t.modules.keyboard = true
	t.modules.event = true
	t.modules.image = true
	t.modules.graphics = true
	t.modules.timer = true
	t.modules.mouse = true
	t.modules.sound = true
	t.modules.physics = false

	return t
end
