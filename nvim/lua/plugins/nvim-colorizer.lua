return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		local web = {
			RGB = true;
			RRGGBB = true;
			RRGGBBAA = true;
			names = true;
			rgb_fn = true;
			hsl_fn = true;
			mode = "background";
		}

		require("colorizer").setup({
			"*";
			html = {
				RGB = true;
				RRGGBB = true;
				RRGGBBAA = true;
				names = true;
				rgb_fn = true;
				hsl_fn = true;
				mode = "background";
			};
			css = {
				RGB = true;
				RRGGBB = true;
				RRGGBBAA = true;
				names = true;
				rgb_fn = true;
				hsl_fn = true;
				mode = "background";
			};
		}, {
			RGB = true;
			RRGGBB = true;
			RRGGBBAA = true;
			names = false;
			rgb_fn = false;
			hsl_fn = false;
			mode = "background";
		})
	end
}
