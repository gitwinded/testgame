-- main.lua
--To Do:
--1x Define the character's direction of travel.
--2x Call function collidable()
--3x Define drawChar() function
--4x check direction the character is moving for drawChar()
--5x use ../tutorials/lovewikitutorials/grid to set motion rates
--6x use above to draw actual vs grid character positions
--7x Reflect left image into right in code
--8 Turn all character related variables into tables
--9 Create character Class using MiddleClass
--10 Figure out how to use love.keyboard.isDown instead of keypressed for moveChar()
--11 Use multiple frames to make character 'walk'
--12x Make map collidable function
--13x Make entity collidable function
--14x Set Name for Game Window
--15 Separate Entity and Map loading
--16 Create grass map from ff art
--17 Place entities on map from ff art
--18x START BACKING UP INTO GITHUB!!

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
