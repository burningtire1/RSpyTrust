local UserInputService =
	game:GetService(
		"UserInputService"
	)


local Signal =
	require(
		script.Parent.Parent.Utils.Signal
	)



local Input = {}



Input.KeyPressed =
	Signal.new()



function Input:Start()

	UserInputService.InputBegan:Connect(
		function(input,processed)

			if processed then
				return
			end


			Input.KeyPressed:Fire(
				input.KeyCode
			)

		end
	)

end



return Input
