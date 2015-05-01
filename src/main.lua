-- main.lua

require 'map-functions'
require 'char-functions'
--require 'maps/ff-farmhouse'

function love.load()
	loadMap('maps/ff-farmhouse.lua')
	loadChar('chars/hero.lua')
	--showColl()
end

function love.update(dt)
	moveChar()
	updateCharPos(dt)
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
