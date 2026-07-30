local Theme =
	require(
		script.Parent.Parent.UI.Theme
	)


local Components =
	require(
		script.Parent.Parent.UI.Components
	)


local Logger =
	require(
		script.Parent.Parent.Core.Logger
	)


local Clipboard =
	require(
		script.Parent.Parent.Services.Clipboard
	)



local Activity = {}



function Activity:Load(window)


	window:Clear()



	local container =
		Components.Frame(
			window.Content
		)


	container.Size =
		UDim2.fromScale(
			1,
			1
		)



	local title =
		Components.Label(
			container,
			"Activity Log",
			18
		)


	title.Size =
		UDim2.new(
			1,
			0,
			0,
			30
		)



	local list =
		Instance.new(
			"ScrollingFrame"
		)


	list.Position =
		UDim2.fromOffset(
			10,
			45
		)


	list.Size =
		UDim2.new(
			0.45,
			-20,
			1,
			-55
		)


	list.BackgroundColor3 =
		Theme.Colors.Card


	list.BorderSizePixel =
		0


	list.Parent =
		container



	local layout =
		Instance.new(
			"UIListLayout"
		)

	layout.Parent =
		list



	local details =
		Components.Label(
			container,
			"Select entry",
			12
		)


	details.Position =
		UDim2.new(
			0.5,
			0,
			0,
			45
		)


	details.Size =
		UDim2.new(
			0.5,
			-10,
			1,
			-55
		)



	local function refresh()


		for _,v in ipairs(
			list:GetChildren()
		) do

			if v:IsA("TextButton") then
				v:Destroy()
			end

		end



		for _,entry in ipairs(
			Logger.Entries
		) do


			local button =
				Components.Button(
					list,
					"["..
					entry.Method..
					"] "
					..
					entry.Remote
				)



			button.Size =
				UDim2.new(
					1,
					-10,
					0,
					32
				)



			button.MouseButton1Click:Connect(
				function()


					details.Text =
						entry.Arguments
						..
						"\n\n"
						..
						entry.Traceback



					Clipboard.Copy(
						details.Text
					)

				end
			)


		end

	end



	Logger.EntryAdded:Connect(
		refresh
	)



	refresh()


end



return Activity
