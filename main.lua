--// DynamicSpy V2
--// Main Loader


local Root = script



local Config =
	require(
		Root.Config
	)



local ReplicatedStorage =
	game:GetService(
		"ReplicatedStorage"
	)



------------------------------------------------
-- Services
------------------------------------------------


local Input =
	require(
		Root.Services.Input
	)



------------------------------------------------
-- Core
------------------------------------------------


local Logger =
	require(
		Root.Core.Logger
	)



------------------------------------------------
-- UI
------------------------------------------------


local UI =
	require(
		Root.UI.Init
	)



------------------------------------------------
-- Pages
------------------------------------------------


local Activity =
	require(
		Root.Pages.Activity
	)


local Remotes =
	require(
		Root.Pages.Remotes
	)


local Analytics =
	require(
		Root.Pages.Analytics
	)


local Settings =
	require(
		Root.Pages.Settings
	)



------------------------------------------------
-- Network Hook
------------------------------------------------


local Modules =
	require(
		ReplicatedStorage.SharedModules.Global
	)



local OldFire =
	Modules.Network.FireServer


local OldInvoke =
	Modules.Network.InvokeServer




Modules.Network.FireServer =
	function(...)

		local args =
			{...}


		Logger:Add(
			"FireServer",
			args,
			3
		)



		return OldFire(
			unpack(args)
		)

	end





Modules.Network.InvokeServer =
	function(...)

		local args =
			{...}



		Logger:Add(
			"InvokeServer",
			args,
			3
		)



		return OldInvoke(
			unpack(args)
		)

	end




------------------------------------------------
-- Start UI
------------------------------------------------


UI:Start(
	Config
)



local Window =
	UI.Window



------------------------------------------------
-- Page Router
------------------------------------------------


local function OpenPage(page)

	page:Load(
		Window
	)

end




Window:AddButton(
	"Activity",
	function()

		OpenPage(
			Activity
		)

	end
)



Window:AddButton(
	"Remotes",
	function()

		OpenPage(
			Remotes
		)

	end
)



Window:AddButton(
	"Analytics",
	function()

		OpenPage(
			Analytics
		)

	end
)



Window:AddButton(
	"Settings",
	function()

		OpenPage(
			Settings
		)

	end
)



------------------------------------------------
-- Default Page
------------------------------------------------


OpenPage(
	Activity
)



------------------------------------------------
-- Keyboard
------------------------------------------------


Input.KeyPressed:Connect(
	function(key)


		if key ==
			Config.UI.ToggleKey then


			Window.Main.Visible =
				not Window.Main.Visible


		end


	end
)



print(
	Config.Name
	..
	" loaded!"
)
