-- main.lua

require 'map-functions'
require 'char-functions'

function love.load()
	loadMap('maps/ff-farmhouse.lua')
	loadChar('chars/hero.lua')
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

--function love.keypressed(key) --Need to us keyboard.isDown for moveChar first
--	if key == 'escape' then love.event.quit() end
--end
