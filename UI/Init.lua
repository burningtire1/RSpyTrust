local Window =
	require(
		script.Parent.Window
	)


local Input =
	require(
		script.Parent.Parent.Services.Input
	)



local Init = {}



function Init:Start(Config)


	local gui =
		Instance.new(
			"ScreenGui"
		)


	gui.Name =
		"DynamicSpyV2"



	gui.ResetOnSpawn =
		false



	gui.Parent =
		(gethui and gethui())
		or game:GetService(
			"Players"
		).LocalPlayer
		:WaitForChild(
			"PlayerGui"
		)




	self.Window =
		Window.new(
			gui
		)



	Input:Start()



	Input.KeyPressed:Connect(
		function(key)

			if key ==
				Config.UI.ToggleKey then

				self.Window.Main.Visible =
					not self.Window.Main.Visible

			end

		end
	)




	print(
		"DynamicSpy UI Started"
	)


end



return Init
