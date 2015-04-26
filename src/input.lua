-- input.lua
--
-- initialize a table used for keypresses on load
-- add to this table for each keypress
-- make it so that character movement just adds to the table
-- create a cleanup function that deletes old events off the table

--local gameinput = {}
local tableKeypressed = {}

function love.keypressed(key, isrepeat)
	for _,fn in ipairs(tableKeypressed) do
		fn(key, isrepeat)
	end
end
