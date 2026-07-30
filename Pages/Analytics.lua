local Components =
	require(
		script.Parent.Parent.UI.Components
	)


local Logger =
	require(
		script.Parent.Parent.Core.Logger
	)


local Registry =
	require(
		script.Parent.Parent.Core.Registry
	)



local Analytics = {}



function Analytics:Load(window)


	window:Clear()



	local title =
		Components.Label(
			window.Content,
			"Analytics",
			20
		)


	title.Size =
		UDim2.new(
			1,
			0,
			0,
			40
		)



	local stats =
		Components.Label(
			window.Content,
			"",
			16
		)



	stats.Position =
		UDim2.fromOffset(
			10,
			60
		)



	stats.Size =
		UDim2.new(
			1,
			-20,
			0,
			200
		)




	local function update()

		local remoteCount = 0


		for _ in pairs(
			Registry.Remotes
		) do

			remoteCount += 1

		end



		stats.Text =
			string.format(

				"Session Statistics\n\n" ..

				"FireServer Calls: %d\n" ..

				"InvokeServer Calls: %d\n" ..

				"Unique Remotes: %d\n" ..

				"Total Captured: %d",

				Logger.FireCount,

				Logger.InvokeCount,

				remoteCount,

				#Logger.Entries

			)


	end



	task.spawn(function()

		while true do

			update()

			task.wait(1)

		end

	end)


end



return Analytics
