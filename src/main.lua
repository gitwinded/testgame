-- main.lua
--To Do:
-- [x] Define the character's direction of travel.
-- [x] Call function collidable()
-- [x] Define drawChar() function
-- [x] check direction the character is moving for drawChar()
-- [x] use ../tutorials/lovewikitutorials/grid to set motion rates
-- [x] use above to draw actual vs grid character positions
-- [x] Reflect left image into right in code
-- [ ] turn all character related variables into tables
-- [ ] create character Class using MiddleClass
-- [ ] Figure out how to use love.keyboard.isDown instead of keypressed for moveChar()
-- [ ] Use multiple frames to make character 'walk'
-- [x] Make map collidable function
-- [x] Make entity collidable function
-- [x] Set Name for Game Window
-- [ ] Separate Entity and Map loading
-- [ ] Create grass map from ff art
-- [ ] Place entities on map from ff art
-- [x] Back up into Github

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
