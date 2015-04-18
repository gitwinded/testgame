-- char/hero.lua

local imgPath = 'img/ff/hero.png'

local charQuadInfo = {
	{'left',	16,	0	}, -- facing left
	{'right',	16,	0	}, -- facing right
	{'forward',	16,	32	}, -- facing forward
	{'backward',	16,	16	}, -- facing backward
}

newChar(16, 16, imgPath, charQuadInfo)
