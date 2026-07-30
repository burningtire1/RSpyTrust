local Config = {}

--// General
Config.Name = "DynamicSpy V2"
Config.Version = "2.0"

--// Logger
Config.MaxEntries = 1500

Config.Logging = {
	SaveToFile = false,
	FileName = "DynamicSpy_Log.lua",

	IncludeTraceback = true,
	IncludeTimestamp = true,
	DecodeObjects = true,
}


--// Remote Filtering
Config.BlockedRemotes = {
	UpdateCharacterSpring = true,
	UpdateCharacterAnimation = true,
	LogFramerate = true,
	Clicked = true,
}


--// UI
Config.UI = {

	Title = "DynamicSpy V2",

	Size = UDim2.fromOffset(
		900,
		600
	),

	MinimumSize = Vector2.new(
		650,
		400
	),

	ToggleKey = Enum.KeyCode.End,

	Animations = true,

}


--// Performance
Config.Performance = {

	UpdateRate = 0.1,

	VirtualizedList = true,

	MaxRenderEntries = 100,

}


--// Default Settings

Config.Defaults = {

	AutoScroll = true,

	Theme = "Dark",

	ShowTraceback = true,

	ConfirmBlacklist = true,

}


return Config
