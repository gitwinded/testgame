-- file: /maps/farmhouse.lua

local function randomizeGrass(mapW,mapH)
	local t = {}
	for y=1, mapH do
		t[y]={}
		for x=1, mapW do
			t[y][x] = love.math.random(1,9)
		end
	end
	local result = table.concat(t[1])
	for y=2, mapH do
		result = result..'\n'..table.concat(t[y])
	end
	return result
end

local tileString = randomizeGrass(9,9)

--local tileString = [[
--123123
--456456
--789789
--]]

local quadInfo = {
	{ '1',	false,	0,	0	},
	{ '2',	false,	16,	0	},
	{ '3',	false,	32,	0	},
	{ '4',	false,	0, 	16	},
	{ '5',	false,	16,	16	},
	{ '6',	false,	32,	16	},
	{ '7',	false,	0, 	32	},
	{ '8',	false,	16,	32	},
	{ '9',	false,	32,	32	}
}

local entityInfo = {
}

local entities = {
}

newMap(16,16,'img/ff/grass-tile.png', tileString, quadInfo, entityInfo, entities)
