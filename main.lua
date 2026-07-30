--// DynamicSpy V2
--// Main Loader


local Root = script


local Config =
	require(
		Root.Config
	)


local Services = {}


local function LoadFolder(folder)

	for _,module in ipairs(folder:GetChildren()) do

		if module:IsA("ModuleScript") then

			Services[module.Name] =
				require(module)

		end

	end

end



-- Load Utils first
LoadFolder(
	Root.Utils
)



-- Load Core systems

LoadFolder(
	Root.Core
)



-- Load Services

LoadFolder(
	Root.Services
)



-- Start UI

local UI =
	require(
		Root.UI.Init
	)



UI:Start(
	Config
)



print(
	string.format(
		"%s loaded successfully",
		Config.Name
	)
)
