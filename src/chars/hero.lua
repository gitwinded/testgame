-- char/hero.lua

local imgPath = 'img/ff/hero.png'

local charQuadInfo = {
--	{facing dir	XCoord	YCoord	XPos	YPos	XScale	YScale
	{'left0',	16,	0,	-1,	-1,	1,	1	}, -- facing left
	{'left1',	0,	0,	-1,	-1,	1,	1	}, -- walking left step 1
	{'left2',	32,	0,	-1,	-1,	1,	1	}, -- walking left step 2
	{'right0',	16,	0,	0,	-1,	-1,	1	}, -- facing right
	{'right1',	32,	0,	0,	-1,	-1,	1	}, -- walking right step 1
	{'right2',	0,	0,	0,	-1,	-1,	1	}, -- walking right step 2
	{'forward0',	16,	32,	-1,	-1,	1,	1	}, -- facing forward
	{'forward1',	32,	32,	-1,	-1,	1,	1	}, -- walking forward step 1
	{'forward2',	0,	32,	-1,	-1,	1,	1	}, -- walking forward step 2
	{'backward0',	16,	16,	-1,	-1,	1,	1	},  -- facing backward
	{'backward1',	0,	16,	-1,	-1,	1,	1	},  -- walking backward step 1
	{'backward2',	32,	16,	-1,	-1,	1,	1	},  -- walking backward step 2
	{'dead',	0,	48,	-1,	-1,	1,	1	}, -- facing forward
	{'surprised',	16,	48,	-1,	-1,	1,	1	}, -- walking forward step 1
	{'tired',	32,	48,	-1,	-1,	1,	1	} -- walking forward step 2
}

newChar(16, 16, imgPath, charQuadInfo)
