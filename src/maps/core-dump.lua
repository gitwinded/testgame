-- file: /maps/core-dump.lua

local tileString = [[
#########################
# tttTtttttt      # TTT #
# bbbBbbbbbb      # BBB #
#                 #     #
# tttttttTtt      ### ###
# bbbbbbbBbb        # # #
#                   * * #
# *                 | | #
# |                     #
           T            #
           B            #
# *                     #
# |                     #
#                       #
# tttttTtttTtttT    TT  #
# bbbbbBbbbBbbbB    BB  #
#                       #
#########################
]]

local quadInfo = {
	{ ' ',	0,	0	}, -- floor
	{ '#',	0,	32	}, -- bricks
	{ 'T',	32,	0	}, -- top of tape machine
	{ 'B',	32,	32	}, -- bottom of tape machine
	{ 't',	64,	0	}, -- top of cabinet
	{ 'b',	64,	32	}, -- bottom of cabinet
	{ '*',	96,	0	}, -- top of plant
	{ '|',	96,	32	} -- trunk of plant
}

local entityInfo = {}
local entities = {}

newMap(32,32,'/img/lab.png', tileString, quadInfo, entityInfo, entities)
