local Theme = {}


Theme.Colors = {

	Background =
		Color3.fromRGB(12,12,18),

	Surface =
		Color3.fromRGB(18,18,28),

	Card =
		Color3.fromRGB(25,25,38),

	Accent =
		Color3.fromRGB(80,160,255),

	Success =
		Color3.fromRGB(100,220,140),

	Danger =
		Color3.fromRGB(255,90,100),

	Text =
		Color3.fromRGB(240,240,245),

	Muted =
		Color3.fromRGB(140,140,160),

	Border =
		Color3.fromRGB(40,40,55)

}



Theme.Fonts = {

	Main =
		Enum.Font.Gotham,

	Bold =
		Enum.Font.GothamBold,

	Code =
		Enum.Font.Code

}



Theme.Radius = {

	Small =
		UDim.new(0,5),

	Medium =
		UDim.new(0,10),

	Large =
		UDim.new(0,15)

}



return Theme
