local Components =
	require(
		script.Parent.Parent.UI.Components
	)


local Config =
	require(
		script.Parent.Parent.Config
	)



local Storage =
	require(
		script.Parent.Parent.Services.Storage
	)



local Settings = {}



function Settings:Load(window)


	window:Clear()



	local title =
		Components.Label(
			window.Content,
			"Settings",
			20
		)



	title.Size =
		UDim2.new(
			1,
			0,
			0,
			40
		)




	local save =
		Components.Button(
			window.Content,
			"Save Configuration"
		)



	save.Position =
		UDim2.fromOffset(
			10,
			60
		)



	save.Size =
		UDim2.fromOffset(
			180,
			35
		)



	save.MouseButton1Click:Connect(
		function()


			Storage:Save({

				Logging =
					Config.Logging,

				Defaults =
					Config.Defaults

			})


			save.Text =
				"Saved!"



			task.delay(
				1,
				function()

					save.Text =
						"Save Configuration"

				end
			)


		end
	)




	local info =
		Components.Label(
			window.Content,

			"DynamicSpy V2\n\n" ..
			"Max Entries: "
			..
			Config.MaxEntries
			..

			"\n\nToggle Key: END",

			14
		)



	info.Position =
		UDim2.fromOffset(
			10,
			120
		)



end



return Settings
