--char-functions.lua

require 'map-functions'
--require 'input'

local tileW, tileH, charTileset, charQuads, charQuadInfo
local charGridX, charGridY = 2, 2
local charActX, charActY = 200, 200
local charFacing = 'forward'
local charMoveSpeed = 10
local moving = false
local timer = 0
local iterator = 1
charPosMessage = 'Example'

function loadChar(path)
	love.filesystem.load(path)()
end

function round(num) return math.floor(num+.5) end

function newChar(tileWidth, tileHeight, tilesetPath, charQuadInfoIn)

	tileW = tileWidth
	tileH = tileHeight
	charQuadInfo = charQuadInfoIn
	tileset = love.graphics.newImage(tilesetPath)

	local tilesetW, tilesetH = tileset:getWidth(), tileset:getHeight()

	charQuads = {}

	for name,quadTables in pairs(charQuadInfoIn) do
		charQuads[name] = {}
		for steps,info in ipairs(quadTables) do
			charQuads[name][steps] = love.graphics.newQuad(info[2], info[3], tileW, tileH, tilesetW, tilesetH)
		end
	end
end

function moveChar()
	love.keyboard.setKeyRepeat(true)
	function love.keypressed(key, isrepeat)
		if key == 'escape' then
			love.event.quit()
		elseif key == 's' and atNextTile() then
			if canMove(charGridX, charGridY, 'down') then
				moving = true
				charGridY = charGridY + 1 end
			charFacing = 'forward'
		elseif key == 'w' and atNextTile() then
			if canMove(charGridX, charGridY, 'up') then
				moving = true
				charGridY = charGridY - 1 end
			charFacing = 'backward'
		elseif key == 'a' and atNextTile() then
			if canMove(charGridX, charGridY, 'left') then
				moving = true
				charGridX = charGridX - 1 end
			charFacing = 'left'
		elseif key == 'd' and atNextTile() then
			if canMove(charGridX, charGridY, 'right') then
				moving = true
				charGridX = charGridX + 1 end
			charFacing = 'right'
		end
	end
	function love.keyreleased(key)
		if key == 's' or 'w' or 'a' or 'd' then
			moving = false
			iterator = 1
		end
	end
	charPosMessage = 'x: '..charGridX..', y: '..charGridY..'\nactX: '..round(charActX)..', actY: '..round(charActY)
end

--moveChar - need 2 variables, charFaceDir facing, starting to move, gotten to the new tile. It should take 1 tile movement to go one full rotation - 0(standing) to 1(leftfoot) to 0(standing) to 2(rightfoot) and landing at the new tile at 0(standing)
--each tile move should have 4 different parts - 1,0,2,0.

local function updateCharImg(dt)
	if moving then
		timer = timer + dt
		if timer > 0.2 then
			timer = 0
			iterator = iterator + 1
			if iterator > 4 then
				iterator = 1
			end
		end
	end
end

function updateCharPos(timeInt)
	charActY = charActY + (charGridY * tileH - charActY) * charMoveSpeed * timeInt
	charActX = charActX + (charGridX * tileW - charActX) * charMoveSpeed * timeInt
	updateCharImg(timeInt)
end

function drawChar() -- the locals below are only used to clean up the draw() command. They add nothing to the actual block.
	local drawPosX = charActX+(charQuadInfo[charFacing][1][4])*tileW
	local drawPosY = charActY+(charQuadInfo[charFacing][1][5])*tileH
	local drawScaleX = charQuadInfo[charFacing][1][6]
	local drawScaleY = charQuadInfo[charFacing][1][7]
	love.graphics.draw(tileset, charQuads[charFacing][iterator], drawPosX, drawPosY, 0, drawScaleX, drawScaleY)
end

function atNextTile()
	if round(charActX) == charGridX * tileW then
		if round(charActY) == charGridY * tileH then
			return true
		end
	end
end
