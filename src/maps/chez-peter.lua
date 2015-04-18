-- file: /maps/chez-peter.lua

local tileString = [[
#########################
#                #      #
# <========>     #      #
# <========>     #      #
# <========>     #      #
# <========>     ###  ###
# <========>            #
#                       #
  <===================> #
  <===================> #
#                       #
#                       #
#                ###  ###
#                #      #
#                #      #
#                #      #
#                #      #
#                #      #
#########################
]]

local quadInfo = {
	{ ' ',		false,	0,	0	}, -- floor
	{ '#',		true,	32,	0	}, -- brick
	{ '<',		false,	0,	32	}, -- carpet left
	{ '=',		false,	32,	32	}, -- carpet middle
	{ '>',		false,	64,	32	}, -- carpet right
}

local entityInfo = {
	{ 'rchair',	96,	0	},
	{ 'lchair',	96,	32	},
	{ 'barrel',	64,	0	}
}

local entities = {
	{'rchair',	true,	6,	4	},
	{'rchair',	true,	6,	5	},
	{'lchair',	true,	9,	4	},
	{'lchair',	true,	9,	5	},
	{'rchair',	true,	20,	3	},
	{'rchair',	true,	20,	4	},
	{'lchair',	true,	23,	3	},
	{'lchair',	true,	23,	4	},
	{'barrel',	true,	19,	14	}
}

newMap(32,32,'/img/resto.png', tileString, quadInfo, entityInfo, entities)
