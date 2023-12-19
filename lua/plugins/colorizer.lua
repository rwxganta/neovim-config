return {
	'norcalli/nvim-colorizer.lua',

	config = function()
		require'colorizer'.setup(
			{'*';},
			{
			names    = true;
			RGB      = true;
			RRGGBB   = true;
			RRGGBBAA = true;
			rgb_fn   = true;
			hsl_fn   = true;
			css      = true;
			css_fn   = true;
		})
	end
}

-- Check this FORK => https://github.com/NvChad/nvim-colorizer.lua
