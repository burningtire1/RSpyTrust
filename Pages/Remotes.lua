local Components =
	require(
		script.Parent.Parent.UI.Components
	)


local Registry =
	require(
		script.Parent.Parent.Core.Registry
	)



local Remotes = {}



function Remotes:Load(window)


	window:Clear()



	local title =
		Components.Label(
			window.Content,
			"Remote Explorer",
			18
		)



	title.Size =
		UDim2.new(
			1,
			0,
			0,
			40
		)




	local list =
		Instance.new(
			ScrollingFrame
		)


	list.Size =
		UDim2.fromScale(
			1,
			0.9
		)


	list.Position =
		UDim2.fromOffset(
			0,
			40
		)


	list.Parent =
		window.Content



	local layout =
		Instance.new(
			"UIListLayout"
		)

	layout.Parent =
		list




	local function update()


		for _,v in ipairs(list:GetChildren()) do

			if v:IsA("TextLabel") then
				v:Destroy()
			end

		end



		for _,remote in ipairs(
			Registry:Get()
		) do


			local label =
				Components.Label(
					list,
					string.format(
						"%s\nFire: %d | Invoke: %d",
						remote.Name,
						remote.Fire,
						remote.Invoke
					),
					14
				)


			label.Size =
				UDim2.new(
					1,
					0,
					0,
					45
				)


		end


	end



	task.spawn(function()

		while true do

			update()

			task.wait(1)

		end

	end)


end


return Remotes
