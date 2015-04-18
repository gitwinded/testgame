-- main.lua

require 'map-functions'
require 'char-functions'

--function love.keypressed(key) --Need to us keyboard.isDown for moveChar first
--	if key == 'escape' then love.event.quit() end
--end

function love.load()
	loadMap('maps/chez-peter.lua')
	loadChar('chars/hero32.lua')
	--showColl()
end

function love.update(dt)
	moveChar()
	updateChar(dt)
end

function love.draw()
	love.window.setTitle("Rogers' Test Game!")
	drawMap()
	drawChar()
	love.graphics.print(charPosMessage)
end
