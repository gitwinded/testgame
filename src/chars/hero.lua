-- char/hero.lua

local imgPath = 'img/ff/hero.png'

local charQuadInfo = {
--	{facing dir	XCoord	YCoord	XPos	YPos	XScale	YScale
	{'left',	16,	0,	-1,	-1,	1,	1	}, -- facing left
	{'right',	16,	0,	0,	-1,	-1,	1	}, -- facing right
	{'forward',	16,	32,	-1,	-1,	1,	1	}, -- facing forward
	{'backward',	16,	16,	-1,	-1,	1,	1	}  -- facing backward
}

newChar(16, 16, imgPath, charQuadInfo)
