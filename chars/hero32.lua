-- char/hero.lua

local imgPath = 'img/ff/hero32.png'

local charQuadInfo = {
--	{facing dir	XCoord	YCoord	XPos	YPos	XScale	YScale
	{'left',	32,	0,	-1,	-1,	1,	1	}, -- facing left
	{'right',	32,	0,	0,	-1,	-1,	1	}, -- facing right
	{'forward',	32,	64,	-1,	-1,	1,	1	}, -- facing forward
	{'backward',	32,	32,	-1,	-1,	1,	1	}, -- facing backward
}

newChar(32, 32, imgPath, charQuadInfo)
