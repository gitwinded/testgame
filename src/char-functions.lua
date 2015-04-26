--char-functions.lua

require 'map-functions'
--require 'input'

local tileW, tileH, charTileset, charQuads, charQuadInfo
local charGridX, charGridY = 2, 2
local charActX, charActY = 200, 200
local charFacing = 'forward'
local charMoveSpeed = 10
charPosMessage = 'Example'

function loadChar(path)
	love.filesystem.load(path)()
end

function newChar(tileWidth, tileHeight, tilesetPath, charQuadInfoIn)

	tileW = tileWidth
	tileH = tileHeight
	charQuadInfo = charQuadInfoIn
	tileset = love.graphics.newImage(tilesetPath)

	local tilesetW, tilesetH = tileset:getWidth(), tileset:getHeight()

	charQuads = {}

	for _,info in ipairs(charQuadInfoIn) do
		--info[1] = direction, info[2] = x, info[3] = y
		charQuads[info[1]] = love.graphics.newQuad(info[2], info[3], tileW, tileH, tilesetW, tilesetH)
	end
end

--table.insert(tableKeypressed, function (key, isrepeat)
--	if key == 's' then
--		if canMove(charGridX, charGridY, 'down') then
--			charGridY = charGridY + 1 end
--		charFacing = 'forward'
--	end
--end)

function moveChar()
	love.keyboard.setKeyRepeat(true)
	function love.keypressed(key, isrepeat)
		if key == 'escape' then
			love.event.quit()
		elseif key == 's' then
			if canMove(charGridX, charGridY, 'down') then
				charGridY = charGridY + 1 end
			charFacing = 'forward'
		elseif key == 'w' then
			if canMove(charGridX, charGridY, 'up') then
				charGridY = charGridY - 1 end
			charFacing = 'backward'
		elseif key == 'a' then
			if canMove(charGridX, charGridY, 'left') then
				charGridX = charGridX - 1 end
			charFacing = 'left'
		elseif key == 'd' then
			if canMove(charGridX, charGridY, 'right') then
				charGridX = charGridX + 1 end
			charFacing = 'right'
		end
	end
	charPosMessage = 'x: '..charGridX..', y: '..charGridY
end

function updateChar(timeInt)
	charActY = charActY - (charActY - charGridY * tileH) * charMoveSpeed * timeInt
	charActX = charActX - (charActX - charGridX * tileW) * charMoveSpeed * timeInt
end

function getCharInfo(facing, column)
	local num = 0
	for i=1,#charQuadInfo do
		if charQuadInfo[i][1] == facing then
			num = charQuadInfo[i][column]
		end
	end
	return num
end

function drawChar()
	love.graphics.draw(tileset, charQuads[charFacing], charActX+(getCharInfo(charFacing, 4))*tileW, charActY+(getCharInfo(charFacing, 5))*tileH, 0, getCharInfo(charFacing, 6), getCharInfo(charFacing, 7))
end
